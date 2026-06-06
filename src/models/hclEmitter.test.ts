import { describe, it, expect } from "vitest";
import { terraformResourceToHCL, buildMultiProviderHcl } from "./hclEmitter";
import type { TerraformResource, TerraformProject } from "./terraform";
import { defaultProviderSettings } from "./providerConfig";

// Minimal resource factory. Only `config.attributes` matters for the emitter;
// the rest is filler the type system requires.
const makeResource = (
  overrides: Partial<TerraformResource> & {
    type?: string;
    name?: string;
    attributes?: Record<string, unknown>;
  } = {},
): TerraformResource => ({
  id: overrides.id ?? "test-id",
  kind: overrides.kind,
  type: overrides.type ?? "aws_instance",
  name: overrides.name ?? "web",
  config: {
    attributes: overrides.attributes ?? {},
    blocks: {},
  },
  ui: { x: 0, y: 0, icon: "" },
});

describe("terraformResourceToHCL", () => {
  it("emits the resource header with type and name", () => {
    const hcl = terraformResourceToHCL(
      makeResource({ type: "aws_vpc", name: "main", attributes: { cidr_block: "10.0.0.0/16" } }),
    );
    expect(hcl.startsWith('resource "aws_vpc" "main" {')).toBe(true);
    expect(hcl.trimEnd().endsWith("}")).toBe(true);
  });

  it("honors kind=data in the block header", () => {
    const hcl = terraformResourceToHCL(
      makeResource({ kind: "data", type: "aws_ami", name: "ubuntu", attributes: { most_recent: true } }),
    );
    expect(hcl.startsWith('data "aws_ami" "ubuntu" {')).toBe(true);
  });

  it("quotes plain strings", () => {
    const hcl = terraformResourceToHCL(
      makeResource({ attributes: { ami: "ami-12345678" } }),
    );
    expect(hcl).toContain('ami = "ami-12345678"');
  });

  it("emits booleans and numbers unquoted", () => {
    const hcl = terraformResourceToHCL(
      makeResource({ attributes: { monitoring: true, count: 3 } }),
    );
    expect(hcl).toContain("monitoring = true");
    expect(hcl).toContain("count = 3");
  });

  // ── The documented invariant: dotted keys → nested blocks ──────────────────
  // CONTRIBUTING.md: "Dotted-key attributes become nested HCL blocks. Tests and
  // templates rely on this convention."
  describe("dotted-key → nested block invariant", () => {
    it("renders a dotted key as a nested block, not a flat assignment", () => {
      const hcl = terraformResourceToHCL(
        makeResource({
          type: "aws_lb_listener",
          name: "front",
          attributes: { "default_action.type": "forward" },
        }),
      );
      // Nested block form is present...
      expect(hcl).toMatch(/default_action\s*\{/);
      expect(hcl).toContain('type = "forward"');
      // ...and the flat dotted form is NOT.
      expect(hcl).not.toContain('default_action.type =');
    });

    it("groups multiple dotted keys under the same block", () => {
      const hcl = terraformResourceToHCL(
        makeResource({
          attributes: {
            "root_block_device.volume_size": 20,
            "root_block_device.volume_type": "gp3",
          },
        }),
      );
      // A single block containing both attributes.
      expect(hcl.match(/root_block_device\s*\{/g)?.length).toBe(1);
      expect(hcl).toContain("volume_size = 20");
      expect(hcl).toContain('volume_type = "gp3"');
    });

    it("nests multi-level dotted keys", () => {
      const hcl = terraformResourceToHCL(
        makeResource({
          type: "google_compute_instance",
          name: "vm",
          attributes: { "boot_disk.initialize_params.image": "debian-cloud/debian-11" },
        }),
      );
      expect(hcl).toMatch(/boot_disk\s*\{[\s\S]*initialize_params\s*\{[\s\S]*image =/);
    });
  });

  // ── Terraform references vs plain strings ──────────────────────────────────
  describe("reference detection", () => {
    it("emits a genuine reference unquoted", () => {
      const hcl = terraformResourceToHCL(
        makeResource({ attributes: { vpc_id: "aws_vpc.main.id" } }),
      );
      expect(hcl).toContain("vpc_id = aws_vpc.main.id");
      expect(hcl).not.toContain('"aws_vpc.main.id"');
    });

    it("emits data.* references unquoted", () => {
      const hcl = terraformResourceToHCL(
        makeResource({ attributes: { ami: "data.aws_ami.ubuntu.id" } }),
      );
      expect(hcl).toContain("ami = data.aws_ami.ubuntu.id");
    });

    it("keeps a domain-like string quoted (not a reference)", () => {
      const hcl = terraformResourceToHCL(
        makeResource({ attributes: { endpoint: "s3.amazonaws.com" } }),
      );
      expect(hcl).toContain('endpoint = "s3.amazonaws.com"');
    });

    it("emits var.* unquoted", () => {
      const hcl = terraformResourceToHCL(
        makeResource({ attributes: { project: "var.project" } }),
      );
      expect(hcl).toContain("project = var.project");
    });
  });

  // ── Raw HCL expressions emitted verbatim ───────────────────────────────────
  describe("raw HCL expressions", () => {
    it("emits a function call unquoted", () => {
      const hcl = terraformResourceToHCL(
        makeResource({ attributes: { policy: 'jsonencode({"Version":"2012-10-17"})' } }),
      );
      expect(hcl).toContain('policy = jsonencode({"Version":"2012-10-17"})');
    });

    it("emits an interpolation unquoted", () => {
      const hcl = terraformResourceToHCL(
        makeResource({ attributes: { user_data: "${path.module}/init.sh" } }),
      );
      expect(hcl).toContain("user_data = ${path.module}/init.sh");
    });
  });

  // ── Value pruning ──────────────────────────────────────────────────────────
  describe("meaningful-value pruning", () => {
    it("skips empty, null and undefined attributes", () => {
      const hcl = terraformResourceToHCL(
        makeResource({
          attributes: {
            real: "keep",
            empty: "",
            blank: "   ",
            nil: null,
            undef: undefined,
            emptyArr: [],
          },
        }),
      );
      expect(hcl).toContain('real = "keep"');
      expect(hcl).not.toContain("empty");
      expect(hcl).not.toContain("blank");
      expect(hcl).not.toContain("nil");
      expect(hcl).not.toContain("undef");
      expect(hcl).not.toContain("emptyArr");
    });
  });

  // ── Special cases ──────────────────────────────────────────────────────────
  describe("special cases", () => {
    it("renders protocol -1 as the string \"-1\"", () => {
      const hcl = terraformResourceToHCL(
        makeResource({ type: "aws_security_group_rule", name: "all", attributes: { protocol: -1 } }),
      );
      expect(hcl).toContain('protocol = "-1"');
    });

    it("renders an array of objects as one nested block per item", () => {
      const hcl = terraformResourceToHCL(
        makeResource({
          type: "aws_security_group",
          name: "web",
          attributes: {
            ingress: [
              { from_port: 80, to_port: 80, protocol: "tcp" },
              { from_port: 443, to_port: 443, protocol: "tcp" },
            ],
          },
        }),
      );
      expect(hcl.match(/ingress\s*\{/g)?.length).toBe(2);
      expect(hcl).toContain("from_port = 80");
      expect(hcl).toContain("from_port = 443");
    });

    it("parses a string-encoded array of objects into nested blocks", () => {
      const hcl = terraformResourceToHCL(
        makeResource({
          type: "aws_security_group",
          name: "web",
          attributes: {
            ingress: '[{ from_port = 22, to_port = 22, protocol = "tcp" }]',
          },
        }),
      );
      expect(hcl).toMatch(/ingress\s*\{/);
      expect(hcl).toContain("from_port = 22");
      expect(hcl).toContain('protocol = "tcp"');
    });

    it("emits an empty nested block for [{}] nested inside a block with content", () => {
      // A bare top-level `access_config: [{}]` is pruned by the meaningfulness
      // guard, but when nested inside a block that has other meaningful content,
      // the empty block is preserved (e.g. GCP network_interface > access_config
      // asks for an ephemeral public IP).
      const hcl = terraformResourceToHCL(
        makeResource({
          type: "google_compute_instance",
          name: "vm",
          attributes: {
            network_interface: [{ network: "default", access_config: [{}] }],
          },
        }),
      );
      expect(hcl).toMatch(/network_interface\s*\{/);
      expect(hcl).toMatch(/access_config\s*\{\s*\}/);
    });
  });

  it("produces balanced braces", () => {
    const hcl = terraformResourceToHCL(
      makeResource({
        attributes: {
          "root_block_device.volume_size": 20,
          ingress: [{ from_port: 80, to_port: 80 }],
          ami: "ami-1",
        },
      }),
    );
    const opens = (hcl.match(/\{/g) ?? []).length;
    const closes = (hcl.match(/\}/g) ?? []).length;
    expect(opens).toBe(closes);
  });
});

describe("buildMultiProviderHcl", () => {
  const settings = defaultProviderSettings();

  it("emits a terraform required_providers block for AWS", () => {
    const project: TerraformProject = {
      provider: "aws",
      resources: [makeResource({ type: "aws_vpc", name: "main", attributes: { cidr_block: "10.0.0.0/16" } })],
    };
    const hcl = buildMultiProviderHcl(project, settings, "aws");
    expect(hcl).toContain("terraform {");
    expect(hcl).toContain("required_providers {");
    expect(hcl).toContain('source  = "hashicorp/aws"');
    expect(hcl).toContain('provider "aws" {');
    expect(hcl).toContain("region =");
    // The resource block is appended.
    expect(hcl).toContain('resource "aws_vpc" "main"');
  });

  it("falls back to var.project for the google provider with no explicit project", () => {
    const project: TerraformProject = {
      provider: "gcp",
      resources: [
        makeResource({ type: "google_compute_network", name: "vpc", attributes: { auto_create_subnetworks: false } }),
      ],
    };
    const hcl = buildMultiProviderHcl(project, settings, "gcp");
    expect(hcl).toContain('provider "google" {');
    expect(hcl).toContain("project = var.project");
  });

  it("detects multiple providers in use", () => {
    const project: TerraformProject = {
      provider: "aws",
      resources: [
        makeResource({ type: "aws_vpc", name: "main", attributes: { cidr_block: "10.0.0.0/16" } }),
        makeResource({ type: "google_compute_network", name: "vpc", attributes: { auto_create_subnetworks: false } }),
      ],
    };
    const hcl = buildMultiProviderHcl(project, settings, "aws");
    expect(hcl).toContain('source  = "hashicorp/aws"');
    expect(hcl).toContain('source  = "hashicorp/google"');
  });
});

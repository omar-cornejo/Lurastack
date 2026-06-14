import { describe, it, expect } from "vitest";
import {
  normalizeMappedReference,
  readNestedAttribute,
  writeNestedAttribute,
} from "./mappingRef";
import type { TerraformResource } from "../models/terraform";

const resource = (
  type: string,
  name: string,
  kind: "resource" | "data" = "resource",
): TerraformResource => ({
  id: `${type}.${name}`,
  kind,
  type,
  name,
  schemaId: type,
  config: { attributes: {}, blocks: {} },
  ui: { x: 0, y: 0, icon: "" },
});

describe("normalizeMappedReference", () => {
  // Types must exist in the schema catalog (NODE_SCHEMAS) for resolution.
  const resources = [resource("aws_subnet", "web"), resource("aws_region", "current", "data")];

  it("passes through an already-canonical reference", () => {
    expect(normalizeMappedReference("aws_subnet.web.id", "subnet_id", resources)).toBe(
      "aws_subnet.web.id",
    );
  });

  it("passes through var.* expressions", () => {
    expect(normalizeMappedReference("var.project", "project", resources)).toBe("var.project");
  });

  it("expands an abbreviated reference using the schema catalog", () => {
    expect(normalizeMappedReference("aws_subnet.web.id", "vpc_id", resources)).toBe(
      "aws_subnet.web.id",
    );
  });

  it("prefixes data sources with data. when expanding an abbreviated ref", () => {
    // A 2-segment ref is abbreviated; the resolver fills the attr and, for a
    // data source, prepends `data.`. (A full 3-segment ref is returned as-is.)
    const out = normalizeMappedReference("aws_region.current", "region", resources);
    expect(out).toBe("data.aws_region.current.id");
  });

  it("returns the raw value when the schema or resource is unknown", () => {
    expect(normalizeMappedReference("madeup.thing.id", "x", resources)).toBe("madeup.thing.id");
    expect(normalizeMappedReference("aws_subnet.nonexistent.id", "x", resources)).toBe(
      "aws_subnet.nonexistent.id",
    );
  });

  it("returns the raw value for non-reference text", () => {
    expect(normalizeMappedReference("just a string", "x", resources)).toBe("just a string");
  });
});

describe("readNestedAttribute", () => {
  it("reads a direct dotted key", () => {
    expect(readNestedAttribute({ "tags.Name": "n" }, "tags.Name")).toBe("n");
  });

  it("reads from a block-list shape", () => {
    expect(readNestedAttribute({ ingress: [{ from_port: 80 }] }, "ingress.from_port")).toBe(80);
  });

  it("returns undefined for a missing path", () => {
    expect(readNestedAttribute({}, "a.b")).toBeUndefined();
    expect(readNestedAttribute({ ingress: [] }, "ingress.from_port")).toBeUndefined();
  });
});

describe("writeNestedAttribute", () => {
  it("writes a top-level key", () => {
    expect(writeNestedAttribute({}, "cidr_block", "10.0.0.0/16")).toEqual({
      cidr_block: "10.0.0.0/16",
    });
  });

  it("deletes a top-level key when the value is empty", () => {
    expect(writeNestedAttribute({ cidr_block: "x" }, "cidr_block", "")).toEqual({});
  });

  it("writes into the first entry of a block-list", () => {
    const out = writeNestedAttribute({ ingress: [{ from_port: 80 }] }, "ingress.to_port", 443);
    expect(out.ingress).toEqual([{ from_port: 80, to_port: 443 }]);
  });

  it("creates a block-list when the block does not exist yet", () => {
    const out = writeNestedAttribute({}, "ingress.from_port", 22);
    expect(out.ingress).toEqual([{ from_port: 22 }]);
  });

  it("removes a legacy dotted-key entry when writing nested", () => {
    const out = writeNestedAttribute({ "ingress.from_port": 80 }, "ingress.from_port", 443);
    expect("ingress.from_port" in out).toBe(false);
    expect(out.ingress).toEqual([{ from_port: 443 }]);
  });
});

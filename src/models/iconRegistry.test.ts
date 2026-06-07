import { describe, it, expect } from "vitest";
import {
  resolveTerraformIcon,
  isSubnetIconPath,
  SUBNET_PUBLIC_ICON_PATH,
  SUBNET_PRIVATE_ICON_PATH,
} from "./iconRegistry";

describe("resolveTerraformIcon", () => {
  it("returns the mapped icon for a known type", () => {
    expect(resolveTerraformIcon("aws_vpc")).toContain("VPC");
    expect(resolveTerraformIcon("google_compute_instance")).toContain("gcp");
  });

  it("falls back to the default icon for an unknown type", () => {
    expect(resolveTerraformIcon("aws_unknown_thing")).toBe("/mock-node.svg");
  });

  describe("aws_subnet public/private rule", () => {
    it("returns the public icon for a truthy map_public_ip_on_launch", () => {
      for (const truthy of [true, "true", "1", "yes", 1]) {
        expect(resolveTerraformIcon("aws_subnet", { map_public_ip_on_launch: truthy })).toBe(
          SUBNET_PUBLIC_ICON_PATH,
        );
      }
    });

    it("returns the private icon for a falsy or absent value", () => {
      expect(resolveTerraformIcon("aws_subnet", { map_public_ip_on_launch: false })).toBe(
        SUBNET_PRIVATE_ICON_PATH,
      );
      expect(resolveTerraformIcon("aws_subnet", {})).toBe(SUBNET_PRIVATE_ICON_PATH);
      expect(resolveTerraformIcon("aws_subnet")).toBe(SUBNET_PRIVATE_ICON_PATH);
    });
  });
});

describe("isSubnetIconPath", () => {
  it("recognizes the two subnet icon paths", () => {
    expect(isSubnetIconPath(SUBNET_PUBLIC_ICON_PATH)).toBe(true);
    expect(isSubnetIconPath(SUBNET_PRIVATE_ICON_PATH)).toBe(true);
  });

  it("rejects other paths and undefined", () => {
    expect(isSubnetIconPath("/icons/aws/aws_vpc.svg")).toBe(false);
    expect(isSubnetIconPath(undefined)).toBe(false);
  });
});

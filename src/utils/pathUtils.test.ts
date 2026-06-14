import { describe, it, expect } from "vitest";
import { basename } from "./pathUtils";

describe("basename", () => {
  it("returns the last component of a posix path", () => {
    expect(basename("/home/user/main.tf")).toBe("main.tf");
  });

  it("handles windows backslashes", () => {
    expect(basename("C:\\projects\\demo\\main.tf")).toBe("main.tf");
  });

  it("returns undefined for empty or undefined input", () => {
    expect(basename(undefined)).toBeUndefined();
    expect(basename("")).toBeUndefined();
  });

  it("returns the input itself when there is no separator", () => {
    expect(basename("main.tf")).toBe("main.tf");
  });
});

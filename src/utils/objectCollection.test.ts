import { describe, it, expect } from "vitest";
import { isObjectCollection, getObjectFields } from "./objectCollection";

describe("isObjectCollection", () => {
  it("is true for a set/list of objects", () => {
    expect(isObjectCollection(["set", ["object", { a: "string" }]])).toBe(true);
    expect(isObjectCollection(["list", ["object", {}]])).toBe(true);
  });

  it("is false for a collection of scalars", () => {
    expect(isObjectCollection(["set", "string"])).toBe(false);
    expect(isObjectCollection(["list", "number"])).toBe(false);
  });

  it("is false for non-collection types", () => {
    expect(isObjectCollection("string")).toBe(false);
    expect(isObjectCollection(["object", {}])).toBe(false);
    expect(isObjectCollection([])).toBe(false);
    expect(isObjectCollection(null)).toBe(false);
  });
});

describe("getObjectFields", () => {
  it("returns the inner object's field map", () => {
    expect(getObjectFields(["set", ["object", { from_port: "number", protocol: "string" }]])).toEqual({
      from_port: "number",
      protocol: "string",
    });
  });

  it("returns an empty map for malformed types", () => {
    expect(getObjectFields(["set", "string"])).toEqual({});
    expect(getObjectFields("string")).toEqual({});
    expect(getObjectFields([])).toEqual({});
  });
});

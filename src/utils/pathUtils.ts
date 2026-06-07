// Extracted verbatim from CodePanel so it can be unit-tested. Returns the last
// path component, tolerating both POSIX and Windows separators.
export const basename = (input?: string): string | undefined => {
  if (!input) return undefined;
  const normalized = input.replace(/\\/g, "/");
  const parts = normalized.split("/");
  return parts[parts.length - 1];
};

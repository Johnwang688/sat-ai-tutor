export const schemaModules = [
  "auth",
  "domain",
  "practice",
  "progress",
  "tutor",
  "admin",
] as const;

export type SchemaModule = (typeof schemaModules)[number];

export * from "./admin";
export * from "./auth";
export * from "./domain";
export * from "./practice";
export * from "./progress";
export * from "./tutor";

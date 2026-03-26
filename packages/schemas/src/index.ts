export const schemaModules = [
  "auth",
  "domain",
  "practice",
  "progress",
  "tutor",
  "admin",
] as const;

export type SchemaModule = (typeof schemaModules)[number];

/*
TODO(shared-zod-schemas):
Turn this package into the single source of truth for request/response and
shared domain validation.

Scope:
- Add schema files for auth, taxonomy/domain data, practice APIs, progress APIs,
  tutor APIs, and admin APIs.
- Keep transport validation here so app routes and feature code import the same
  schemas.
- Do not move database query code into this package.

Naming:
- Use singular file names like `practice.ts` and `tutor.ts`.
- Export schema names like `CreateSessionInputSchema`,
  `ProgressOverviewResponseSchema`, and `TutorRespondInputSchema`.
*/

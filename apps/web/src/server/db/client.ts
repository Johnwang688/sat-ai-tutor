export type DbClientProvider = "supabase";

export function getDbClient(): never {
  throw new Error("Database client is not implemented yet.");
}

/*
TODO(db-client):
Implement the minimal server-side database client here.

Scope:
- Create one server-only client factory for privileged backend work.
- Keep V1 data access simple; use focused query modules per feature instead of a
  heavy repository abstraction.
- Separate admin/service-role access from student-scoped access once auth is in
  place.

Naming:
- Shared database files should use simple noun names like `client.ts`,
  `queries.ts`, and `mappers.ts`.
- Query functions should be verb-first and feature-specific, such as
  `createPracticeSession` or `getProgressOverview`.
*/

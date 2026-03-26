export const requiredEnvKeys = [
  "NEXT_PUBLIC_SUPABASE_URL",
  "NEXT_PUBLIC_SUPABASE_ANON_KEY",
  "SUPABASE_SERVICE_ROLE_KEY",
  "DATABASE_URL",
  "OPENAI_API_KEY",
  "OPENAI_MODEL_TUTOR",
  "OPENAI_MODEL_GENERATION",
] as const;

export const optionalEnvKeys = [
  "NEXT_PUBLIC_DESMOS_API_KEY",
  "NEXT_PUBLIC_POSTHOG_KEY",
  "SENTRY_DSN",
  "STRIPE_SECRET_KEY",
  "RESEND_API_KEY",
] as const;

export type RequiredEnvKey = (typeof requiredEnvKeys)[number];
export type OptionalEnvKey = (typeof optionalEnvKeys)[number];

/*
TODO(env-loader):
Implement a validated env loader in this module.

Scope:
- Parse required and optional env vars once on the server.
- Fail fast when required secrets are missing.
- Keep browser-safe keys separate from server-only secrets.
- Make API routes and server utilities import from this file instead of reading
  raw `process.env` throughout the codebase.

Naming:
- Export the parsed object as `env`.
- Group feature-specific subsets with names like `tutorEnv` only if a concrete
  feature needs that split later.
*/

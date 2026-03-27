/** Used when `OPENAI_MODEL_TUTOR` / `OPENAI_MODEL_GENERATION` are unset or blank. */
export const OPENAI_MODEL_DEFAULT = "gpt-5.4-nano";

export const requiredEnvKeys = [
  "NEXT_PUBLIC_SUPABASE_URL",
  "NEXT_PUBLIC_SUPABASE_ANON_KEY",
  "SUPABASE_SERVICE_ROLE_KEY",
  "DATABASE_URL",
  "OPENAI_API_KEY",
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

type ParsedEnv = Record<RequiredEnvKey, string> &
  Record<OptionalEnvKey, string | undefined> & {
    OPENAI_MODEL_TUTOR: string;
    OPENAI_MODEL_GENERATION: string;
  };

export type PublicEnv = Readonly<{
  NEXT_PUBLIC_SUPABASE_URL: string;
  NEXT_PUBLIC_SUPABASE_ANON_KEY: string;
  NEXT_PUBLIC_DESMOS_API_KEY: string | undefined;
  NEXT_PUBLIC_POSTHOG_KEY: string | undefined;
}>;

export type ServerEnv = Readonly<{
  SUPABASE_SERVICE_ROLE_KEY: string;
  DATABASE_URL: string;
  OPENAI_API_KEY: string;
  OPENAI_MODEL_TUTOR: string;
  OPENAI_MODEL_GENERATION: string;
  SENTRY_DSN: string | undefined;
  STRIPE_SECRET_KEY: string | undefined;
  RESEND_API_KEY: string | undefined;
}>;

function getTrimmedEnvValue(key: string): string | undefined {
  const value = process.env[key];
  if (typeof value !== "string") {
    return undefined;
  }

  const trimmed = value.trim();
  return trimmed.length > 0 ? trimmed : undefined;
}

function parseEnv(): ParsedEnv {
  const missingRequired: RequiredEnvKey[] = [];
  const requiredValues = {} as Record<RequiredEnvKey, string>;
  const optionalValues = {} as Record<OptionalEnvKey, string | undefined>;

  for (const key of requiredEnvKeys) {
    const value = getTrimmedEnvValue(key);
    if (!value) {
      missingRequired.push(key);
      continue;
    }

    requiredValues[key] = value;
  }

  if (missingRequired.length > 0) {
    throw new Error(
      [
        "Missing required environment variables:",
        ...missingRequired.map((key) => `- ${key}`),
      ].join("\n"),
    );
  }

  for (const key of optionalEnvKeys) {
    optionalValues[key] = getTrimmedEnvValue(key);
  }

  optionalValues.NEXT_PUBLIC_DESMOS_API_KEY =
    getTrimmedEnvValue("DESMOS_API_KEY") ?? optionalValues.NEXT_PUBLIC_DESMOS_API_KEY;

  const openaiModelTutor =
    getTrimmedEnvValue("OPENAI_MODEL_TUTOR") ?? OPENAI_MODEL_DEFAULT;
  const openaiModelGeneration =
    getTrimmedEnvValue("OPENAI_MODEL_GENERATION") ?? OPENAI_MODEL_DEFAULT;

  return {
    ...requiredValues,
    ...optionalValues,
    OPENAI_MODEL_TUTOR: openaiModelTutor,
    OPENAI_MODEL_GENERATION: openaiModelGeneration,
  };
}

const parsedEnv = parseEnv();

export const env: Readonly<ParsedEnv> = Object.freeze(parsedEnv);

export const publicEnv: PublicEnv = Object.freeze({
  NEXT_PUBLIC_SUPABASE_URL: env.NEXT_PUBLIC_SUPABASE_URL,
  NEXT_PUBLIC_SUPABASE_ANON_KEY: env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
  NEXT_PUBLIC_DESMOS_API_KEY: env.NEXT_PUBLIC_DESMOS_API_KEY,
  NEXT_PUBLIC_POSTHOG_KEY: env.NEXT_PUBLIC_POSTHOG_KEY,
});

export const serverEnv: ServerEnv = Object.freeze({
  SUPABASE_SERVICE_ROLE_KEY: env.SUPABASE_SERVICE_ROLE_KEY,
  DATABASE_URL: env.DATABASE_URL,
  OPENAI_API_KEY: env.OPENAI_API_KEY,
  OPENAI_MODEL_TUTOR: env.OPENAI_MODEL_TUTOR,
  OPENAI_MODEL_GENERATION: env.OPENAI_MODEL_GENERATION,
  SENTRY_DSN: env.SENTRY_DSN,
  STRIPE_SECRET_KEY: env.STRIPE_SECRET_KEY,
  RESEND_API_KEY: env.RESEND_API_KEY,
});

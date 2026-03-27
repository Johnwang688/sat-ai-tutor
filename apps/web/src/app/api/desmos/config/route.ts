import { NextResponse } from "next/server";

/**
 * Exposes the Desmos API key to the client at request time.
 *
 * Read `process.env` here (not the frozen `env` snapshot from `@/server/env`) so
 * deployment platforms inject the key at runtime. GitHub repo secrets do not
 * reach Vercel/hosting unless you also add them there (or pass them in CI).
 */
export const dynamic = "force-dynamic";

export async function GET() {
  const apiKey =
    process.env.DESMOS_API_KEY?.trim()
    || process.env.NEXT_PUBLIC_DESMOS_API_KEY?.trim()
    || null;
  return NextResponse.json({ apiKey });
}

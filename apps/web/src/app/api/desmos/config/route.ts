import { NextResponse } from "next/server";
import { env } from "@/server/env";

/**
 * Exposes the Desmos API key to the client at request time so DESMOS_API_KEY
 * can live in server-only deployment env without being inlined at `next build`.
 */
export async function GET() {
  const raw = env.NEXT_PUBLIC_DESMOS_API_KEY;
  const apiKey = raw?.trim() ? raw.trim() : null;
  return NextResponse.json({ apiKey });
}

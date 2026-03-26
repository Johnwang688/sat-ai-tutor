import { NextResponse } from "next/server";

// TODO(api/session-routes): POST — Finalize scoring for `sessionId`, persist review/explanation payload, update mastery aggregates. Validate with `SubmitSessionInputSchema` / `SubmitSessionResponseSchema`. Server helper: `finalizeSession` (or `submitSession`).

export async function POST() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

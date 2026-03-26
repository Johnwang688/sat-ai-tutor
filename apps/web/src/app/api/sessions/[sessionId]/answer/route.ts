import { NextResponse } from "next/server";

// TODO(api/session-routes): POST — Persist one answer attempt for `sessionId` (body: question id + choice); return updated in-session progress state the client needs. Validate with `SubmitAnswerInputSchema` / `SubmitAnswerResponseSchema`. Server helper: `submitAnswer`.

export async function POST() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

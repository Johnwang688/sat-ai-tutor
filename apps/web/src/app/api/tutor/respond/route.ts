import { NextResponse } from "next/server";

// TODO(api/tutor-route): POST — From session + question context, run reveal policy (`enforce*`), assemble prompts (`build*` + `packages/prompts` templates), call the model server-side, stream or return text, and log the interaction tied to user/session. Validate `TutorRespondInputSchema` / `TutorRespondResponseSchema`.

export async function POST() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

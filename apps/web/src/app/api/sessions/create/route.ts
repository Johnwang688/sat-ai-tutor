import { NextResponse } from "next/server";

// TODO(api/session-routes): POST — Create a practice session for the authenticated student; persist session rows and attach ordered question snapshots from the bank. Validate with `CreateSessionInputSchema`, respond with `CreateSessionResponseSchema`. Server helper: `createSession`.

export async function POST() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

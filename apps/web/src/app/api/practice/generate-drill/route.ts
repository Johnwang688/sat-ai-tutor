import { NextResponse } from "next/server";

// TODO(api/practice): POST — Given concept/section filters, select or generate a drill question list (per product rules), return ids or snapshots for starting a session (may pair with `createSession` or embed creation). Validate request/response schemas per api README naming (`GenerateDrillInputSchema`, etc.).

export async function POST() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

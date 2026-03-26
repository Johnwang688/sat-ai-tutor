import { NextResponse } from "next/server";

// TODO(admin-routes): Enforce admin role before reads/writes (same pattern as `/api/admin/questions`).

// TODO(api/admin-questions): GET — Fetch one vetted question by `questionId`. PATCH — Update draft fields, taxonomy links, answer schema. Keep handlers separate from variant review routes under `/api/admin/review/*`.

export async function GET() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

export async function PATCH() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

import { NextResponse } from "next/server";

// TODO(admin-routes): Enforce admin role first.

// TODO(api/admin-questions): POST — Transition question from draft to published per schema rules.

// TODO(admin-routes): Write an audit row (who/when/what) for this publish action.

export async function POST() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

import { NextResponse } from "next/server";

// TODO(admin-routes): Enforce admin role first.

// TODO(api/admin-review): POST — Approve `variantId` for downstream use; validate state transitions.

// TODO(admin-routes): Write an audit row for approve (actor, variant id, timestamp, metadata).

export async function POST() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

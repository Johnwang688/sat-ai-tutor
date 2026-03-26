import { NextResponse } from "next/server";

// TODO(admin-routes): Enforce admin role first.

// TODO(api/admin-review): POST — Reject `variantId` with reason; keep variant workflow isolated from vetted `questions` publish.

// TODO(admin-routes): Write an audit row for reject.

export async function POST() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

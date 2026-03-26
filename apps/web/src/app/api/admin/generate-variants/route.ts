import { NextResponse } from "next/server";

// TODO(admin-routes): Enforce admin role first.

// TODO(api/admin-variants): POST — Generated-variant pipeline only: enqueue or run variant generation from a parent vetted question; do not reuse vetted-question editor handlers. Separate code paths from `/api/admin/questions/*` per api README.

export async function POST() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

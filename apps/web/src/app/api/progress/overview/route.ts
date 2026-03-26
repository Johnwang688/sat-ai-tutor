import { NextResponse } from "next/server";

// TODO(api/progress-route): GET — Return dashboard-ready JSON for the signed-in student only (section rollups, concept snapshot, recent sessions, optional recommendation inputs). Validate output with `ProgressOverviewResponseSchema`. Never leak another user's data.

export async function GET() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

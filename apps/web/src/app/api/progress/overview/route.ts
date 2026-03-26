import { NextResponse } from "next/server";
import {
  resolvePracticeUserId,
} from "../../../../features/practice/server";
import { getProgressOverview } from "../../../../features/progress/server";

type ProgressOverviewResponseSchema = ReturnType<typeof getProgressOverview>;

export async function GET(request: Request) {
  try {
    const userId = resolvePracticeUserId(request);
    const payload: ProgressOverviewResponseSchema = getProgressOverview(userId);
    return NextResponse.json(payload, { status: 200 });
  } catch (error) {
    return NextResponse.json(
      { error: error instanceof Error ? error.message : "Unable to load overview." },
      { status: 400 },
    );
  }
}

import { NextResponse } from "next/server";
import {
  finalizeSession,
  resolvePracticeUserId,
} from "../../../../../features/practice/server";

type SubmitSessionInputSchema = Record<string, never>;

type RouteContext = {
  params: Promise<{
    sessionId: string;
  }>;
};

export async function POST(request: Request, context: RouteContext) {
  try {
    const { sessionId } = await context.params;
    await request.json().catch(() => ({} as SubmitSessionInputSchema));
    const userId = resolvePracticeUserId(request);
    const result = finalizeSession({ userId, sessionId });
    return NextResponse.json(result, { status: 200 });
  } catch (error) {
    return NextResponse.json(
      { error: error instanceof Error ? error.message : "Unable to submit session." },
      { status: 400 },
    );
  }
}

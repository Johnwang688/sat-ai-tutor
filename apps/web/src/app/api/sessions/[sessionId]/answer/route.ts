import { NextResponse } from "next/server";
import {
  resolvePracticeUserId,
  submitAnswer,
} from "../../../../../features/practice/server";

type SubmitAnswerInputSchema = {
  questionId: string;
  choiceIndex: number;
};

type RouteContext = {
  params: Promise<{
    sessionId: string;
  }>;
};

export async function POST(request: Request, context: RouteContext) {
  try {
    const { sessionId } = await context.params;
    const body = (await request.json()) as Partial<SubmitAnswerInputSchema>;
    if (!body.questionId || typeof body.choiceIndex !== "number") {
      return NextResponse.json(
        { error: "questionId and numeric choiceIndex are required." },
        { status: 400 },
      );
    }

    const userId = resolvePracticeUserId(request);
    const response = submitAnswer({
      userId,
      sessionId,
      questionId: body.questionId,
      choiceIndex: body.choiceIndex,
    });
    return NextResponse.json(response, { status: 200 });
  } catch (error) {
    return NextResponse.json(
      { error: error instanceof Error ? error.message : "Unable to submit answer." },
      { status: 400 },
    );
  }
}

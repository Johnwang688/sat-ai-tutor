import { NextResponse } from "next/server";
import { assertAdminFromRequest } from "@/features/admin/server/auth";
import { jsonError, withAdminRouteErrors } from "@/features/admin/server/http";
import {
  getVettedQuestionById,
  updateQuestionDraft,
} from "@/features/admin/server/store";

export async function GET(
  request: Request,
  context: { params: Promise<{ questionId: string }> },
) {
  return withAdminRouteErrors(async () => {
    assertAdminFromRequest(request);
    const { questionId } = await context.params;
    const question = getVettedQuestionById(questionId);
    if (!question) {
      return jsonError("Question not found.", 404);
    }
    return NextResponse.json({ question });
  });
}

export async function PATCH(
  request: Request,
  context: { params: Promise<{ questionId: string }> },
) {
  return withAdminRouteErrors(async () => {
    const actor = assertAdminFromRequest(request);
    const { questionId } = await context.params;
    const body = (await request.json()) as Record<string, unknown>;

    const difficulty = body.difficulty === undefined ? undefined : Number(body.difficulty);
    if (
      difficulty !== undefined &&
      (!Number.isInteger(difficulty) || difficulty < 1 || difficulty > 5)
    ) {
      return jsonError("difficulty must be an integer between 1 and 5.", 400);
    }

    const question = updateQuestionDraft(
      questionId,
      {
        title: typeof body.title === "string" ? body.title : undefined,
        conceptSlug:
          typeof body.conceptSlug === "string" ? body.conceptSlug : undefined,
        difficulty: difficulty as 1 | 2 | 3 | 4 | 5 | undefined,
        calculatorAllowed:
          typeof body.calculatorAllowed === "boolean"
            ? body.calculatorAllowed
            : undefined,
        desmosRelevant:
          typeof body.desmosRelevant === "boolean" ? body.desmosRelevant : undefined,
        answerSchema:
          typeof body.answerSchema === "string" ? body.answerSchema : undefined,
        explanationJson:
          typeof body.explanationJson === "string" ? body.explanationJson : undefined,
      },
      actor,
    );

    if (!question) {
      return jsonError("Question not found or not editable.", 404);
    }

    return NextResponse.json({ question });
  });
}

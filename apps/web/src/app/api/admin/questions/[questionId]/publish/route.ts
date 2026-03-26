import { NextResponse } from "next/server";
import { assertAdminFromRequest } from "@/features/admin/server/auth";
import { jsonError, withAdminRouteErrors } from "@/features/admin/server/http";
import { publishQuestion } from "@/features/admin/server/store";

export async function POST(
  request: Request,
  context: { params: Promise<{ questionId: string }> },
) {
  return withAdminRouteErrors(async () => {
    const actor = assertAdminFromRequest(request);
    const { questionId } = await context.params;
    const question = publishQuestion(questionId, actor);

    if (!question) {
      return jsonError("Question not found or already published.", 404);
    }

    return NextResponse.json({ question });
  });
}

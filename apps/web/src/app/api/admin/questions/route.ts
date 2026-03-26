import { NextResponse } from "next/server";
import { assertAdminFromRequest } from "@/features/admin/server/auth";
import { jsonError, withAdminRouteErrors } from "@/features/admin/server/http";
import { createQuestionDraft, listVettedQuestions } from "@/features/admin/server/store";

function asSection(value: string | null): "reading-writing" | "math" | undefined {
  if (value === "reading-writing" || value === "math") {
    return value;
  }
  return undefined;
}

function asStatus(value: string | null): "draft" | "published" | undefined {
  if (value === "draft" || value === "published") {
    return value;
  }
  return undefined;
}

export async function GET(request: Request) {
  return withAdminRouteErrors(async () => {
    assertAdminFromRequest(request);
    const url = new URL(request.url);
    const section = asSection(url.searchParams.get("section"));
    const status = asStatus(url.searchParams.get("status"));
    const search = url.searchParams.get("search") ?? undefined;

    return NextResponse.json({
      questions: listVettedQuestions({ section, status, search }),
    });
  });
}

export async function POST(request: Request) {
  return withAdminRouteErrors(async () => {
    const actor = assertAdminFromRequest(request);
    const body = (await request.json()) as Record<string, unknown>;
    const title = typeof body.title === "string" ? body.title.trim() : "";
    const conceptSlug =
      typeof body.conceptSlug === "string" ? body.conceptSlug.trim() : "";
    const difficulty = Number(body.difficulty);

    if (!title || !conceptSlug) {
      return jsonError("title and conceptSlug are required.", 400);
    }
    if (!Number.isInteger(difficulty) || difficulty < 1 || difficulty > 5) {
      return jsonError("difficulty must be an integer between 1 and 5.", 400);
    }

    const question = createQuestionDraft(
      {
        title,
        conceptSlug,
        difficulty: difficulty as 1 | 2 | 3 | 4 | 5,
        calculatorAllowed: Boolean(body.calculatorAllowed),
        desmosRelevant: Boolean(body.desmosRelevant),
        answerSchema: typeof body.answerSchema === "string" ? body.answerSchema : "{}",
        explanationJson: typeof body.explanationJson === "string" ? body.explanationJson : "{}",
      },
      actor,
    );

    return NextResponse.json({ question }, { status: 201 });
  });
}

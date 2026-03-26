import { NextResponse } from "next/server";

// TODO(admin-routes): Call shared `assertAdmin()` (or equivalent) at the start of every `/api/admin/*` handler.

// TODO(api/admin-questions): GET — List vetted questions with filters. POST — Create draft question_bank row. Vetted-question workflow only (not variant review). Use `QuestionListResponseSchema` / `CreateQuestionInputSchema` naming per api README.

export async function GET() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

export async function POST() {
  return NextResponse.json({ error: "Not implemented" }, { status: 501 });
}

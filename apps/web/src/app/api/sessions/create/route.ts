import { NextResponse } from "next/server";
import {
  createSession,
  resolvePracticeUserId,
  type SectionSlug,
  type SessionTypeSlug,
} from "../../../../features/practice/server";

type CreateSessionInputSchema = {
  sessionType: SessionTypeSlug;
  section: SectionSlug;
  conceptSlug?: string;
};

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as Partial<CreateSessionInputSchema>;
    if (!body.sessionType || !body.section) {
      return NextResponse.json(
        { error: "sessionType and section are required." },
        { status: 400 },
      );
    }

    const userId = resolvePracticeUserId(request);
    const created = createSession({
      userId,
      sessionType: body.sessionType,
      section: body.section,
      conceptSlug: body.conceptSlug,
    });

    return NextResponse.json(created, { status: 201 });
  } catch (error) {
    return NextResponse.json(
      { error: error instanceof Error ? error.message : "Unable to create session." },
      { status: 400 },
    );
  }
}

import { NextResponse } from "next/server";
import {
  generateDrill,
  resolvePracticeUserId,
  type SectionSlug,
} from "../../../../features/practice/server";

type GenerateDrillInputSchema = {
  conceptSlug?: string;
  section?: SectionSlug;
  count?: number;
  createSession?: boolean;
};

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as GenerateDrillInputSchema;
    const userId = resolvePracticeUserId(request);
    const result = generateDrill({
      userId,
      conceptSlug: body.conceptSlug,
      section: body.section,
      count: body.count,
      createSession: body.createSession,
    });
    return NextResponse.json(result, { status: 200 });
  } catch (error) {
    return NextResponse.json(
      { error: error instanceof Error ? error.message : "Unable to generate drill." },
      { status: 400 },
    );
  }
}

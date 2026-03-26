import { NextResponse } from "next/server";
import {
  buildTutorContext,
  buildTutorPromptAssembly,
  enforceTutorRevealPolicy,
  generateDeterministicTutorResponse,
  TutorRespondInputSchema,
  TutorRespondResponseSchema,
  TutorValidationError,
} from "../../../../features/tutor/server";

function createResponseId(): string {
  return `tutor_${Date.now().toString(36)}_${Math.random().toString(36).slice(2, 8)}`;
}

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as unknown;
    const input = TutorRespondInputSchema.parse(body);

    const context = buildTutorContext(input);
    const policy = enforceTutorRevealPolicy(context);
    const promptAssembly = buildTutorPromptAssembly(context, policy);

    const tutorMessage = generateDeterministicTutorResponse({
      studentMessage: input.message,
      context,
      policy,
    });

    const response = TutorRespondResponseSchema.parse({
      responseId: createResponseId(),
      createdAt: new Date().toISOString(),
      tutorMessage,
      tutorMode: policy.effectiveMode,
      revealState: policy.revealState,
      blockedDirectAnswer: policy.blockedDirectAnswer,
      model: {
        provider: "deterministic",
        id: "tutor-policy-v1",
      },
      promptMetadata: {
        modules: promptAssembly.modules,
        versions: promptAssembly.versions,
      },
    });

    console.info("[tutor.respond]", {
      userId: context.userId,
      sessionId: context.sessionId,
      questionId: context.questionId,
      tutorMode: response.tutorMode,
      revealState: response.revealState,
      blockedDirectAnswer: response.blockedDirectAnswer,
      promptVersions: response.promptMetadata.versions,
      policyReason: policy.policyReason,
    });

    return NextResponse.json(response, { status: 200 });
  } catch (error) {
    if (error instanceof TutorValidationError) {
      return NextResponse.json({ error: error.message }, { status: 400 });
    }

    if (error instanceof SyntaxError) {
      return NextResponse.json(
        { error: "Invalid JSON request body." },
        { status: 400 },
      );
    }

    return NextResponse.json(
      { error: "Unable to process tutor response request." },
      { status: 500 },
    );
  }
}

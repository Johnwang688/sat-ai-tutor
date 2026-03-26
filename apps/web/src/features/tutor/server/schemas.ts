export const tutorModes = [
  "hint",
  "teach-concept",
  "guided-solve",
  "full-explanation",
  "generate-drill",
] as const;

export const answerStates = [
  "unanswered",
  "answered_correct",
  "answered_incorrect",
] as const;

export const revealStates = ["protected", "allowed"] as const;

export type TutorMode = (typeof tutorModes)[number];
export type AnswerState = (typeof answerStates)[number];
export type RevealState = (typeof revealStates)[number];

export type TutorRespondInput = {
  userId: string;
  message: string;
  tutorMode: TutorMode;
  sessionId: string | null;
  questionId: string | null;
  section: string | null;
  domain: string | null;
  concept: string | null;
  subskill: string | null;
  answerState: AnswerState;
  requestedRevealState: RevealState;
  masterySnapshot: Record<string, unknown> | null;
  questionSnapshot: Record<string, unknown> | null;
};

export type TutorRespondResponse = {
  responseId: string;
  createdAt: string;
  tutorMessage: string;
  tutorMode: TutorMode;
  revealState: RevealState;
  blockedDirectAnswer: boolean;
  model: {
    provider: "deterministic";
    id: string;
  };
  promptMetadata: {
    modules: ReadonlyArray<"tutor-system" | "tutor-policy" | "tutor-context">;
    versions: {
      system: string;
      policy: string;
      context: string;
    };
  };
};

export class TutorValidationError extends Error {}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === "object" && value !== null;
}

function parseNonEmptyString(value: unknown, fieldName: string): string {
  if (typeof value !== "string") {
    throw new TutorValidationError(`${fieldName} must be a string.`);
  }

  const trimmed = value.trim();
  if (!trimmed) {
    throw new TutorValidationError(`${fieldName} must not be empty.`);
  }

  return trimmed;
}

function parseOptionalString(value: unknown): string | null {
  if (value == null) {
    return null;
  }
  if (typeof value !== "string") {
    throw new TutorValidationError("Optional string fields must be strings when provided.");
  }

  const trimmed = value.trim();
  return trimmed.length > 0 ? trimmed : null;
}

function parseEnum<T extends string>(
  value: unknown,
  options: readonly T[],
  fallback: T,
): T {
  if (typeof value !== "string") {
    return fallback;
  }

  const normalized = value.trim();
  return (options as readonly string[]).includes(normalized)
    ? (normalized as T)
    : fallback;
}

function parseOptionalRecord(value: unknown): Record<string, unknown> | null {
  if (value == null) {
    return null;
  }
  if (!isRecord(value) || Array.isArray(value)) {
    throw new TutorValidationError("Snapshot fields must be JSON objects when provided.");
  }
  return value;
}

export const TutorRespondInputSchema = {
  parse(payload: unknown): TutorRespondInput {
    if (!isRecord(payload)) {
      throw new TutorValidationError("Request body must be a JSON object.");
    }

    return {
      userId: parseNonEmptyString(payload.userId, "userId"),
      message: parseNonEmptyString(payload.message, "message"),
      tutorMode: parseEnum(payload.tutorMode, tutorModes, "hint"),
      sessionId: parseOptionalString(payload.sessionId),
      questionId: parseOptionalString(payload.questionId),
      section: parseOptionalString(payload.section),
      domain: parseOptionalString(payload.domain),
      concept: parseOptionalString(payload.concept),
      subskill: parseOptionalString(payload.subskill),
      answerState: parseEnum(payload.answerState, answerStates, "unanswered"),
      requestedRevealState: parseEnum(
        payload.revealState,
        revealStates,
        "protected",
      ),
      masterySnapshot: parseOptionalRecord(payload.masterySnapshot),
      questionSnapshot: parseOptionalRecord(payload.questionSnapshot),
    };
  },
};

export const TutorRespondResponseSchema = {
  parse(payload: unknown): TutorRespondResponse {
    if (!isRecord(payload)) {
      throw new TutorValidationError("Tutor response payload must be an object.");
    }

    const responseId = parseNonEmptyString(payload.responseId, "responseId");
    const createdAt = parseNonEmptyString(payload.createdAt, "createdAt");
    const tutorMessage = parseNonEmptyString(payload.tutorMessage, "tutorMessage");
    const tutorMode = parseEnum(payload.tutorMode, tutorModes, "hint");
    const revealState = parseEnum(payload.revealState, revealStates, "protected");

    if (!isRecord(payload.model)) {
      throw new TutorValidationError("model must be an object.");
    }
    if (!isRecord(payload.promptMetadata)) {
      throw new TutorValidationError("promptMetadata must be an object.");
    }

    const provider =
      payload.model.provider === "deterministic"
        ? "deterministic"
        : (() => {
            throw new TutorValidationError("model.provider must be deterministic.");
          })();

    const modelId = parseNonEmptyString(payload.model.id, "model.id");

    const rawModules = payload.promptMetadata.modules;
    if (!Array.isArray(rawModules) || rawModules.length === 0) {
      throw new TutorValidationError("promptMetadata.modules must be a non-empty array.");
    }

    const modules = rawModules.map((moduleName) =>
      parseEnum(
        moduleName,
        ["tutor-system", "tutor-policy", "tutor-context"] as const,
        "tutor-system",
      ),
    ) as TutorRespondResponse["promptMetadata"]["modules"];

    if (!isRecord(payload.promptMetadata.versions)) {
      throw new TutorValidationError("promptMetadata.versions must be an object.");
    }

    return {
      responseId,
      createdAt,
      tutorMessage,
      tutorMode,
      revealState,
      blockedDirectAnswer: payload.blockedDirectAnswer === true,
      model: {
        provider,
        id: modelId,
      },
      promptMetadata: {
        modules,
        versions: {
          system: parseNonEmptyString(
            payload.promptMetadata.versions.system,
            "promptMetadata.versions.system",
          ),
          policy: parseNonEmptyString(
            payload.promptMetadata.versions.policy,
            "promptMetadata.versions.policy",
          ),
          context: parseNonEmptyString(
            payload.promptMetadata.versions.context,
            "promptMetadata.versions.context",
          ),
        },
      },
    };
  },
};

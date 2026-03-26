import type { TutorRespondInput } from "./schemas";

export type TutorContext = {
  userId: string;
  sessionId: string | null;
  questionId: string | null;
  section: string | null;
  domain: string | null;
  concept: string | null;
  subskill: string | null;
  answerState: TutorRespondInput["answerState"];
  tutorMode: TutorRespondInput["tutorMode"];
  requestedRevealState: TutorRespondInput["requestedRevealState"];
  masterySnapshotJson: string;
  questionSnapshotJson: string;
};

export function buildTutorContext(input: TutorRespondInput): TutorContext {
  return {
    userId: input.userId,
    sessionId: input.sessionId,
    questionId: input.questionId,
    section: input.section,
    domain: input.domain,
    concept: input.concept,
    subskill: input.subskill,
    answerState: input.answerState,
    tutorMode: input.tutorMode,
    requestedRevealState: input.requestedRevealState,
    masterySnapshotJson: JSON.stringify(input.masterySnapshot ?? {}),
    questionSnapshotJson: JSON.stringify(input.questionSnapshot ?? {}),
  };
}

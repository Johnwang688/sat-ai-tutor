import type { TutorContext } from "./build-tutor-context";
import type { RevealState, TutorMode } from "./schemas";

export type TutorPolicyResult = {
  revealState: RevealState;
  effectiveMode: TutorMode;
  blockedDirectAnswer: boolean;
  policyReason: string;
};

export function enforceTutorRevealPolicy(context: TutorContext): TutorPolicyResult {
  const answerAllowsReveal = context.answerState !== "unanswered";
  const requestedAllowed = context.requestedRevealState === "allowed";
  const revealState: RevealState =
    answerAllowsReveal && requestedAllowed ? "allowed" : "protected";

  const requestedMode = context.tutorMode;
  const fullExplanationBlocked =
    revealState === "protected" && requestedMode === "full-explanation";

  const effectiveMode = fullExplanationBlocked ? "guided-solve" : requestedMode;

  const policyReason =
    revealState === "allowed"
      ? "Reveal is allowed because the question has an answer state and reveal was requested."
      : "Reveal remains protected for active or unanswered work.";

  return {
    revealState,
    effectiveMode,
    blockedDirectAnswer: fullExplanationBlocked,
    policyReason,
  };
}

import type { TutorContext } from "./build-tutor-context";
import type { TutorPolicyResult } from "./enforce-tutor-reveal-policy";

type Args = {
  studentMessage: string;
  context: TutorContext;
  policy: TutorPolicyResult;
};

function firstSentence(text: string): string {
  const trimmed = text.trim();
  const firstBreak = trimmed.search(/[.!?]\s/);
  if (firstBreak === -1) {
    return trimmed;
  }
  return trimmed.slice(0, firstBreak + 1);
}

export function generateDeterministicTutorResponse({
  studentMessage,
  context,
  policy,
}: Args): string {
  const concept = context.concept ?? "this SAT skill";
  const section = context.section ?? "the active section";
  const studentLead = firstSentence(studentMessage);

  if (policy.revealState === "allowed") {
    return [
      `Let's break this down for ${concept}.`,
      `You asked: "${studentLead}"`,
      "Since reveal is allowed, here is a full explanation path:",
      "1) Restate what the question is asking in your own words.",
      `2) Use the core ${section} rule for ${concept}.`,
      "3) Eliminate choices that break the rule, then verify the best remaining choice.",
      "4) Finish by checking units, wording, and boundary conditions.",
    ].join(" ");
  }

  if (policy.effectiveMode === "teach-concept") {
    return [
      `Quick concept lesson for ${concept}:`,
      "Focus on the governing rule first, then test each option against that rule.",
      "I will keep this in hint mode and avoid giving the final answer directly.",
      "Try one step now and tell me what you got.",
    ].join(" ");
  }

  if (policy.effectiveMode === "generate-drill") {
    return [
      `Protected-mode drill ideas for ${concept}:`,
      "1) One easier item that isolates a single step.",
      "2) One medium item with a common distractor trap.",
      "3) One challenge item that mixes two subskills.",
      "After each, explain your reasoning in one sentence.",
    ].join(" ");
  }

  return [
    `Hint for ${concept}:`,
    "Start by identifying the exact quantity the problem asks for.",
    "Then apply one rule before doing any heavy computation.",
    "Share your next step and I will guide the follow-up.",
  ].join(" ");
}

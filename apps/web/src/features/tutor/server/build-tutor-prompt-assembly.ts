import {
  promptModules,
  promptTemplates,
} from "../../../../../../packages/prompts/src/index";
import type { TutorContext } from "./build-tutor-context";
import type { TutorPolicyResult } from "./enforce-tutor-reveal-policy";

export type TutorPromptAssembly = {
  modules: typeof promptModules;
  versions: {
    system: string;
    policy: string;
    context: string;
  };
  contextBlock: string;
  combinedPrompt: string;
};

function toPromptLine(label: string, value: string | null): string {
  return `${label}: ${value ?? "null"}`;
}

export function buildTutorPromptAssembly(
  context: TutorContext,
  policy: TutorPolicyResult,
): TutorPromptAssembly {
  const contextBlock = [
    toPromptLine("user_id", context.userId),
    toPromptLine("session_id", context.sessionId),
    toPromptLine("question_id", context.questionId),
    toPromptLine("section", context.section),
    toPromptLine("domain", context.domain),
    toPromptLine("concept", context.concept),
    toPromptLine("subskill", context.subskill),
    toPromptLine("answer_state", context.answerState),
    toPromptLine("reveal_state", policy.revealState),
    toPromptLine("tutor_mode", policy.effectiveMode),
    toPromptLine("mastery_snapshot_json", context.masterySnapshotJson),
    toPromptLine("question_snapshot_json", context.questionSnapshotJson),
  ].join("\n");

  const combinedPrompt = [
    promptTemplates["tutor-system"].text,
    promptTemplates["tutor-policy"].text,
    promptTemplates["tutor-context"].text,
    "",
    "Structured context follows:",
    contextBlock,
  ].join("\n\n");

  return {
    modules: promptModules,
    versions: {
      system: promptTemplates["tutor-system"].version,
      policy: promptTemplates["tutor-policy"].version,
      context: promptTemplates["tutor-context"].version,
    },
    contextBlock,
    combinedPrompt,
  };
}

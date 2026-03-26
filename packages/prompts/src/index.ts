import {
  tutorContextPrompt,
  tutorContextPromptVersion,
} from "./tutor-context";
import {
  tutorRevealPolicyPrompt,
  tutorRevealPolicyPromptVersion,
} from "./tutor-policy";
import {
  tutorSystemPrompt,
  tutorSystemPromptVersion,
} from "./tutor-system";

export const promptModules = ["tutor-system", "tutor-policy", "tutor-context"] as const;

export type PromptModule = (typeof promptModules)[number];

export type PromptTemplate = {
  module: PromptModule;
  version: string;
  text: string;
};

export const promptTemplates: Readonly<Record<PromptModule, PromptTemplate>> = {
  "tutor-context": {
    module: "tutor-context",
    version: tutorContextPromptVersion,
    text: tutorContextPrompt,
  },
  "tutor-policy": {
    module: "tutor-policy",
    version: tutorRevealPolicyPromptVersion,
    text: tutorRevealPolicyPrompt,
  },
  "tutor-system": {
    module: "tutor-system",
    version: tutorSystemPromptVersion,
    text: tutorSystemPrompt,
  },
};

export {
  tutorContextPrompt,
  tutorContextPromptVersion,
  tutorRevealPolicyPrompt,
  tutorRevealPolicyPromptVersion,
  tutorSystemPrompt,
  tutorSystemPromptVersion,
};

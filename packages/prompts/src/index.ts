export const promptModules = ["tutor-system", "tutor-policy", "tutor-context"] as const;

export type PromptModule = (typeof promptModules)[number];

/*
TODO(prompt-pack):
Turn this package into the shared home for stable prompt text and prompt
versioning.

Scope:
- Start with tutor system, tutor policy, and tutor context prompts.
- Keep prompt text separate from runtime data assembly.
- Add prompt version identifiers so tutor interactions can be audited later.

Naming:
- Use file names like `tutor-system.ts` and `tutor-policy.ts`.
- Export values with clear names like `tutorSystemPrompt` and
  `tutorRevealPolicyPrompt`.
*/

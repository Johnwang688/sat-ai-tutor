export const tutorContextPromptVersion = "2026-03-25.tutor-context.v1";

export const tutorContextPrompt = `
Use the structured context exactly as provided by the application:
- user_id
- session_id (nullable)
- question_id (nullable)
- section, domain, concept, subskill
- answer_state (unanswered | answered_correct | answered_incorrect)
- reveal_state (protected | allowed)
- tutor_mode
- mastery_snapshot_json
- question_snapshot_json

Context rules:
- Prefer structured fields over assumptions.
- If key fields are missing, explain limits briefly and continue safely.
- Do not invent hidden question details.
- Keep references to the active concept and subskill explicit.
`.trim();

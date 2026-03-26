import { z } from "zod";

import { SlugSchema, UuidSchema } from "./domain";

const JsonValueSchema: z.ZodType<unknown> = z.unknown();
const JsonObjectSchema = z.record(JsonValueSchema);

export const TutorModeSchema = z.enum([
  "hint",
  "teach-concept",
  "guided-solve",
  "full-explanation",
  "generate-drill",
]);

export const RevealStateSchema = z.enum(["protected", "allowed"]);
export const AnswerStateSchema = z.enum(["unanswered", "answered_correct", "answered_incorrect"]);

export const TutorContextInputSchema = z.object({
  userId: UuidSchema,
  sessionId: UuidSchema.nullable().optional(),
  questionId: UuidSchema.nullable().optional(),
  section: z.string().min(1).max(80),
  domain: SlugSchema.optional(),
  concept: SlugSchema.optional(),
  subskill: SlugSchema.optional(),
  answerState: AnswerStateSchema,
  revealState: RevealStateSchema,
  masterySnapshotJson: JsonObjectSchema.optional(),
  questionSnapshotJson: JsonObjectSchema.optional(),
});

export const TutorRespondInputSchema = z.object({
  mode: TutorModeSchema,
  message: z.string().trim().min(1).max(6000),
  context: TutorContextInputSchema,
});

export const TutorReferenceSchema = z.object({
  label: z.string().min(1).max(120),
  href: z.string().url().optional(),
});

export const TutorRespondResponseSchema = z.object({
  responseText: z.string().min(1),
  mode: TutorModeSchema,
  policyState: RevealStateSchema,
  promptVersionJson: JsonObjectSchema.optional(),
  references: z.array(TutorReferenceSchema).optional(),
});

export type TutorRespondInput = z.infer<typeof TutorRespondInputSchema>;
export type TutorRespondResponse = z.infer<typeof TutorRespondResponseSchema>;

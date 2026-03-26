import { z } from "zod";

import {
  SectionSlugSchema,
  SessionTypeSchema,
  SourceTypeSchema,
  UuidSchema,
} from "./domain";

const JsonValueSchema: z.ZodType<unknown> = z.unknown();
const JsonObjectSchema = z.record(JsonValueSchema);

export const SessionConfigSchema = z.object({
  section: SectionSlugSchema,
  conceptSlugs: z.array(z.string()).max(20).optional(),
  questionCount: z.number().int().min(1).max(60).optional(),
  timed: z.boolean().optional(),
});

export const CreateSessionInputSchema = z.object({
  sessionType: SessionTypeSchema,
  config: SessionConfigSchema,
});

export const SessionQuestionSnapshotSchema = z.object({
  questionId: UuidSchema,
  orderIndex: z.number().int().nonnegative(),
  sourceType: SourceTypeSchema,
  promptJson: JsonObjectSchema,
  answerSchemaJson: JsonObjectSchema.optional(),
  calculatorAllowed: z.boolean().optional(),
  desmosRelevant: z.boolean().optional(),
});

export const CreateSessionResponseSchema = z.object({
  sessionId: UuidSchema,
  sessionType: SessionTypeSchema,
  questions: z.array(SessionQuestionSnapshotSchema).min(1),
  timerSeconds: z.number().int().positive().optional(),
});

export const SubmitAnswerInputSchema = z.object({
  questionId: UuidSchema,
  answerJson: JsonObjectSchema,
  timeSpentSeconds: z.number().int().min(0).max(7200),
  hintCount: z.number().int().min(0).max(20).default(0),
  tutorUsed: z.boolean().default(false),
});

export const SubmitAnswerResponseSchema = z.object({
  sessionId: UuidSchema,
  questionId: UuidSchema,
  isCorrect: z.boolean().nullable(),
  answeredCount: z.number().int().nonnegative(),
  remainingCount: z.number().int().nonnegative(),
});

export const SubmitSessionInputSchema = z.object({
  completedAt: z.string().datetime({ offset: true }).optional(),
});

export const SubmitSessionResponseSchema = z.object({
  sessionId: UuidSchema,
  scoreSummaryJson: JsonObjectSchema,
  conceptBreakdownJson: JsonObjectSchema,
  recommendedNextJson: JsonObjectSchema.optional(),
});

export type CreateSessionInput = z.infer<typeof CreateSessionInputSchema>;
export type CreateSessionResponse = z.infer<typeof CreateSessionResponseSchema>;
export type SubmitAnswerInput = z.infer<typeof SubmitAnswerInputSchema>;
export type SubmitAnswerResponse = z.infer<typeof SubmitAnswerResponseSchema>;
export type SubmitSessionResponse = z.infer<typeof SubmitSessionResponseSchema>;

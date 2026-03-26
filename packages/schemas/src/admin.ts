import { z } from "zod";

import {
  QuestionStatusSchema,
  SlugSchema,
  UuidSchema,
  VariantReviewStatusSchema,
} from "./domain";

const JsonValueSchema: z.ZodType<unknown> = z.unknown();
const JsonObjectSchema = z.record(JsonValueSchema);

export const AdminQuestionInputSchema = z.object({
  sectionId: UuidSchema,
  domainId: UuidSchema,
  conceptId: UuidSchema,
  subskillId: UuidSchema.optional(),
  difficulty: z.number().int().min(1).max(5),
  questionType: z.string().trim().min(1).max(60),
  promptJson: JsonObjectSchema,
  answerSchemaJson: JsonObjectSchema,
  explanationJson: JsonObjectSchema,
  calculatorAllowed: z.boolean(),
  desmosRelevant: z.boolean(),
  desmosPresetStateJson: JsonObjectSchema.optional(),
  status: QuestionStatusSchema.default("draft"),
});

export const CreateQuestionInputSchema = AdminQuestionInputSchema;

export const UpdateQuestionInputSchema = AdminQuestionInputSchema.partial().extend({
  status: QuestionStatusSchema.optional(),
});

export const PublishQuestionInputSchema = z.object({
  questionId: UuidSchema,
  publishNote: z.string().trim().max(500).optional(),
});

export const GenerateVariantsInputSchema = z.object({
  parentQuestionId: UuidSchema,
  conceptSlug: SlugSchema.optional(),
  count: z.number().int().min(1).max(20).default(3),
});

export const ReviewVariantInputSchema = z.object({
  variantId: UuidSchema,
  decision: VariantReviewStatusSchema.refine((value) => value !== "pending", {
    message: "Decision must be approved or rejected.",
  }),
  reviewNotes: z.string().trim().max(2000).optional(),
});

export const AdminActionResponseSchema = z.object({
  ok: z.boolean(),
  id: UuidSchema,
  message: z.string().min(1),
});

export type CreateQuestionInput = z.infer<typeof CreateQuestionInputSchema>;
export type UpdateQuestionInput = z.infer<typeof UpdateQuestionInputSchema>;
export type ReviewVariantInput = z.infer<typeof ReviewVariantInputSchema>;

import { z } from "zod";

export const UuidSchema = z.string().uuid();
export const SlugSchema = z
  .string()
  .trim()
  .min(1)
  .max(80)
  .regex(/^[a-z0-9]+(?:-[a-z0-9]+)*$/, "Slug must be lowercase kebab-case.");

export const IsoDateTimeSchema = z.string().datetime({ offset: true });

export const UserRoleSchema = z.enum(["student", "admin"]);
export const SectionSlugSchema = z.enum(["reading-writing", "math"]);
export const SourceTypeSchema = z.enum([
  "verified",
  "generated_variant",
  "generated_dynamic",
]);
export const SessionTypeSchema = z.enum([
  "full-module",
  "concept-drill",
  "mini-quiz",
  "review-session",
  "tutor-generated",
]);
export const QuestionStatusSchema = z.enum([
  "draft",
  "generated_pending_review",
  "reviewed",
  "published",
  "archived",
  "flagged",
]);
export const VariantReviewStatusSchema = z.enum([
  "pending",
  "approved",
  "rejected",
]);

export const SectionSchema = z.object({
  id: UuidSchema,
  slug: SectionSlugSchema,
  name: z.string().min(1).max(120),
  displayOrder: z.number().int().nonnegative(),
});

export const DomainSchema = z.object({
  id: UuidSchema,
  sectionId: UuidSchema,
  slug: SlugSchema,
  name: z.string().min(1).max(120),
  displayOrder: z.number().int().nonnegative(),
});

export const ConceptSchema = z.object({
  id: UuidSchema,
  domainId: UuidSchema,
  slug: SlugSchema,
  name: z.string().min(1).max(160),
  description: z.string().max(2000).nullable().optional(),
  displayOrder: z.number().int().nonnegative(),
});

export const SubskillSchema = z.object({
  id: UuidSchema,
  conceptId: UuidSchema,
  slug: SlugSchema,
  name: z.string().min(1).max(160),
  description: z.string().max(2000).nullable().optional(),
  displayOrder: z.number().int().nonnegative(),
});

export type UserRole = z.infer<typeof UserRoleSchema>;
export type SectionSlug = z.infer<typeof SectionSlugSchema>;
export type SourceType = z.infer<typeof SourceTypeSchema>;
export type SessionType = z.infer<typeof SessionTypeSchema>;
export type QuestionStatus = z.infer<typeof QuestionStatusSchema>;
export type VariantReviewStatus = z.infer<typeof VariantReviewStatusSchema>;

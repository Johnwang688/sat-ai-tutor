import { z } from "zod";

import { SectionSlugSchema, SlugSchema, UuidSchema } from "./domain";

export const MasteryBandSchema = z.enum(["not-started", "developing", "proficient", "strong"]);

export const ConceptMasterySchema = z.object({
  conceptId: UuidSchema,
  conceptSlug: SlugSchema,
  conceptName: z.string().min(1).max(160),
  weightedMastery: z.number().min(0).max(1),
  rawAccuracy: z.number().min(0).max(1),
  attemptCount: z.number().int().nonnegative(),
  confidenceLevel: z.number().min(0).max(1),
  lastPracticedAt: z.string().datetime({ offset: true }).nullable(),
  masteryBand: MasteryBandSchema,
});

export const DomainProgressSchema = z.object({
  domainId: UuidSchema,
  domainSlug: SlugSchema,
  domainName: z.string().min(1).max(120),
  weightedMastery: z.number().min(0).max(1),
  concepts: z.array(ConceptMasterySchema),
});

export const SectionProgressSchema = z.object({
  section: SectionSlugSchema,
  weightedMastery: z.number().min(0).max(1),
  domains: z.array(DomainProgressSchema),
});

export const RecommendationTypeSchema = z.enum([
  "concept-drill",
  "mixed-mini-quiz",
  "review-missed",
  "tutor-lesson",
]);

export const ProgressRecommendationSchema = z.object({
  type: RecommendationTypeSchema,
  title: z.string().min(1).max(120),
  reason: z.string().min(1).max(240),
  href: z.string().startsWith("/"),
  conceptSlug: SlugSchema.optional(),
});

export const RecentSessionSchema = z.object({
  sessionId: UuidSchema,
  sessionType: z.string().min(1),
  section: SectionSlugSchema,
  startedAt: z.string().datetime({ offset: true }),
  submittedAt: z.string().datetime({ offset: true }).nullable(),
  correctCount: z.number().int().nonnegative(),
  totalCount: z.number().int().positive(),
});

export const ProgressOverviewResponseSchema = z.object({
  userId: UuidSchema,
  sections: z.array(SectionProgressSchema),
  recentSessions: z.array(RecentSessionSchema),
  recommendations: z.array(ProgressRecommendationSchema),
  generatedAt: z.string().datetime({ offset: true }),
});

export type ProgressOverviewResponse = z.infer<typeof ProgressOverviewResponseSchema>;

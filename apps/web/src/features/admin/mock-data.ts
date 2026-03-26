import {
  canonicalConcepts,
  canonicalDomains,
  canonicalSections,
} from "../taxonomy/core-concepts";

export type AdminSummaryMetric = {
  label: string;
  count: number;
  detail: string;
};

export type SectionRecord = {
  id: string;
  slug: string;
  name: string;
  displayOrder: number;
  domainCount: number;
};

export type DomainRecord = {
  id: string;
  sectionSlug: string;
  slug: string;
  name: string;
  conceptCount: number;
  displayOrder: number;
};

export type ConceptRecord = {
  id: string;
  domainSlug: string;
  slug: string;
  name: string;
  subskillCount: number;
  displayOrder: number;
};

export type QuestionDraft = {
  id: string;
  status: "draft" | "reviewed";
  section: "reading-writing" | "math";
  domainSlug: string;
  domainName: string;
  conceptSlug: string;
  conceptName: string;
  title: string;
  difficulty: 1 | 2 | 3 | 4 | 5;
  updatedAt: string;
};

export type VariantReviewItem = {
  id: string;
  parentQuestionId: string;
  conceptSlug: string;
  conceptName: string;
  validationScore: number;
  ambiguityRisk: "low" | "medium" | "high";
  generatedAt: string;
  notes: string;
};

export const adminSummaryMetrics: readonly AdminSummaryMetric[] = [
  { label: "Draft questions", count: 42, detail: "Vetted content waiting for review" },
  { label: "Pending variants", count: 17, detail: "Generated variants awaiting approve/reject" },
  { label: "Taxonomy edits", count: 3, detail: "Unpublished section/domain/concept changes" },
];

export const sectionRecords: readonly SectionRecord[] = canonicalSections.map((section) => ({
  id: section.id,
  slug: section.slug,
  name: section.name,
  displayOrder: section.displayOrder,
  domainCount: canonicalDomains.filter((domain) => domain.sectionSlug === section.slug).length,
}));

export const domainRecords: readonly DomainRecord[] = canonicalDomains.map((domain) => ({
  id: domain.id,
  sectionSlug: domain.sectionSlug,
  slug: domain.slug,
  name: domain.name,
  conceptCount: canonicalConcepts.filter((concept) => concept.domainSlug === domain.slug).length,
  displayOrder: domain.displayOrder,
}));

export const conceptRecords: readonly ConceptRecord[] = canonicalConcepts.map((concept) => ({
  id: concept.id,
  domainSlug: concept.domainSlug,
  slug: concept.slug,
  name: concept.name,
  subskillCount: 0,
  displayOrder: concept.displayOrder,
}));

export const questionDrafts: readonly QuestionDraft[] = [
  {
    id: "q_1023",
    status: "draft",
    section: "math",
    domainSlug: "algebra",
    domainName: "Algebra",
    conceptSlug: "linear-equations-in-one-variable",
    conceptName: "Linear equations in one variable",
    title: "Solve an equation with variables on both sides",
    difficulty: 2,
    updatedAt: "2026-03-23",
  },
  {
    id: "q_1037",
    status: "reviewed",
    section: "reading-writing",
    domainSlug: "information-and-ideas",
    domainName: "Information and Ideas",
    conceptSlug: "central-ideas-and-details",
    conceptName: "Central Ideas and Details",
    title: "Identify the central claim in a short passage",
    difficulty: 3,
    updatedAt: "2026-03-24",
  },
];

export const variantReviewItems: readonly VariantReviewItem[] = [
  {
    id: "var_401",
    parentQuestionId: "q_0871",
    conceptSlug: "linear-functions",
    conceptName: "Linear functions",
    validationScore: 96,
    ambiguityRisk: "low",
    generatedAt: "2026-03-24",
    notes: "Answer schema valid; distractors are distinct.",
  },
  {
    id: "var_402",
    parentQuestionId: "q_0871",
    conceptSlug: "linear-functions",
    conceptName: "Linear functions",
    validationScore: 82,
    ambiguityRisk: "medium",
    generatedAt: "2026-03-24",
    notes: "One distractor may be too close to the correct option.",
  },
  {
    id: "var_410",
    parentQuestionId: "q_0610",
    conceptSlug: "command-of-evidence-textual",
    conceptName: "Command of Evidence (Textual)",
    validationScore: 71,
    ambiguityRisk: "high",
    generatedAt: "2026-03-25",
    notes: "Passage wording likely supports two answers.",
  },
];

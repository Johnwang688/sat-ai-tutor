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
  domain: string;
  concept: string;
  title: string;
  difficulty: 1 | 2 | 3 | 4 | 5;
  updatedAt: string;
};

export type VariantReviewItem = {
  id: string;
  parentQuestionId: string;
  concept: string;
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

export const sectionRecords: readonly SectionRecord[] = [
  {
    id: "sec_rw",
    slug: "reading-writing",
    name: "Reading and Writing",
    displayOrder: 1,
    domainCount: 4,
  },
  {
    id: "sec_math",
    slug: "math",
    name: "Math",
    displayOrder: 2,
    domainCount: 4,
  },
];

export const domainRecords: readonly DomainRecord[] = [
  {
    id: "dom_rw_info",
    sectionSlug: "reading-writing",
    slug: "information-and-ideas",
    name: "Information and Ideas",
    conceptCount: 8,
    displayOrder: 1,
  },
  {
    id: "dom_math_algebra",
    sectionSlug: "math",
    slug: "algebra",
    name: "Algebra",
    conceptCount: 11,
    displayOrder: 1,
  },
  {
    id: "dom_math_adv",
    sectionSlug: "math",
    slug: "advanced-math",
    name: "Advanced Math",
    conceptCount: 9,
    displayOrder: 2,
  },
];

export const conceptRecords: readonly ConceptRecord[] = [
  {
    id: "con_linear_eq",
    domainSlug: "algebra",
    slug: "linear-equations-one-variable",
    name: "Linear equations in one variable",
    subskillCount: 5,
    displayOrder: 1,
  },
  {
    id: "con_transition",
    domainSlug: "information-and-ideas",
    slug: "main-idea-and-purpose",
    name: "Main idea and purpose",
    subskillCount: 4,
    displayOrder: 2,
  },
];

export const questionDrafts: readonly QuestionDraft[] = [
  {
    id: "q_1023",
    status: "draft",
    section: "math",
    domain: "Algebra",
    concept: "Linear equations in one variable",
    title: "Solve an equation with variables on both sides",
    difficulty: 2,
    updatedAt: "2026-03-23",
  },
  {
    id: "q_1037",
    status: "reviewed",
    section: "reading-writing",
    domain: "Information and Ideas",
    concept: "Main idea and purpose",
    title: "Identify the central claim in a short passage",
    difficulty: 3,
    updatedAt: "2026-03-24",
  },
];

export const variantReviewItems: readonly VariantReviewItem[] = [
  {
    id: "var_401",
    parentQuestionId: "q_0871",
    concept: "Linear functions",
    validationScore: 96,
    ambiguityRisk: "low",
    generatedAt: "2026-03-24",
    notes: "Answer schema valid; distractors are distinct.",
  },
  {
    id: "var_402",
    parentQuestionId: "q_0871",
    concept: "Linear functions",
    validationScore: 82,
    ambiguityRisk: "medium",
    generatedAt: "2026-03-24",
    notes: "One distractor may be too close to the correct option.",
  },
  {
    id: "var_410",
    parentQuestionId: "q_0610",
    concept: "Command of evidence",
    validationScore: 71,
    ambiguityRisk: "high",
    generatedAt: "2026-03-25",
    notes: "Passage wording likely supports two answers.",
  },
];

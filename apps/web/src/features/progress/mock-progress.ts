// TODO(progress-feature): Implement real mastery rollups and dashboard queries against Supabase (or RPCs); keep next-step logic rule-based for V1. Reusable widgets = `Progress*`; this route-specific layout = `Dashboard*` only.

export type SectionProgress = {
  slug: "reading-writing" | "math";
  label: string;
  attempted: number;
  accuracyPercent: number;
  weightedMastery: number;
};

export type ConceptProgress = {
  slug: string;
  section: "Reading and Writing" | "Math";
  domain: string;
  name: string;
  masteryPercent: number;
  recentAccuracyPercent: number;
  attempts: number;
  lastPracticedAt: string;
  subskills: ReadonlyArray<{
    name: string;
    masteryPercent: number;
    attempts: number;
  }>;
};

export type RecentSession = {
  id: string;
  type: "Concept Drill" | "Mini Quiz" | "Full Module";
  section: "Reading and Writing" | "Math";
  correct: number;
  total: number;
  completedAt: string;
};

export const sectionProgress: ReadonlyArray<SectionProgress> = [
  {
    slug: "reading-writing",
    label: "Reading and Writing",
    attempted: 124,
    accuracyPercent: 74,
    weightedMastery: 71,
  },
  {
    slug: "math",
    label: "Math",
    attempted: 118,
    accuracyPercent: 68,
    weightedMastery: 64,
  },
];

export const conceptProgress: ReadonlyArray<ConceptProgress> = [
  {
    slug: "linear-equations",
    section: "Math",
    domain: "Algebra",
    name: "Linear Equations in One Variable",
    masteryPercent: 62,
    recentAccuracyPercent: 58,
    attempts: 31,
    lastPracticedAt: "2026-03-23",
    subskills: [
      { name: "One-step equations", masteryPercent: 79, attempts: 11 },
      { name: "Multi-step equations", masteryPercent: 61, attempts: 12 },
      { name: "Word problem translation", masteryPercent: 48, attempts: 8 },
    ],
  },
  {
    slug: "transitions",
    section: "Reading and Writing",
    domain: "Expression of Ideas",
    name: "Transitions",
    masteryPercent: 76,
    recentAccuracyPercent: 80,
    attempts: 24,
    lastPracticedAt: "2026-03-24",
    subskills: [
      { name: "Cause and effect transitions", masteryPercent: 72, attempts: 10 },
      { name: "Contrast transitions", masteryPercent: 79, attempts: 7 },
      { name: "Sequence transitions", masteryPercent: 77, attempts: 7 },
    ],
  },
  {
    slug: "punctuation",
    section: "Reading and Writing",
    domain: "Standard English Conventions",
    name: "Punctuation",
    masteryPercent: 69,
    recentAccuracyPercent: 65,
    attempts: 20,
    lastPracticedAt: "2026-03-22",
    subskills: [
      { name: "Commas", masteryPercent: 72, attempts: 8 },
      { name: "Semicolons", masteryPercent: 61, attempts: 6 },
      { name: "Dashes and colons", masteryPercent: 68, attempts: 6 },
    ],
  },
];

export const recentSessions: ReadonlyArray<RecentSession> = [
  {
    id: "sess-4382",
    type: "Concept Drill",
    section: "Math",
    correct: 9,
    total: 15,
    completedAt: "2026-03-24",
  },
  {
    id: "sess-4368",
    type: "Mini Quiz",
    section: "Reading and Writing",
    correct: 7,
    total: 10,
    completedAt: "2026-03-23",
  },
  {
    id: "sess-4349",
    type: "Full Module",
    section: "Math",
    correct: 16,
    total: 27,
    completedAt: "2026-03-22",
  },
];

// TODO(progress-feature): When wiring real data, keep recommendation deterministic/rule-based (e.g. lowest mastery / recent accuracy), not model-generated.

export function getDeterministicRecommendation(): {
  conceptSlug: string;
  recommendationTitle: string;
  reason: string;
  targetRoute: string;
} {
  const sorted = [...conceptProgress].sort(
    (left, right) => left.masteryPercent - right.masteryPercent,
  );
  const nextConcept = sorted[0] ?? conceptProgress[0];

  return {
    conceptSlug: nextConcept.slug,
    recommendationTitle: `Next drill: ${nextConcept.name}`,
    reason: `${nextConcept.section} ${nextConcept.domain} is currently your lowest-mastery area (${nextConcept.masteryPercent}%).`,
    targetRoute: `/concepts/${nextConcept.slug}`,
  };
}

export function getConceptBySlug(slug: string): ConceptProgress | undefined {
  return conceptProgress.find((concept) => concept.slug === slug);
}

import {
  conceptCatalog,
  DEFAULT_PRACTICE_USER_ID,
  getUserProgressState,
} from "../practice/server";

export type SectionProgress = {
  slug: "reading-writing" | "math";
  label: "Reading and Writing" | "Math";
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

export type Recommendation = {
  conceptSlug: string;
  recommendationTitle: string;
  reason: string;
  targetRoute: string;
};

export type ProgressOverview = {
  sectionProgress: ReadonlyArray<SectionProgress>;
  conceptProgress: ReadonlyArray<ConceptProgress>;
  recentSessions: ReadonlyArray<RecentSession>;
  recommendation: Recommendation;
};

function toPercent(value: number): number {
  if (!Number.isFinite(value)) {
    return 0;
  }
  return Math.max(0, Math.min(100, Math.round(value)));
}

function safeDate(value: string | null | undefined, fallback: string): string {
  if (!value) {
    return fallback;
  }
  return value;
}

export function getProgressOverview(
  userId: string = DEFAULT_PRACTICE_USER_ID,
): ProgressOverview {
  const userState = getUserProgressState(userId);

  const conceptProgress: ConceptProgress[] = conceptCatalog.map((concept) => {
    const delta = userState.conceptDeltas[concept.slug];
    const baselineAttempts = concept.baseline.attempts;
    const baselineCorrect = Math.round(
      (concept.baseline.masteryPercent / 100) * baselineAttempts,
    );
    const attempts = baselineAttempts + (delta?.attempts ?? 0);
    const correct = baselineCorrect + (delta?.correct ?? 0);
    const masteryPercent =
      attempts > 0 ? toPercent((correct / attempts) * 100) : concept.baseline.masteryPercent;
    const recentAccuracyPercent =
      delta && delta.recentResults.length > 0
        ? toPercent(
            (delta.recentResults.filter(Boolean).length / delta.recentResults.length) * 100,
          )
        : concept.baseline.recentAccuracyPercent;
    const lastPracticedAt = safeDate(
      delta?.lastPracticedAt,
      concept.baseline.lastPracticedAt,
    );

    return {
      slug: concept.slug,
      section: concept.section,
      domain: concept.domain,
      name: concept.name,
      masteryPercent,
      recentAccuracyPercent,
      attempts,
      lastPracticedAt,
      subskills: concept.subskills,
    };
  });

  const sectionProgress: SectionProgress[] = ["reading-writing", "math"].map((slug) => {
    const label =
      slug === "math" ? ("Math" as const) : ("Reading and Writing" as const);
    const scopedConcepts = conceptProgress.filter((item) =>
      slug === "math" ? item.section === "Math" : item.section === "Reading and Writing",
    );
    const attempted = scopedConcepts.reduce((sum, item) => sum + item.attempts, 0);
    const weightedMastery =
      attempted === 0
        ? 0
        : toPercent(
            scopedConcepts.reduce(
              (sum, item) => sum + item.masteryPercent * item.attempts,
              0,
            ) / attempted,
          );
    const accuracyPercent =
      attempted === 0
        ? 0
        : toPercent(
            scopedConcepts.reduce(
              (sum, item) => sum + item.recentAccuracyPercent * item.attempts,
              0,
            ) / attempted,
          );

    return {
      slug: slug as "reading-writing" | "math",
      label,
      attempted,
      accuracyPercent,
      weightedMastery,
    };
  });

  const recentSessions: RecentSession[] = userState.recentSessions.map((entry) => ({
    id: entry.sessionId,
    type: entry.type,
    section: entry.section,
    correct: entry.correct,
    total: entry.total,
    completedAt: entry.completedAt,
  }));

  const recommendation = getDeterministicRecommendation(conceptProgress);
  return {
    sectionProgress,
    conceptProgress,
    recentSessions,
    recommendation,
  };
}

export function getDeterministicRecommendation(
  concepts?: ReadonlyArray<ConceptProgress>,
): Recommendation {
  const conceptProgress = concepts ?? getProgressOverview().conceptProgress;
  const sorted = [...conceptProgress].sort(
    (left, right) => left.masteryPercent - right.masteryPercent,
  );
  const nextConcept = sorted[0] ?? conceptProgress[0];

  if (!nextConcept) {
    return {
      conceptSlug: "linear-equations",
      recommendationTitle: "Next drill: Linear Equations in One Variable",
      reason: "No progress data yet, so we start with a foundational algebra concept.",
      targetRoute: "/concepts/linear-equations",
    };
  }

  return {
    conceptSlug: nextConcept.slug,
    recommendationTitle: `Next drill: ${nextConcept.name}`,
    reason: `${nextConcept.section} ${nextConcept.domain} is currently your lowest-mastery area (${nextConcept.masteryPercent}%).`,
    targetRoute: `/concepts/${nextConcept.slug}`,
  };
}

export function getConceptBySlug(
  slug: string,
  userId: string = DEFAULT_PRACTICE_USER_ID,
): ConceptProgress | undefined {
  return getProgressOverview(userId).conceptProgress.find((concept) => concept.slug === slug);
}

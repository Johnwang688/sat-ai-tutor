import {
  createSession,
  DEFAULT_PRACTICE_USER_ID,
  finalizeSession,
  getConceptCatalog,
  getPracticeModeList,
  getSessionReview as getSessionReviewForUser,
  getSessionSnapshot as getSessionSnapshotForUser,
  type PracticeMode,
  type SessionReview,
  type SessionSnapshot,
  type SessionTypeSlug,
} from "./server";

export type { PracticeMode, SessionReview, SessionSnapshot };

export const practiceModes: ReadonlyArray<PracticeMode> = getPracticeModeList();

export const conceptOptions = getConceptCatalog().map((concept) => ({
  slug: concept.slug,
  label: concept.name,
}));

function getFallbackSession(sessionId: string): SessionSnapshot {
  const created = createSession({
    userId: DEFAULT_PRACTICE_USER_ID,
    sessionType: "concept-drill",
    section: "math",
    conceptSlug: "linear-equations",
  });
  return {
    ...created.snapshot,
    sessionId,
  };
}

export function getSessionSnapshot(sessionId: string): SessionSnapshot {
  return (
    getSessionSnapshotForUser(sessionId, DEFAULT_PRACTICE_USER_ID) ??
    getFallbackSession(sessionId)
  );
}

export function getSessionReview(sessionId: string): SessionReview {
  const existing = getSessionReviewForUser(sessionId, DEFAULT_PRACTICE_USER_ID);
  if (existing) {
    return existing;
  }

  const fallback = getSessionSnapshotForUser(sessionId, DEFAULT_PRACTICE_USER_ID);
  if (fallback) {
    return finalizeSession({
      userId: DEFAULT_PRACTICE_USER_ID,
      sessionId: fallback.sessionId,
    }).review;
  }

  const created = createSession({
    userId: DEFAULT_PRACTICE_USER_ID,
    sessionType: "concept-drill" satisfies SessionTypeSlug,
    section: "math",
    conceptSlug: "linear-equations",
  });
  return finalizeSession({
    userId: DEFAULT_PRACTICE_USER_ID,
    sessionId: created.sessionId,
  }).review;
}

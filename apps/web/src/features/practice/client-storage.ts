import type { ClientSessionState, SessionReview } from "./server";

const sessionStoragePrefix = "sat-practice-session:";
const reviewStoragePrefix = "sat-practice-review:";

function isBrowser(): boolean {
  return typeof window !== "undefined" && typeof window.localStorage !== "undefined";
}

function getSessionStorageKey(sessionId: string): string {
  return `${sessionStoragePrefix}${sessionId}`;
}

function getReviewStorageKey(sessionId: string): string {
  return `${reviewStoragePrefix}${sessionId}`;
}

function parseStoredJson<T>(rawValue: string | null): T | null {
  if (!rawValue) {
    return null;
  }

  try {
    return JSON.parse(rawValue) as T;
  } catch {
    return null;
  }
}

function computeRemainingSeconds(startedAt: string, durationSeconds: number): number {
  const elapsedSeconds = Math.max(
    0,
    Math.floor((Date.now() - Date.parse(startedAt)) / 1000),
  );
  return Math.max(0, durationSeconds - elapsedSeconds);
}

function normalizeStoredSession(session: ClientSessionState): ClientSessionState {
  if (session.status === "submitted") {
    return {
      ...session,
      remainingSeconds: 0,
    };
  }

  return {
    ...session,
    remainingSeconds: computeRemainingSeconds(session.startedAt, session.durationSeconds),
  };
}

export function saveStoredPracticeSession(session: ClientSessionState): void {
  if (!isBrowser()) {
    return;
  }

  window.localStorage.setItem(
    getSessionStorageKey(session.sessionId),
    JSON.stringify(session),
  );
}

export function getStoredPracticeSession(sessionId: string): ClientSessionState | null {
  if (!isBrowser()) {
    return null;
  }

  const stored = parseStoredJson<ClientSessionState>(
    window.localStorage.getItem(getSessionStorageKey(sessionId)),
  );
  return stored ? normalizeStoredSession(stored) : null;
}

export function saveStoredPracticeReview(review: SessionReview): void {
  if (!isBrowser()) {
    return;
  }

  window.localStorage.setItem(
    getReviewStorageKey(review.sessionId),
    JSON.stringify(review),
  );
}

export function getStoredPracticeReview(sessionId: string): SessionReview | null {
  if (!isBrowser()) {
    return null;
  }

  return parseStoredJson<SessionReview>(
    window.localStorage.getItem(getReviewStorageKey(sessionId)),
  );
}

export function buildSubmittedPracticeSession(
  session: ClientSessionState,
): ClientSessionState {
  const submittedAt = session.submittedAt ?? new Date().toISOString().slice(0, 10);

  return {
    ...session,
    status: "submitted",
    submittedAt,
    remainingSeconds: 0,
  };
}

export function buildStoredPracticeReview(session: ClientSessionState): SessionReview {
  const submittedAt = session.submittedAt ?? new Date().toISOString().slice(0, 10);
  const conceptTotals: Record<string, { correct: number; total: number }> = {};
  const questions = session.questionOrder.map((question) => {
    const selectedChoiceIndex = question.selectedChoiceIndex;
    const isCorrect = selectedChoiceIndex === question.correctChoiceIndex;

    if (!conceptTotals[question.concept]) {
      conceptTotals[question.concept] = { correct: 0, total: 0 };
    }

    conceptTotals[question.concept].total += 1;
    conceptTotals[question.concept].correct += isCorrect ? 1 : 0;

    return {
      id: question.id,
      prompt: question.prompt,
      selectedChoice:
        selectedChoiceIndex === null
          ? "No answer selected"
          : question.choices[selectedChoiceIndex] ?? "Invalid choice",
      correctChoice: question.choices[question.correctChoiceIndex] ?? "Unknown",
      isCorrect,
      explanation: question.explanation,
    };
  });

  return {
    sessionId: session.sessionId,
    scoreSummary: {
      correct: questions.filter((question) => question.isCorrect).length,
      total: questions.length,
      submittedAt,
    },
    conceptBreakdown: Object.entries(conceptTotals).map(([concept, totals]) => ({
      concept,
      correct: totals.correct,
      total: totals.total,
    })),
    questions,
  };
}
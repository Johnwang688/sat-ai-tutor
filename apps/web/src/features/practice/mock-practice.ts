// TODO(practice-feature): Move real session/question/review loading into `features/practice/server` and colocate active-session-only UI helpers as `Session*`; shared cross-session UI as `Practice*` (see features/README.md). Replace mock snapshots once APIs exist.

export type PracticeMode = {
  slug: "concept-drill" | "mini-quiz" | "full-module";
  title: string;
  description: string;
  questionCount: number;
  usesVerifiedQuestionsOnly: boolean;
};

export type SessionQuestion = {
  id: string;
  section: "Reading and Writing" | "Math";
  domain: string;
  concept: string;
  prompt: string;
  choices: ReadonlyArray<string>;
  selectedChoiceIndex: number | null;
  desmosRelevant: boolean;
};

export type SessionSnapshot = {
  sessionId: string;
  sessionType: "Concept Drill" | "Mini Quiz" | "Full Module";
  section: "Reading and Writing" | "Math";
  questionOrder: ReadonlyArray<SessionQuestion>;
  remainingSeconds: number;
  tutorMode: "hint-only";
};

export type SessionReview = {
  sessionId: string;
  scoreSummary: {
    correct: number;
    total: number;
    submittedAt: string;
  };
  conceptBreakdown: ReadonlyArray<{
    concept: string;
    correct: number;
    total: number;
  }>;
  questions: ReadonlyArray<{
    id: string;
    prompt: string;
    selectedChoice: string;
    correctChoice: string;
    isCorrect: boolean;
    explanation: string;
  }>;
};

export const practiceModes: ReadonlyArray<PracticeMode> = [
  {
    slug: "concept-drill",
    title: "Concept Drill",
    description: "Focus on one concept with deterministic, targeted repetition.",
    questionCount: 15,
    usesVerifiedQuestionsOnly: true,
  },
  {
    slug: "mini-quiz",
    title: "Mini Quiz",
    description: "A quick mixed check-in across recent weak and medium concepts.",
    questionCount: 10,
    usesVerifiedQuestionsOnly: true,
  },
  {
    slug: "full-module",
    title: "Full Module",
    description: "Longer SAT-style module with timing pressure and mixed content.",
    questionCount: 27,
    usesVerifiedQuestionsOnly: true,
  },
];

const demoSession: SessionSnapshot = {
  sessionId: "sess-demo-linear",
  sessionType: "Concept Drill",
  section: "Math",
  remainingSeconds: 968,
  tutorMode: "hint-only",
  questionOrder: [
    {
      id: "q-101",
      section: "Math",
      domain: "Algebra",
      concept: "Linear Equations in One Variable",
      prompt:
        "Solve for x: 3(x - 4) + 5 = 2x + 9. Choose the value that satisfies the equation.",
      choices: ["x = 2", "x = 4", "x = 8", "x = 16"],
      selectedChoiceIndex: null,
      desmosRelevant: true,
    },
    {
      id: "q-102",
      section: "Math",
      domain: "Algebra",
      concept: "Linear Equations in One Variable",
      prompt:
        "A phone plan costs $18 plus $4 per gigabyte. Which equation models total cost y for x gigabytes?",
      choices: ["y = 4x + 18", "y = 18x + 4", "y = 4x - 18", "y = 18 - 4x"],
      selectedChoiceIndex: null,
      desmosRelevant: false,
    },
  ],
};

const demoReview: SessionReview = {
  sessionId: "sess-demo-linear",
  scoreSummary: {
    correct: 9,
    total: 15,
    submittedAt: "2026-03-24",
  },
  conceptBreakdown: [
    { concept: "Linear Equations in One Variable", correct: 6, total: 9 },
    { concept: "Linear Functions", correct: 3, total: 6 },
  ],
  questions: [
    {
      id: "q-101",
      prompt: "Solve for x: 3(x - 4) + 5 = 2x + 9.",
      selectedChoice: "x = 4",
      correctChoice: "x = 16",
      isCorrect: false,
      explanation:
        "Distribute first: 3x - 12 + 5 = 2x + 9, then simplify to 3x - 7 = 2x + 9. Subtract 2x to get x - 7 = 9, so x = 16.",
    },
    {
      id: "q-102",
      prompt: "A phone plan costs $18 plus $4 per gigabyte.",
      selectedChoice: "y = 4x + 18",
      correctChoice: "y = 4x + 18",
      isCorrect: true,
      explanation:
        "The fixed fee is the intercept ($18), and the per-gigabyte rate is the slope ($4), so y = 4x + 18.",
    },
  ],
};

export function getSessionSnapshot(sessionId: string): SessionSnapshot {
  if (sessionId === demoSession.sessionId) {
    return demoSession;
  }

  return {
    ...demoSession,
    sessionId,
  };
}

export function getSessionReview(sessionId: string): SessionReview {
  if (sessionId === demoReview.sessionId) {
    return demoReview;
  }

  return {
    ...demoReview,
    sessionId,
  };
}

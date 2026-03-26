export type SectionSlug = "reading-writing" | "math";
export type SectionLabel = "Reading and Writing" | "Math";
export type SessionTypeSlug = "concept-drill" | "mini-quiz" | "full-module";
export type SessionTypeLabel = "Concept Drill" | "Mini Quiz" | "Full Module";

export type PracticeMode = {
  slug: SessionTypeSlug;
  title: SessionTypeLabel;
  description: string;
  questionCount: number;
  usesVerifiedQuestionsOnly: boolean;
  durationSeconds: number;
};

export type ConceptCatalogItem = {
  slug: string;
  name: string;
  section: SectionLabel;
  sectionSlug: SectionSlug;
  domain: string;
  subskills: ReadonlyArray<{
    name: string;
    masteryPercent: number;
    attempts: number;
  }>;
  baseline: {
    attempts: number;
    masteryPercent: number;
    recentAccuracyPercent: number;
    lastPracticedAt: string;
  };
};

type QuestionBankItem = {
  id: string;
  sectionSlug: SectionSlug;
  section: SectionLabel;
  domain: string;
  conceptSlug: string;
  concept: string;
  prompt: string;
  choices: [string, string, string, string];
  correctChoiceIndex: number;
  explanation: string;
  desmosRelevant: boolean;
};

type SessionQuestionState = {
  id: string;
  questionId: string;
  section: SectionLabel;
  domain: string;
  conceptSlug: string;
  concept: string;
  prompt: string;
  choices: ReadonlyArray<string>;
  correctChoiceIndex: number;
  selectedChoiceIndex: number | null;
  explanation: string;
  desmosRelevant: boolean;
};

type SessionState = {
  sessionId: string;
  userId: string;
  sessionType: SessionTypeLabel;
  sessionTypeSlug: SessionTypeSlug;
  section: SectionLabel;
  sectionSlug: SectionSlug;
  conceptSlug: string | null;
  startedAt: string;
  durationSeconds: number;
  status: "active" | "submitted";
  submittedAt: string | null;
  questions: SessionQuestionState[];
};

type ConceptDelta = {
  attempts: number;
  correct: number;
  recentResults: boolean[];
  lastPracticedAt: string | null;
};

type SessionResultSummary = {
  sessionId: string;
  type: SessionTypeLabel;
  section: SectionLabel;
  correct: number;
  total: number;
  completedAt: string;
};

type UserProgressState = {
  conceptDeltas: Record<string, ConceptDelta>;
  recentSessions: SessionResultSummary[];
};

type PracticeStore = {
  sessions: Record<string, SessionState>;
  reviews: Record<string, SessionReview>;
  users: Record<string, UserProgressState>;
  nextSessionId: number;
};

export type SessionQuestion = {
  id: string;
  section: SectionLabel;
  domain: string;
  concept: string;
  prompt: string;
  choices: ReadonlyArray<string>;
  selectedChoiceIndex: number | null;
  desmosRelevant: boolean;
};

export type SessionSnapshot = {
  sessionId: string;
  sessionType: SessionTypeLabel;
  section: SectionLabel;
  questionOrder: ReadonlyArray<SessionQuestion>;
  remainingSeconds: number;
  tutorMode: "hint-only";
  startedAt: string;
  durationSeconds: number;
  status: "active" | "submitted";
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

export type CreateSessionInput = {
  userId: string;
  sessionType: SessionTypeSlug;
  section: SectionSlug;
  conceptSlug?: string;
};

export type CreateSessionResponse = {
  sessionId: string;
  snapshot: SessionSnapshot;
};

export type SubmitAnswerInput = {
  userId: string;
  sessionId: string;
  questionId: string;
  choiceIndex: number;
};

export type SubmitAnswerResponse = {
  sessionId: string;
  answeredCount: number;
  totalQuestions: number;
  completed: boolean;
  snapshot: SessionSnapshot;
};

export type SubmitSessionInput = {
  userId: string;
  sessionId: string;
};

export type SubmitSessionResponse = {
  review: SessionReview;
};

export type GenerateDrillInput = {
  userId: string;
  conceptSlug?: string;
  section?: SectionSlug;
  count?: number;
  createSession?: boolean;
};

export type GenerateDrillResponse = {
  generatedAt: string;
  section: SectionLabel;
  conceptSlug: string;
  questions: ReadonlyArray<{
    id: string;
    prompt: string;
    concept: string;
  }>;
  sessionId?: string;
};

export const DEFAULT_PRACTICE_USER_ID = "student-demo";

export const practiceModes: ReadonlyArray<PracticeMode> = [
  {
    slug: "concept-drill",
    title: "Concept Drill",
    description: "Focus on one concept with deterministic, targeted repetition.",
    questionCount: 15,
    usesVerifiedQuestionsOnly: true,
    durationSeconds: 18 * 60,
  },
  {
    slug: "mini-quiz",
    title: "Mini Quiz",
    description: "A quick mixed check-in across recent weak and medium concepts.",
    questionCount: 10,
    usesVerifiedQuestionsOnly: true,
    durationSeconds: 12 * 60,
  },
  {
    slug: "full-module",
    title: "Full Module",
    description: "Longer SAT-style module with timing pressure and mixed content.",
    questionCount: 27,
    usesVerifiedQuestionsOnly: true,
    durationSeconds: 32 * 60,
  },
];

export const conceptCatalog: ReadonlyArray<ConceptCatalogItem> = [
  {
    slug: "linear-equations",
    name: "Linear Equations in One Variable",
    section: "Math",
    sectionSlug: "math",
    domain: "Algebra",
    baseline: {
      attempts: 31,
      masteryPercent: 62,
      recentAccuracyPercent: 58,
      lastPracticedAt: "2026-03-23",
    },
    subskills: [
      { name: "One-step equations", masteryPercent: 79, attempts: 11 },
      { name: "Multi-step equations", masteryPercent: 61, attempts: 12 },
      { name: "Word problem translation", masteryPercent: 48, attempts: 8 },
    ],
  },
  {
    slug: "transitions",
    name: "Transitions",
    section: "Reading and Writing",
    sectionSlug: "reading-writing",
    domain: "Expression of Ideas",
    baseline: {
      attempts: 24,
      masteryPercent: 76,
      recentAccuracyPercent: 80,
      lastPracticedAt: "2026-03-24",
    },
    subskills: [
      { name: "Cause and effect transitions", masteryPercent: 72, attempts: 10 },
      { name: "Contrast transitions", masteryPercent: 79, attempts: 7 },
      { name: "Sequence transitions", masteryPercent: 77, attempts: 7 },
    ],
  },
  {
    slug: "punctuation",
    name: "Punctuation",
    section: "Reading and Writing",
    sectionSlug: "reading-writing",
    domain: "Standard English Conventions",
    baseline: {
      attempts: 20,
      masteryPercent: 69,
      recentAccuracyPercent: 65,
      lastPracticedAt: "2026-03-22",
    },
    subskills: [
      { name: "Commas", masteryPercent: 72, attempts: 8 },
      { name: "Semicolons", masteryPercent: 61, attempts: 6 },
      { name: "Dashes and colons", masteryPercent: 68, attempts: 6 },
    ],
  },
];

const questionBank: ReadonlyArray<QuestionBankItem> = [
  {
    id: "q-101",
    sectionSlug: "math",
    section: "Math",
    domain: "Algebra",
    conceptSlug: "linear-equations",
    concept: "Linear Equations in One Variable",
    prompt:
      "Solve for x: 3(x - 4) + 5 = 2x + 9. Choose the value that satisfies the equation.",
    choices: ["x = 2", "x = 4", "x = 8", "x = 16"],
    correctChoiceIndex: 3,
    explanation:
      "Distribute: 3x - 12 + 5 = 2x + 9, so 3x - 7 = 2x + 9. Subtract 2x to get x - 7 = 9, then x = 16.",
    desmosRelevant: true,
  },
  {
    id: "q-102",
    sectionSlug: "math",
    section: "Math",
    domain: "Algebra",
    conceptSlug: "linear-equations",
    concept: "Linear Equations in One Variable",
    prompt:
      "A phone plan costs $18 plus $4 per gigabyte. Which equation models total cost y for x gigabytes?",
    choices: ["y = 4x + 18", "y = 18x + 4", "y = 4x - 18", "y = 18 - 4x"],
    correctChoiceIndex: 0,
    explanation:
      "The fixed fee is the y-intercept (18) and the per-gigabyte rate is slope (4), giving y = 4x + 18.",
    desmosRelevant: false,
  },
  {
    id: "q-103",
    sectionSlug: "math",
    section: "Math",
    domain: "Algebra",
    conceptSlug: "linear-equations",
    concept: "Linear Equations in One Variable",
    prompt: "If 5x + 1 = 3x + 13, what is x?",
    choices: ["4", "5", "6", "7"],
    correctChoiceIndex: 2,
    explanation:
      "Move terms: 5x - 3x = 13 - 1, so 2x = 12 and x = 6.",
    desmosRelevant: false,
  },
  {
    id: "q-201",
    sectionSlug: "reading-writing",
    section: "Reading and Writing",
    domain: "Expression of Ideas",
    conceptSlug: "transitions",
    concept: "Transitions",
    prompt:
      "The scientist repeated the trial three times; ____ the result remained consistent.",
    choices: ["however", "therefore", "for example", "meanwhile"],
    correctChoiceIndex: 1,
    explanation:
      "The second clause states an outcome from repeated trials, so a cause/effect transition such as 'therefore' fits.",
    desmosRelevant: false,
  },
  {
    id: "q-202",
    sectionSlug: "reading-writing",
    section: "Reading and Writing",
    domain: "Expression of Ideas",
    conceptSlug: "transitions",
    concept: "Transitions",
    prompt:
      "The team improved attendance this month; ____, class participation also rose.",
    choices: ["similarly", "in contrast", "as a result", "for instance"],
    correctChoiceIndex: 2,
    explanation:
      "The second statement follows from the first, so 'as a result' best signals consequence.",
    desmosRelevant: false,
  },
  {
    id: "q-203",
    sectionSlug: "reading-writing",
    section: "Reading and Writing",
    domain: "Expression of Ideas",
    conceptSlug: "transitions",
    concept: "Transitions",
    prompt:
      "The proposal was expensive; ____ it promised long-term savings.",
    choices: ["nevertheless", "for example", "therefore", "similarly"],
    correctChoiceIndex: 0,
    explanation:
      "The second clause contrasts with the first, so a concession transition like 'nevertheless' is appropriate.",
    desmosRelevant: false,
  },
  {
    id: "q-301",
    sectionSlug: "reading-writing",
    section: "Reading and Writing",
    domain: "Standard English Conventions",
    conceptSlug: "punctuation",
    concept: "Punctuation",
    prompt:
      "Choose the sentence with correct punctuation.",
    choices: [
      "Maya packed snacks, and water and she left early.",
      "Maya packed snacks and water, and she left early.",
      "Maya, packed snacks and water and she left early.",
      "Maya packed snacks and water and, she left early.",
    ],
    correctChoiceIndex: 1,
    explanation:
      "A comma before 'and' is needed because it joins two independent clauses.",
    desmosRelevant: false,
  },
  {
    id: "q-302",
    sectionSlug: "reading-writing",
    section: "Reading and Writing",
    domain: "Standard English Conventions",
    conceptSlug: "punctuation",
    concept: "Punctuation",
    prompt:
      "Which option correctly punctuates the sentence?",
    choices: [
      "The museum closed early however, the staff stayed to prepare.",
      "The museum closed early; however, the staff stayed to prepare.",
      "The museum closed early however the staff stayed, to prepare.",
      "The museum closed early: however the staff stayed to prepare.",
    ],
    correctChoiceIndex: 1,
    explanation:
      "A semicolon can join related independent clauses, and 'however' is followed by a comma.",
    desmosRelevant: false,
  },
  {
    id: "q-303",
    sectionSlug: "reading-writing",
    section: "Reading and Writing",
    domain: "Standard English Conventions",
    conceptSlug: "punctuation",
    concept: "Punctuation",
    prompt:
      "The volunteers brought flashlights ____ extra batteries.",
    choices: [",", ";", ":", "no punctuation"],
    correctChoiceIndex: 2,
    explanation:
      "A colon introduces a list or explanation after an independent clause.",
    desmosRelevant: false,
  },
];

function getDefaultUserState(): UserProgressState {
  return {
    conceptDeltas: {},
    recentSessions: [
      {
        sessionId: "sess-4382",
        type: "Concept Drill",
        section: "Math",
        correct: 9,
        total: 15,
        completedAt: "2026-03-24",
      },
      {
        sessionId: "sess-4368",
        type: "Mini Quiz",
        section: "Reading and Writing",
        correct: 7,
        total: 10,
        completedAt: "2026-03-23",
      },
      {
        sessionId: "sess-4349",
        type: "Full Module",
        section: "Math",
        correct: 16,
        total: 27,
        completedAt: "2026-03-22",
      },
    ],
  };
}

function getStore(): PracticeStore {
  const globalStore = globalThis as typeof globalThis & {
    __satPracticeStore?: PracticeStore;
  };

  if (!globalStore.__satPracticeStore) {
    globalStore.__satPracticeStore = {
      sessions: {},
      reviews: {},
      users: {},
      nextSessionId: 5000,
    };
  }

  return globalStore.__satPracticeStore;
}

function normalizeSection(section: string): SectionSlug | null {
  if (section === "math") {
    return "math";
  }
  if (section === "reading-writing") {
    return "reading-writing";
  }
  return null;
}

function getSessionMode(slug: SessionTypeSlug): PracticeMode {
  const found = practiceModes.find((mode) => mode.slug === slug);
  if (!found) {
    throw new Error("Unsupported session type.");
  }
  return found;
}

function toSessionSnapshot(session: SessionState): SessionSnapshot {
  const elapsedSeconds = Math.max(
    0,
    Math.floor((Date.now() - Date.parse(session.startedAt)) / 1000),
  );
  const remainingSeconds = Math.max(0, session.durationSeconds - elapsedSeconds);

  return {
    sessionId: session.sessionId,
    sessionType: session.sessionType,
    section: session.section,
    remainingSeconds,
    tutorMode: "hint-only",
    startedAt: session.startedAt,
    durationSeconds: session.durationSeconds,
    status: session.status,
    questionOrder: session.questions.map((question) => ({
      id: question.id,
      section: question.section,
      domain: question.domain,
      concept: question.concept,
      prompt: question.prompt,
      choices: question.choices,
      selectedChoiceIndex: question.selectedChoiceIndex,
      desmosRelevant: question.desmosRelevant,
    })),
  };
}

function buildSessionQuestions(
  section: SectionSlug,
  mode: PracticeMode,
  conceptSlug?: string,
): SessionQuestionState[] {
  const basePool = questionBank.filter((question) => {
    if (question.sectionSlug !== section) {
      return false;
    }
    if (mode.slug === "concept-drill" && conceptSlug) {
      return question.conceptSlug === conceptSlug;
    }
    return true;
  });

  if (basePool.length === 0) {
    throw new Error("No questions available for the selected filters.");
  }

  const items: SessionQuestionState[] = [];
  const targetCount = mode.questionCount;

  for (let index = 0; index < targetCount; index += 1) {
    const source = basePool[index % basePool.length];
    items.push({
      id: `${source.id}-${index + 1}`,
      questionId: source.id,
      section: source.section,
      domain: source.domain,
      conceptSlug: source.conceptSlug,
      concept: source.concept,
      prompt: source.prompt,
      choices: source.choices,
      correctChoiceIndex: source.correctChoiceIndex,
      selectedChoiceIndex: null,
      explanation: source.explanation,
      desmosRelevant: source.desmosRelevant,
    });
  }

  return items;
}

function assertSessionOwnership(session: SessionState, userId: string): void {
  if (session.userId !== userId) {
    throw new Error("Session does not belong to this user.");
  }
}

function getOrCreateUserState(userId: string): UserProgressState {
  const store = getStore();
  if (!store.users[userId]) {
    store.users[userId] = getDefaultUserState();
  }
  return store.users[userId];
}

function appendRecentResults(existing: boolean[], next: boolean): boolean[] {
  const recent = [...existing, next];
  if (recent.length <= 20) {
    return recent;
  }
  return recent.slice(recent.length - 20);
}

function scoreSession(session: SessionState): SessionReview {
  const submittedAt = new Date().toISOString().slice(0, 10);
  const conceptTotals: Record<string, { correct: number; total: number }> = {};
  const questions = session.questions.map((question) => {
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
  const correct = questions.filter((question) => question.isCorrect).length;

  return {
    sessionId: session.sessionId,
    scoreSummary: {
      correct,
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

function applyProgressUpdates(userId: string, session: SessionState, review: SessionReview): void {
  const userState = getOrCreateUserState(userId);
  const completedAt = review.scoreSummary.submittedAt;

  for (const question of session.questions) {
    const conceptDelta = userState.conceptDeltas[question.conceptSlug] ?? {
      attempts: 0,
      correct: 0,
      recentResults: [],
      lastPracticedAt: null,
    };
    const correct = question.selectedChoiceIndex === question.correctChoiceIndex;

    conceptDelta.attempts += 1;
    conceptDelta.correct += correct ? 1 : 0;
    conceptDelta.lastPracticedAt = completedAt;
    conceptDelta.recentResults = appendRecentResults(conceptDelta.recentResults, correct);
    userState.conceptDeltas[question.conceptSlug] = conceptDelta;
  }

  userState.recentSessions = [
    {
      sessionId: session.sessionId,
      type: session.sessionType,
      section: session.section,
      correct: review.scoreSummary.correct,
      total: review.scoreSummary.total,
      completedAt,
    },
    ...userState.recentSessions.filter((entry) => entry.sessionId !== session.sessionId),
  ].slice(0, 8);
}

export function resolvePracticeUserId(request: Request): string {
  const headerUserId = request.headers.get("x-user-id");
  if (headerUserId && headerUserId.trim()) {
    return headerUserId.trim();
  }
  const cookieHeader = request.headers.get("cookie");
  if (cookieHeader) {
    const userCookie = cookieHeader
      .split(";")
      .map((chunk) => chunk.trim())
      .find((chunk) => chunk.startsWith("sat_user_id="));
    if (userCookie) {
      const [, rawValue] = userCookie.split("=");
      const value = decodeURIComponent(rawValue ?? "").trim();
      if (value) {
        return value;
      }
    }
  }
  return DEFAULT_PRACTICE_USER_ID;
}

export function getPracticeModeList(): ReadonlyArray<PracticeMode> {
  return practiceModes;
}

export function getConceptCatalog(): ReadonlyArray<ConceptCatalogItem> {
  return conceptCatalog;
}

export function createSession(input: CreateSessionInput): CreateSessionResponse {
  const section = normalizeSection(input.section);
  if (!section) {
    throw new Error("Invalid section.");
  }
  const mode = getSessionMode(input.sessionType);
  const store = getStore();
  const sessionId = `sess-${store.nextSessionId}`;
  store.nextSessionId += 1;

  const questions = buildSessionQuestions(section, mode, input.conceptSlug);
  const now = new Date().toISOString();
  const sectionLabel = section === "math" ? "Math" : "Reading and Writing";

  const session: SessionState = {
    sessionId,
    userId: input.userId,
    sessionType: mode.title,
    sessionTypeSlug: mode.slug,
    section: sectionLabel,
    sectionSlug: section,
    conceptSlug: input.conceptSlug ?? null,
    startedAt: now,
    durationSeconds: mode.durationSeconds,
    status: "active",
    submittedAt: null,
    questions,
  };

  store.sessions[session.sessionId] = session;
  return {
    sessionId: session.sessionId,
    snapshot: toSessionSnapshot(session),
  };
}

export function getSessionSnapshot(
  sessionId: string,
  userId: string,
): SessionSnapshot | null {
  const store = getStore();
  const session = store.sessions[sessionId];
  if (!session) {
    return null;
  }
  assertSessionOwnership(session, userId);
  return toSessionSnapshot(session);
}

export function submitAnswer(input: SubmitAnswerInput): SubmitAnswerResponse {
  const store = getStore();
  const session = store.sessions[input.sessionId];
  if (!session) {
    throw new Error("Session not found.");
  }
  assertSessionOwnership(session, input.userId);
  if (session.status !== "active") {
    throw new Error("Session already submitted.");
  }

  const question = session.questions.find((item) => item.id === input.questionId);
  if (!question) {
    throw new Error("Question not found in session.");
  }
  if (
    !Number.isInteger(input.choiceIndex) ||
    input.choiceIndex < 0 ||
    input.choiceIndex >= question.choices.length
  ) {
    throw new Error("Choice index is out of range.");
  }

  question.selectedChoiceIndex = input.choiceIndex;
  const answeredCount = session.questions.filter(
    (item) => item.selectedChoiceIndex !== null,
  ).length;

  return {
    sessionId: session.sessionId,
    answeredCount,
    totalQuestions: session.questions.length,
    completed: answeredCount === session.questions.length,
    snapshot: toSessionSnapshot(session),
  };
}

export function finalizeSession(input: SubmitSessionInput): SubmitSessionResponse {
  const store = getStore();
  const session = store.sessions[input.sessionId];
  if (!session) {
    throw new Error("Session not found.");
  }
  assertSessionOwnership(session, input.userId);

  if (session.status === "submitted") {
    const review = store.reviews[session.sessionId];
    if (!review) {
      throw new Error("Submitted session review not found.");
    }
    return { review };
  }

  session.status = "submitted";
  session.submittedAt = new Date().toISOString().slice(0, 10);
  const review = scoreSession(session);
  store.reviews[session.sessionId] = review;
  applyProgressUpdates(input.userId, session, review);
  return { review };
}

export function getSessionReview(
  sessionId: string,
  userId: string,
): SessionReview | null {
  const store = getStore();
  const session = store.sessions[sessionId];
  if (!session) {
    return null;
  }
  assertSessionOwnership(session, userId);
  return store.reviews[sessionId] ?? null;
}

export function generateDrill(input: GenerateDrillInput): GenerateDrillResponse {
  const concept =
    (input.conceptSlug
      ? conceptCatalog.find((item) => item.slug === input.conceptSlug)
      : undefined) ??
    conceptCatalog.find((item) => item.sectionSlug === (input.section ?? "math")) ??
    conceptCatalog[0];

  const candidateQuestions = questionBank
    .filter((question) => question.conceptSlug === concept.slug)
    .slice(0, Math.max(1, Math.min(input.count ?? 5, 10)))
    .map((question) => ({
      id: question.id,
      prompt: question.prompt,
      concept: question.concept,
    }));

  const response: GenerateDrillResponse = {
    generatedAt: new Date().toISOString(),
    section: concept.section,
    conceptSlug: concept.slug,
    questions: candidateQuestions,
  };

  if (input.createSession) {
    const created = createSession({
      userId: input.userId,
      sessionType: "concept-drill",
      section: concept.sectionSlug,
      conceptSlug: concept.slug,
    });
    response.sessionId = created.sessionId;
  }

  return response;
}

export function getUserProgressState(userId: string): UserProgressState {
  return getOrCreateUserState(userId);
}

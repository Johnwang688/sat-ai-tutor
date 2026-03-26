export type QuestionBankDifficulty = 1 | 2 | 3 | 4 | 5;

export type QuestionBankDifficultyLabel = "easy" | "medium" | "hard";

export type ChoiceQuestionPrompt = {
  stem: string;
  body?: string;
  passage?: string;
  text1?: string;
  text2?: string;
  notes?: ReadonlyArray<string>;
  table?: {
    title?: string;
    columns: ReadonlyArray<string>;
    rows: ReadonlyArray<ReadonlyArray<string>>;
  };
  promptText: string;
};

export type ChoiceQuestionAnswerSchema = {
  type: "multiple_choice";
  choices: ReadonlyArray<string>;
  correctIndex: number;
};

export type QuestionBankExplanation = {
  summary: string;
  strategy?: string;
  whyCorrect?: string;
};

export type GeneratedQuestionRecord = {
  id: string;
  sectionSlug: "reading-writing" | "math";
  sectionName: "Reading and Writing" | "Math";
  domainSlug: string;
  domainName: string;
  conceptSlug: string;
  conceptName: string;
  difficulty: QuestionBankDifficulty;
  difficultyLabel: QuestionBankDifficultyLabel;
  questionType: string;
  calculatorAllowed: boolean;
  desmosRelevant: boolean;
  sourceType: "verified" | "generated_dynamic";
  status:
    | "draft"
    | "generated_pending_review"
    | "reviewed"
    | "published";
  tags: ReadonlyArray<string>;
  promptJson: ChoiceQuestionPrompt;
  answerSchemaJson: ChoiceQuestionAnswerSchema;
  explanationJson: QuestionBankExplanation;
};

export type GeneratedQuestionBank = {
  generatedAt: string;
  workflowVersion: string;
  questions: ReadonlyArray<GeneratedQuestionRecord>;
};

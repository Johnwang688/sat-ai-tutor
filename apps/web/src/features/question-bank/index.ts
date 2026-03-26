import { generateMathQuestionBank } from "./generator/math";
import { generateReadingWritingQuestionBank } from "./generator/reading-writing";
import type {
  ChoiceQuestionPrompt,
  GeneratedQuestionBank,
  GeneratedQuestionRecord,
  QuestionBankExplanation,
} from "./types";

type RawChoice = string | { text?: string };

type RawQuestion = {
  id: string;
  sectionSlug: "reading-writing" | "math";
  sectionName: "Reading and Writing" | "Math";
  domainSlug: string;
  domainName: string;
  conceptSlug: string;
  conceptName: string;
  difficulty: 1 | 2 | 3 | 4 | 5;
  questionType: string;
  calculatorAllowed: boolean;
  desmosRelevant: boolean;
  sourceType: "generated_dynamic";
  status: "draft" | "generated_pending_review";
  tags?: string[];
  promptJson: Record<string, unknown>;
  answerSchemaJson: {
    type?: string;
    choices?: RawChoice[];
    correctIndex?: number;
  };
  explanationJson: Record<string, unknown>;
};

function normalizeChoice(choice: RawChoice): string {
  if (typeof choice === "string") {
    return choice;
  }
  return choice.text ?? "";
}

function stringifyValue(value: unknown): string[] {
  if (value === null || value === undefined) {
    return [];
  }
  if (typeof value === "string") {
    return [value];
  }
  if (typeof value === "number" || typeof value === "boolean") {
    return [String(value)];
  }
  if (Array.isArray(value)) {
    return value.flatMap((item) => stringifyValue(item));
  }
  if (typeof value === "object") {
    const entries = Object.entries(value as Record<string, unknown>);
    return entries.flatMap(([key, nested]) => {
      if (key === "choices" || key === "correctIndex") {
        return [];
      }
      const nestedStrings = stringifyValue(nested);
      if (nestedStrings.length === 0) {
        return [];
      }
      if (
        key === "passage" ||
        key === "stem" ||
        key === "claim" ||
        key === "table" ||
        key === "notes" ||
        key === "context" ||
        key === "stimulus" ||
        key === "data"
      ) {
        return nestedStrings;
      }
      return nestedStrings.map((item) => `${key}: ${item}`);
    });
  }
  return [];
}

function buildPromptJson(promptJson: Record<string, unknown>): ChoiceQuestionPrompt {
  const lines = stringifyValue(promptJson).filter(Boolean);
  const stem = typeof promptJson.stem === "string" ? promptJson.stem : "Select the best answer.";
  const promptText = Array.from(new Set(lines)).join("\n\n");

  return {
    stem,
    body: promptText === stem ? undefined : promptText,
    promptText,
  };
}

function buildExplanationJson(
  explanationJson: Record<string, unknown>,
): QuestionBankExplanation {
  const summary =
    typeof explanationJson.summary === "string"
      ? explanationJson.summary
      : typeof explanationJson.whyCorrect === "string"
        ? explanationJson.whyCorrect
        : "Review the relationships in the prompt and select the choice best supported by the information.";

  return {
    summary,
    strategy:
      Array.isArray(explanationJson.steps) && explanationJson.steps.length > 0
        ? explanationJson.steps.join(" ")
        : undefined,
    whyCorrect:
      typeof explanationJson.whyCorrect === "string"
        ? explanationJson.whyCorrect
        : undefined,
  };
}

function normalizeQuestion(raw: RawQuestion): GeneratedQuestionRecord {
  const choices = (raw.answerSchemaJson.choices ?? []).map(normalizeChoice);
  while (choices.length < 4) {
    choices.push("");
  }

  return {
    id: raw.id,
    sectionSlug: raw.sectionSlug,
    sectionName: raw.sectionName,
    domainSlug: raw.domainSlug,
    domainName: raw.domainName,
    conceptSlug: raw.conceptSlug,
    conceptName: raw.conceptName,
    difficulty: raw.difficulty,
    difficultyLabel:
      raw.difficulty <= 2 ? "easy" : raw.difficulty === 3 ? "medium" : "hard",
    questionType: raw.questionType,
    calculatorAllowed: raw.calculatorAllowed,
    desmosRelevant: raw.desmosRelevant,
    sourceType: raw.sourceType,
    status: raw.status,
    tags: raw.tags ?? [],
    promptJson: buildPromptJson(raw.promptJson),
    answerSchemaJson: {
      type: "multiple_choice",
      choices: choices.slice(0, 4),
      correctIndex: raw.answerSchemaJson.correctIndex ?? 0,
    },
    explanationJson: buildExplanationJson(raw.explanationJson),
  };
}

const allQuestions = [
  ...generateReadingWritingQuestionBank(),
  ...generateMathQuestionBank(),
].map((question) => normalizeQuestion(question as RawQuestion));

export const generatedQuestionBank: GeneratedQuestionBank = {
  generatedAt: "2026-03-26T00:00:00.000Z",
  workflowVersion: "initial-research-bank-v1",
  questions: allQuestions,
};

export function getGeneratedQuestionBank(): GeneratedQuestionBank {
  return generatedQuestionBank;
}

export function listGeneratedQuestions(): ReadonlyArray<GeneratedQuestionRecord> {
  return generatedQuestionBank.questions;
}

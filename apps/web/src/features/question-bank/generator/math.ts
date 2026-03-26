import { canonicalConcepts } from "../../taxonomy/core-concepts";

type MathSectionSlug = "math";
type MathSectionName = "Math";
type MathDifficultyBand = "easy" | "medium" | "hard";
type MathQuestionDifficulty = 1 | 2 | 3 | 4 | 5;
type MathQuestionType = "multiple_choice";
type MathSourceType = "generated_dynamic";
type MathQuestionStatus = "generated_pending_review";
type MathQuestionChoiceTuple = [string, string, string, string];

type MathConceptMeta = {
  slug: string;
  name: string;
  sectionSlug: MathSectionSlug;
  sectionName: MathSectionName;
  domainSlug: string;
  domainName: string;
};

type MathQuestionPromptJson = {
  stem: string;
  data?: Record<string, unknown>;
  generationSource: "generated_from_research";
  difficultyBand: MathDifficultyBand;
  templateKey: string;
};

type MathQuestionAnswerSchemaJson = {
  type: MathQuestionType;
  choices: MathQuestionChoiceTuple;
  correctIndex: number;
  correctChoice: string;
  choiceLabels: ["A", "B", "C", "D"];
};

type MathQuestionExplanationJson = {
  summary: string;
  steps: string[];
  choiceNotes: string[];
  generationSource: "generated_from_research";
};

export type MathQuestionRecord = {
  id: string;
  sourceType: MathSourceType;
  status: MathQuestionStatus;
  sectionSlug: MathSectionSlug;
  sectionName: MathSectionName;
  domainSlug: string;
  domainName: string;
  conceptSlug: string;
  conceptName: string;
  questionType: MathQuestionType;
  difficulty: MathQuestionDifficulty;
  calculatorAllowed: boolean;
  desmosRelevant: boolean;
  promptJson: MathQuestionPromptJson;
  answerSchemaJson: MathQuestionAnswerSchemaJson;
  explanationJson: MathQuestionExplanationJson;
  tags: string[];
  metadata: {
    orderIndex: number;
    difficultyBand: MathDifficultyBand;
    templateKey: string;
    generationSource: "generated_from_research";
  };
};

export type MathQuestionBankConfig = {
  conceptSlug: string;
  conceptName: string;
  generator: (meta: MathConceptMeta) => MathQuestionRecord[];
};

const sectionSlug: MathSectionSlug = "math";
const sectionName: MathSectionName = "Math";
const questionCountPerConcept = 20;
const difficultyBands: ReadonlyArray<MathDifficultyBand> = [
  "easy",
  "easy",
  "easy",
  "easy",
  "easy",
  "easy",
  "medium",
  "medium",
  "medium",
  "medium",
  "medium",
  "medium",
  "medium",
  "medium",
  "hard",
  "hard",
  "hard",
  "hard",
  "hard",
  "hard",
];

const mathConceptSlugs = [
  "linear-equations-in-one-variable",
  "linear-equations-in-two-variables",
  "linear-functions",
  "systems-of-two-linear-equations-in-two-variables",
  "linear-inequalities-in-one-or-two-variables",
  "equivalent-expressions",
  "nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables",
  "nonlinear-functions",
  "ratios-rates-proportional-relationships-and-units",
  "percentages",
  "one-variable-data-distributions-and-measures-of-center-and-spread",
  "two-variable-data-models-and-scatterplots",
  "probability-and-conditional-probability",
  "inference-from-sample-statistics-and-margin-of-error",
  "evaluating-statistical-claims-observational-studies-and-experiments",
  "area-and-volume",
  "lines-angles-and-triangles",
  "right-triangles-and-trigonometry",
  "circles",
] as const;

type MathConceptSlug = (typeof mathConceptSlugs)[number];

type BuildQuestionInput = {
  orderIndex: number;
  difficultyBand: MathDifficultyBand;
  difficulty: MathQuestionDifficulty;
  templateKey: string;
  stem: string;
  data?: Record<string, unknown>;
  correctChoice: string;
  distractors: [string, string, string];
  summary: string;
  steps: string[];
  choiceNotes: [string, string, string, string];
  calculatorAllowed?: boolean;
  desmosRelevant?: boolean;
  tags?: string[];
};

function getMathConceptMeta(conceptSlug: MathConceptSlug): MathConceptMeta {
  const concept = canonicalConcepts.find(
    (item) => item.slug === conceptSlug && item.sectionSlug === sectionSlug,
  );

  if (!concept) {
    throw new Error(`Unknown math concept slug: ${conceptSlug}`);
  }

  return {
    slug: concept.slug,
    name: concept.name,
    sectionSlug,
    sectionName,
    domainSlug: concept.domainSlug,
    domainName: concept.domainName,
  };
}

function bandForIndex(orderIndex: number): MathDifficultyBand {
  return difficultyBands[orderIndex] ?? "medium";
}

function difficultyFromBand(band: MathDifficultyBand, orderIndex: number): MathQuestionDifficulty {
  if (band === "easy") {
    return orderIndex % 2 === 0 ? 1 : 2;
  }
  if (band === "medium") {
    return 3;
  }
  return orderIndex % 2 === 0 ? 4 : 5;
}

function normalizeAnswerChoices(
  correctChoice: string,
  distractors: [string, string, string],
  seed: number,
): { choices: MathQuestionChoiceTuple; correctIndex: number } {
  const baseChoices = [correctChoice, ...distractors];
  const rotation = seed % baseChoices.length;
  const rotated = baseChoices.slice(rotation).concat(baseChoices.slice(0, rotation));
  const correctIndex = rotated.indexOf(correctChoice);

  if (correctIndex < 0) {
    throw new Error("Correct choice missing from choice set.");
  }

  return {
    choices: rotated as MathQuestionChoiceTuple,
    correctIndex,
  };
}

function buildQuestion(meta: MathConceptMeta, input: BuildQuestionInput): MathQuestionRecord {
  const { choices, correctIndex } = normalizeAnswerChoices(
    input.correctChoice,
    input.distractors,
    input.orderIndex,
  );

  return {
    id: `math-${meta.slug}-${String(input.orderIndex + 1).padStart(2, "0")}`,
    sourceType: "generated_dynamic",
    status: "generated_pending_review",
    sectionSlug: meta.sectionSlug,
    sectionName: meta.sectionName,
    domainSlug: meta.domainSlug,
    domainName: meta.domainName,
    conceptSlug: meta.slug,
    conceptName: meta.name,
    questionType: "multiple_choice",
    difficulty: input.difficulty,
    calculatorAllowed: input.calculatorAllowed ?? true,
    desmosRelevant: input.desmosRelevant ?? false,
    promptJson: {
      stem: input.stem,
      data: input.data,
      generationSource: "generated_from_research",
      difficultyBand: input.difficultyBand,
      templateKey: input.templateKey,
    },
    answerSchemaJson: {
      type: "multiple_choice",
      choices,
      correctIndex,
      correctChoice: choices[correctIndex],
      choiceLabels: ["A", "B", "C", "D"],
    },
    explanationJson: {
      summary: input.summary,
      steps: input.steps,
      choiceNotes: input.choiceNotes,
      generationSource: "generated_from_research",
    },
    tags: ["math", meta.domainSlug, meta.slug, input.templateKey, ...(input.tags ?? [])],
    metadata: {
      orderIndex: input.orderIndex,
      difficultyBand: input.difficultyBand,
      templateKey: input.templateKey,
      generationSource: "generated_from_research",
    },
  };
}

function makeQuestionSeries(
  meta: MathConceptMeta,
  generator: (orderIndex: number, difficultyBand: MathDifficultyBand, difficulty: MathQuestionDifficulty) => BuildQuestionInput,
): MathQuestionRecord[] {
  return Array.from({ length: questionCountPerConcept }, (_, orderIndex) => {
    const difficultyBand = bandForIndex(orderIndex);
    const difficulty = difficultyFromBand(difficultyBand, orderIndex);
    return buildQuestion(meta, generator(orderIndex, difficultyBand, difficulty));
  });
}

function money(value: number): string {
  return `$${Number.isInteger(value) ? String(value) : value.toFixed(2).replace(/0+$/, "").replace(/\.$/, "")}`;
}

function intervalString(lower: number, upper: number, includeLower: boolean, includeUpper: boolean): string {
  return `${includeLower ? "[" : "("}${lower}, ${upper}${includeUpper ? "]" : ")"}`;
}

function orderedPair(x: number, y: number): string {
  return `(${x}, ${y})`;
}

function linearEquation(m: number, b: number): string {
  const sign = b >= 0 ? "+" : "-";
  return `y = ${m}x ${sign} ${Math.abs(b)}`;
}

function numericWrongs(answer: number, seed: number): [string, string, string] {
  return [
    String(answer + seed + 1),
    String(answer - (seed + 2)),
    String(answer + (seed + 3)),
  ];
}

function pairWrongs(answer: [number, number], seed: number): [string, string, string] {
  const [x, y] = answer;
  return [
    orderedPair(x + seed + 1, y),
    orderedPair(x, y + seed + 2),
    orderedPair(x - (seed + 1), y - (seed + 1)),
  ];
}

function decimalString(value: number): string {
  return Number.isInteger(value)
    ? String(value)
    : value.toFixed(2).replace(/0+$/, "").replace(/\.$/, "");
}

function fractionString(numerator: number, denominator: number): string {
  const divisor = gcd(numerator, denominator);
  const normalizedNumerator = numerator / divisor;
  const normalizedDenominator = denominator / divisor;
  if (normalizedDenominator < 0) {
    return `${-normalizedNumerator}/${-normalizedDenominator}`;
  }
  return `${normalizedNumerator}/${normalizedDenominator}`;
}

function gcd(left: number, right: number): number {
  let a = Math.abs(left);
  let b = Math.abs(right);
  while (b !== 0) {
    const next = a % b;
    a = b;
    b = next;
  }
  return a || 1;
}

function statementChoiceNotes(): [string, string, string, string] {
  return [
    "This is the correct answer.",
    "This choice reflects a common setup or sign error.",
    "This choice uses the wrong relationship from the prompt.",
    "This choice is plausible but not supported by the math.",
  ];
}

function seriesMeta(slug: MathConceptSlug): MathConceptMeta {
  return getMathConceptMeta(slug);
}

export function generateLinearEquationsInOneVariableQuestions(
  meta: MathConceptMeta,
): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const a = 4 + seed;
        const b = 11 + seed * 3;
        const answer = b - a;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "one-step-equation",
          stem: `Solve for x: x + ${a} = ${b}.`,
          correctChoice: String(answer),
          distractors: numericWrongs(answer, seed),
          summary: "Subtract the constant from both sides to isolate x.",
          steps: [`Subtract ${a} from both sides.`, `x = ${answer}.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["one-step", "equation"],
        };
      }
      case 1: {
        const a = 3 + seed;
        const b = 4 + seed;
        const c = 12 + seed * 4;
        const answer = (c + b) / a;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "multiplication-equation",
          stem: `Solve for x: ${a}x - ${b} = ${c}.`,
          correctChoice: String(answer),
          distractors: numericWrongs(answer, seed),
          summary: "Add the constant term and divide by the coefficient of x.",
          steps: [`Add ${b} to both sides.`, `${a}x = ${c + b}.`, `Divide by ${a}.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["one-variable", "solve"],
        };
      }
      case 2: {
        const a = 2 + seed;
        const b = 3 + seed;
        const c = 1 + seed;
        const answer = (14 + seed * 3 - c + a * b) / a;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "distribution-equation",
          stem: `Solve for x: ${a}(x - ${b}) + ${c} = ${14 + seed * 3}.`,
          correctChoice: String(answer),
          distractors: numericWrongs(answer, seed),
          summary: "Distribute first, then combine like terms and isolate x.",
          steps: [`Distribute ${a}.`, `Combine constants and move them to the other side.`, `Divide by the coefficient of x.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["distribution", "linear-equations"],
        };
      }
      case 3: {
        const leftCoeff = 5 + seed;
        const rightCoeff = 2 + seed;
        const leftConst = 8 + seed;
        const rightConst = 20 + seed * 2;
        const answer = (rightConst - leftConst) / (leftCoeff - rightCoeff);
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "variable-both-sides",
          stem: `Solve for x: ${leftCoeff}x + ${leftConst} = ${rightCoeff}x + ${rightConst}.`,
          correctChoice: String(answer),
          distractors: numericWrongs(answer, seed),
          summary: "Move the variable terms to one side and the constants to the other side.",
          steps: [`Subtract ${rightCoeff}x from both sides.`, `Subtract ${leftConst} from both sides.`, `Divide by the remaining coefficient.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["both-sides", "solve"],
        };
      }
      default: {
        const classes = 3 + seed;
        const fee = 12 + seed * 2;
        const total = fee + classes * (2 + seed);
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "word-problem",
          stem: `A studio charges a one-time fee of ${money(fee)} plus ${money(2 + seed)} per class. If the total cost is ${money(total)}, how many classes were taken?`,
          correctChoice: String(classes),
          distractors: [String(classes + 1), String(classes + 2), String(classes - 1)],
          summary: "Set up a linear equation from the fixed fee and the per-class cost.",
          steps: ["Subtract the fixed fee.", "Divide by the cost per class.", `The result is ${classes}.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["word-problem", "linear-equations"],
        };
      }
    }
  });
}

export function generateLinearEquationsInTwoVariablesQuestions(
  meta: MathConceptMeta,
): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const x = 2 + seed;
        const y = 4 + seed * 2;
        const a = 3 + seed;
        const b = 2 + seed;
        const c = a * x + b * y;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "solve-for-y",
          stem: `In the equation ${a}x + ${b}y = ${c}, what is y when x = ${x}?`,
          correctChoice: String(y),
          distractors: numericWrongs(y, seed),
          summary: "Substitute the given x-value, then solve for y.",
          steps: [`Replace x with ${x}.`, `Subtract the x-term from both sides.`, `Divide by the coefficient of y.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["two-variables", "solve-for-y"],
        };
      }
      case 1: {
        const m = 2 + seed;
        const b = -3 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "slope-intercept",
          stem: `Which equation has slope ${m} and y-intercept ${b}?`,
          correctChoice: linearEquation(m, b),
          distractors: [
            linearEquation(-m, b),
            linearEquation(m, Math.abs(b) + 2),
            linearEquation(m + 1, b),
          ],
          summary: "Use slope-intercept form y = mx + b.",
          steps: [`The slope is ${m}.`, `The y-intercept is ${b}.`, "Write the equation in slope-intercept form."],
          choiceNotes: statementChoiceNotes(),
          tags: ["slope-intercept", "equation"],
        };
      }
      case 2: {
        const p1 = { x: 1 + seed, y: 5 + seed };
        const p2 = { x: 4 + seed, y: 11 + seed * 2 };
        const slope = (p2.y - p1.y) / (p2.x - p1.x);
        const intercept = p1.y - slope * p1.x;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "line-from-points",
          stem: `A line passes through ${orderedPair(p1.x, p1.y)} and ${orderedPair(p2.x, p2.y)}. What is its equation?`,
          correctChoice: linearEquation(slope, intercept),
          distractors: [
            linearEquation(-slope, intercept),
            linearEquation(slope, intercept + 2),
            linearEquation(slope + 1, intercept),
          ],
          summary: "Find the slope from two points and then solve for the intercept.",
          steps: ["Compute rise over run.", "Use one point to find b.", "Write the equation."],
          choiceNotes: statementChoiceNotes(),
          tags: ["points", "equation"],
          desmosRelevant: true,
        };
      }
      case 3: {
        const fee = 4 + seed;
        const per = 3 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "context-linear-equation",
          stem: `A taxi charges a base fee of ${money(fee)} plus ${money(per)} per mile. Which equation represents the total cost C for m miles?`,
          correctChoice: `C = ${fee} + ${per}m`,
          distractors: [`C = ${fee}m + ${per}`, `C = ${per} + ${fee}m`, `C = ${fee + per}m`],
          summary: "A fixed fee becomes the constant term, and the per-mile charge multiplies the miles.",
          steps: ["Let m represent miles.", "Use the base fee as the constant.", "Multiply the per-mile charge by m."],
          choiceNotes: statementChoiceNotes(),
          tags: ["context", "equation"],
        };
      }
      default: {
        const x = 2 + seed;
        const y = 3 + seed;
        const c = y - 2 * x;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "point-satisfaction",
          stem: `Which ordered pair satisfies the equation y = 2x + ${c}?`,
          correctChoice: orderedPair(x, y),
          distractors: pairWrongs([x, y], seed),
          summary: "Substitute each ordered pair and check whether both sides are equal.",
          steps: ["Use the pair in the equation.", "Check whether the result matches.", "Only one choice makes the equation true."],
          choiceNotes: statementChoiceNotes(),
          tags: ["ordered-pairs", "two-variables"],
          desmosRelevant: true,
        };
      }
    }
  });
}

export function generateLinearFunctionsQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const start = 6 + seed * 2;
        const rate = 3 + seed;
        const table = {
          headers: ["x", "f(x)"],
          rows: [
            ["0", String(start)],
            ["1", String(start + rate)],
            ["2", String(start + 2 * rate)],
          ],
        };
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "table-rate",
          stem: "A linear function is shown in the table. What is the rate of change?",
          data: { table },
          correctChoice: String(rate),
          distractors: numericWrongs(rate, seed),
          summary: "Compare consecutive outputs to find the constant change in y for each 1-unit increase in x.",
          steps: ["Look at the change from x = 0 to x = 1.", "Confirm the same change appears from x = 1 to x = 2.", "That constant change is the rate of change."],
          choiceNotes: statementChoiceNotes(),
          tags: ["table", "rate"],
          desmosRelevant: true,
        };
      }
      case 1: {
        const m = 2 + seed;
        const b = 5 + seed;
        const x = 3 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "evaluate-function",
          stem: `If f(x) = ${linearEquation(m, b)}, what is f(${x})?`,
          correctChoice: String(m * x + b),
          distractors: numericWrongs(m * x + b, seed),
          summary: "Substitute the input into the function and simplify.",
          steps: [`Replace x with ${x}.`, `Multiply by the slope and add the intercept.`, `The output is ${m * x + b}.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["function", "evaluation"],
        };
      }
      case 2: {
        const start = 4 + seed;
        const change = 6 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "starting-value",
          stem: `A savings plan starts with ${money(start)} and increases by ${money(change)} each week. What is the starting value of the function?`,
          correctChoice: money(start),
          distractors: [money(start + change), money(change), money(start - 1)],
          summary: "The starting value is the output when the input is 0.",
          steps: ["Identify the amount at week 0.", "That amount is the starting value.", "No growth has happened yet."],
          choiceNotes: statementChoiceNotes(),
          tags: ["intercept", "starting-value"],
        };
      }
      case 3: {
        const m = 3 + seed;
        const b = 2 + seed;
        const otherM = m + 1;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "compare-rates",
          stem: `Two lines are described by y = ${linearEquation(m, b)} and y = ${linearEquation(otherM, b - 2)}. Which line has the greater rate of change?`,
          correctChoice: `The line with slope ${otherM}`,
          distractors: [`The line with slope ${m}`, "The line with the larger intercept", "They have the same rate of change"],
          summary: "The rate of change is the slope, so compare the coefficients of x.",
          steps: ["Identify the slope of each function.", "Compare the coefficients of x.", "The larger coefficient means the greater rate of change."],
          choiceNotes: statementChoiceNotes(),
          tags: ["slope", "comparison"],
        };
      }
      default: {
        const x1 = 0;
        const x2 = 4 + seed;
        const y1 = 7 + seed;
        const y2 = y1 + (x2 - x1) * (2 + seed);
        const slope = (y2 - y1) / (x2 - x1);
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "two-points",
          stem: `A linear function passes through ${orderedPair(x1, y1)} and ${orderedPair(x2, y2)}. What is its slope?`,
          correctChoice: String(slope),
          distractors: numericWrongs(slope, seed),
          summary: "Find the slope from two points using rise over run.",
          steps: ["Subtract the y-values.", "Subtract the x-values.", "Divide the change in y by the change in x."],
          choiceNotes: statementChoiceNotes(),
          tags: ["points", "slope"],
          desmosRelevant: true,
        };
      }
    }
  });
}

export function generateSystemsOfTwoLinearEquationsQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const x = 2 + seed;
        const y = 5 + seed;
        const a = 2 + seed;
        const b = 1 + seed;
        const c = a * x + b * y;
        const d = 3 + seed;
        const e = 2 + seed;
        const f = d * x + e * y;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "solve-system",
          stem: `Solve the system:\n${a}x + ${b}y = ${c}\n${d}x + ${e}y = ${f}`,
          correctChoice: orderedPair(x, y),
          distractors: pairWrongs([x, y], seed),
          summary: "Use elimination or substitution to find the ordered pair that satisfies both equations.",
          steps: ["Eliminate one variable or solve one equation for a variable.", "Substitute into the other equation.", `The solution is ${orderedPair(x, y)}.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["systems", "solve"],
          desmosRelevant: true,
        };
      }
      case 1: {
        const slope = 3 + seed;
        const b1 = 4 + seed;
        const b2 = b1 + 2;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "number-of-solutions",
          stem: `How many solutions does the system y = ${linearEquation(slope, b1)} and y = ${linearEquation(slope, b2)} have?`,
          correctChoice: "0",
          distractors: ["1", "2", "Infinitely many"],
          summary: "Parallel lines with different intercepts never intersect.",
          steps: ["Both equations have the same slope.", "The y-intercepts are different.", "So the lines are parallel and have no solution."],
          choiceNotes: statementChoiceNotes(),
          tags: ["systems", "parallel-lines"],
        };
      }
      case 2: {
        const fee = 6 + seed;
        const per = 4 + seed;
        const guides = 2 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "context-system",
          stem: `A museum charges ${money(fee)} for admission plus ${money(per)} per guide. If the total cost is ${money(fee + per * guides)} for ${guides} guides, which equation matches the situation?`,
          correctChoice: `C = ${fee} + ${per}g`,
          distractors: [`C = ${fee}g + ${per}`, `C = ${per} + ${fee}g`, `C = ${fee + per}g`],
          summary: "Translate the context into an equation with a fixed fee and a per-guide rate.",
          steps: ["Let g represent the number of guides.", "Use the fixed fee as the constant term.", "Multiply the per-guide charge by g."],
          choiceNotes: statementChoiceNotes(),
          tags: ["systems", "context"],
        };
      }
      case 3: {
        const x = 1 + seed;
        const y = 7 + seed * 2;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "solution-check",
          stem: `Which ordered pair is a solution to the system x + y = ${x + y} and 2x - y = ${2 * x - y}?`,
          correctChoice: orderedPair(x, y),
          distractors: pairWrongs([x, y], seed),
          summary: "Substitute the ordered pair into both equations.",
          steps: ["Check the first equation.", "Check the second equation.", "Only one pair satisfies both equations."],
          choiceNotes: statementChoiceNotes(),
          tags: ["systems", "check"],
        };
      }
      default: {
        const x = 4 + seed;
        const y = 3 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "intersection-interpretation",
          stem: `Two lines intersect at the point ${orderedPair(x, y)}. What does that point represent?`,
          correctChoice: "The solution to the system",
          distractors: ["The y-intercepts of both lines", "The slope of each line", "The point where the lines are parallel"],
          summary: "The intersection of two lines is the one ordered pair that satisfies both equations.",
          steps: ["At the intersection, both equations have the same x- and y-values.", "That means the ordered pair solves the system.", "The point is not a slope or intercept."],
          choiceNotes: statementChoiceNotes(),
          tags: ["systems", "intersection"],
          desmosRelevant: true,
        };
      }
    }
  });
}

export function generateLinearInequalitiesQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const a = 3 + seed;
        const threshold = 2 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "single-inequality",
          stem: `Solve the inequality: ${a}x - ${5 + seed * 2} > ${a * threshold - (5 + seed * 2)}.`,
          correctChoice: `x > ${threshold}`,
          distractors: [`x < ${threshold}`, `x >= ${threshold}`, `x = ${threshold}`],
          summary: "Isolate x and keep the inequality direction unchanged because you divide by a positive number.",
          steps: ["Add the constant to both sides.", "Divide by the positive coefficient of x.", `The solution is x > ${threshold}.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["inequalities", "single"],
        };
      }
      case 1: {
        const lower = 2 + seed;
        const upper = 8 + seed * 2;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "compound-inequality",
          stem: `Which interval represents the solution to ${lower} < x + 1 <= ${upper}?`,
          correctChoice: intervalString(lower - 1, upper - 1, false, true),
          distractors: [
            intervalString(lower - 1, upper - 1, true, true),
            intervalString(lower - 2, upper - 1, false, true),
            intervalString(lower - 1, upper, false, true),
          ],
          summary: "Subtract 1 from all three parts of the compound inequality.",
          steps: ["Subtract 1 from the left, middle, and right expressions.", "Keep the inequality directions the same.", "Write the interval notation carefully."],
          choiceNotes: statementChoiceNotes(),
          tags: ["inequalities", "compound"],
        };
      }
      case 2: {
        const budget = 60 + seed * 10;
        const cost = 8 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "context-range",
          stem: `A club has ${money(budget)} to spend on tickets that cost ${money(cost)} each. What is the greatest whole number of tickets it can buy?`,
          correctChoice: String(Math.floor(budget / cost)),
          distractors: [String(Math.ceil(budget / cost)), String(Math.floor(budget / cost) - 1), String(budget - cost)],
          summary: "Divide the budget by the ticket price and round down to the nearest whole ticket.",
          steps: ["Divide the budget by the ticket price.", "Keep only the whole-number count that does not exceed the budget.", "That is the greatest number of tickets."],
          choiceNotes: statementChoiceNotes(),
          tags: ["inequalities", "word-problem"],
        };
      }
      case 3: {
        const lower = -2 - seed;
        const upper = 5 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "graph-interval",
          stem: `Which inequality matches the interval ${intervalString(lower, upper, true, false)}?`,
          correctChoice: `${lower} <= x < ${upper}`,
          distractors: [`${lower} < x <= ${upper}`, `${lower} <= x <= ${upper}`, `${lower} < x < ${upper}`],
          summary: "Match included endpoints with <= or >= and excluded endpoints with < or >.",
          steps: ["A square bracket means the endpoint is included.", "A parenthesis means the endpoint is excluded.", "Translate the interval into inequality notation."],
          choiceNotes: statementChoiceNotes(),
          tags: ["inequalities", "intervals"],
        };
      }
      default: {
        const x = 3 + seed;
        const y = 2 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "test-point",
          stem: `Does the point ${orderedPair(x, y)} satisfy the inequality y >= x - ${1 + seed}?`,
          correctChoice: "Yes",
          distractors: ["No", "Only if x is negative", "Only if y is greater than x"],
          summary: "Substitute the point and compare the two sides.",
          steps: [`Replace x with ${x} and y with ${y}.`, "Check whether the left side is at least as large as the right side.", "The point does or does not satisfy the inequality."],
          choiceNotes: statementChoiceNotes(),
          tags: ["inequalities", "test-point"],
        };
      }
    }
  });
}

export function generateEquivalentExpressionsQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const a = 3 + seed;
        const b = 5 + seed;
        const c = 2 + seed;
        const answer = `${a * c}x + ${a * b}`;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "expand",
          stem: `Which expression is equivalent to ${a}(${c}x + ${b})?`,
          correctChoice: answer,
          distractors: [
            `${a + c}x + ${a * b}`,
            `${a * c}x + ${b}`,
            `${a * c + b}x`,
          ],
          summary: "Distribute the factor across both terms inside the parentheses.",
          steps: ["Multiply the outside factor by each term inside the parentheses.", "Combine like terms if needed.", "Write the expanded expression."],
          choiceNotes: statementChoiceNotes(),
          tags: ["expand", "distributive-property"],
        };
      }
      case 1: {
        const factor = 3 + seed;
        const a = factor * 2;
        const b = factor * 3;
        const answer = `${factor}(2x + 3)`;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "factor",
          stem: `Which expression is equivalent to ${a}x + ${b}?`,
          correctChoice: answer,
          distractors: [`${a}(x + 3)`, `${a + b}x`, `${factor}(2x + 4)`],
          summary: "Factor out the greatest common factor.",
          steps: ["Identify the greatest common factor of the terms.", "Write the expression as a product.", "Check by distributing back."],
          choiceNotes: statementChoiceNotes(),
          tags: ["factor", "gcf"],
        };
      }
      case 2: {
        const d = 3 + seed;
        const n = d * (4 + seed);
        const answer = `${n / d}`;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "rational-simplify",
          stem: `Which expression is equivalent to ${n}x / ${d}x?`,
          correctChoice: answer,
          distractors: [String(n / d + 1), String(d / n), `${d}x`],
          summary: "Cancel the common factor of x and reduce the coefficient fraction.",
          steps: ["Cancel x from numerator and denominator.", "Reduce the numerical fraction.", "Write the simplified value."],
          choiceNotes: statementChoiceNotes(),
          tags: ["rational-expressions", "simplify"],
        };
      }
      case 3: {
        const a = 2 + seed;
        const answer = `${a * a * a}`;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "exponent-rules",
          stem: `Which expression is equivalent to (${a})^3?`,
          correctChoice: answer,
          distractors: [String(a * 3), String(a ** 2), String(a + 3)],
          summary: "A power means repeated multiplication, not multiplication by the exponent.",
          steps: [`Compute ${a} times ${a} times ${a}.`, "Do not confuse powers with multiplication by the exponent.", "Write the final value."],
          choiceNotes: statementChoiceNotes(),
          tags: ["exponents", "powers"],
        };
      }
      default: {
        const x = 3 + seed;
        const answer = `${2 * x + 4}`;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "combine-like-terms",
          stem: `Which expression is equivalent to ${x} + ${x} + 4?`,
          correctChoice: answer,
          distractors: [`${x + 4}`, `${3 * x + 4}`, `${2 * x}`],
          summary: "Combine like terms before simplifying the constants.",
          steps: ["Add the two x terms together.", "Keep the constant 4.", "Write the simplified expression."],
          choiceNotes: statementChoiceNotes(),
          tags: ["like-terms", "simplify"],
        };
      }
    }
  });
}

export function generateNonlinearEquationsQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const roots = [2 + seed, -3 - seed];
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "quadratic-roots",
          stem: `Which value is a solution to x^2 + ${1 + seed}x - ${(2 + seed) * (3 + seed)} = 0?`,
          correctChoice: String(roots[0]),
          distractors: [String(roots[1]), String(roots[0] + 1), String(Math.abs(roots[1]))],
          summary: "Factor the quadratic or test the roots.",
          steps: ["Look for factors of the constant term.", "Check which value makes the equation true.", "Use the root that satisfies the equation."],
          choiceNotes: statementChoiceNotes(),
          tags: ["quadratic", "roots"],
        };
      }
      case 1: {
        const x = 4 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "radical-equation",
          stem: `Solve for x: sqrt(x + ${1 + seed}) = ${3 + seed}.`,
          correctChoice: String(x * x - (1 + seed)),
          distractors: [String(x * x), String(x + 1), String(x * x + 1)],
          summary: "Square both sides and then check for extraneous solutions.",
          steps: ["Square both sides to remove the radical.", "Solve the resulting equation.", "Check whether the solution works in the original equation."],
          choiceNotes: statementChoiceNotes(),
          tags: ["radical", "extraneous"],
        };
      }
      case 2: {
        const a = 2 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "absolute-value",
          stem: `How many solutions does |x - ${3 + seed}| = ${a} have?`,
          correctChoice: "2",
          distractors: ["0", "1", "Infinitely many"],
          summary: "An absolute value equation with a positive right side usually has two solutions.",
          steps: ["Set the inside equal to the positive and negative values.", "Solve each equation.", "Count the valid solutions."],
          choiceNotes: statementChoiceNotes(),
          tags: ["absolute-value", "solutions"],
        };
      }
      case 3: {
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "linear-quadratic-system",
          stem: `The system y = x^2 and y = x + ${1 + seed} has how many solutions?`,
          correctChoice: "2",
          distractors: ["0", "2", "3"],
          summary: "A line that crosses a parabola in two places gives two solutions.",
          steps: ["Set the equations equal to each other.", "Solve the resulting quadratic.", "Count the real intersection points."],
          choiceNotes: statementChoiceNotes(),
          tags: ["system", "quadratic"],
          desmosRelevant: true,
        };
      }
      default: {
        const vertexY = -2 - seed;
        const lineY = vertexY - (2 + seed);
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "intersection-count",
          stem: `A parabola has a minimum point at y = ${vertexY}. A horizontal line with equation y = ${lineY} is graphed on the same plane. How many intersection points are there?`,
          correctChoice: "0",
          distractors: ["1", "2", "Infinitely many"],
          summary: "If the line stays below the parabola's lowest point, the graphs do not intersect.",
          steps: ["Look at the parabola's minimum point.", "Compare the line's height to that minimum.", "No intersection points means zero solutions."],
          choiceNotes: statementChoiceNotes(),
          tags: ["intersection-count", "graphs"],
          desmosRelevant: true,
        };
      }
    }
  });
}

export function generateNonlinearFunctionsQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const vertex = 4 + seed;
        const max = 12 + seed * 2;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "quadratic-vertex",
          stem: `A quadratic function has vertex at x = ${vertex} and opens downward. What is the maximum value if the vertex is (${vertex}, ${max})?`,
          correctChoice: String(max),
          distractors: numericWrongs(max, seed),
          summary: "For a downward-opening parabola, the y-value of the vertex is the maximum.",
          steps: ["Identify the vertex.", "Because the parabola opens downward, the vertex gives the maximum.", `The maximum value is ${max}.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["quadratic", "vertex"],
          desmosRelevant: true,
        };
      }
      case 1: {
        const start = 2 + seed;
        const growth = 1.5 + seed * 0.5;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "exponential-growth",
          stem: `A population starts at ${start} and is multiplied by ${decimalString(1.2 + seed * 0.1)} each year. What is the value after one year?`,
          correctChoice: decimalString(start * (1.2 + seed * 0.1)),
          distractors: [
            decimalString(start + (1.2 + seed * 0.1)),
            decimalString(start * (1.2 + seed * 0.1) + 1),
            decimalString(start * (1.2 + seed * 0.1) - 1),
          ],
          summary: "Exponential growth multiplies by the growth factor each period.",
          steps: ["Multiply the starting value by the growth factor.", "Do not add the factor.", "Write the result after one year."],
          choiceNotes: statementChoiceNotes(),
          tags: ["exponential", "growth"],
        };
      }
      case 2: {
        const x = 2 + seed;
        const y = (x + 1) * (x + 3);
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "table-nonlinear",
          stem: `A function is defined by f(x) = (x + 1)(x + 3). What is f(${x})?`,
          correctChoice: String(y),
          distractors: numericWrongs(y, seed),
          summary: "Substitute the input into both factors and multiply.",
          steps: ["Replace x with the given value.", "Evaluate each factor.", "Multiply the results."],
          choiceNotes: statementChoiceNotes(),
          tags: ["nonlinear", "table"],
        };
      }
      case 3: {
        const x = 3 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "transformation",
          stem: `The graph of y = x^2 is shifted up by ${2 + seed} units. Which function is produced?`,
          correctChoice: `y = x^2 + ${2 + seed}`,
          distractors: [`y = (x + ${2 + seed})^2`, `y = x^2 - ${2 + seed}`, `y = ${2 + seed}x^2`],
          summary: "A vertical shift changes the constant term, not the x inside the square.",
          steps: ["Start with the parent function y = x^2.", "Add the vertical shift to the output.", "Write the transformed function."],
          choiceNotes: statementChoiceNotes(),
          tags: ["transformations", "quadratic"],
        };
      }
      default: {
        const factor = 2 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "function-comparison",
          stem: `Which type of function best matches values that are multiplied by ${factor} each time x increases by 1?`,
          correctChoice: "Exponential",
          distractors: ["Linear", "Quadratic", "Constant"],
          summary: "Repeated multiplication by the same factor is exponential behavior.",
          steps: ["Look for a constant ratio, not a constant difference.", `Multiplying by ${factor} each time creates a repeated ratio.`, "That pattern is exponential."],
          choiceNotes: statementChoiceNotes(),
          tags: ["exponential", "comparison"],
        };
      }
    }
  });
}

export function generateRatiosRatesAndUnitsQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const miles = 120 + seed * 20;
        const hours = 3 + seed;
        const answer = miles / hours;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "unit-rate",
          stem: `A car travels ${miles} miles in ${hours} hours. What is its unit rate in miles per hour?`,
          correctChoice: String(answer),
          distractors: numericWrongs(answer, seed),
          summary: "Divide distance by time to find the unit rate.",
          steps: ["Take miles divided by hours.", "Simplify the quotient.", "The result is miles per hour."],
          choiceNotes: statementChoiceNotes(),
          tags: ["rate", "unit-rate"],
        };
      }
      case 1: {
        const ratioLeft = 2 + seed;
        const ratioRight = 3 + seed;
        const sugar = (5 + seed) * 2;
        const flour = (ratioLeft * sugar) / ratioRight;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "ratio-scale",
          stem: `A recipe uses a ratio of ${ratioLeft}:${ratioRight} cups of flour to cups of sugar. If the sugar amount is ${sugar} cups, how many cups of flour are needed?`,
          correctChoice: String(flour),
          distractors: [String(sugar), String(flour + ratioLeft), String(flour - ratioLeft)],
          summary: "Set up a proportion that preserves the ratio.",
          steps: ["Match flour to sugar in the same order.", "Use cross multiplication or proportional reasoning.", "Find the missing amount."],
          choiceNotes: statementChoiceNotes(),
          tags: ["ratio", "proportion"],
        };
      }
      case 2: {
        const km = 8 + seed;
        const answer = km * 1.6;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "unit-conversion",
          stem: `How many miles is ${km} kilometers? Use 1 kilometer = 1.6 miles.`,
          correctChoice: decimalString(answer),
          distractors: [decimalString(km / 1.6), decimalString(answer + 1), decimalString(answer - 1)],
          summary: "Multiply by the conversion factor with matching units.",
          steps: ["Use the given conversion factor.", "Multiply the number of kilometers by 1.6.", "Write the distance in miles."],
          choiceNotes: statementChoiceNotes(),
          tags: ["units", "conversion"],
        };
      }
      case 3: {
        const bikes = 3 + seed;
        const wheels = bikes * 2;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "proportional-relationship",
          stem: `If 3 bicycles have 6 wheels, how many wheels do ${bikes} bicycles have?`,
          correctChoice: String(wheels),
          distractors: [String(wheels + 2), String(wheels - 2), String(bikes + 6)],
          summary: "Keep the ratio wheels to bicycles constant.",
          steps: ["Find the number of wheels per bicycle.", "Multiply by the number of bicycles.", "The relationship stays proportional."],
          choiceNotes: statementChoiceNotes(),
          tags: ["proportional", "ratio"],
        };
      }
      default: {
        const time = 2 + seed;
        const speed = 30 + seed * 5;
        const distance = time * speed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "compound-rate",
          stem: `A runner travels at ${speed} miles per hour for ${time} hours. How far does the runner go?`,
          correctChoice: String(distance),
          distractors: [String(distance + speed), String(distance - speed), String(distance / time)],
          summary: "Distance equals rate times time.",
          steps: ["Multiply the speed by the number of hours.", "Keep the units consistent.", "The result is distance."],
          choiceNotes: statementChoiceNotes(),
          tags: ["rate", "distance"],
        };
      }
    }
  });
}

export function generatePercentagesQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const original = 80 + seed * 10;
        const increase = 10 + seed * 5;
        const answer = original * (1 + increase / 100);
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "percent-change",
          stem: `A price increases from ${money(original)} by ${increase}%. What is the new price?`,
          correctChoice: money(answer),
          distractors: [money(original + increase), money(original - increase), money(original * increase / 100)],
          summary: "Increase the original price by the percent of the original, not the percent of the new price.",
          steps: ["Find the increase amount.", "Add it to the original price.", "Write the new price."],
          choiceNotes: statementChoiceNotes(),
          tags: ["percent", "change"],
        };
      }
      case 1: {
        const price = 50 + seed * 10;
        const discount = 20 + seed * 5;
        const answer = price * (1 - discount / 100);
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "discount",
          stem: `A jacket costs ${money(price)} and is discounted by ${discount}%. What is the sale price?`,
          correctChoice: money(answer),
          distractors: [money(price - discount), money(price + discount), money(price * discount / 100)],
          summary: "Subtract the discount amount from the original price.",
          steps: ["Find the discount as a percent of the original price.", "Subtract the discount from the original.", "The remainder is the sale price."],
          choiceNotes: statementChoiceNotes(),
          tags: ["percent", "discount"],
        };
      }
      case 2: {
        const final = 72 + seed * 8;
        const percent = 80 - seed * 5;
        const answer = final / (percent / 100);
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "reverse-percent",
          stem: `A number is ${percent}% of an original value and equals ${money(final)}. What was the original value?`,
          correctChoice: money(answer),
          distractors: [money(final * percent / 100), money(answer - 10), money(answer + 10)],
          summary: "Divide the part by the percent written as a decimal.",
          steps: ["Convert the percent to a decimal.", "Divide the part by that decimal.", "The quotient is the original value."],
          choiceNotes: statementChoiceNotes(),
          tags: ["percent", "reverse"],
        };
      }
      case 3: {
        const original = 100;
        const increase = 10 + seed * 2;
        const answer = original * (1 + increase / 100) * (1 + increase / 100);
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "repeated-change",
          stem: `A value of ${money(original)} increases by ${increase}% two times in a row. What is the final value?`,
          correctChoice: money(answer),
          distractors: [money(original * (1 + 2 * increase / 100)), money(original + 2 * increase), money(original * (1 - increase / 100))],
          summary: "Apply the percent change twice, using the new value after each step.",
          steps: ["Multiply by 1 + the percent as a decimal.", "Use the new value for the second increase.", "Write the final amount."],
          choiceNotes: statementChoiceNotes(),
          tags: ["percent", "repeated-change"],
        };
      }
      default: {
        const base = 200 + seed * 50;
        const pct = 15 + seed * 5;
        const answer = base * pct / 100;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "percent-of-amount",
          stem: `What is ${pct}% of ${money(base)}?`,
          correctChoice: money(answer),
          distractors: [money(base - answer), money(answer + 5), money(answer - 5)],
          summary: "Multiply the amount by the percent written as a decimal.",
          steps: ["Convert the percent to a decimal.", "Multiply by the base amount.", "Write the part."],
          choiceNotes: statementChoiceNotes(),
          tags: ["percent", "of"],
        };
      }
    }
  });
}

export function generateOneVariableDataQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const values = [5 + seed, 7 + seed, 8 + seed, 10 + seed];
        const mean = values.reduce((sum, value) => sum + value, 0) / values.length;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "mean",
          stem: `What is the mean of the data set ${values.join(", ")}?`,
          data: { values },
          correctChoice: String(mean),
          distractors: numericWrongs(mean, seed),
          summary: "Add the values and divide by the number of data points.",
          steps: ["Add all four numbers.", "Divide by 4.", "The quotient is the mean."],
          choiceNotes: statementChoiceNotes(),
          tags: ["mean", "center"],
        };
      }
      case 1: {
        const values = [3 + seed, 4 + seed, 4 + seed, 5 + seed, 30 + seed];
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "outlier-effect",
          stem: `A data set contains ${values.join(", ")}. Which statement is true if the value ${30 + seed} is removed?`,
          data: { values },
          correctChoice: "The mean decreases more than the median changes",
          distractors: [
            "The mean increases",
            "The median changes a lot more than the mean",
            "Both center measures stay exactly the same",
          ],
          summary: "Removing a high outlier pulls the mean down more than it changes the median.",
          steps: ["Identify the outlier.", "Think about how the mean responds to extreme values.", "The median is usually less affected."],
          choiceNotes: statementChoiceNotes(),
          tags: ["outlier", "mean"],
        };
      }
      case 2: {
        const values = [2 + seed, 4 + seed, 6 + seed, 8 + seed];
        const range = values[values.length - 1] - values[0];
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "range",
          stem: `What is the range of the data set ${values.join(", ")}?`,
          data: { values },
          correctChoice: String(range),
          distractors: numericWrongs(range, seed),
          summary: "Range is the greatest value minus the least value.",
          steps: ["Find the largest value.", "Find the smallest value.", "Subtract the smallest from the largest."],
          choiceNotes: statementChoiceNotes(),
          tags: ["range", "spread"],
        };
      }
      case 3: {
        const setA = [4 + seed, 5 + seed, 6 + seed, 7 + seed];
        const setB = [2 + seed, 2 + seed, 9 + seed, 9 + seed];
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "compare-distributions",
          stem: `Which data set has the greater median: ${setA.join(", ")} or ${setB.join(", ")}?`,
          data: { setA, setB },
          correctChoice: "They have the same median",
          distractors: ["Set A", "Set B", "Neither"],
          summary: "Sort each set and compare the middle values.",
          steps: ["Order each data set.", "Find the middle value or average of the two middle values.", "Compare the medians."],
          choiceNotes: statementChoiceNotes(),
          tags: ["median", "comparison"],
        };
      }
      default: {
        const outlier = 18 + seed * 4;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "statistic-choice",
          stem: `A data set contains the values 4, 5, 5, 6, and ${outlier}. Which statistic is least affected by that unusually large value?`,
          correctChoice: "Median",
          distractors: ["Mean", "Range", "Maximum"],
          summary: "The median depends on position, so it resists outliers better than the mean.",
          steps: ["Think about which statistic uses the middle position.", "Outliers change the total more than the middle.", "The median is the best choice."],
          choiceNotes: statementChoiceNotes(),
          tags: ["median", "outlier"],
        };
      }
    }
  });
}

export function generateTwoVariableDataQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const x1 = 0;
        const y1 = 4 + seed;
        const x2 = 3 + seed;
        const y2 = y1 + (x2 - x1) * (2 + seed);
        const slope = (y2 - y1) / (x2 - x1);
        const table = {
          headers: ["x", "y"],
          rows: [
            [String(x1), String(y1)],
            [String(x2), String(y2)],
          ],
        };
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "best-fit-slope",
          stem: "A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?",
          data: { table },
          correctChoice: String(slope),
          distractors: numericWrongs(slope, seed),
          summary: "Use rise over run with the two points on the line of best fit.",
          steps: ["Subtract the y-values.", "Subtract the x-values.", "Divide the change in y by the change in x."],
          choiceNotes: statementChoiceNotes(),
          tags: ["scatterplot", "slope"],
          desmosRelevant: true,
        };
      }
      case 1: {
        const x = 5 + seed;
        const y = 2 * x + 3;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "prediction",
          stem: `A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = ${x}?`,
          correctChoice: String(y),
          distractors: numericWrongs(y, seed),
          summary: "Substitute the x-value into the model to make a prediction.",
          steps: [`Replace x with ${x}.`, "Compute 2x + 3.", `The predicted value is ${y}.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["prediction", "model"],
          desmosRelevant: true,
        };
      }
      case 2: {
        const trendWord = seed % 2 === 0 ? "rise" : "increase";
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "association",
          stem: `A scatterplot shows points that generally ${trendWord} from left to right and stay close to a straight line. What best describes the association?`,
          correctChoice: "Strong positive linear association",
          distractors: ["Strong negative linear association", "Weak positive linear association", "No association"],
          summary: "Rising from left to right indicates a positive association, and close to a line indicates it is strong and linear.",
          steps: ["Look at the direction of the points.", "Judge how tightly they cluster around a line.", "Describe the association using both pieces of information."],
          choiceNotes: statementChoiceNotes(),
          tags: ["association", "scatterplot"],
        };
      }
      case 3: {
        const context =
          seed % 2 === 0
            ? "sales rise quickly at first and then level off"
            : "a plant's height rises quickly at first and then level off";
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "model-choice",
          stem: `Which model is most appropriate for data when ${context}?`,
          correctChoice: "Exponential decay or growth with a plateau-like trend is not ideal; a nonlinear model is needed",
          distractors: ["Perfectly linear", "Constant", "Random"],
          summary: "A pattern that changes rate is not linear, so a linear model is not the best fit.",
          steps: ["Notice the rate is not constant.", "A curved pattern needs a nonlinear model.", "Choose the model that matches the shape."],
          choiceNotes: statementChoiceNotes(),
          tags: ["modeling", "scatterplot"],
        };
      }
      default: {
        const predicted = 15 + seed * 2;
        const actual = predicted + 3;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "residual",
          stem: `A model predicts a value of ${predicted}, but the actual value is ${actual}. What is the residual?`,
          correctChoice: String(actual - predicted),
          distractors: numericWrongs(actual - predicted, seed),
          summary: "Residual equals actual minus predicted.",
          steps: ["Subtract the predicted value from the actual value.", "Keep the sign if needed.", "Write the residual."],
          choiceNotes: statementChoiceNotes(),
          tags: ["residual", "prediction"],
        };
      }
    }
  });
}

export function generateProbabilityQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const red = 3 + seed;
        const blue = 5 + seed;
        const total = red + blue;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "simple-probability",
          stem: `A bag contains ${red} red marbles and ${blue} blue marbles. What is the probability of selecting a red marble?`,
          data: { red, blue, total },
          correctChoice: fractionString(red, total),
          distractors: [fractionString(blue, total), fractionString(red, blue), fractionString(1, total)],
          summary: "Probability is favorable outcomes over total outcomes.",
          steps: ["Count the red marbles.", "Count the total marbles.", "Write favorable over total."],
          choiceNotes: statementChoiceNotes(),
          tags: ["probability", "simple"],
        };
      }
      case 1: {
        const p1 = 1 / (2 + seed);
        const p2 = 1 / (3 + seed);
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "independent-events",
          stem: `If the probability of event A is 1/${2 + seed} and the probability of event B is 1/${3 + seed}, what is P(A and B) if the events are independent?`,
          correctChoice: fractionString(1, (2 + seed) * (3 + seed)),
          distractors: [fractionString(1, (2 + seed) + (3 + seed)), fractionString(1, (2 + seed)), fractionString(1, (3 + seed))],
          summary: "Multiply the probabilities of independent events.",
          steps: ["Identify that the events are independent.", "Multiply the probabilities.", "Write the product as a fraction."],
          choiceNotes: statementChoiceNotes(),
          tags: ["probability", "independent"],
        };
      }
      case 2: {
        const instrument = 8 + seed;
        const choir = 3 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "conditional-probability",
          stem: `A table shows ${instrument} students who play an instrument, and ${choir} of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?`,
          data: { instrument, choir },
          correctChoice: fractionString(choir, instrument),
          distractors: [fractionString(choir, instrument + choir), fractionString(instrument, instrument + choir), fractionString(1, instrument)],
          summary: "Conditional probability uses the restricted group as the denominator.",
          steps: ["Use only the students who play an instrument as the total.", "Count the students in choir among that group.", "Write favorable over the restricted total."],
          choiceNotes: statementChoiceNotes(),
          tags: ["probability", "conditional"],
        };
      }
      case 3: {
        const favorable = 4 + seed;
        const total = 10 + seed * 2;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "complement",
          stem: `If the probability of rain is ${fractionString(favorable, total)}, what is the probability of no rain?`,
          correctChoice: fractionString(total - favorable, total),
          distractors: [fractionString(favorable, total), fractionString(total, favorable), fractionString(1, total)],
          summary: "Use 1 minus the probability of rain.",
          steps: ["Treat the complement as the opposite event.", "Subtract the probability from 1.", "Write the result as a fraction."],
          choiceNotes: statementChoiceNotes(),
          tags: ["probability", "complement"],
        };
      }
      default: {
        const total = 12 + seed * 2;
        const success = 3 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "two-step-counting",
          stem: `A class has ${total} students, of whom ${success} are left-handed. What is the probability that a randomly chosen student is left-handed?`,
          correctChoice: fractionString(success, total),
          distractors: [fractionString(total - success, total), fractionString(success, success + 1), fractionString(1, total)],
          summary: "Use the count of left-handed students over the total number of students.",
          steps: ["Count favorable outcomes.", "Count the total outcomes.", "Write the probability as a fraction."],
          choiceNotes: statementChoiceNotes(),
          tags: ["probability", "counting"],
        };
      }
    }
  });
}

export function generateInferenceAndMarginQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const low = 40 + seed;
        const high = 50 + seed * 2;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "confidence-interval",
          stem: `A survey estimates that between ${low}% and ${high}% of students prefer online study guides. Which statement is supported by the interval?`,
          correctChoice: "The true percentage is likely within that range.",
          distractors: ["The true percentage must be exactly the midpoint", "The true percentage is outside the range", "The sample guarantees the result"],
          summary: "A confidence interval gives a plausible range for the population value, not an exact certainty.",
          steps: ["Read the lower and upper bounds.", "Remember that intervals estimate a population value.", "Use likely, not certain, language."],
          choiceNotes: statementChoiceNotes(),
          tags: ["inference", "interval"],
        };
      }
      case 1: {
        const meanA = 72 + seed;
        const meanB = 78 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "compare-means",
          stem: `Sample A has a mean of ${meanA} with margin of error 2. Sample B has a mean of ${meanB} with margin of error 1. What can be concluded?`,
          correctChoice: "The samples may overlap, so the difference may not be significant",
          distractors: ["Sample B is definitely lower", "Sample A is definitely higher", "The samples are identical"],
          summary: "If intervals overlap, the data do not clearly prove one population mean is greater.",
          steps: ["Build the plausible interval for each sample.", "Compare the intervals.", "Check whether the intervals clearly separate."],
          choiceNotes: statementChoiceNotes(),
          tags: ["margin-of-error", "means"],
        };
      }
      case 2: {
        const sample = 40 + seed * 5;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "sample-size",
          stem: `Survey A uses ${sample} responses and Survey B uses ${sample + 80} responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?`,
          correctChoice: "The survey with the smaller sample size",
          distractors: ["The survey with the larger sample size", "They must have the same margin of error", "Margin of error does not depend on sample size"],
          summary: "Smaller samples usually produce less precise estimates and larger margins of error.",
          steps: ["Recall that more data usually means more precision.", "A smaller sample is less stable.", "So its margin of error is larger."],
          choiceNotes: statementChoiceNotes(),
          tags: ["margin-of-error", "sample-size"],
        };
      }
      case 3: {
        const estimate = 60 + seed * 5;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "support-claim",
          stem: `A poll estimates ${estimate}% support with a margin of error of 3 percentage points. Which claim is supported?`,
          correctChoice: `Support is likely between ${estimate - 3}% and ${estimate + 3}%`,
          distractors: [`Support is exactly ${estimate}%`, `Support must be under ${estimate - 3}%`, `Support must be over ${estimate + 3}%`],
          summary: "A margin of error creates a range around the estimate.",
          steps: ["Subtract and add the margin of error.", "Write the interval around the estimate.", "Use cautious language."],
          choiceNotes: statementChoiceNotes(),
          tags: ["inference", "poll"],
        };
      }
      default: {
        const target =
          seed % 2 === 0
            ? "the town's recycling rate"
            : "the percentage of students who prefer later start times";
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "interpretation",
          stem: `A sample statistic is used to estimate ${target}. What is the best interpretation of that estimate?`,
          correctChoice: "It is a reasonable estimate, not an exact certainty",
          distractors: ["It is always exact", "It proves the population value", "It cannot be used for inference"],
          summary: "Sample statistics are used to estimate population values with some uncertainty.",
          steps: ["Recognize that a sample only provides an estimate.", "Look for language about likely or reasonable values.", "Do not treat the sample as perfect certainty."],
          choiceNotes: statementChoiceNotes(),
          tags: ["inference", "interpretation"],
        };
      }
    }
  });
}

export function generateEvaluatingStatisticalClaimsQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const habit = seed % 2 === 0 ? "water" : "breakfast";
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "causation-vs-association",
          stem: `A study finds that students who have more ${habit} tend to score higher. What can be concluded from an observational study?`,
          correctChoice: "The variables are associated, but causation is not proven",
          distractors: ["Water definitely causes higher scores", "Scores cause students to drink water", "There is no relationship"],
          summary: "Observational studies can show association, not causation.",
          steps: ["Check whether the study was observational.", "Look for the word associated.", "Do not claim a cause without an experiment."],
          choiceNotes: statementChoiceNotes(),
          tags: ["observational", "causation"],
        };
      }
      case 1: {
        const population = seed % 2 === 0 ? "all students in a district" : "all city voters";
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "random-sample-vs-assignment",
          stem: `Which condition is needed to generalize survey results to ${population}?`,
          correctChoice: "A random sample",
          distractors: ["Random assignment", "A larger margin of error", "A control group"],
          summary: "Random samples help a study represent the population.",
          steps: ["Random sample means people are chosen fairly from the population.", "Random assignment is for experiments.", "Choose the condition that supports generalization."],
          choiceNotes: statementChoiceNotes(),
          tags: ["sampling", "generalization"],
        };
      }
      case 2: {
        const treatment = seed % 2 === 0 ? "a tutoring app" : "a new study schedule";
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "experiment-design",
          stem: `Why is random assignment important in an experiment testing ${treatment}?`,
          correctChoice: "It helps reduce confounding so differences can be linked to the treatment",
          distractors: ["It guarantees causation with no variability", "It makes the sample random", "It proves the claim without data"],
          summary: "Random assignment helps isolate the effect of the treatment.",
          steps: ["Think about how experiments differ from surveys.", "Random assignment helps compare groups fairly.", "It reduces the impact of confounding variables."],
          choiceNotes: statementChoiceNotes(),
          tags: ["experiment", "random-assignment"],
        };
      }
      case 3: {
        const variable = seed % 2 === 0 ? "stress" : "outside temperature";
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "confounding",
          stem: `A study of exercise and sleep does not account for ${variable}. Why is ${variable} a concern?`,
          correctChoice: `${variable.charAt(0).toUpperCase()}${variable.slice(1)} could be a confounding variable`,
          distractors: [`${variable.charAt(0).toUpperCase()}${variable.slice(1)} proves causation`, `${variable.charAt(0).toUpperCase()}${variable.slice(1)} eliminates the need for a control group`, `${variable.charAt(0).toUpperCase()}${variable.slice(1)} changes the sample size`],
          summary: "A confounding variable can influence both variables and blur the relationship.",
          steps: ["Identify another factor related to both variables.", "Ask whether it could affect the result.", "That factor is a confounder."],
          choiceNotes: statementChoiceNotes(),
          tags: ["confounding", "observational"],
        };
      }
      default: {
        const group = seed % 2 === 0 ? "all customers at a store" : "all households in a town";
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "generalization",
          stem: `When can results from a sample be generalized to ${group}?`,
          correctChoice: "When the sample is random and representative",
          distractors: ["When the sample is convenient", "When the experiment is blind", "When the margin of error is zero"],
          summary: "A random representative sample supports generalization.",
          steps: ["Look for representativeness.", "Convenience samples are weaker.", "Randomness helps the sample reflect the population."],
          choiceNotes: statementChoiceNotes(),
          tags: ["generalization", "sample"],
        };
      }
    }
  });
}

export function generateAreaAndVolumeQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const length = 8 + seed;
        const width = 5 + seed;
        const answer = length * width;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "rectangle-area",
          stem: `What is the area of a rectangle with length ${length} and width ${width}?`,
          correctChoice: String(answer),
          distractors: numericWrongs(answer, seed),
          summary: "Area of a rectangle is length times width.",
          steps: ["Multiply length by width.", "Use the same units squared.", `The area is ${answer}.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["area", "rectangle"],
        };
      }
      case 1: {
        const base = 6 + seed;
        const height = 4 + seed;
        const extra = 3 + seed;
        const answer = base * height + (base * extra) / 2;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "composite-area",
          stem: `A shape consists of a rectangle ${base} by ${height} with a right triangle attached that has base ${base} and height ${extra}. What is the total area?`,
          correctChoice: String(answer),
          distractors: [String(answer + base), String(answer - base), String(base * height * extra)],
          summary: "Find each part's area and add the results.",
          steps: ["Find the rectangle area.", "Find the triangle area.", "Add the two areas together."],
          choiceNotes: statementChoiceNotes(),
          tags: ["area", "composite"],
        };
      }
      case 2: {
        const length = 4 + seed;
        const width = 3 + seed;
        const height = 5 + seed;
        const answer = length * width * height;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "rectangular-prism-volume",
          stem: `What is the volume of a rectangular prism with dimensions ${length}, ${width}, and ${height}?`,
          correctChoice: String(answer),
          distractors: [String(length * width + height), String(length + width + height), String(answer - height)],
          summary: "Volume of a rectangular prism is length times width times height.",
          steps: ["Multiply the three dimensions.", "Use cubic units.", `The volume is ${answer}.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["volume", "prism"],
        };
      }
      case 3: {
        const scale = 2 + seed;
        const area = 12 + seed * 3;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "scale-factor-area",
          stem: `A figure is enlarged by a scale factor of ${scale}. If its original area is ${area}, what is the new area?`,
          correctChoice: String(area * scale * scale),
          distractors: [String(area * scale), String(area + scale), String(area - scale)],
          summary: "Area scales by the square of the scale factor.",
          steps: ["Square the scale factor.", "Multiply the original area by that square.", "Write the new area."],
          choiceNotes: statementChoiceNotes(),
          tags: ["scale-factor", "area"],
        };
      }
      default: {
        const radius = 3 + seed;
        const answer = `${radius * radius}pi`;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "circle-area",
          stem: `What is the area of a circle with radius ${radius}? Use pi.`,
          correctChoice: answer,
          distractors: [`${2 * radius}pi`, `${radius}pi`, `${radius * radius * 2}pi`],
          summary: "Area of a circle is pi times the radius squared.",
          steps: ["Square the radius.", "Multiply by pi.", "Write the area in square units."],
          choiceNotes: statementChoiceNotes(),
          tags: ["circle", "area"],
        };
      }
    }
  });
}

export function generateLinesAnglesAndTrianglesQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const angle = 40 + seed * 10;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "supplementary-angles",
          stem: `Two supplementary angles are shown. If one angle measures ${angle}, what is the other angle?`,
          correctChoice: String(180 - angle),
          distractors: [String(180 + angle), String(angle / 2), String(angle)],
          summary: "Supplementary angles add to 180 degrees.",
          steps: ["Subtract the given angle from 180.", "The result is the supplementary angle.", "Write the measure in degrees."],
          choiceNotes: statementChoiceNotes(),
          tags: ["angles", "supplementary"],
        };
      }
      case 1: {
        const first = 50 + seed * 5;
        const second = 60 - seed * 5;
        const answer = 180 - first - second;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "triangle-sum",
          stem: `A triangle has angles measuring ${first}, ${second}, and x. What is x?`,
          correctChoice: String(answer),
          distractors: [String(first + second), String(180 - first), String(180 - second)],
          summary: "The angles of a triangle add to 180 degrees.",
          steps: ["Add the known angles.", "Subtract their sum from 180.", `The missing angle is ${answer}.`],
          choiceNotes: statementChoiceNotes(),
          tags: ["triangle", "angle-sum"],
        };
      }
      case 2: {
        const angle = 110 - seed * 5;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "parallel-lines",
          stem: `Two parallel lines are cut by a transversal. If one angle measures ${angle}, what is the corresponding angle?`,
          correctChoice: String(angle),
          distractors: [String(180 - angle), String(angle + 20), String(angle - 20)],
          summary: "Corresponding angles formed by parallel lines are equal.",
          steps: ["Identify the angle relationship.", "Corresponding angles have the same measure.", "The matching angle is ${angle}."],
          choiceNotes: statementChoiceNotes(),
          tags: ["transversal", "parallel-lines"],
        };
      }
      case 3: {
        const scale = 2 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "similar-triangles",
          stem: `Two similar triangles have side-length ratio 1:${scale}. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?`,
          correctChoice: String(4 * scale),
          distractors: [String(4 + scale), String(4 / scale), String(4 * (scale - 1))],
          summary: "Similar triangles have proportional side lengths.",
          steps: ["Use the scale factor between the triangles.", "Multiply the smaller side by the scale factor.", "Write the corresponding side length."],
          choiceNotes: statementChoiceNotes(),
          tags: ["similarity", "triangles"],
        };
      }
      default: {
        const x = 2 + seed;
        const y = 5 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "angle-chase",
          stem: `In a triangle, two angles measure ${x} and ${y}. What is the third angle?`,
          correctChoice: String(180 - x - y),
          distractors: [String(x + y), String(180 - x), String(180 - y)],
          summary: "Use the triangle angle sum theorem and subtract the known angles from 180.",
          steps: ["Add the known angles.", "Subtract from 180.", "The remainder is the missing angle."],
          choiceNotes: statementChoiceNotes(),
          tags: ["angles", "triangle"],
        };
      }
    }
  });
}

export function generateRightTrianglesAndTrigonometryQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const a = 3 + seed;
        const b = 4 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "pythagorean-theorem",
          stem: `A right triangle has legs ${a} and ${b}. What is the length of the hypotenuse?`,
          correctChoice: String(Math.sqrt(a * a + b * b)),
          distractors: [String(a + b), String(Math.abs(a - b)), String(a * b)],
          summary: "Use the Pythagorean theorem a^2 + b^2 = c^2.",
          steps: ["Square both legs.", "Add the squares.", "Take the square root."],
          choiceNotes: statementChoiceNotes(),
          tags: ["right-triangle", "pythagorean"],
        };
      }
      case 1: {
        const side = 5 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "special-right-triangle",
          stem: `In a 45-45-90 triangle, one leg is ${side}. What is the hypotenuse?`,
          correctChoice: `${side}sqrt2`,
          distractors: [`${side * 2}`, `${side}/2`, `${side}sqrt3`],
          summary: "In a 45-45-90 triangle, the hypotenuse equals a leg times sqrt2.",
          steps: ["Recall the side ratio 1:1:sqrt2.", "Multiply the leg by sqrt2.", "Write the hypotenuse."],
          choiceNotes: statementChoiceNotes(),
          tags: ["special-triangle", "hypotenuse"],
        };
      }
      case 2: {
        const opp = 3 + seed;
        const adj = 4 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "trig-ratio",
          stem: `In a right triangle, the side opposite the angle is ${opp} and the adjacent side is ${adj}. What is tan of the angle?`,
          correctChoice: fractionString(opp, adj),
          distractors: [fractionString(adj, opp), fractionString(opp, opp + adj), fractionString(1, adj)],
          summary: "Tangent equals opposite over adjacent.",
          steps: ["Identify the opposite side.", "Identify the adjacent side.", "Write opposite over adjacent."],
          choiceNotes: statementChoiceNotes(),
          tags: ["trigonometry", "tangent"],
        };
      }
      case 3: {
        const angle = 30 + seed * 5;
        const height = 8 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "angle-of-elevation",
          stem: `A tree casts a shadow of length ${height}. The angle of elevation to the top is ${angle} degrees. Which trig ratio would relate the tree's height and the shadow?`,
          correctChoice: angle === 45 ? "tan" : "tan",
          distractors: ["sin", "cos", "sec"],
          summary: "Use tangent to relate opposite and adjacent sides in an angle-of-elevation problem.",
          steps: ["Identify the opposite side as the height.", "Identify the adjacent side as the shadow.", "Use tangent."],
          choiceNotes: statementChoiceNotes(),
          tags: ["trigonometry", "elevation"],
          desmosRelevant: true,
        };
      }
      default: {
        const angleLabel = seed % 2 === 0 ? "angle A" : "angle B";
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "ratio-selection",
          stem: `For ${angleLabel} in a right triangle, which ratio equals sin(${angleLabel})?`,
          correctChoice: "opposite / hypotenuse",
          distractors: ["adjacent / hypotenuse", "opposite / adjacent", "hypotenuse / opposite"],
          summary: "Sine is opposite over hypotenuse.",
          steps: ["Recall SOH-CAH-TOA.", "Match sine with opposite over hypotenuse.", "Choose the matching ratio."],
          choiceNotes: statementChoiceNotes(),
          tags: ["trigonometry", "sine"],
        };
      }
    }
  });
}

export function generateCirclesQuestions(meta: MathConceptMeta): MathQuestionRecord[] {
  return makeQuestionSeries(meta, (orderIndex, difficultyBand, difficulty) => {
    const seed = Math.floor(orderIndex / 5);
    switch (orderIndex % 5) {
      case 0: {
        const radius = 3 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "circumference",
          stem: `What is the circumference of a circle with radius ${radius}? Use pi.`,
          correctChoice: `${2 * radius}pi`,
          distractors: [`${radius}pi`, `${radius * radius}pi`, `${4 * radius}pi`],
          summary: "Circumference is 2pi times the radius.",
          steps: ["Use the circumference formula.", "Substitute the radius.", "Write the result in terms of pi."],
          choiceNotes: statementChoiceNotes(),
          tags: ["circle", "circumference"],
        };
      }
      case 1: {
        const radius = 4 + seed;
        const fraction = 60 + seed * 10;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "arc-length",
          stem: `A circle has radius ${radius}. What is the arc length of a ${fraction} degree arc? Use pi.`,
          correctChoice: `${fraction * radius / 180}pi`,
          distractors: [`${fraction / 360}pi`, `${radius * radius}pi`, `${2 * radius}pi`],
          summary: "Arc length is the same fraction of the circumference as the central angle is of 360 degrees.",
          steps: ["Find the fraction of the full circle.", "Multiply that fraction by the circumference.", "Write the arc length."],
          choiceNotes: statementChoiceNotes(),
          tags: ["circle", "arc-length"],
        };
      }
      case 2: {
        const radius = 5 + seed;
        const fraction = 90 + seed * 10;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "sector-area",
          stem: `What is the area of a ${fraction} degree sector in a circle with radius ${radius}? Use pi.`,
          correctChoice: `${fraction * radius * radius / 360}pi`,
          distractors: [`${radius * radius}pi`, `${fraction / 360}pi`, `${2 * radius}pi`],
          summary: "Sector area is the same fraction of the circle's area as the angle is of 360 degrees.",
          steps: ["Find the fraction of the whole circle.", "Multiply that fraction by pi r^2.", "Write the sector area."],
          choiceNotes: statementChoiceNotes(),
          tags: ["circle", "sector"],
        };
      }
      case 3: {
        const cx = 2 + seed;
        const cy = -3 - seed;
        const r = 4 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "circle-equation",
          stem: `Which equation represents a circle with center ${orderedPair(cx, cy)} and radius ${r}?`,
          correctChoice: `(x - ${cx})^2 + (y + ${Math.abs(cy)})^2 = ${r * r}`,
          distractors: [`(x + ${cx})^2 + (y + ${Math.abs(cy)})^2 = ${r}`, `(x - ${cx})^2 + (y - ${Math.abs(cy)})^2 = ${r}`, `(x - ${r})^2 + (y - ${r})^2 = ${cx * cx + cy * cy}`],
          summary: "A circle equation uses (x - h)^2 + (y - k)^2 = r^2.",
          steps: ["Identify the center.", "Substitute the center coordinates into the equation.", "Square the radius."],
          choiceNotes: statementChoiceNotes(),
          tags: ["circle", "equation"],
          desmosRelevant: true,
        };
      }
      default: {
        const radius = 6 + seed;
        return {
          orderIndex,
          difficultyBand,
          difficulty,
          templateKey: "tangent-radius",
          stem: `A circle has radius ${radius}. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?`,
          correctChoice: "They are perpendicular",
          distractors: ["They are parallel", "They are congruent", "They form a 60 degree angle"],
          summary: "A radius drawn to the point of tangency is perpendicular to the tangent line.",
          steps: ["Identify the point of tangency.", "Recall the tangent-radius theorem.", "The lines meet at a right angle."],
          choiceNotes: statementChoiceNotes(),
          tags: ["circle", "tangent"],
        };
      }
    }
  });
}

const mathQuestionGeneratorMap: Record<MathConceptSlug, (meta: MathConceptMeta) => MathQuestionRecord[]> = {
  "linear-equations-in-one-variable": generateLinearEquationsInOneVariableQuestions,
  "linear-equations-in-two-variables": generateLinearEquationsInTwoVariablesQuestions,
  "linear-functions": generateLinearFunctionsQuestions,
  "systems-of-two-linear-equations-in-two-variables": generateSystemsOfTwoLinearEquationsQuestions,
  "linear-inequalities-in-one-or-two-variables": generateLinearInequalitiesQuestions,
  "equivalent-expressions": generateEquivalentExpressionsQuestions,
  "nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables":
    generateNonlinearEquationsQuestions,
  "nonlinear-functions": generateNonlinearFunctionsQuestions,
  "ratios-rates-proportional-relationships-and-units": generateRatiosRatesAndUnitsQuestions,
  "percentages": generatePercentagesQuestions,
  "one-variable-data-distributions-and-measures-of-center-and-spread":
    generateOneVariableDataQuestions,
  "two-variable-data-models-and-scatterplots": generateTwoVariableDataQuestions,
  "probability-and-conditional-probability": generateProbabilityQuestions,
  "inference-from-sample-statistics-and-margin-of-error": generateInferenceAndMarginQuestions,
  "evaluating-statistical-claims-observational-studies-and-experiments":
    generateEvaluatingStatisticalClaimsQuestions,
  "area-and-volume": generateAreaAndVolumeQuestions,
  "lines-angles-and-triangles": generateLinesAnglesAndTrianglesQuestions,
  "right-triangles-and-trigonometry": generateRightTrianglesAndTrigonometryQuestions,
  circles: generateCirclesQuestions,
};

export const mathQuestionBankConfig: ReadonlyArray<MathQuestionBankConfig> = mathConceptSlugs.map(
  (conceptSlug) => {
    const meta = seriesMeta(conceptSlug);
    return {
      conceptSlug,
      conceptName: meta.name,
      generator: mathQuestionGeneratorMap[conceptSlug],
    };
  },
);

export function generateMathQuestionsForConcept(conceptSlug: MathConceptSlug): MathQuestionRecord[] {
  const meta = seriesMeta(conceptSlug);
  return mathQuestionGeneratorMap[conceptSlug](meta);
}

export function generateMathQuestionBank(): MathQuestionRecord[] {
  return mathQuestionBankConfig.flatMap((entry) => entry.generator(seriesMeta(entry.conceptSlug as MathConceptSlug)));
}

export function getMathQuestionBankManifest(): ReadonlyArray<{
  conceptSlug: MathConceptSlug;
  conceptName: string;
  questionCount: number;
}> {
  return mathQuestionBankConfig.map((entry) => ({
    conceptSlug: entry.conceptSlug as MathConceptSlug,
    conceptName: entry.conceptName,
    questionCount: questionCountPerConcept,
  }));
}

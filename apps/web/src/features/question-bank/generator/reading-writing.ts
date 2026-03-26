import { getCanonicalConcept } from "../../taxonomy/core-concepts";

type SectionSlug = "reading-writing";
type DifficultyTier = "easy" | "medium" | "hard";
type SourceTag = "generated_from_research";

export type ReadingWritingConceptSlug =
  | "central-ideas-and-details"
  | "command-of-evidence-textual"
  | "command-of-evidence-quantitative"
  | "inferences"
  | "words-in-context"
  | "text-structure-and-purpose"
  | "cross-text-connections"
  | "transitions"
  | "rhetorical-synthesis"
  | "boundaries-punctuation"
  | "form-structure-and-sense-grammar";

type ChoiceLabel = "A" | "B" | "C" | "D";
type ChoiceTuple = readonly [string, string, string, string];
type FactTuple5 = readonly [string, string, string, string, string];

export type GeneratedChoice = {
  label: ChoiceLabel;
  text: string;
};

export type GeneratedReadingWritingQuestion = {
  id: string;
  sourceType: "generated_dynamic";
  generationSource: SourceTag;
  sectionSlug: SectionSlug;
  sectionName: "Reading and Writing";
  domainSlug: string;
  domainName: string;
  conceptSlug: ReadingWritingConceptSlug;
  conceptName: string;
  difficultyTier: DifficultyTier;
  difficulty: 2 | 3 | 4;
  questionType: string;
  promptJson: Record<string, unknown>;
  answerSchemaJson: Record<string, unknown>;
  explanationJson: Record<string, unknown>;
  calculatorAllowed: false;
  desmosRelevant: false;
  status: "draft";
  tags: string[];
};

type ConceptInfo = {
  slug: ReadingWritingConceptSlug;
  name: string;
  domainSlug: string;
  domainName: string;
};

type PassageTheme = {
  id: string;
  passage: string;
  facts: FactTuple5;
};

type EvidenceTheme = {
  id: string;
  passage: string;
  claim: string;
  evidence: FactTuple5;
};

type QuantTheme = {
  id: string;
  table: string;
  claim: string;
  findings: FactTuple5;
};

type PairTheme = {
  id: string;
  passageA: string;
  passageB: string;
  facts: FactTuple5;
};

type SentenceItem = {
  stem: string;
  choices: ChoiceTuple;
  correctIndex: 0 | 1 | 2 | 3;
  explanation: string;
  focus?: string;
};

type ItemTheme = {
  id: string;
  context: string;
  items: readonly [SentenceItem, SentenceItem, SentenceItem, SentenceItem, SentenceItem];
};

const sectionSlug: SectionSlug = "reading-writing";
const sectionName = "Reading and Writing" as const;
const sourceTag: SourceTag = "generated_from_research";
const choiceLabels: readonly ChoiceLabel[] = ["A", "B", "C", "D"];
const difficultySchedule: readonly DifficultyTier[] = [
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
] as const;

const difficultyScore: Record<DifficultyTier, 2 | 3 | 4> = {
  easy: 2,
  medium: 3,
  hard: 4,
};

const centralIdeaStems = [
  "Which choice best states the main idea of the passage?",
  "Which choice best describes a detail stated in the passage?",
  "Which choice best reflects another detail directly supported by the passage?",
  "Which choice best captures the passage's emphasis?",
  "Which choice is most consistent with the passage overall?",
] as const;

const evidenceTextualStems = [
  "Which choice best supports the claim below?",
  "Which choice provides the strongest textual evidence for the claim below?",
  "Which choice would the author most likely cite as support for the claim below?",
  "Which choice most directly backs the claim below?",
  "Which choice best confirms the claim below?",
] as const;

const quantitativeEvidenceStems = [
  "Which choice best supports the claim below using the data provided?",
  "Which choice provides the strongest quantitative evidence for the claim below?",
  "Which choice is most consistent with the data and supports the claim below?",
  "Which choice would best justify the claim below?",
  "Which choice best matches the trend shown in the data and supports the claim below?",
] as const;

const inferenceStems = [
  "Which choice is best supported by the passage?",
  "Which choice is the most reasonable inference from the passage?",
  "Which choice is most strongly suggested by the passage?",
  "Which choice follows logically from the passage?",
  "Which choice is most consistent with what the passage implies?",
] as const;

const structureStems = [
  "What is the main purpose of the underlined sentence?",
  "How does the underlined sentence function in the passage?",
  "What role does the underlined sentence play in the author's argument?",
  "Why does the author include the underlined sentence?",
  "What best describes the contribution of the underlined sentence?",
] as const;

const crossTextStems = [
  "How would the writer of Passage B most likely respond to the idea in Passage A?",
  "What would both passages most likely agree about?",
  "Which choice best describes a relationship between the two passages?",
  "What claim would the writers most likely share?",
  "Which choice best captures the connection between the passages?",
] as const;

const transitionStems = [
  "Which transition best fits the blank?",
  "Which word or phrase best completes the sentence?",
  "Which transition best signals the relationship between the two ideas?",
  "Which choice best links the sentence to the previous idea?",
  "Which transition best matches the logic of the sentence?",
] as const;

const synthesisStems = [
  "Which choice best uses the notes to achieve the goal described?",
  "Which choice best synthesizes the notes for the stated purpose?",
  "Which choice most effectively combines relevant information from the notes?",
  "Which choice best answers the prompt using only relevant notes?",
  "Which choice most clearly fulfills the writer's goal?",
] as const;

const boundaryStems = [
  "Which choice correctly punctuates the sentence?",
  "Which choice best completes the punctuation in the sentence?",
  "Which punctuation choice makes the sentence correct?",
  "Which choice uses punctuation correctly?",
  "Which punctuation choice best fits the sentence?",
] as const;

const grammarStems = [
  "Which choice best revises the underlined portion so the sentence is correct?",
  "Which choice best completes the sentence?",
  "Which revision best preserves the sentence's meaning while making it correct?",
  "Which choice makes the sentence most grammatically correct?",
  "Which choice best fixes the structure of the sentence?",
] as const;

function resolveConcept(slug: ReadingWritingConceptSlug): ConceptInfo {
  const concept = getCanonicalConcept(slug);
  if (!concept) {
    throw new Error(`Unknown Reading and Writing concept slug: ${slug}`);
  }

  return {
    slug,
    name: concept.name,
    domainSlug: concept.domainSlug,
    domainName: concept.domainName,
  };
}

function toChoiceTuple(texts: ChoiceTuple): readonly GeneratedChoice[] {
  return texts.map((text, index) => ({
    label: choiceLabels[index] ?? "A",
    text,
  }));
}

function rotateChoices(texts: ChoiceTuple, rotation: number): ChoiceTuple {
  const normalized = rotation % 4;
  if (normalized === 0) {
    return texts;
  }

  const rotated = [...texts.slice(normalized), ...texts.slice(0, normalized)];
  return rotated as unknown as ChoiceTuple;
}

function makeQuestionRecord(args: {
  concept: ConceptInfo;
  index: number;
  questionType: string;
  promptJson: Record<string, unknown>;
  answerChoices: ChoiceTuple;
  correctIndex: 0 | 1 | 2 | 3;
  explanation: string;
  tags: readonly string[];
  difficultyTier: DifficultyTier;
}): GeneratedReadingWritingQuestion {
  const difficulty = difficultyScore[args.difficultyTier];
  const sequence = args.index + 1;
  const id = `rw-${args.concept.slug}-${String(sequence).padStart(2, "0")}`;
  const choiceSet = toChoiceTuple(args.answerChoices);
  const correctChoice = choiceSet[args.correctIndex];

  return {
    id,
    sourceType: "generated_dynamic",
    generationSource: sourceTag,
    sectionSlug,
    sectionName,
    domainSlug: args.concept.domainSlug,
    domainName: args.concept.domainName,
    conceptSlug: args.concept.slug,
    conceptName: args.concept.name,
    difficultyTier: args.difficultyTier,
    difficulty,
    questionType: args.questionType,
    promptJson: {
      ...args.promptJson,
      choices: choiceSet,
    },
    answerSchemaJson: {
      type: "multiple_choice",
      choices: choiceSet,
      correctIndex: args.correctIndex,
      correctLabel: correctChoice?.label,
      correctText: correctChoice?.text,
    },
    explanationJson: {
      summary: args.explanation,
      whyCorrect: args.explanation,
      correctChoiceLabel: correctChoice?.label,
      correctChoiceText: correctChoice?.text,
      tags: [...args.tags],
    },
    calculatorAllowed: false,
    desmosRelevant: false,
    status: "draft",
    tags: [...args.tags],
  };
}

function buildFiveFactThemeQuestions(args: {
  concept: ConceptInfo;
  themeId: string;
  baseIndex: number;
  questionType: string;
  stimulus: Record<string, unknown>;
  facts: FactTuple5;
  stems: readonly [string, string, string, string, string];
  tags: readonly string[];
}): GeneratedReadingWritingQuestion[] {
  return args.facts.map((fact, index) => {
    const distractors = args.facts.filter((_, factIndex) => factIndex !== index).slice(0, 3);
    const answerChoices = rotateChoices(
      [fact, distractors[0] ?? args.facts[1], distractors[1] ?? args.facts[2], distractors[2] ?? args.facts[3]] as ChoiceTuple,
      index,
    );
    const questionIndex = args.baseIndex + index;

    return makeQuestionRecord({
      concept: args.concept,
      index: questionIndex,
      questionType: args.questionType,
      promptJson: {
        kind: args.questionType,
        themeId: args.themeId,
        stimulus: args.stimulus,
        stem: args.stems[index] ?? args.stems[0],
      },
      answerChoices,
      correctIndex: (index % 4) as 0 | 1 | 2 | 3,
      explanation: fact,
      tags: args.tags,
      difficultyTier: difficultySchedule[questionIndex] ?? "medium",
    });
  });
}

function buildItemThemeQuestions(args: {
  concept: ConceptInfo;
  themeId: string;
  baseIndex: number;
  questionType: string;
  context: Record<string, unknown>;
  items: readonly [SentenceItem, SentenceItem, SentenceItem, SentenceItem, SentenceItem];
  tags: readonly string[];
}): GeneratedReadingWritingQuestion[] {
  return args.items.map((item, index) =>
    makeQuestionRecord({
      concept: args.concept,
      index: args.baseIndex + index,
      questionType: args.questionType,
      promptJson: {
        kind: args.questionType,
        themeId: args.themeId,
        context: args.context,
        stem: item.stem,
        focus: item.focus ?? args.themeId,
      },
      answerChoices: item.choices,
      correctIndex: item.correctIndex,
      explanation: item.explanation,
      tags: args.tags,
      difficultyTier: difficultySchedule[args.baseIndex + index] ?? "medium",
    }),
  );
}

const centralIdeaThemes: readonly PassageTheme[] = [
  {
    id: "tool-library",
    passage:
      "A neighborhood tool library opened in an unused bus depot. Members can borrow ladders, drills, and garden tools instead of buying items they will use only once or twice. The program also offers short weekend workshops for simple repairs.",
    facts: [
      "The passage shows that the tool library makes repairs more affordable and accessible for residents.",
      "The passage states that the program offers weekend workshops on simple repairs.",
      "The passage notes that borrowing tools can reduce waste by limiting unnecessary purchases.",
      "The passage explains that the library operates in a repurposed bus depot.",
      "The passage mentions that members can check out tools such as ladders and drills.",
    ],
  },
  {
    id: "rooftop-garden",
    passage:
      "An apartment complex turned its flat roof into a garden with raised beds, rain barrels, and a small herb corner. Neighbors water the plants in rotating shifts, and the harvest is shared among the building's residents. The garden has also become a place where children learn how compost supports new growth.",
    facts: [
      "The passage presents the rooftop garden as a shared project that benefits the building's residents.",
      "The passage says neighbors take turns watering the plants.",
      "The passage notes that children learn how compost helps new growth.",
      "The passage explains that the harvest is divided among the residents.",
      "The passage states that the roof was turned into a garden with raised beds and rain barrels.",
    ],
  },
  {
    id: "oral-history-project",
    passage:
      "Students at a local high school interviewed longtime residents about the neighborhood's changing storefronts and street names. They transcribed the interviews, created short captions, and placed the results in the library archive. Teachers said the project helped students notice how personal memory can preserve community history.",
    facts: [
      "The passage shows that the project uses interviews to preserve neighborhood history.",
      "The passage says students transcribed the interviews.",
      "The passage notes that the final materials were placed in the library archive.",
      "The passage explains that teachers believed the work helped students see how memory preserves history.",
      "The passage states that residents discussed changing storefronts and street names.",
    ],
  },
  {
    id: "storm-alert-network",
    passage:
      "After several storms damaged local roads, volunteers built a text-message network that warns residents about blocked bridges and downed trees. The messages arrive quickly, in plain language, and are translated into three languages. Emergency crews say the system has reduced confusion during the first hour after severe weather.",
    facts: [
      "The passage shows that the text-message network helps residents respond more safely after storms.",
      "The passage says the messages are translated into three languages.",
      "The passage notes that the system warns people about blocked bridges and downed trees.",
      "The passage explains that emergency crews think the network reduces confusion after severe weather.",
      "The passage states that the messages arrive quickly and in plain language.",
    ],
  },
] as const;

function generateCentralIdeasAndDetails(): GeneratedReadingWritingQuestion[] {
  const concept = resolveConcept("central-ideas-and-details");
  return centralIdeaThemes.flatMap((theme, themeIndex) =>
    buildFiveFactThemeQuestions({
      concept,
      themeId: theme.id,
      baseIndex: themeIndex * 5,
      questionType: "rw-central-ideas-and-details",
      stimulus: { passage: theme.passage },
      facts: theme.facts,
      stems: centralIdeaStems,
      tags: ["reading-writing", "central-ideas-and-details", `theme:${theme.id}`],
    }).map((question, itemIndex) => ({
      ...question,
      index: themeIndex * 5 + itemIndex,
    })),
  );
}

const evidenceTextualThemes: readonly EvidenceTheme[] = [
  {
    id: "transit-passes",
    passage:
      "City planners tested monthly bus passes that cost less than the usual fare bundle. Riders with the passes took more trips in the evening, and they reported fewer missed connections because they were less worried about each transfer. The report concluded that the new pass made transit feel more flexible.",
    claim: "The monthly bus pass made public transit feel more flexible for riders.",
    evidence: [
      "Riders with the passes took more trips in the evening.",
      "Riders reported fewer missed connections because they worried less about each transfer.",
      "The report concluded that the new pass made transit feel more flexible.",
      "The passes cost less than the usual fare bundle.",
      "City planners tested the passes before expanding the program.",
    ],
  },
  {
    id: "music-program",
    passage:
      "A middle school added a string ensemble after several students said they wanted a quieter way to perform together. Rehearsals were held before classes, and attendance stayed high because students enjoyed the small-group setting. The orchestra director said the ensemble helped more students stay engaged in music.",
    claim: "The string ensemble helped more students stay engaged in music.",
    evidence: [
      "Attendance stayed high because students enjoyed the small-group setting.",
      "The orchestra director said the ensemble helped more students stay engaged in music.",
      "The ensemble was added after students asked for a quieter way to perform together.",
      "Rehearsals were held before classes.",
      "Students wanted a quieter way to perform together.",
    ],
  },
  {
    id: "clinic-schedule",
    passage:
      "A neighborhood clinic changed its appointment schedule so that patients could book earlier check-ins on Tuesdays and Thursdays. Staff members said the new system shortened the waiting line in the lobby and reduced the number of people who left before being seen. The manager described the change as a practical way to improve access.",
    claim: "The clinic's new schedule improved access for patients.",
    evidence: [
      "The manager described the change as a practical way to improve access.",
      "The new system shortened the waiting line in the lobby.",
      "The change reduced the number of people who left before being seen.",
      "Patients could book earlier check-ins on Tuesdays and Thursdays.",
      "Staff members changed the schedule to match patient availability.",
    ],
  },
  {
    id: "tree-planting",
    passage:
      "Volunteers planting shade trees on a hot schoolyard tracked the difference in temperature before and after the project. The surface near the trees stayed cooler at midday, and teachers said students now used the courtyard more often during lunch. The group shared the results with the district to support future planting plans.",
    claim: "The tree-planting project made the courtyard more usable during the day.",
    evidence: [
      "The surface near the trees stayed cooler at midday.",
      "Teachers said students used the courtyard more often during lunch.",
      "The group shared the results with the district.",
      "Volunteers tracked the difference in temperature before and after the project.",
      "The project added shade trees to a hot schoolyard.",
    ],
  },
] as const;

function generateCommandOfEvidenceTextual(): GeneratedReadingWritingQuestion[] {
  const concept = resolveConcept("command-of-evidence-textual");
  return evidenceTextualThemes.flatMap((theme, themeIndex) =>
    buildFiveFactThemeQuestions({
      concept,
      themeId: theme.id,
      baseIndex: themeIndex * 5,
      questionType: "rw-command-of-evidence-textual",
      stimulus: { passage: theme.passage, claim: theme.claim },
      facts: theme.evidence,
      stems: evidenceTextualStems,
      tags: ["reading-writing", "command-of-evidence-textual", `theme:${theme.id}`],
    }).map((question, itemIndex) => ({
      ...question,
      index: themeIndex * 5 + itemIndex,
    })),
  );
}

const quantitativeEvidenceThemes: readonly QuantTheme[] = [
  {
    id: "library-usage",
    table:
      "A survey of 120 students found that 72 borrowed a book more than once a month, 36 borrowed books only a few times a semester, and 12 rarely borrowed books.",
    claim: "Most surveyed students borrowed books regularly.",
    findings: [
      "Seventy-two students borrowed a book more than once a month.",
      "Seventy-two is greater than the combined total of the other two groups.",
      "The regular borrowers outnumbered the rare borrowers by sixty.",
      "Only twelve students said they rarely borrowed books.",
      "The survey included 120 students in all.",
    ],
  },
  {
    id: "commute-times",
    table:
      "A transportation study tracked average commute times for three neighborhoods. Neighborhood A averaged 18 minutes, Neighborhood B averaged 26 minutes, and Neighborhood C averaged 31 minutes after a bus route change.",
    claim: "The route change was associated with different commute times across neighborhoods.",
    findings: [
      "The study reported average commute times for three neighborhoods.",
      "Neighborhood A averaged 18 minutes.",
      "Neighborhood B averaged 26 minutes.",
      "Neighborhood C averaged 31 minutes.",
      "The route change was associated with different commute times across neighborhoods.",
    ],
  },
  {
    id: "garden-harvest",
    table:
      "A school garden logged produce over four weeks: week 1, 14 pounds; week 2, 17 pounds; week 3, 21 pounds; week 4, 24 pounds.",
    claim: "The garden harvest generally increased over the month.",
    findings: [
      "The harvest rose from 14 pounds in week 1 to 24 pounds in week 4.",
      "Each week produced more pounds than the previous week.",
      "The final week produced the highest total.",
      "The data show a general increase over the month.",
      "The garden logged produce over four weeks.",
    ],
  },
  {
    id: "workshop-attendance",
    table:
      "A weekend workshop series drew 40 attendees on day one, 55 on day two, and 58 on day three. Staff said the higher turnout happened after the event was advertised more widely online.",
    claim: "Advertising the workshop more widely was linked to higher turnout.",
    findings: [
      "Attendance increased from 40 to 58 across the three days.",
      "Staff said turnout rose after the event was advertised online.",
      "The largest audience came on day three.",
      "The workshop series drew 55 attendees on day two.",
      "The event was held over a weekend.",
    ],
  },
] as const;

function generateCommandOfEvidenceQuantitative(): GeneratedReadingWritingQuestion[] {
  const concept = resolveConcept("command-of-evidence-quantitative");
  return quantitativeEvidenceThemes.flatMap((theme, themeIndex) =>
    buildFiveFactThemeQuestions({
      concept,
      themeId: theme.id,
      baseIndex: themeIndex * 5,
      questionType: "rw-command-of-evidence-quantitative",
      stimulus: { table: theme.table, claim: theme.claim },
      facts: theme.findings,
      stems: quantitativeEvidenceStems,
      tags: ["reading-writing", "command-of-evidence-quantitative", `theme:${theme.id}`],
    }).map((question, itemIndex) => ({
      ...question,
      index: themeIndex * 5 + itemIndex,
    })),
  );
}

const inferenceThemes: readonly PassageTheme[] = [
  {
    id: "late-shift-bakery",
    passage:
      "The bakery opens before sunrise, and the first tray of bread is usually gone by 7:30 a.m. Customers line up outside even when the weather is cold because the owner bakes only small batches. By noon, the shelves are empty and the oven is already cooling for the next day.",
    facts: [
      "The bakery likely has a steady customer base that values fresh bread.",
      "The owner probably prefers quality and freshness over large-scale production.",
      "The bakery probably sells most of its bread early in the day.",
      "The small batches likely help the bread stay fresh.",
      "The bakery is probably busiest in the morning.",
    ],
  },
  {
    id: "evening-reading-room",
    passage:
      "The public library opened an evening reading room with soft lamps, quiet tables, and a separate area for group study. After the room opened, students began staying longer after school, and some nearby parents stopped by to finish paperwork before going home. The librarian said the room was designed to make the building useful at different hours.",
    facts: [
      "The library probably wanted to serve more kinds of visitors after school.",
      "Students likely stayed longer because the new room made the library more comfortable.",
      "The evening reading room likely made the building useful at different hours.",
      "Some visitors probably used the room for focused work.",
      "The room likely encouraged people to use the library after regular school hours.",
    ],
  },
  {
    id: "field-notes",
    passage:
      "A student club spent the semester taking notes about birds in the park and comparing sightings from one week to the next. Their chart showed that certain birds appeared more often after the club planted native shrubs. The advisor said the club had begun to notice how habitat choices affect wildlife.",
    facts: [
      "The club likely concluded that habitat changes can influence which birds appear in the park.",
      "The planted shrubs probably helped attract certain birds.",
      "The advisor probably wanted students to connect habitat choices and wildlife.",
      "The chart likely showed a pattern across several weeks.",
      "The club likely noticed a relationship between the shrubs and bird sightings.",
    ],
  },
  {
    id: "repair-cafe",
    passage:
      "At the repair cafe, volunteers fixed lamps, hemmed jackets, and replaced missing buttons while owners waited at nearby tables. People left carrying items they had thought were useless only an hour earlier. The organizers said the event worked because it paired practical help with a relaxed social setting.",
    facts: [
      "The organizers likely believed the social atmosphere helped the event succeed.",
      "The cafe probably encouraged people to keep and reuse belongings instead of throwing them away.",
      "The volunteers likely offered a range of simple repair skills.",
      "Visitors probably felt relieved to salvage items they had expected to discard.",
      "The event likely combined practical service with community interaction.",
    ],
  },
] as const;

function generateInferences(): GeneratedReadingWritingQuestion[] {
  const concept = resolveConcept("inferences");
  return inferenceThemes.flatMap((theme, themeIndex) =>
    buildFiveFactThemeQuestions({
      concept,
      themeId: theme.id,
      baseIndex: themeIndex * 5,
      questionType: "rw-inferences",
      stimulus: { passage: theme.passage },
      facts: theme.facts,
      stems: inferenceStems,
      tags: ["reading-writing", "inferences", `theme:${theme.id}`],
    }).map((question, itemIndex) => ({
      ...question,
      index: themeIndex * 5 + itemIndex,
    })),
  );
}

const wordsInContextThemes: readonly ItemTheme[] = [
  {
    id: "museum-labels",
    context: "academic vocabulary",
    items: [
      {
        stem: "The curator's explanation was so clear that even younger visitors could ____ the exhibit's main point.",
        choices: ["ignore", "discern", "delay", "dilute"],
        correctIndex: 1,
        explanation: "discern means to understand or recognize clearly",
        focus: "discern",
      },
      {
        stem: "The committee hoped the new rules would ____ a sense of trust rather than confusion.",
        choices: ["foster", "discard", "compress", "interrupt"],
        correctIndex: 0,
        explanation: "foster means to encourage the growth of",
        focus: "foster",
      },
      {
        stem: "After several revisions, the article became more ____ and easier to follow.",
        choices: ["opaque", "coherent", "frail", "rushed"],
        correctIndex: 1,
        explanation: "coherent means logically connected and easy to understand",
        focus: "coherent",
      },
      {
        stem: "The scientist's tone was ____ rather than dramatic, which made the report feel reliable.",
        choices: ["measured", "ornate", "reckless", "frantic"],
        correctIndex: 0,
        explanation: "measured means calm and carefully controlled",
        focus: "measured",
      },
      {
        stem: "The coach's remarks were meant to ____ the players after a difficult loss.",
        choices: ["scold", "reassure", "scatter", "flatten"],
        correctIndex: 1,
        explanation: "reassure means to make someone feel less worried",
        focus: "reassure",
      },
    ],
  },
  {
    id: "workshop-notes",
    context: "workshop vocabulary",
    items: [
      {
        stem: "The repair guide was written in a ____ style so volunteers could read it quickly.",
        choices: ["concise", "ceremonial", "lengthy", "mysterious"],
        correctIndex: 0,
        explanation: "concise means brief and to the point",
        focus: "concise",
      },
      {
        stem: "The class hoped to ____ the crowd by demonstrating the project before the fair opened.",
        choices: ["deter", "engage", "erase", "stifle"],
        correctIndex: 1,
        explanation: "engage means to attract and involve",
        focus: "engage",
      },
      {
        stem: "The author added one final example to ____ the claim that the method worked.",
        choices: ["undermine", "corroborate", "complicate", "hide"],
        correctIndex: 1,
        explanation: "corroborate means to confirm or support",
        focus: "corroborate",
      },
      {
        stem: "The group made a ____ effort to include both new and longtime residents.",
        choices: ["selective", "deliberate", "careless", "haphazard"],
        correctIndex: 1,
        explanation: "deliberate means done intentionally and carefully",
        focus: "deliberate",
      },
      {
        stem: "The leader wanted the survey results to be as ____ as possible.",
        choices: ["ambiguous", "transparent", "fragile", "vague"],
        correctIndex: 1,
        explanation: "transparent means clear and easy to see or understand",
        focus: "transparent",
      },
    ],
  },
  {
    id: "public-art",
    context: "public art vocabulary",
    items: [
      {
        stem: "The mural's colors were so vivid that the scene seemed to ____ in the sunlight.",
        choices: ["wilt", "glimmer", "collapse", "blur"],
        correctIndex: 1,
        explanation: "glimmer means to shine with a soft light",
        focus: "glimmer",
      },
      {
        stem: "The designer chose a ____ layout so visitors could move through the space without confusion.",
        choices: ["ordered", "chaotic", "hidden", "stiff"],
        correctIndex: 0,
        explanation: "ordered means arranged in a clear, logical way",
        focus: "ordered",
      },
      {
        stem: "The speaker's comment was intended to ____ the audience to act, not to just admire the idea.",
        choices: ["provoke", "distract", "conceal", "weaken"],
        correctIndex: 0,
        explanation: "provoke means to stir someone to action or thought",
        focus: "provoke",
      },
      {
        stem: "The gallery used a ____ statement to explain why the exhibit mattered.",
        choices: ["trivial", "succinct", "wandering", "noisy"],
        correctIndex: 1,
        explanation: "succinct means brief and clearly expressed",
        focus: "succinct",
      },
      {
        stem: "The final panel helped ____ the theme of shared responsibility.",
        choices: ["clarify", "fracture", "burden", "neutralize"],
        correctIndex: 0,
        explanation: "clarify means to make something easier to understand",
        focus: "clarify",
      },
    ],
  },
  {
    id: "field-journal",
    context: "field journal vocabulary",
    items: [
      {
        stem: "The researcher was careful not to ____ the data with personal opinion.",
        choices: ["contaminate", "celebrate", "extend", "publish"],
        correctIndex: 0,
        explanation: "contaminate means to make something less pure or reliable",
        focus: "contaminate",
      },
      {
        stem: "The hiker followed a ____ path that curved around the lake.",
        choices: ["direct", "tortuous", "massive", "silent"],
        correctIndex: 1,
        explanation: "tortuous means winding or twisting",
        focus: "tortuous",
      },
      {
        stem: "The editor asked for a more ____ statement of the problem.",
        choices: ["elaborate", "succinct", "ornamental", "hesitant"],
        correctIndex: 1,
        explanation: "succinct means expressed in a few clear words",
        focus: "succinct",
      },
      {
        stem: "The new policy was meant to ____ delays at the front desk.",
        choices: ["accelerate", "intensify", "restore", "mimic"],
        correctIndex: 0,
        explanation: "accelerate means to speed up",
        focus: "accelerate",
      },
      {
        stem: "The coach gave a ____ explanation, repeating the key steps slowly.",
        choices: ["patient", "temperamental", "private", "fickle"],
        correctIndex: 0,
        explanation: "patient means calm and willing to take time",
        focus: "patient",
      },
    ],
  },
] as const;

function generateWordsInContext(): GeneratedReadingWritingQuestion[] {
  const concept = resolveConcept("words-in-context");
  return wordsInContextThemes.flatMap((theme, themeIndex) =>
    buildItemThemeQuestions({
      concept,
      themeId: theme.id,
      baseIndex: themeIndex * 5,
      questionType: "rw-words-in-context",
      context: { label: theme.context },
      items: theme.items,
      tags: ["reading-writing", "words-in-context", `theme:${theme.id}`],
    }).map((question, itemIndex) => ({
      ...question,
      index: themeIndex * 5 + itemIndex,
    })),
  );
}

const textStructureThemes: readonly PassageTheme[] = [
  {
    id: "opening-anecdote",
    passage:
      "The article opens with a description of a child tracing raindrops down a window. It then shifts to a discussion of how water cycles through a city. The first image is used to move the reader from a familiar scene to a larger scientific point.",
    facts: [
      "The opening image helps the author move from a familiar scene to a scientific explanation.",
      "The passage begins with a child's observation of raindrops on a window.",
      "The article then shifts to a discussion of the city water cycle.",
      "The author uses the first image to set up the larger point.",
      "The structure shows a transition from concrete example to broader idea.",
    ],
  },
  {
    id: "contrast-structure",
    passage:
      "The first paragraph describes a park that looked dull in winter. The second paragraph explains how the same park becomes active in spring, and the final sentence argues that the change reveals the value of patient planning. The arrangement lets the writer contrast appearance and long-term effect.",
    facts: [
      "The writer uses contrast to show how the park changes over time.",
      "The first paragraph presents the park in winter.",
      "The final sentence links the change to patient planning.",
      "The second paragraph describes the park in spring.",
      "The structure sets up a contrast between appearance and outcome.",
    ],
  },
  {
    id: "definition-example",
    passage:
      "The author defines a maker space as a room where people can test ideas, then gives examples such as sewing machines, 3-D printers, and shared worktables. The explanation helps readers understand that the term refers to both tools and the habits of collaboration that form around them.",
    facts: [
      "The author defines a term and then illustrates it with examples.",
      "The passage explains that a maker space includes tools and collaboration.",
      "The author gives examples such as sewing machines and 3-D printers.",
      "The definition helps readers understand the term more clearly.",
      "The structure pairs explanation with concrete examples.",
    ],
  },
  {
    id: "conclusion-structure",
    passage:
      "After describing several short experiments, the writer concludes that small adjustments can lead to larger improvements. The final sentence does not introduce new evidence; instead, it ties the examples together and signals the article's main lesson.",
    facts: [
      "The final sentence draws a conclusion from the earlier examples.",
      "The writer argues that small adjustments can produce larger improvements.",
      "The final sentence ties the examples together.",
      "The article uses several short experiments to build its point.",
      "The structure ends by stating the main lesson of the article.",
    ],
  },
] as const;

function generateTextStructureAndPurpose(): GeneratedReadingWritingQuestion[] {
  const concept = resolveConcept("text-structure-and-purpose");
  return textStructureThemes.flatMap((theme, themeIndex) =>
    buildFiveFactThemeQuestions({
      concept,
      themeId: theme.id,
      baseIndex: themeIndex * 5,
      questionType: "rw-text-structure-and-purpose",
      stimulus: { passage: theme.passage },
      facts: theme.facts,
      stems: structureStems,
      tags: ["reading-writing", "text-structure-and-purpose", `theme:${theme.id}`],
    }).map((question, itemIndex) => ({
      ...question,
      index: themeIndex * 5 + itemIndex,
    })),
  );
}

const crossTextThemes: readonly PairTheme[] = [
  {
    id: "shared-access",
    passageA:
      "Passage A argues that community workshops help residents trust their own ability to fix simple problems.",
    passageB:
      "Passage B says that repair workshops matter because they make practical skills easier to share across a neighborhood.",
    facts: [
      "Both passages support the value of repair workshops, though they emphasize different benefits.",
      "Passage A focuses on confidence while Passage B focuses on sharing practical skills.",
      "Both writers see community repair as worthwhile.",
      "The writers would likely agree that workshops can help neighborhoods.",
      "The passages connect repair skills with community value.",
    ],
  },
  {
    id: "urban-gardens",
    passageA:
      "Passage A says rooftop gardens mostly matter because they provide fresh produce in tight urban spaces.",
    passageB:
      "Passage B argues that rooftop gardens are useful because they create places where neighbors can work together.",
    facts: [
      "The passages agree that rooftop gardens matter, but for different reasons.",
      "Passage A emphasizes food access while Passage B emphasizes cooperation.",
      "Both writers value rooftop gardens.",
      "The writers would likely agree that gardens can serve cities well.",
      "The connection between the passages is that each highlights a different benefit.",
    ],
  },
  {
    id: "archive-memory",
    passageA:
      "Passage A says oral history projects preserve details that official records often miss.",
    passageB:
      "Passage B argues that oral history projects help students see how memory shapes community identity.",
    facts: [
      "Both passages support oral history projects as useful, but for different purposes.",
      "Passage A values the projects for preserving overlooked details.",
      "Passage B values the projects for shaping identity through memory.",
      "The writers would likely agree that memory can be valuable.",
      "The passages show two related but distinct reasons for using oral history.",
    ],
  },
  {
    id: "storm-prep",
    passageA:
      "Passage A says emergency text alerts matter because they quickly share practical warnings.",
    passageB:
      "Passage B says emergency text alerts matter because they reduce uncertainty in the first hour after a storm.",
    facts: [
      "Both passages support emergency alerts as useful, but they stress different outcomes.",
      "Passage A emphasizes speed and practical warnings.",
      "Passage B emphasizes reducing uncertainty.",
      "The writers would likely agree that alerts help people respond.",
      "The passages show complementary reasons to use text alerts.",
    ],
  },
] as const;

function generateCrossTextConnections(): GeneratedReadingWritingQuestion[] {
  const concept = resolveConcept("cross-text-connections");
  return crossTextThemes.flatMap((theme, themeIndex) =>
    buildFiveFactThemeQuestions({
      concept,
      themeId: theme.id,
      baseIndex: themeIndex * 5,
      questionType: "rw-cross-text-connections",
      stimulus: { passageA: theme.passageA, passageB: theme.passageB },
      facts: theme.facts,
      stems: crossTextStems,
      tags: ["reading-writing", "cross-text-connections", `theme:${theme.id}`],
    }).map((question, itemIndex) => ({
      ...question,
      index: themeIndex * 5 + itemIndex,
    })),
  );
}

const transitionThemes: readonly ItemTheme[] = [
  {
    id: "cause-effect",
    context: "cause and effect",
    items: [
      {
        stem: "The path was icy. ____ the school delayed opening by two hours.",
        choices: ["However", "Therefore", "For example", "Meanwhile"],
        correctIndex: 1,
        explanation: "Therefore shows a cause-and-effect relationship.",
        focus: "cause-and-effect",
      },
      {
        stem: "The team added more signs around campus. ____ visitors found the building faster.",
        choices: ["As a result", "By contrast", "For instance", "Similarly"],
        correctIndex: 0,
        explanation: "As a result signals a consequence.",
        focus: "cause-and-effect",
      },
      {
        stem: "The lights were dimmed. ____ the room became easier to focus in.",
        choices: ["Otherwise", "Consequently", "Likewise", "Nevertheless"],
        correctIndex: 1,
        explanation: "Consequently signals an outcome that follows the first action.",
        focus: "cause-and-effect",
      },
      {
        stem: "The city installed new bike racks. ____ more commuters chose to cycle.",
        choices: ["Accordingly", "Meanwhile", "Instead", "For example"],
        correctIndex: 0,
        explanation: "Accordingly signals that the second idea follows from the first.",
        focus: "cause-and-effect",
      },
      {
        stem: "The fundraiser advertised on social media. ____ attendance rose sharply.",
        choices: ["Thus", "Conversely", "At least", "In addition"],
        correctIndex: 0,
        explanation: "Thus shows that the second clause is a result.",
        focus: "cause-and-effect",
      },
    ],
  },
  {
    id: "contrast",
    context: "contrast",
    items: [
      {
        stem: "The old theater was elegant. ____ the new one was plain but efficient.",
        choices: ["Similarly", "In contrast", "As a result", "For instance"],
        correctIndex: 1,
        explanation: "In contrast signals a difference between the two ideas.",
        focus: "contrast",
      },
      {
        stem: "The first draft was crowded with details. ____ the revision was more focused.",
        choices: ["On the other hand", "For example", "Therefore", "Meanwhile"],
        correctIndex: 0,
        explanation: "On the other hand introduces a contrasting idea.",
        focus: "contrast",
      },
      {
        stem: "The garden looked small from the street. ____ it felt much larger once visitors entered.",
        choices: ["However", "Since", "Moreover", "Likewise"],
        correctIndex: 0,
        explanation: "However signals a contrast with the previous statement.",
        focus: "contrast",
      },
      {
        stem: "The article praised the program's reach. ____ it also noted the program's limited funding.",
        choices: ["Yet", "Accordingly", "In order to", "As a result"],
        correctIndex: 0,
        explanation: "Yet introduces a contrasting point.",
        focus: "contrast",
      },
      {
        stem: "The exhibit was small. ____ the display felt carefully curated.",
        choices: ["Still", "Because", "For example", "Then"],
        correctIndex: 0,
        explanation: "Still shows that the second idea contrasts with the first.",
        focus: "contrast",
      },
    ],
  },
  {
    id: "addition",
    context: "addition",
    items: [
      {
        stem: "The museum added a new gallery. ____ it expanded the audio guide to include local history.",
        choices: ["In addition", "Instead", "However", "As a result"],
        correctIndex: 0,
        explanation: "In addition introduces an extra related point.",
        focus: "addition",
      },
      {
        stem: "The club hosted a reading night. ____ it offered free bookmarks to visitors.",
        choices: ["Moreover", "Meanwhile", "Nevertheless", "Otherwise"],
        correctIndex: 0,
        explanation: "Moreover adds another supporting detail.",
        focus: "addition",
      },
      {
        stem: "The report included photos. ____ it included a map of the route.",
        choices: ["Also", "Yet", "Thus", "Although"],
        correctIndex: 0,
        explanation: "Also introduces another item in the list of details.",
        focus: "addition",
      },
      {
        stem: "The teacher explained the rule. ____ she gave two examples.",
        choices: ["Furthermore", "By contrast", "Even so", "Therefore"],
        correctIndex: 0,
        explanation: "Furthermore adds an additional point.",
        focus: "addition",
      },
      {
        stem: "The program served younger students. ____ it was open to adults in the evening.",
        choices: ["Likewise", "Instead", "Otherwise", "For instance"],
        correctIndex: 0,
        explanation: "Likewise can add a parallel related idea.",
        focus: "addition",
      },
    ],
  },
  {
    id: "sequence",
    context: "sequence",
    items: [
      {
        stem: "The volunteers sorted the books. ____ they labeled the shelves.",
        choices: ["Afterward", "Nevertheless", "For example", "Despite that"],
        correctIndex: 0,
        explanation: "Afterward signals that one action happened after another.",
        focus: "sequence",
      },
      {
        stem: "The class gathered its supplies. ____ it began the experiment.",
        choices: ["Then", "Although", "Instead", "Likewise"],
        correctIndex: 0,
        explanation: "Then indicates the next step in a sequence.",
        focus: "sequence",
      },
      {
        stem: "The chef chopped the herbs. ____ she added them to the soup.",
        choices: ["Next", "Otherwise", "Yet", "By contrast"],
        correctIndex: 0,
        explanation: "Next marks the following step.",
        focus: "sequence",
      },
      {
        stem: "The team drafted the poster. ____ it printed copies for the event.",
        choices: ["Subsequently", "For example", "Conversely", "Still"],
        correctIndex: 0,
        explanation: "Subsequently means after that.",
        focus: "sequence",
      },
      {
        stem: "The group reviewed the map. ____ it chose the safest route.",
        choices: ["Finally", "However", "Meanwhile", "Moreover"],
        correctIndex: 0,
        explanation: "Finally works because the sentence describes the last step.",
        focus: "sequence",
      },
    ],
  },
] as const;

function generateTransitions(): GeneratedReadingWritingQuestion[] {
  const concept = resolveConcept("transitions");
  return transitionThemes.flatMap((theme, themeIndex) =>
    buildItemThemeQuestions({
      concept,
      themeId: theme.id,
      baseIndex: themeIndex * 5,
      questionType: "rw-transitions",
      context: { label: theme.context },
      items: theme.items,
      tags: ["reading-writing", "transitions", `theme:${theme.id}`],
    }).map((question, itemIndex) => ({
      ...question,
      index: themeIndex * 5 + itemIndex,
    })),
  );
}

const synthesisThemes: readonly ItemTheme[] = [
  {
    id: "after-school-robotics",
    context: "robotics notes",
    items: [
      {
        stem: "Goal: emphasize how the club increased student confidence.\nNotes: 14 students joined, mentors demonstrated basic repairs, students practiced troubleshooting, attendance rose after the first month.",
        choices: [
          "The club increased confidence by giving students repeated chances to solve problems and see their skills improve.",
          "The club mainly focused on competing against nearby schools.",
          "The club replaced all science classes with robotics work.",
          "The club was open only to students who already had experience.",
        ],
        correctIndex: 0,
        explanation: "The best synthesis highlights repeated practice and growing confidence.",
        focus: "confidence",
      },
      {
        stem: "Goal: emphasize the club's community benefit.\nNotes: mentors volunteered, students repaired donated parts, finished devices were shared with the library, families attended the showcase.",
        choices: [
          "The club benefited the community by repairing devices and sharing results publicly.",
          "The club operated privately and avoided public events.",
          "The club focused only on individual awards.",
          "The club replaced the library with a workshop space.",
        ],
        correctIndex: 0,
        explanation: "The answer connects the repairs, sharing, and showcase to a community benefit.",
        focus: "community benefit",
      },
      {
        stem: "Goal: explain why the club stayed popular.\nNotes: sessions were short, tools were easy to use, students could choose projects, mentors encouraged teamwork.",
        choices: [
          "The club stayed popular because it was flexible, welcoming, and easy for beginners to join.",
          "The club stayed popular because it required advanced engineering classes.",
          "The club stayed popular because it met during lunch only.",
          "The club stayed popular because it focused on a single competition.",
        ],
        correctIndex: 0,
        explanation: "The answer best combines the notes into a clear explanation of popularity.",
        focus: "popularity",
      },
      {
        stem: "Goal: summarize the club's approach.\nNotes: students tested ideas, mentors gave feedback, mistakes were treated as part of learning, projects improved over time.",
        choices: [
          "The club treated mistakes as part of the learning process and used feedback to improve projects.",
          "The club discouraged feedback to keep projects unchanged.",
          "The club focused mainly on theory rather than making things.",
          "The club completed projects without revising them.",
        ],
        correctIndex: 0,
        explanation: "The notes show revision and feedback, not a one-and-done process.",
        focus: "approach",
      },
      {
        stem: "Goal: explain how the club affected student participation.\nNotes: many members returned each week, new students joined after demonstrations, peers invited friends, the room filled more quickly over time.",
        choices: [
          "The club encouraged participation by attracting returning members and new students alike.",
          "The club reduced participation by making the work too difficult.",
          "The club focused only on the same handful of students.",
          "The club met once and then stopped.",
        ],
        correctIndex: 0,
        explanation: "The notes point to increasing participation, not declining participation.",
        focus: "participation",
      },
    ],
  },
  {
    id: "garden-notes",
    context: "garden notes",
    items: [
      {
        stem: "Goal: highlight the garden's educational value.\nNotes: students measured soil moisture, logged plant height, compared sunlight on different beds, discussed results in science class.",
        choices: [
          "The garden supported learning because students used it to collect and discuss real data.",
          "The garden existed mainly for formal landscaping.",
          "The garden replaced all classroom instruction.",
          "The garden was closed to students during science class.",
        ],
        correctIndex: 0,
        explanation: "The notes emphasize measurement and discussion as learning tools.",
        focus: "educational value",
      },
      {
        stem: "Goal: emphasize the garden's shared ownership.\nNotes: neighbors watered on a schedule, residents chose which crops to plant, produce was divided among families, meetings were held monthly.",
        choices: [
          "The garden functioned as a shared project shaped by residents' decisions and labor.",
          "The garden was managed entirely by one person.",
          "The garden sold all produce to outside buyers.",
          "The garden was meant only for decoration.",
        ],
        correctIndex: 0,
        explanation: "The notes show collective decisions and shared work.",
        focus: "shared ownership",
      },
      {
        stem: "Goal: explain the garden's environmental benefit.\nNotes: compost reduced waste, rain barrels saved water, native plants attracted pollinators, shade lowered afternoon heat.",
        choices: [
          "The garden supported the environment by conserving resources and attracting wildlife.",
          "The garden relied on heavy chemical use.",
          "The garden increased waste and water use.",
          "The garden had no effect beyond appearance.",
        ],
        correctIndex: 0,
        explanation: "The notes point to conservation and habitat support.",
        focus: "environmental benefit",
      },
      {
        stem: "Goal: summarize the garden's social effect.\nNotes: neighbors shared tools, children helped harvest herbs, older residents taught planting tips, visitors stayed to talk after work sessions.",
        choices: [
          "The garden helped build neighborhood connections through shared work and conversation.",
          "The garden isolated residents from one another.",
          "The garden replaced neighborhood meetings.",
          "The garden was used only by children.",
        ],
        correctIndex: 0,
        explanation: "The notes link the garden to repeated social interaction.",
        focus: "social effect",
      },
      {
        stem: "Goal: stress the practical outcome.\nNotes: herbs were used in the cafeteria, seedlings were transplanted to classroom windows, extra vegetables were donated, parents volunteered on Saturdays.",
        choices: [
          "The garden produced practical benefits in addition to educational ones.",
          "The garden existed only for posters and displays.",
          "The garden had no use outside the soil beds.",
          "The garden was unrelated to the school.",
        ],
        correctIndex: 0,
        explanation: "The notes show direct uses for the produce and seedlings.",
        focus: "practical outcome",
      },
    ],
  },
  {
    id: "archive-notes",
    context: "archive notes",
    items: [
      {
        stem: "Goal: explain why the archive matters.\nNotes: recordings preserve accents, old photos reveal neighborhood landmarks, captions identify people, students can compare past and present.",
        choices: [
          "The archive helps preserve and compare neighborhood history across generations.",
          "The archive exists only to store new textbooks.",
          "The archive prevents students from studying the past.",
          "The archive replaces the need for any written records.",
        ],
        correctIndex: 0,
        explanation: "The notes emphasize preservation and comparison over time.",
        focus: "archive value",
      },
      {
        stem: "Goal: stress the student role.\nNotes: students interviewed residents, edited captions, checked dates, and selected photos for display.",
        choices: [
          "Students shaped the archive by gathering, checking, and organizing the materials.",
          "Students only watched others work on the archive.",
          "Students had no part in the display.",
          "Students were asked to ignore the interviews.",
        ],
        correctIndex: 0,
        explanation: "The notes show students doing active archival work.",
        focus: "student role",
      },
      {
        stem: "Goal: highlight the audience.\nNotes: families visited on weekends, teachers used the display in class, residents added stories, the exhibit sparked conversation.",
        choices: [
          "The archive reached a broad audience and prompted discussion.",
          "The archive was hidden from the public.",
          "The archive was used only by one class.",
          "The archive discouraged conversation.",
        ],
        correctIndex: 0,
        explanation: "The notes show the archive being used by several groups.",
        focus: "audience",
      },
      {
        stem: "Goal: show what the archive reveals.\nNotes: repeated names appear in several sources, a single store changed hands many times, oral stories fill gaps in the records.",
        choices: [
          "The archive reveals how multiple sources can combine to create a fuller history.",
          "The archive shows that one source is always enough.",
          "The archive removes uncertainty from every historical question.",
          "The archive proves that oral stories are never useful.",
        ],
        correctIndex: 0,
        explanation: "The notes point to a fuller picture built from several sources.",
        focus: "what the archive reveals",
      },
      {
        stem: "Goal: stress the learning outcome.\nNotes: students wrote reflections, compared sources, spotted contradictions, and revised captions after feedback.",
        choices: [
          "The project taught students how to question and refine historical information.",
          "The project discouraged analysis and revision.",
          "The project focused only on memory games.",
          "The project was complete before any sources were checked.",
        ],
        correctIndex: 0,
        explanation: "The notes show analysis, contradictions, and revision.",
        focus: "learning outcome",
      },
    ],
  },
  {
    id: "alert-notes",
    context: "alert system notes",
    items: [
      {
        stem: "Goal: explain the system's usefulness.\nNotes: alerts arrive in seconds, messages use plain language, residents can opt into language preferences, crews posted updates during storms.",
        choices: [
          "The system is useful because it delivers fast, clear, and customizable warnings.",
          "The system is useful because it sends long technical reports.",
          "The system is useful because it ignores user preferences.",
          "The system is useful because it slows down emergency response.",
        ],
        correctIndex: 0,
        explanation: "The notes emphasize speed, clarity, and personalization.",
        focus: "usefulness",
      },
      {
        stem: "Goal: stress community coordination.\nNotes: volunteers checked blocked streets, drivers confirmed road closures, the app updated maps, residents shared the warnings with neighbors.",
        choices: [
          "The system worked best when volunteers, drivers, and residents shared information.",
          "The system worked best when no one communicated.",
          "The system replaced road maps with printed flyers only.",
          "The system depended on one person doing everything.",
        ],
        correctIndex: 0,
        explanation: "The notes show coordination across several groups.",
        focus: "coordination",
      },
      {
        stem: "Goal: explain the timing.\nNotes: alerts were sent before floodwaters rose, crews had time to reroute traffic, families moved cars, schools delayed buses.",
        choices: [
          "The system helped people act before conditions became worse.",
          "The system waited until after the storm ended.",
          "The system was designed only for entertainment.",
          "The system ignored the first hours of the storm.",
        ],
        correctIndex: 0,
        explanation: "The notes show the alerts arriving early enough to matter.",
        focus: "timing",
      },
      {
        stem: "Goal: summarize the result.\nNotes: confusion dropped, fewer people called for basic directions, crews reached problem areas faster, the first hour became more orderly.",
        choices: [
          "The system made the first hour after storms more organized and efficient.",
          "The system made the first hour after storms more confusing.",
          "The system prevented any need for crews.",
          "The system reduced the amount of information available.",
        ],
        correctIndex: 0,
        explanation: "The notes show less confusion and faster response.",
        focus: "result",
      },
      {
        stem: "Goal: emphasize multilingual access.\nNotes: translations were reviewed by native speakers, text alerts were sent in three languages, families said the messages felt more trustworthy.",
        choices: [
          "The system improved access by providing messages in more than one language.",
          "The system avoided translation entirely.",
          "The system was only for one neighborhood.",
          "The system made messages less trustworthy.",
        ],
        correctIndex: 0,
        explanation: "The notes show that translations widened access and trust.",
        focus: "multilingual access",
      },
    ],
  },
] as const;

function generateRhetoricalSynthesis(): GeneratedReadingWritingQuestion[] {
  const concept = resolveConcept("rhetorical-synthesis");
  return synthesisThemes.flatMap((theme, themeIndex) =>
    buildItemThemeQuestions({
      concept,
      themeId: theme.id,
      baseIndex: themeIndex * 5,
      questionType: "rw-rhetorical-synthesis",
      context: { label: theme.context },
      items: theme.items,
      tags: ["reading-writing", "rhetorical-synthesis", `theme:${theme.id}`],
    }).map((question, itemIndex) => ({
      ...question,
      index: themeIndex * 5 + itemIndex,
    })),
  );
}

const boundaryThemes: readonly ItemTheme[] = [
  {
    id: "clause-boundaries",
    context: "clause boundaries",
    items: [
      {
        stem: "The concert ended early ____ the storm moved in quickly.",
        choices: [";", ",", ":", "no punctuation"],
        correctIndex: 0,
        explanation: "A semicolon can join two related independent clauses.",
        focus: "semicolon",
      },
      {
        stem: "Mina packed her notebook ____ her pencil before leaving.",
        choices: ["and", ";", ":", "no punctuation"],
        correctIndex: 0,
        explanation: "A simple conjunction connects the list items.",
        focus: "list",
      },
      {
        stem: "The volunteers arrived on time ____ as planned, the cleanup began at noon.",
        choices: [",", ";", ":", "no punctuation"],
        correctIndex: 1,
        explanation: "A semicolon can separate independent clauses here.",
        focus: "semicolon",
      },
      {
        stem: "The coach shouted instructions ____ the players ran drills.",
        choices: ["while", ";", ":", "no punctuation"],
        correctIndex: 0,
        explanation: "While correctly links the two actions.",
        focus: "subordination",
      },
      {
        stem: "The recipe was simple ____ flour, water, and salt.",
        choices: [":", ",", ";", "no punctuation"],
        correctIndex: 0,
        explanation: "A colon can introduce a list after a complete clause.",
        focus: "colon",
      },
    ],
  },
  {
    id: "appositives",
    context: "appositives",
    items: [
      {
        stem: "The city library ____ the oldest building downtown, is open on Sundays.",
        choices: ["which is", ", which is", "that is", "; which is"],
        correctIndex: 1,
        explanation: "The appositive clause is set off with commas.",
        focus: "appositive",
      },
      {
        stem: "Our guide ____ a retired engineer, explained the bridge design.",
        choices: ["who was", ", a retired engineer,", "that was", "; a retired engineer"],
        correctIndex: 1,
        explanation: "The appositive should be enclosed in commas.",
        focus: "appositive",
      },
      {
        stem: "The mural ____ painted by local students, brightened the hallway.",
        choices: ["was", ", was", "being", "; was"],
        correctIndex: 0,
        explanation: "The sentence is correct without extra punctuation before the verb.",
        focus: "appositive",
      },
      {
        stem: "Jules ____ the team captain, organized the fundraiser.",
        choices: [", the team captain,", "; the team captain", ": the team captain", "the team captain"],
        correctIndex: 0,
        explanation: "The appositive is correctly set off by commas.",
        focus: "appositive",
      },
      {
        stem: "The exhibit ____ a collection of handmade maps, drew many visitors.",
        choices: [": a collection of handmade maps", ", a collection of handmade maps,", "; a collection of handmade maps", "no punctuation"],
        correctIndex: 1,
        explanation: "The appositive phrase belongs between commas.",
        focus: "appositive",
      },
    ],
  },
  {
    id: "introductory-elements",
    context: "introductory elements",
    items: [
      {
        stem: "____ after the lecture ended, the students asked several questions.",
        choices: ["Quietly", "However", "Besides", "Therefore"],
        correctIndex: 0,
        explanation: "An introductory adverb is fine without extra punctuation here.",
        focus: "introductory element",
      },
      {
        stem: "____ the rain stopped, the volunteers resumed painting the fence.",
        choices: ["Because", "After", "Before", "Unless"],
        correctIndex: 1,
        explanation: "After correctly introduces the time relationship.",
        focus: "introductory element",
      },
      {
        stem: "____ the concert was over, the crowd slowly left the hall.",
        choices: ["Once", "Although", "Meanwhile", "Instead"],
        correctIndex: 0,
        explanation: "Once correctly introduces the dependent clause.",
        focus: "introductory element",
      },
      {
        stem: "____ the meeting was short, the team still solved the main problem.",
        choices: ["Although", "Besides", "Likewise", "Afterward"],
        correctIndex: 0,
        explanation: "Although sets up the contrast between the two clauses.",
        focus: "introductory element",
      },
      {
        stem: "____ the bell rang, everyone packed up their notebooks.",
        choices: ["When", "Yet", "Indeed", "Moreover"],
        correctIndex: 0,
        explanation: "When works well to introduce the time clause.",
        focus: "introductory element",
      },
    ],
  },
  {
    id: "end-boundaries",
    context: "end boundaries",
    items: [
      {
        stem: "The hallway was quiet ____ the doors had already locked.",
        choices: [".", ",", ";", ":"],
        correctIndex: 0,
        explanation: "A period ends the complete sentence correctly.",
        focus: "period",
      },
      {
        stem: "The notice read ____ 'Please return the keys by 5 p.m.'",
        choices: [":", ";", ",", "no punctuation"],
        correctIndex: 0,
        explanation: "A colon can introduce the quotation.",
        focus: "colon",
      },
      {
        stem: "The coach spoke calmly ____ the players listened closely.",
        choices: [",", ";", ":", "."],
        correctIndex: 1,
        explanation: "A semicolon can join the two independent clauses.",
        focus: "semicolon",
      },
      {
        stem: "The speakers arrived late ____ the event started on time.",
        choices: ["but", ", but", "; but", ": but"],
        correctIndex: 1,
        explanation: "A comma is needed before the coordinating conjunction.",
        focus: "comma",
      },
      {
        stem: "The sample was labeled carefully ____ the lab workers could track it.",
        choices: [",", ";", ":", "no punctuation"],
        correctIndex: 0,
        explanation: "A comma is correct here because the second clause follows naturally with the first.",
        focus: "comma",
      },
    ],
  },
] as const;

function generateBoundaries(): GeneratedReadingWritingQuestion[] {
  const concept = resolveConcept("boundaries-punctuation");
  return boundaryThemes.flatMap((theme, themeIndex) =>
    buildItemThemeQuestions({
      concept,
      themeId: theme.id,
      baseIndex: themeIndex * 5,
      questionType: "rw-boundaries-punctuation",
      context: { label: theme.context },
      items: theme.items,
      tags: ["reading-writing", "boundaries-punctuation", `theme:${theme.id}`],
    }).map((question, itemIndex) => ({
      ...question,
      index: themeIndex * 5 + itemIndex,
    })),
  );
}

const grammarThemes: readonly ItemTheme[] = [
  {
    id: "agreement",
    context: "subject-verb agreement",
    items: [
      {
        stem: "Each of the students ____ a notebook and a pencil.",
        choices: ["have", "has", "having", "had been"],
        correctIndex: 1,
        explanation: "Each is singular, so has is correct.",
        focus: "subject-verb agreement",
      },
      {
        stem: "The series of lectures ____ scheduled for Friday afternoon.",
        choices: ["were", "was", "are", "have been"],
        correctIndex: 1,
        explanation: "The subject series is singular, so was is correct.",
        focus: "subject-verb agreement",
      },
      {
        stem: "Neither the manager nor the assistants ____ available at the moment.",
        choices: ["is", "are", "was", "has been"],
        correctIndex: 1,
        explanation: "The verb agrees with the nearer plural subject assistants.",
        focus: "subject-verb agreement",
      },
      {
        stem: "A stack of reports ____ on the desk before class started.",
        choices: ["were", "was", "are", "be"],
        correctIndex: 1,
        explanation: "A stack is singular, so was is correct.",
        focus: "subject-verb agreement",
      },
      {
        stem: "The pair of gloves ____ missing from the shelf.",
        choices: ["were", "was", "are", "have"],
        correctIndex: 1,
        explanation: "The subject pair is singular, so was is correct.",
        focus: "subject-verb agreement",
      },
    ],
  },
  {
    id: "parallelism",
    context: "parallel structure",
    items: [
      {
        stem: "The project requires planning, testing, and ____ the results.",
        choices: ["to explain", "explaining", "explains", "explain"],
        correctIndex: 1,
        explanation: "The items in the list should be parallel gerunds.",
        focus: "parallelism",
      },
      {
        stem: "The speaker promised to be clear, to be brief, and ____ respectful.",
        choices: ["is", "being", "to be", "be"],
        correctIndex: 2,
        explanation: "The verbs in the series should match the infinitive structure.",
        focus: "parallelism",
      },
      {
        stem: "The class practiced reading, writing, and ____ carefully.",
        choices: ["speaks", "to speak", "speaking", "spoken"],
        correctIndex: 2,
        explanation: "The three actions should be parallel gerunds.",
        focus: "parallelism",
      },
      {
        stem: "The article is interesting, detailed, and ____.",
        choices: ["well organized", "organizing well", "organizes well", "well organizing"],
        correctIndex: 0,
        explanation: "The adjectives in the series should be parallel.",
        focus: "parallelism",
      },
      {
        stem: "The team hoped to finish the report, to check the figures, and ____ it to the teacher.",
        choices: ["submit", "submitting", "submitted", "to submitting"],
        correctIndex: 0,
        explanation: "The series should use parallel infinitives.",
        focus: "parallelism",
      },
    ],
  },
  {
    id: "modifiers",
    context: "modifiers",
    items: [
      {
        stem: "Walking down the hall, ____ the posters on the wall.",
        choices: ["the posters caught her eye", "she noticed the posters", "the posters were noticed by her", "the wall had posters"],
        correctIndex: 1,
        explanation: "The modifier should clearly describe she.",
        focus: "modifier",
      },
      {
        stem: "After studying for hours, ____ the exam felt manageable.",
        choices: ["the exam", "she found", "the notes", "the clock"],
        correctIndex: 1,
        explanation: "The subject of the modifier should be she.",
        focus: "modifier",
      },
      {
        stem: "The book on the table ____ belongs to my sister.",
        choices: ["that", "which", "who", "whom"],
        correctIndex: 0,
        explanation: "That correctly introduces the clause modifying book.",
        focus: "modifier",
      },
      {
        stem: "To make the instructions easier to follow, ____ the first two steps.",
        choices: ["the teacher rewrote", "rewriting", "the first two steps were", "the teacher was rewritten"],
        correctIndex: 0,
        explanation: "The sentence needs a clear subject before the verb.",
        focus: "modifier",
      },
      {
        stem: "Pressed by the wind, ____ the tent flap closed.",
        choices: ["the campers", "the tent", "the flap", "the wind"],
        correctIndex: 0,
        explanation: "The campers are the ones pressed by the wind and can act.",
        focus: "modifier",
      },
    ],
  },
  {
    id: "tense-and-pronouns",
    context: "tense and pronouns",
    items: [
      {
        stem: "By the time the guests arrived, the volunteers ____ the tables.",
        choices: ["set", "had set", "have set", "will set"],
        correctIndex: 1,
        explanation: "Past perfect shows the earlier action completed before arrival.",
        focus: "tense",
      },
      {
        stem: "The committee said that each member should bring ____ own notes.",
        choices: ["their", "its", "his or her", "theirs"],
        correctIndex: 2,
        explanation: "His or her is the clearest singular pronoun here.",
        focus: "pronoun",
      },
      {
        stem: "When the class ____ the lab, it will receive safety instructions.",
        choices: ["enter", "enters", "entered", "has entered"],
        correctIndex: 1,
        explanation: "The present tense enters matches the conditional sentence.",
        focus: "tense",
      },
      {
        stem: "The hikers brought backpacks that contained ____ maps and snacks.",
        choices: ["its", "their", "it's", "theirs"],
        correctIndex: 1,
        explanation: "The plural hikers need the plural possessive their.",
        focus: "pronoun",
      },
      {
        stem: "Before the lights dimmed, the orchestra ____ the final chord.",
        choices: ["plays", "has played", "played", "will play"],
        correctIndex: 2,
        explanation: "The completed past action needs the simple past tense.",
        focus: "tense",
      },
    ],
  },
] as const;

function generateFormStructureAndSenseGrammar(): GeneratedReadingWritingQuestion[] {
  const concept = resolveConcept("form-structure-and-sense-grammar");
  return grammarThemes.flatMap((theme, themeIndex) =>
    buildItemThemeQuestions({
      concept,
      themeId: theme.id,
      baseIndex: themeIndex * 5,
      questionType: "rw-form-structure-and-sense-grammar",
      context: { label: theme.context },
      items: theme.items,
      tags: ["reading-writing", "form-structure-and-sense-grammar", `theme:${theme.id}`],
    }).map((question, itemIndex) => ({
      ...question,
      index: themeIndex * 5 + itemIndex,
    })),
  );
}

export const readingWritingConceptSlugs: readonly ReadingWritingConceptSlug[] = [
  "central-ideas-and-details",
  "command-of-evidence-textual",
  "command-of-evidence-quantitative",
  "inferences",
  "words-in-context",
  "text-structure-and-purpose",
  "cross-text-connections",
  "transitions",
  "rhetorical-synthesis",
  "boundaries-punctuation",
  "form-structure-and-sense-grammar",
] as const;

export const readingWritingQuestionGenerators: Readonly<
  Record<ReadingWritingConceptSlug, () => GeneratedReadingWritingQuestion[]>
> = {
  "central-ideas-and-details": generateCentralIdeasAndDetails,
  "command-of-evidence-textual": generateCommandOfEvidenceTextual,
  "command-of-evidence-quantitative": generateCommandOfEvidenceQuantitative,
  inferences: generateInferences,
  "words-in-context": generateWordsInContext,
  "text-structure-and-purpose": generateTextStructureAndPurpose,
  "cross-text-connections": generateCrossTextConnections,
  transitions: generateTransitions,
  "rhetorical-synthesis": generateRhetoricalSynthesis,
  "boundaries-punctuation": generateBoundaries,
  "form-structure-and-sense-grammar": generateFormStructureAndSenseGrammar,
};

export function generateReadingWritingQuestionsForConcept(
  conceptSlug: ReadingWritingConceptSlug,
): GeneratedReadingWritingQuestion[] {
  return readingWritingQuestionGenerators[conceptSlug]();
}

export function generateReadingWritingQuestionBank(): GeneratedReadingWritingQuestion[] {
  return readingWritingConceptSlugs.flatMap((conceptSlug) =>
    generateReadingWritingQuestionsForConcept(conceptSlug),
  );
}

export const readingWritingQuestionBank = generateReadingWritingQuestionBank();

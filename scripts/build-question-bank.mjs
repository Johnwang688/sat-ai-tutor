import { execFileSync } from "node:child_process";
import fs from "node:fs";
import path from "node:path";
import { pathToFileURL } from "node:url";

const repoRoot = process.cwd();
const tempDir = path.join(repoRoot, ".tmp", "question-bank-build");
const tscPath = path.join(
  repoRoot,
  "apps",
  "web",
  "node_modules",
  "typescript",
  "bin",
  "tsc",
);

function ensureDir(filePath) {
  fs.mkdirSync(path.dirname(filePath), { recursive: true });
}

function escapeSql(value) {
  return String(value).replace(/'/g, "''");
}

function toJsonSql(value) {
  return `'${escapeSql(JSON.stringify(value))}'::jsonb`;
}

function validateQuestionBank(questionBank) {
  const countsByConcept = {};
  const promptKeys = new Set();

  for (const question of questionBank.questions) {
    countsByConcept[question.conceptSlug] =
      (countsByConcept[question.conceptSlug] ?? 0) + 1;

    if ((question.answerSchemaJson.choices ?? []).length !== 4) {
      throw new Error(`Question ${question.id} does not have 4 answer choices.`);
    }

    if (
      typeof question.answerSchemaJson.correctIndex !== "number" ||
      question.answerSchemaJson.correctIndex < 0 ||
      question.answerSchemaJson.correctIndex > 3
    ) {
      throw new Error(`Question ${question.id} has an invalid correct answer index.`);
    }

    const promptKey = `${question.conceptSlug}::${question.promptJson.promptText}`;
    if (promptKeys.has(promptKey)) {
      throw new Error(`Near-duplicate prompt detected for ${question.id}.`);
    }
    promptKeys.add(promptKey);
  }

  for (const [conceptSlug, count] of Object.entries(countsByConcept)) {
    if (count !== 20) {
      throw new Error(`Concept ${conceptSlug} has ${count} questions instead of 20.`);
    }
  }

  return countsByConcept;
}

function createSeedMigration(questionBank) {
  const lines = [
    "-- Seed the initial research-informed SAT question bank.",
    "-- Questions are original, generated from public pattern research, and linked to canonical taxonomy rows by slug.",
    "",
  ];

  for (const question of questionBank.questions) {
    lines.push("with taxonomy as (");
    lines.push("  select");
    lines.push("    s.id as section_id,");
    lines.push("    d.id as domain_id,");
    lines.push("    c.id as concept_id");
    lines.push("  from public.sections s");
    lines.push("  join public.domains d on d.section_id = s.id");
    lines.push("  join public.concepts c on c.domain_id = d.id");
    lines.push(`  where s.slug = '${escapeSql(question.sectionSlug)}'`);
    lines.push(`    and d.slug = '${escapeSql(question.domainSlug)}'`);
    lines.push(`    and c.slug = '${escapeSql(question.conceptSlug)}'`);
    lines.push(")");
    lines.push("insert into public.question_bank (");
    lines.push("  source_type, section_id, domain_id, concept_id, difficulty, question_type,");
    lines.push("  prompt_json, answer_schema_json, explanation_json, calculator_allowed,");
    lines.push("  desmos_relevant, status, published_at");
    lines.push(")");
    lines.push("select");
    lines.push("  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,");
    lines.push(`  ${question.difficulty}, '${escapeSql(question.questionType)}',`);
    lines.push(
      `  ${toJsonSql({
        ...question.promptJson,
        metadata: {
          questionKey: question.id,
          generationSource: "generated_from_research",
          tags: question.tags,
        },
      })},`,
    );
    lines.push(`  ${toJsonSql(question.answerSchemaJson)},`);
    lines.push(`  ${toJsonSql(question.explanationJson)},`);
    lines.push(`  ${question.calculatorAllowed ? "true" : "false"},`);
    lines.push(`  ${question.desmosRelevant ? "true" : "false"},`);
    lines.push("  'published', now()");
    lines.push("from taxonomy;");
    lines.push("");
  }

  return lines.join("\n");
}

async function buildQuestionBank() {
  fs.rmSync(tempDir, { recursive: true, force: true });
  fs.mkdirSync(tempDir, { recursive: true });

  execFileSync(
    process.execPath,
    [
      tscPath,
      path.join(
        repoRoot,
        "apps",
        "web",
        "src",
        "features",
        "question-bank",
        "index.ts",
      ),
      "--outDir",
      tempDir,
      "--module",
      "commonjs",
      "--target",
      "es2020",
      "--moduleResolution",
      "node",
      "--esModuleInterop",
      "--resolveJsonModule",
      "--skipLibCheck",
      "--strict",
      "false",
    ],
    { cwd: repoRoot, stdio: "inherit" },
  );

  const compiledIndex = path.join(
    tempDir,
    "question-bank",
    "index.js",
  );
  const module = await import(pathToFileURL(compiledIndex).href);
  return module.getGeneratedQuestionBank();
}

const questionBank = await buildQuestionBank();
const countsByConcept = validateQuestionBank(questionBank);

const jsonPath = path.join(
  repoRoot,
  "apps",
  "web",
  "src",
  "features",
  "question-bank",
  "content",
  "generated-question-bank.json",
);
const summaryPath = path.join(repoRoot, "docs", "question-bank-summary.json");
const migrationPath = path.join(
  repoRoot,
  "supabase",
  "migrations",
  "0003_seed_initial_question_bank.sql",
);

ensureDir(jsonPath);
ensureDir(summaryPath);
ensureDir(migrationPath);

fs.writeFileSync(jsonPath, `${JSON.stringify(questionBank, null, 2)}\n`);
fs.writeFileSync(
  summaryPath,
  `${JSON.stringify(
    {
      generatedAt: questionBank.generatedAt,
      workflowVersion: questionBank.workflowVersion,
      totalQuestions: questionBank.questions.length,
      countsByConcept,
    },
    null,
    2,
  )}\n`,
);
fs.writeFileSync(migrationPath, `${createSeedMigration(questionBank)}\n`);

console.log(
  JSON.stringify(
    {
      ok: true,
      totalQuestions: questionBank.questions.length,
      countsByConcept,
      jsonPath,
      summaryPath,
      migrationPath,
    },
    null,
    2,
  ),
);

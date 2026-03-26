/**
 * Splits a monolithic question-bank seed migration into smaller files so each
 * stays under SQL editor / timeout limits.
 *
 * CLI: node scripts/split-question-bank-migration.mjs <path-to-merged.sql>
 * (Used by build-question-bank.mjs when emitting migrations.)
 */
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const repoRoot = path.resolve(__dirname, "..");

const DEFAULT_CHUNK_SIZE = 30;
const START_MIGRATION_NUMBER = 3;
const PART_FILE_RE = /^\d{4}_seed_initial_question_bank_part\d{2}\.sql$/;

/** @returns {{ header: string, statements: string[] }} */
export function parseSeedMigrationStatements(content) {
  const marker = "with taxonomy as (";
  const idx = content.indexOf(marker);
  if (idx === -1) {
    throw new Error(`Could not find ${marker}`);
  }
  const header = content.slice(0, idx);
  const rest = content.slice(idx);
  const parts = rest.split(/\n\nwith taxonomy as \(/);
  const statements = [parts[0]];
  for (let i = 1; i < parts.length; i++) {
    statements.push("with taxonomy as (" + parts[i]);
  }
  return { header, statements };
}

/**
 * Removes prior partNN migrations so regeneration does not leave stale files.
 * @param {string} migrationsDir
 */
export function removeExistingSeedPartFiles(migrationsDir) {
  if (!fs.existsSync(migrationsDir)) return;
  for (const name of fs.readdirSync(migrationsDir)) {
    if (PART_FILE_RE.test(name)) {
      fs.unlinkSync(path.join(migrationsDir, name));
    }
  }
}

/**
 * @param {{ header: string, statements: string[] }} parsed
 * @param {{ migrationsDir: string, chunkSize?: number }} options
 * @returns {string[]} written file paths
 */
export function writeSplitSeedMigrationFiles(parsed, options) {
  const { header, statements } = parsed;
  const { migrationsDir, chunkSize = DEFAULT_CHUNK_SIZE } = options;
  const totalParts = Math.ceil(statements.length / chunkSize) || 1;
  const paths = [];

  let part = 1;
  let start = 0;
  let outNum = START_MIGRATION_NUMBER;
  while (start < statements.length) {
    const slice = statements.slice(start, start + chunkSize);
    const n = String(outNum).padStart(4, "0");
    const filename = `${n}_seed_initial_question_bank_part${String(part).padStart(2, "0")}.sql`;
    const outPath = path.join(migrationsDir, filename);

    let body = slice.join("\n\n");
    if (!body.endsWith("\n")) body += "\n";

    const partHeader =
      part === 1
        ? header
        : `-- Continuation of initial question bank seed (part ${part} of ${totalParts}).\n-- Requires migrations 0001, 0002, and prior question-bank parts.\n\n`;

    fs.writeFileSync(outPath, partHeader + body, "utf8");
    paths.push(outPath);

    start += chunkSize;
    part += 1;
    outNum += 1;
  }
  return paths;
}

function main() {
  const src = process.argv[2]
    ? path.resolve(process.argv[2])
    : path.join(repoRoot, "supabase/migrations/0003_seed_initial_question_bank.sql");

  if (!fs.existsSync(src)) {
    console.error(
      "Usage: node scripts/split-question-bank-migration.mjs <path-to-merged-seed.sql>",
    );
    console.error("Missing file:", src);
    process.exit(1);
  }
  const content = fs.readFileSync(src, "utf8");
  const parsed = parseSeedMigrationStatements(content);
  console.log("Parsed statements:", parsed.statements.length);

  const migrationsDir = path.join(repoRoot, "supabase/migrations");
  removeExistingSeedPartFiles(migrationsDir);
  const paths = writeSplitSeedMigrationFiles(parsed, { migrationsDir });
  for (const p of paths) {
    console.log("Wrote", path.basename(p));
  }
}

const isMain =
  process.argv[1] &&
  import.meta.url === pathToFileURL(path.resolve(process.argv[1])).href;
if (isMain) {
  main();
}

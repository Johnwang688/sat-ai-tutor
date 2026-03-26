/**
 * Regenerates empty per-concept JSON banks under data/questions/by-concept/.
 * Keep `satTaxonomy` in sync with apps/web/src/features/taxonomy/core-concepts.ts (`satTaxonomy`).
 */
import fs from "node:fs";
import path from "node:path";

const repoRoot = process.cwd();
const satTaxonomy = [
  {
    slug: "reading-writing",
    name: "Reading and Writing",
    domains: [
      {
        slug: "information-and-ideas",
        name: "Information and Ideas",
        concepts: [
          { slug: "central-ideas-and-details", name: "Central Ideas and Details" },
          { slug: "command-of-evidence-textual", name: "Command of Evidence (Textual)" },
          { slug: "command-of-evidence-quantitative", name: "Command of Evidence (Quantitative)" },
          { slug: "inferences", name: "Inferences" },
        ],
      },
      {
        slug: "craft-and-structure",
        name: "Craft and Structure",
        concepts: [
          { slug: "words-in-context", name: "Words in Context" },
          { slug: "text-structure-and-purpose", name: "Text Structure and Purpose" },
          { slug: "cross-text-connections", name: "Cross-Text Connections" },
        ],
      },
      {
        slug: "expression-of-ideas",
        name: "Expression of Ideas",
        concepts: [
          { slug: "transitions", name: "Transitions" },
          { slug: "rhetorical-synthesis", name: "Rhetorical Synthesis" },
        ],
      },
      {
        slug: "standard-english-conventions",
        name: "Standard English Conventions",
        concepts: [
          { slug: "boundaries-punctuation", name: "Boundaries (Punctuation)" },
          { slug: "form-structure-and-sense-grammar", name: "Form, Structure, and Sense (Grammar)" },
        ],
      },
    ],
  },
  {
    slug: "math",
    name: "Math",
    domains: [
      {
        slug: "algebra",
        name: "Algebra",
        concepts: [
          { slug: "linear-equations-in-one-variable", name: "Linear equations in one variable" },
          { slug: "linear-equations-in-two-variables", name: "Linear equations in two variables" },
          { slug: "linear-functions", name: "Linear functions" },
          {
            slug: "systems-of-two-linear-equations-in-two-variables",
            name: "Systems of two linear equations in two variables",
          },
          {
            slug: "linear-inequalities-in-one-or-two-variables",
            name: "Linear inequalities in one or two variables",
          },
        ],
      },
      {
        slug: "advanced-math",
        name: "Advanced Math",
        concepts: [
          { slug: "equivalent-expressions", name: "Equivalent expressions" },
          {
            slug: "nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables",
            name: "Nonlinear equations in one variable and systems of equations in two variables",
          },
          { slug: "nonlinear-functions", name: "Nonlinear functions" },
        ],
      },
      {
        slug: "problem-solving-and-data-analysis",
        name: "Problem-Solving and Data Analysis",
        concepts: [
          {
            slug: "ratios-rates-proportional-relationships-and-units",
            name: "Ratios, rates, proportional relationships, and units",
          },
          { slug: "percentages", name: "Percentages" },
          {
            slug: "one-variable-data-distributions-and-measures-of-center-and-spread",
            name: "One-variable data: distributions and measures of center and spread",
          },
          {
            slug: "two-variable-data-models-and-scatterplots",
            name: "Two-variable data: models and scatterplots",
          },
          {
            slug: "probability-and-conditional-probability",
            name: "Probability and conditional probability",
          },
          {
            slug: "inference-from-sample-statistics-and-margin-of-error",
            name: "Inference from sample statistics and margin of error",
          },
          {
            slug: "evaluating-statistical-claims-observational-studies-and-experiments",
            name: "Evaluating statistical claims: observational studies and experiments",
          },
        ],
      },
      {
        slug: "geometry-and-trigonometry",
        name: "Geometry and Trigonometry",
        concepts: [
          { slug: "area-and-volume", name: "Area and volume" },
          { slug: "lines-angles-and-triangles", name: "Lines, angles, and triangles" },
          { slug: "right-triangles-and-trigonometry", name: "Right triangles and trigonometry" },
          { slug: "circles", name: "Circles" },
        ],
      },
    ],
  },
];

const dir = path.join(repoRoot, "data", "questions", "by-concept");
fs.mkdirSync(dir, { recursive: true });

const manifest = {
  schemaVersion: "1",
  description: "Index of per-concept JSON banks under data/questions/by-concept/",
  concepts: [],
};

for (const sec of satTaxonomy) {
  for (const dom of sec.domains) {
    for (const con of dom.concepts) {
      const payload = {
        schemaVersion: "1",
        taxonomy: {
          sectionSlug: sec.slug,
          sectionName: sec.name,
          domainSlug: dom.slug,
          domainName: dom.name,
          conceptSlug: con.slug,
          conceptName: con.name,
        },
        questions: [],
      };
      const file = path.join(dir, `${con.slug}.json`);
      fs.writeFileSync(file, `${JSON.stringify(payload, null, 2)}\n`, "utf8");
      manifest.concepts.push({
        conceptSlug: con.slug,
        file: `by-concept/${con.slug}.json`,
        sectionSlug: sec.slug,
        domainSlug: dom.slug,
      });
    }
  }
}

fs.writeFileSync(
  path.join(repoRoot, "data", "questions", "manifest.json"),
  `${JSON.stringify(manifest, null, 2)}\n`,
  "utf8",
);

console.log(`Wrote ${manifest.concepts.length} concept files + manifest.json`);

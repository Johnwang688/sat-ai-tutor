export type TaxonomySectionSlug = "reading-writing" | "math";
export type TaxonomySectionLabel = "Reading and Writing" | "Math";

type TaxonomyConceptDefinition = {
  slug: string;
  name: string;
};

type TaxonomyDomainDefinition = {
  slug: string;
  name: string;
  concepts: ReadonlyArray<TaxonomyConceptDefinition>;
};

type TaxonomySectionDefinition = {
  slug: TaxonomySectionSlug;
  name: TaxonomySectionLabel;
  domains: ReadonlyArray<TaxonomyDomainDefinition>;
};

export const satTaxonomy: ReadonlyArray<TaxonomySectionDefinition> = [
  {
    slug: "reading-writing",
    name: "Reading and Writing",
    domains: [
      {
        slug: "information-and-ideas",
        name: "Information and Ideas",
        concepts: [
          {
            slug: "central-ideas-and-details",
            name: "Central Ideas and Details",
          },
          {
            slug: "command-of-evidence-textual",
            name: "Command of Evidence (Textual)",
          },
          {
            slug: "command-of-evidence-quantitative",
            name: "Command of Evidence (Quantitative)",
          },
          {
            slug: "inferences",
            name: "Inferences",
          },
        ],
      },
      {
        slug: "craft-and-structure",
        name: "Craft and Structure",
        concepts: [
          {
            slug: "words-in-context",
            name: "Words in Context",
          },
          {
            slug: "text-structure-and-purpose",
            name: "Text Structure and Purpose",
          },
          {
            slug: "cross-text-connections",
            name: "Cross-Text Connections",
          },
        ],
      },
      {
        slug: "expression-of-ideas",
        name: "Expression of Ideas",
        concepts: [
          {
            slug: "transitions",
            name: "Transitions",
          },
          {
            slug: "rhetorical-synthesis",
            name: "Rhetorical Synthesis",
          },
        ],
      },
      {
        slug: "standard-english-conventions",
        name: "Standard English Conventions",
        concepts: [
          {
            slug: "boundaries-punctuation",
            name: "Boundaries (Punctuation)",
          },
          {
            slug: "form-structure-and-sense-grammar",
            name: "Form, Structure, and Sense (Grammar)",
          },
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
          {
            slug: "linear-equations-in-one-variable",
            name: "Linear equations in one variable",
          },
          {
            slug: "linear-equations-in-two-variables",
            name: "Linear equations in two variables",
          },
          {
            slug: "linear-functions",
            name: "Linear functions",
          },
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
          {
            slug: "equivalent-expressions",
            name: "Equivalent expressions",
          },
          {
            slug: "nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables",
            name: "Nonlinear equations in one variable and systems of equations in two variables",
          },
          {
            slug: "nonlinear-functions",
            name: "Nonlinear functions",
          },
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
          {
            slug: "percentages",
            name: "Percentages",
          },
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
          {
            slug: "area-and-volume",
            name: "Area and volume",
          },
          {
            slug: "lines-angles-and-triangles",
            name: "Lines, angles, and triangles",
          },
          {
            slug: "right-triangles-and-trigonometry",
            name: "Right triangles and trigonometry",
          },
          {
            slug: "circles",
            name: "Circles",
          },
        ],
      },
    ],
  },
] as const;

export type CanonicalSectionRecord = {
  id: string;
  slug: TaxonomySectionSlug;
  name: TaxonomySectionLabel;
  displayOrder: number;
};

export type CanonicalDomainRecord = {
  id: string;
  sectionId: string;
  sectionSlug: TaxonomySectionSlug;
  slug: string;
  name: string;
  displayOrder: number;
};

export type CanonicalConceptRecord = {
  id: string;
  sectionId: string;
  sectionSlug: TaxonomySectionSlug;
  sectionName: TaxonomySectionLabel;
  domainId: string;
  domainSlug: string;
  domainName: string;
  slug: string;
  name: string;
  displayOrder: number;
};

type PracticeBaseline = {
  attempts: number;
  masteryPercent: number;
  recentAccuracyPercent: number;
  lastPracticedAt: string;
};

export type CanonicalConceptCatalogItem = {
  slug: string;
  name: string;
  section: TaxonomySectionLabel;
  sectionSlug: TaxonomySectionSlug;
  domain: string;
  domainSlug: string;
  baseline: PracticeBaseline;
  subskills: ReadonlyArray<{
    name: string;
    masteryPercent: number;
    attempts: number;
  }>;
};

function makeId(prefix: string, slug: string): string {
  return `${prefix}_${slug.replace(/-/g, "_")}`;
}

const baselineOverrides: Readonly<Record<string, PracticeBaseline>> = {
  "linear-equations-in-one-variable": {
    attempts: 31,
    masteryPercent: 62,
    recentAccuracyPercent: 58,
    lastPracticedAt: "2026-03-23",
  },
  transitions: {
    attempts: 24,
    masteryPercent: 76,
    recentAccuracyPercent: 80,
    lastPracticedAt: "2026-03-24",
  },
  "boundaries-punctuation": {
    attempts: 20,
    masteryPercent: 69,
    recentAccuracyPercent: 65,
    lastPracticedAt: "2026-03-22",
  },
};

const subskillOverrides: Readonly<
  Record<string, CanonicalConceptCatalogItem["subskills"]>
> = {
  "linear-equations-in-one-variable": [
    { name: "One-step equations", masteryPercent: 79, attempts: 11 },
    { name: "Multi-step equations", masteryPercent: 61, attempts: 12 },
    { name: "Word problem translation", masteryPercent: 48, attempts: 8 },
  ],
  transitions: [
    { name: "Cause and effect transitions", masteryPercent: 72, attempts: 10 },
    { name: "Contrast transitions", masteryPercent: 79, attempts: 7 },
    { name: "Sequence transitions", masteryPercent: 77, attempts: 7 },
  ],
  "boundaries-punctuation": [
    { name: "Commas", masteryPercent: 72, attempts: 8 },
    { name: "Semicolons", masteryPercent: 61, attempts: 6 },
    { name: "Dashes and colons", masteryPercent: 68, attempts: 6 },
  ],
};

const defaultBaseline: PracticeBaseline = {
  attempts: 6,
  masteryPercent: 92,
  recentAccuracyPercent: 90,
  lastPracticedAt: "2026-03-21",
};

export const canonicalSections: ReadonlyArray<CanonicalSectionRecord> = satTaxonomy.map(
  (section, index) => ({
    id: makeId("sec", section.slug),
    slug: section.slug,
    name: section.name,
    displayOrder: index + 1,
  }),
);

export const canonicalDomains: ReadonlyArray<CanonicalDomainRecord> = satTaxonomy.flatMap(
  (section, sectionIndex) =>
    section.domains.map((domain, domainIndex) => ({
      id: makeId("dom", domain.slug),
      sectionId: canonicalSections[sectionIndex]?.id ?? "",
      sectionSlug: section.slug,
      slug: domain.slug,
      name: domain.name,
      displayOrder: domainIndex + 1,
    })),
);

export const canonicalConcepts: ReadonlyArray<CanonicalConceptRecord> = satTaxonomy.flatMap(
  (section, sectionIndex) =>
    section.domains.flatMap((domain, domainIndex) =>
      domain.concepts.map((concept, conceptIndex) => ({
        id: makeId("con", concept.slug),
        sectionId: canonicalSections[sectionIndex]?.id ?? "",
        sectionSlug: section.slug,
        sectionName: section.name,
        domainId: canonicalDomains.find((item) => item.slug === domain.slug)?.id ?? "",
        domainSlug: domain.slug,
        domainName: domain.name,
        slug: concept.slug,
        name: concept.name,
        displayOrder: conceptIndex + 1,
      })),
    ),
);

export const canonicalConceptCatalog: ReadonlyArray<CanonicalConceptCatalogItem> =
  canonicalConcepts.map((concept) => ({
    slug: concept.slug,
    name: concept.name,
    section: concept.sectionName,
    sectionSlug: concept.sectionSlug,
    domain: concept.domainName,
    domainSlug: concept.domainSlug,
    baseline: baselineOverrides[concept.slug] ?? defaultBaseline,
    subskills: subskillOverrides[concept.slug] ?? [],
  }));

export function getCanonicalConcept(slug: string): CanonicalConceptRecord | undefined {
  return canonicalConcepts.find((concept) => concept.slug === slug);
}

export function getCanonicalDomain(slug: string): CanonicalDomainRecord | undefined {
  return canonicalDomains.find((domain) => domain.slug === slug);
}

export function getCanonicalConceptCatalogItem(
  slug: string,
): CanonicalConceptCatalogItem | undefined {
  return canonicalConceptCatalog.find((concept) => concept.slug === slug);
}

export function getConceptOptionsForSection(
  sectionSlug?: TaxonomySectionSlug,
): ReadonlyArray<{
  slug: string;
  label: string;
  sectionSlug: TaxonomySectionSlug;
}> {
  return canonicalConceptCatalog
    .filter((concept) => !sectionSlug || concept.sectionSlug === sectionSlug)
    .map((concept) => ({
      slug: concept.slug,
      label: `${concept.domain} -> ${concept.name}`,
      sectionSlug: concept.sectionSlug,
    }));
}

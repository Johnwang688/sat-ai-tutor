"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.canonicalConceptCatalog = exports.canonicalConcepts = exports.canonicalDomains = exports.canonicalSections = exports.satTaxonomy = void 0;
exports.getCanonicalConcept = getCanonicalConcept;
exports.getCanonicalDomain = getCanonicalDomain;
exports.getCanonicalConceptCatalogItem = getCanonicalConceptCatalogItem;
exports.getConceptOptionsForSection = getConceptOptionsForSection;
exports.satTaxonomy = [
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
];
function makeId(prefix, slug) {
    return `${prefix}_${slug.replace(/-/g, "_")}`;
}
const baselineOverrides = {
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
const subskillOverrides = {
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
const defaultBaseline = {
    attempts: 6,
    masteryPercent: 92,
    recentAccuracyPercent: 90,
    lastPracticedAt: "2026-03-21",
};
exports.canonicalSections = exports.satTaxonomy.map((section, index) => ({
    id: makeId("sec", section.slug),
    slug: section.slug,
    name: section.name,
    displayOrder: index + 1,
}));
exports.canonicalDomains = exports.satTaxonomy.flatMap((section, sectionIndex) => section.domains.map((domain, domainIndex) => ({
    id: makeId("dom", domain.slug),
    sectionId: exports.canonicalSections[sectionIndex]?.id ?? "",
    sectionSlug: section.slug,
    slug: domain.slug,
    name: domain.name,
    displayOrder: domainIndex + 1,
})));
exports.canonicalConcepts = exports.satTaxonomy.flatMap((section, sectionIndex) => section.domains.flatMap((domain, domainIndex) => domain.concepts.map((concept, conceptIndex) => ({
    id: makeId("con", concept.slug),
    sectionId: exports.canonicalSections[sectionIndex]?.id ?? "",
    sectionSlug: section.slug,
    sectionName: section.name,
    domainId: exports.canonicalDomains.find((item) => item.slug === domain.slug)?.id ?? "",
    domainSlug: domain.slug,
    domainName: domain.name,
    slug: concept.slug,
    name: concept.name,
    displayOrder: conceptIndex + 1,
}))));
exports.canonicalConceptCatalog = exports.canonicalConcepts.map((concept) => ({
    slug: concept.slug,
    name: concept.name,
    section: concept.sectionName,
    sectionSlug: concept.sectionSlug,
    domain: concept.domainName,
    domainSlug: concept.domainSlug,
    baseline: baselineOverrides[concept.slug] ?? defaultBaseline,
    subskills: subskillOverrides[concept.slug] ?? [],
}));
function getCanonicalConcept(slug) {
    return exports.canonicalConcepts.find((concept) => concept.slug === slug);
}
function getCanonicalDomain(slug) {
    return exports.canonicalDomains.find((domain) => domain.slug === slug);
}
function getCanonicalConceptCatalogItem(slug) {
    return exports.canonicalConceptCatalog.find((concept) => concept.slug === slug);
}
function getConceptOptionsForSection(sectionSlug) {
    return exports.canonicalConceptCatalog
        .filter((concept) => !sectionSlug || concept.sectionSlug === sectionSlug)
        .map((concept) => ({
        slug: concept.slug,
        label: `${concept.domain} -> ${concept.name}`,
        sectionSlug: concept.sectionSlug,
    }));
}

import {
  conceptRecords,
  domainRecords,
  questionDrafts,
  sectionRecords,
  variantReviewItems,
} from "../mock-data";
import type {
  AdminActor,
  AdminAuditEvent,
  ConceptRecord,
  DomainRecord,
  GeneratedVariantRecord,
  SatSection,
  SectionRecord,
  VettedQuestionRecord,
  VariantAmbiguityRisk,
} from "./types";

type QuestionListFilters = {
  section?: SatSection;
  status?: "draft" | "published";
  search?: string;
};

type CreateQuestionDraftInput = {
  title: string;
  section: SatSection;
  domain: string;
  concept: string;
  difficulty: 1 | 2 | 3 | 4 | 5;
  calculatorAllowed?: boolean;
  desmosRelevant?: boolean;
  answerSchema?: string;
  explanationJson?: string;
};

type UpdateQuestionDraftInput = Partial<CreateQuestionDraftInput>;

type GenerateVariantInput = {
  parentQuestionId: string;
  concept?: string;
  count?: number;
};

type TaxonomyEntityKind = "section" | "domain" | "concept";

type CreateSectionInput = {
  name: string;
  slug: string;
  displayOrder: number;
};

type CreateDomainInput = {
  sectionSlug: string;
  name: string;
  slug: string;
  displayOrder: number;
};

type CreateConceptInput = {
  domainSlug: string;
  name: string;
  slug: string;
  displayOrder: number;
};

type UpdateSectionInput = Partial<CreateSectionInput>;
type UpdateDomainInput = Partial<CreateDomainInput>;
type UpdateConceptInput = Partial<CreateConceptInput>;

const questionStore: VettedQuestionRecord[] = questionDrafts.map((draft) => ({
  id: draft.id,
  status: "draft",
  section: draft.section,
  domain: draft.domain,
  concept: draft.concept,
  title: draft.title,
  difficulty: draft.difficulty,
  calculatorAllowed: true,
  desmosRelevant: false,
  answerSchema: '{"type":"multiple_choice","choices":["A","B","C","D"],"correctIndex":1}',
  explanationJson:
    '{"summary":"Isolate terms, simplify, and solve with inverse operations."}',
  updatedAt: draft.updatedAt,
}));

const variantStore: GeneratedVariantRecord[] = variantReviewItems.map((item) => ({
  id: item.id,
  parentQuestionId: item.parentQuestionId,
  concept: item.concept,
  validationScore: item.validationScore,
  ambiguityRisk: item.ambiguityRisk,
  generatedAt: item.generatedAt,
  notes: item.notes,
  status: "pending",
}));

const sectionStore: SectionRecord[] = sectionRecords.map((section) => ({
  id: section.id,
  slug: section.slug,
  name: section.name,
  displayOrder: section.displayOrder,
}));

const domainStore: DomainRecord[] = domainRecords.map((domain) => ({
  id: domain.id,
  sectionSlug: domain.sectionSlug,
  slug: domain.slug,
  name: domain.name,
  displayOrder: domain.displayOrder,
}));

const conceptStore: ConceptRecord[] = conceptRecords.map((concept) => ({
  id: concept.id,
  domainSlug: concept.domainSlug,
  slug: concept.slug,
  name: concept.name,
  displayOrder: concept.displayOrder,
}));

const auditStore: AdminAuditEvent[] = [];

function nowIsoDate(): string {
  return new Date().toISOString().slice(0, 10);
}

function nowIsoDateTime(): string {
  return new Date().toISOString();
}

function nextId(prefix: string): string {
  const randomSuffix = Math.random().toString(36).slice(2, 8);
  return `${prefix}_${randomSuffix}`;
}

function writeAudit(
  actor: AdminActor,
  action: AdminAuditEvent["action"],
  entityId: string,
  metadata: Record<string, unknown>,
): AdminAuditEvent {
  const event: AdminAuditEvent = {
    id: nextId("audit"),
    actorId: actor.id,
    action,
    entityId,
    createdAt: nowIsoDateTime(),
    metadata,
  };
  auditStore.unshift(event);
  return event;
}

function compareByDisplayOrder<T extends { displayOrder: number; name: string }>(
  left: T,
  right: T,
): number {
  if (left.displayOrder !== right.displayOrder) {
    return left.displayOrder - right.displayOrder;
  }
  return left.name.localeCompare(right.name);
}

function compareByDateDesc<T extends { updatedAt: string }>(left: T, right: T): number {
  return right.updatedAt.localeCompare(left.updatedAt);
}

export function getAdminDashboardSummary() {
  const pendingVariants = variantStore.filter((item) => item.status === "pending").length;
  const draftQuestions = questionStore.filter((item) => item.status === "draft").length;
  const taxonomyAuditCount = auditStore.filter((event) =>
    event.action.startsWith("taxonomy."),
  ).length;

  return {
    metrics: [
      {
        label: "Draft questions",
        count: draftQuestions,
        detail: "Vetted content waiting for review",
      },
      {
        label: "Pending variants",
        count: pendingVariants,
        detail: "Generated variants awaiting approve/reject",
      },
      {
        label: "Taxonomy edits",
        count: taxonomyAuditCount,
        detail: "Section/domain/concept updates tracked in audit log",
      },
    ] as const,
    auditEvents: auditStore.slice(0, 10),
  };
}

export function listVettedQuestions(filters: QuestionListFilters = {}): VettedQuestionRecord[] {
  const search = filters.search?.trim().toLowerCase();

  return questionStore
    .filter((question) => {
      if (filters.section && question.section !== filters.section) {
        return false;
      }
      if (filters.status && question.status !== filters.status) {
        return false;
      }
      if (!search) {
        return true;
      }
      const haystack = [
        question.id,
        question.title,
        question.section,
        question.domain,
        question.concept,
      ]
        .join(" ")
        .toLowerCase();
      return haystack.includes(search);
    })
    .sort(compareByDateDesc);
}

export function getVettedQuestionById(questionId: string): VettedQuestionRecord | undefined {
  return questionStore.find((question) => question.id === questionId);
}

export function createQuestionDraft(
  input: CreateQuestionDraftInput,
  actor: AdminActor,
): VettedQuestionRecord {
  const record: VettedQuestionRecord = {
    id: nextId("q"),
    status: "draft",
    section: input.section,
    domain: input.domain.trim(),
    concept: input.concept.trim(),
    title: input.title.trim(),
    difficulty: input.difficulty,
    calculatorAllowed: Boolean(input.calculatorAllowed),
    desmosRelevant: Boolean(input.desmosRelevant),
    answerSchema: input.answerSchema?.trim() || "{}",
    explanationJson: input.explanationJson?.trim() || "{}",
    updatedAt: nowIsoDate(),
  };

  questionStore.unshift(record);
  writeAudit(actor, "question.created", record.id, {
    section: record.section,
    domain: record.domain,
    concept: record.concept,
  });

  return record;
}

export function updateQuestionDraft(
  questionId: string,
  input: UpdateQuestionDraftInput,
  actor: AdminActor,
): VettedQuestionRecord | undefined {
  const question = getVettedQuestionById(questionId);
  if (!question) {
    return undefined;
  }

  if (question.status === "published") {
    return undefined;
  }

  if (typeof input.title === "string") {
    question.title = input.title.trim();
  }
  if (typeof input.section === "string") {
    question.section = input.section;
  }
  if (typeof input.domain === "string") {
    question.domain = input.domain.trim();
  }
  if (typeof input.concept === "string") {
    question.concept = input.concept.trim();
  }
  if (typeof input.difficulty === "number") {
    question.difficulty = input.difficulty;
  }
  if (typeof input.calculatorAllowed === "boolean") {
    question.calculatorAllowed = input.calculatorAllowed;
  }
  if (typeof input.desmosRelevant === "boolean") {
    question.desmosRelevant = input.desmosRelevant;
  }
  if (typeof input.answerSchema === "string") {
    question.answerSchema = input.answerSchema.trim();
  }
  if (typeof input.explanationJson === "string") {
    question.explanationJson = input.explanationJson.trim();
  }

  question.updatedAt = nowIsoDate();
  writeAudit(actor, "question.updated", question.id, {
    section: question.section,
    domain: question.domain,
    concept: question.concept,
  });

  return question;
}

export function publishQuestion(
  questionId: string,
  actor: AdminActor,
): VettedQuestionRecord | undefined {
  const question = getVettedQuestionById(questionId);
  if (!question || question.status === "published") {
    return undefined;
  }

  question.status = "published";
  question.publishedAt = nowIsoDate();
  question.updatedAt = nowIsoDate();

  writeAudit(actor, "question.published", question.id, {
    publishedAt: question.publishedAt,
  });

  return question;
}

export function listGeneratedVariants(status?: GeneratedVariantRecord["status"]): GeneratedVariantRecord[] {
  const rows = status ? variantStore.filter((variant) => variant.status === status) : variantStore;
  return [...rows].sort((left, right) => right.generatedAt.localeCompare(left.generatedAt));
}

function pickRiskFromScore(score: number): VariantAmbiguityRisk {
  if (score >= 90) {
    return "low";
  }
  if (score >= 80) {
    return "medium";
  }
  return "high";
}

export function generateVariants(
  input: GenerateVariantInput,
  actor: AdminActor,
): GeneratedVariantRecord[] {
  const parentQuestion = getVettedQuestionById(input.parentQuestionId);
  const baseConcept = input.concept?.trim() || parentQuestion?.concept || "Unassigned Concept";
  const count = Math.max(1, Math.min(5, input.count ?? 2));
  const created: GeneratedVariantRecord[] = [];

  for (let index = 0; index < count; index += 1) {
    const validationScore = 72 + ((index + baseConcept.length) % 28);
    const item: GeneratedVariantRecord = {
      id: nextId("var"),
      parentQuestionId: input.parentQuestionId,
      concept: baseConcept,
      validationScore,
      ambiguityRisk: pickRiskFromScore(validationScore),
      generatedAt: nowIsoDate(),
      notes: "Generated by admin pipeline with validation scaffolding.",
      status: "pending",
    };
    variantStore.unshift(item);
    created.push(item);
  }

  writeAudit(actor, "variant.generated", input.parentQuestionId, {
    count: created.length,
    concept: baseConcept,
  });

  return created;
}

export function approveVariant(
  variantId: string,
  actor: AdminActor,
): GeneratedVariantRecord | undefined {
  const variant = variantStore.find((item) => item.id === variantId);
  if (!variant || variant.status !== "pending") {
    return undefined;
  }

  variant.status = "approved";
  variant.reviewedAt = nowIsoDate();

  writeAudit(actor, "variant.approved", variant.id, {
    parentQuestionId: variant.parentQuestionId,
  });

  return variant;
}

export function rejectVariant(
  variantId: string,
  reason: string,
  actor: AdminActor,
): GeneratedVariantRecord | undefined {
  const variant = variantStore.find((item) => item.id === variantId);
  if (!variant || variant.status !== "pending") {
    return undefined;
  }

  variant.status = "rejected";
  variant.rejectionReason = reason.trim();
  variant.reviewedAt = nowIsoDate();

  writeAudit(actor, "variant.rejected", variant.id, {
    parentQuestionId: variant.parentQuestionId,
    reason: variant.rejectionReason,
  });

  return variant;
}

export function getTaxonomySnapshot() {
  const sections = [...sectionStore]
    .sort(compareByDisplayOrder)
    .map((section) => ({
      ...section,
      domainCount: domainStore.filter((domain) => domain.sectionSlug === section.slug).length,
    }));

  const domains = [...domainStore]
    .sort(compareByDisplayOrder)
    .map((domain) => ({
      ...domain,
      conceptCount: conceptStore.filter((concept) => concept.domainSlug === domain.slug).length,
    }));

  const concepts = [...conceptStore]
    .sort(compareByDisplayOrder)
    .map((concept) => ({
      ...concept,
      subskillCount: 0,
    }));

  return { sections, domains, concepts };
}

export function createSection(input: CreateSectionInput, actor: AdminActor): SectionRecord {
  const section: SectionRecord = {
    id: nextId("sec"),
    name: input.name.trim(),
    slug: input.slug.trim(),
    displayOrder: input.displayOrder,
  };
  sectionStore.push(section);
  writeAudit(actor, "taxonomy.section.created", section.id, { slug: section.slug });
  return section;
}

export function createDomain(input: CreateDomainInput, actor: AdminActor): DomainRecord | undefined {
  const sectionExists = sectionStore.some((section) => section.slug === input.sectionSlug);
  if (!sectionExists) {
    return undefined;
  }

  const domain: DomainRecord = {
    id: nextId("dom"),
    sectionSlug: input.sectionSlug.trim(),
    name: input.name.trim(),
    slug: input.slug.trim(),
    displayOrder: input.displayOrder,
  };
  domainStore.push(domain);
  writeAudit(actor, "taxonomy.domain.created", domain.id, {
    slug: domain.slug,
    sectionSlug: domain.sectionSlug,
  });
  return domain;
}

export function createConcept(input: CreateConceptInput, actor: AdminActor): ConceptRecord | undefined {
  const domainExists = domainStore.some((domain) => domain.slug === input.domainSlug);
  if (!domainExists) {
    return undefined;
  }

  const concept: ConceptRecord = {
    id: nextId("con"),
    domainSlug: input.domainSlug.trim(),
    name: input.name.trim(),
    slug: input.slug.trim(),
    displayOrder: input.displayOrder,
  };
  conceptStore.push(concept);
  writeAudit(actor, "taxonomy.concept.created", concept.id, {
    slug: concept.slug,
    domainSlug: concept.domainSlug,
  });
  return concept;
}

export function updateTaxonomySection(
  sectionId: string,
  input: UpdateSectionInput,
  actor: AdminActor,
): SectionRecord | undefined {
  const section = sectionStore.find((row) => row.id === sectionId);
  if (!section) {
    return undefined;
  }
  if (typeof input.name === "string") {
    section.name = input.name.trim();
  }
  if (typeof input.slug === "string") {
    section.slug = input.slug.trim();
  }
  if (typeof input.displayOrder === "number") {
    section.displayOrder = input.displayOrder;
  }
  writeAudit(actor, "taxonomy.section.updated", section.id, { slug: section.slug });
  return section;
}

export function updateTaxonomyDomain(
  domainId: string,
  input: UpdateDomainInput,
  actor: AdminActor,
): DomainRecord | undefined {
  const domain = domainStore.find((row) => row.id === domainId);
  if (!domain) {
    return undefined;
  }
  if (typeof input.name === "string") {
    domain.name = input.name.trim();
  }
  if (typeof input.slug === "string") {
    domain.slug = input.slug.trim();
  }
  if (typeof input.sectionSlug === "string") {
    const sectionExists = sectionStore.some((section) => section.slug === input.sectionSlug);
    if (!sectionExists) {
      return undefined;
    }
    domain.sectionSlug = input.sectionSlug.trim();
  }
  if (typeof input.displayOrder === "number") {
    domain.displayOrder = input.displayOrder;
  }
  writeAudit(actor, "taxonomy.domain.updated", domain.id, { slug: domain.slug });
  return domain;
}

export function updateTaxonomyConcept(
  conceptId: string,
  input: UpdateConceptInput,
  actor: AdminActor,
): ConceptRecord | undefined {
  const concept = conceptStore.find((row) => row.id === conceptId);
  if (!concept) {
    return undefined;
  }
  if (typeof input.name === "string") {
    concept.name = input.name.trim();
  }
  if (typeof input.slug === "string") {
    concept.slug = input.slug.trim();
  }
  if (typeof input.domainSlug === "string") {
    const domainExists = domainStore.some((domain) => domain.slug === input.domainSlug);
    if (!domainExists) {
      return undefined;
    }
    concept.domainSlug = input.domainSlug.trim();
  }
  if (typeof input.displayOrder === "number") {
    concept.displayOrder = input.displayOrder;
  }
  writeAudit(actor, "taxonomy.concept.updated", concept.id, { slug: concept.slug });
  return concept;
}

export function deleteTaxonomyEntity(
  kind: TaxonomyEntityKind,
  id: string,
  actor: AdminActor,
): boolean {
  if (kind === "section") {
    const index = sectionStore.findIndex((row) => row.id === id);
    if (index === -1) {
      return false;
    }
    const [removed] = sectionStore.splice(index, 1);
    for (let i = domainStore.length - 1; i >= 0; i -= 1) {
      if (domainStore[i]?.sectionSlug === removed?.slug) {
        const domainSlug = domainStore[i].slug;
        domainStore.splice(i, 1);
        for (let j = conceptStore.length - 1; j >= 0; j -= 1) {
          if (conceptStore[j]?.domainSlug === domainSlug) {
            conceptStore.splice(j, 1);
          }
        }
      }
    }
    writeAudit(actor, "taxonomy.section.deleted", id, { slug: removed?.slug });
    return true;
  }

  if (kind === "domain") {
    const index = domainStore.findIndex((row) => row.id === id);
    if (index === -1) {
      return false;
    }
    const [removed] = domainStore.splice(index, 1);
    for (let i = conceptStore.length - 1; i >= 0; i -= 1) {
      if (conceptStore[i]?.domainSlug === removed?.slug) {
        conceptStore.splice(i, 1);
      }
    }
    writeAudit(actor, "taxonomy.domain.deleted", id, { slug: removed?.slug });
    return true;
  }

  const conceptIndex = conceptStore.findIndex((row) => row.id === id);
  if (conceptIndex === -1) {
    return false;
  }
  const [removed] = conceptStore.splice(conceptIndex, 1);
  writeAudit(actor, "taxonomy.concept.deleted", id, { slug: removed?.slug });
  return true;
}

export function getRecentAuditEvents(limit = 20): AdminAuditEvent[] {
  return auditStore.slice(0, limit);
}

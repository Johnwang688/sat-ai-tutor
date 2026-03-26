export type SatSection = "reading-writing" | "math";

export type QuestionStatus = "draft" | "published";

export type VettedQuestionRecord = {
  id: string;
  status: QuestionStatus;
  section: SatSection;
  domainSlug: string;
  domainName: string;
  conceptSlug: string;
  conceptName: string;
  title: string;
  difficulty: 1 | 2 | 3 | 4 | 5;
  calculatorAllowed: boolean;
  desmosRelevant: boolean;
  answerSchema: string;
  explanationJson: string;
  updatedAt: string;
  publishedAt?: string;
};

export type VariantStatus = "pending" | "approved" | "rejected";
export type VariantAmbiguityRisk = "low" | "medium" | "high";

export type GeneratedVariantRecord = {
  id: string;
  parentQuestionId: string;
  conceptSlug: string;
  conceptName: string;
  validationScore: number;
  ambiguityRisk: VariantAmbiguityRisk;
  generatedAt: string;
  notes: string;
  status: VariantStatus;
  rejectionReason?: string;
  reviewedAt?: string;
};

export type SectionRecord = {
  id: string;
  slug: string;
  name: string;
  displayOrder: number;
};

export type DomainRecord = {
  id: string;
  sectionSlug: string;
  slug: string;
  name: string;
  displayOrder: number;
};

export type ConceptRecord = {
  id: string;
  domainSlug: string;
  slug: string;
  name: string;
  displayOrder: number;
};

export type AdminAuditAction =
  | "question.created"
  | "question.updated"
  | "question.published"
  | "variant.generated"
  | "variant.approved"
  | "variant.rejected"
  | "taxonomy.section.created"
  | "taxonomy.section.updated"
  | "taxonomy.section.deleted"
  | "taxonomy.domain.created"
  | "taxonomy.domain.updated"
  | "taxonomy.domain.deleted"
  | "taxonomy.concept.created"
  | "taxonomy.concept.updated"
  | "taxonomy.concept.deleted";

export type AdminAuditEvent = {
  id: string;
  actorId: string;
  action: AdminAuditAction;
  entityId: string;
  createdAt: string;
  metadata: Record<string, unknown>;
};

export type AdminActor = {
  id: string;
  role: "admin";
};

import { DEFAULT_PRACTICE_USER_ID } from "../practice/server";
import {
  getConceptBySlug as getConceptBySlugForUser,
  getDeterministicRecommendation as getRecommendation,
  getProgressOverview,
  type ConceptProgress,
  type RecentSession,
  type SectionProgress,
} from "./server";

export type { ConceptProgress, RecentSession, SectionProgress };

const overview = getProgressOverview(DEFAULT_PRACTICE_USER_ID);

export const sectionProgress: ReadonlyArray<SectionProgress> = overview.sectionProgress;
export const conceptProgress: ReadonlyArray<ConceptProgress> = overview.conceptProgress;
export const recentSessions: ReadonlyArray<RecentSession> = overview.recentSessions;

export function getDeterministicRecommendation() {
  return getRecommendation(overview.conceptProgress);
}

export function getConceptBySlug(slug: string): ConceptProgress | undefined {
  return getConceptBySlugForUser(slug, DEFAULT_PRACTICE_USER_ID);
}

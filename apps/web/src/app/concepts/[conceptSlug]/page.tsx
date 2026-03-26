import Link from "next/link";
import { StartConceptDrillButton } from "../../../features/practice/components/start-concept-drill-button";
import { DEFAULT_PRACTICE_USER_ID } from "../../../features/practice/server";
import {
  getConceptBySlug,
  getProgressOverview,
} from "../../../features/progress/server";

type ConceptDetailPageProps = {
  params: Promise<{
    conceptSlug: string;
  }>;
};

export default async function ConceptDetailPage({ params }: ConceptDetailPageProps) {
  const { conceptSlug } = await params;
  const fallbackConcept = getProgressOverview(DEFAULT_PRACTICE_USER_ID).conceptProgress[0];
  const concept = getConceptBySlug(conceptSlug, DEFAULT_PRACTICE_USER_ID) ?? fallbackConcept;

  return (
    <main style={{ margin: "0 auto", maxWidth: 980, padding: "2rem 1.25rem 3rem" }}>
      <header style={{ marginBottom: "1.25rem" }}>
        <p style={{ margin: "0 0 0.35rem" }}>
          {concept.section} | {concept.domain}
        </p>
        <h1 style={{ marginBottom: "0.35rem" }}>{concept.name}</h1>
        <p style={{ margin: 0 }}>
          Mastery: {concept.masteryPercent}% | Recent accuracy:{" "}
          {concept.recentAccuracyPercent}% | Attempts: {concept.attempts}
        </p>
      </header>

      <section style={panelStyle}>
        <h2 style={{ marginTop: 0 }}>Subskill signal</h2>
        <ul style={listStyle}>
          {concept.subskills.map((subskill) => (
            <li key={subskill.name}>
              {subskill.name}: {subskill.masteryPercent}% mastery over{" "}
              {subskill.attempts} attempts
            </li>
          ))}
        </ul>
        <p style={{ marginBottom: 0 }}>Last practiced: {concept.lastPracticedAt}</p>
      </section>

      <section style={{ marginTop: "1.25rem" }}>
        <h2>Deterministic next action</h2>
        <p style={{ marginBottom: "0.6rem" }}>
          Continue focused reps in this concept until mastery reaches at least 75%, then
          switch to a mixed mini quiz.
        </p>
        <div style={{ display: "flex", flexWrap: "wrap", gap: "0.65rem", alignItems: "center" }}>
          <StartConceptDrillButton
            conceptSlug={concept.slug}
            section={concept.section === "Math" ? "math" : "reading-writing"}
          />
          <Link href="/practice" style={secondaryButtonStyle}>
            Adjust practice setup
          </Link>
          <Link href="/dashboard" style={secondaryButtonStyle}>
            Back to dashboard
          </Link>
        </div>
      </section>
    </main>
  );
}

const panelStyle = {
  border: "1px solid #d7dce5",
  borderRadius: 12,
  padding: "1rem",
  backgroundColor: "#f8fafc",
} as const;

const listStyle = {
  margin: "0 0 0.75rem 1.1rem",
  padding: 0,
  lineHeight: 1.45,
} as const;

const secondaryButtonStyle = {
  display: "inline-block",
  borderRadius: 8,
  padding: "0.55rem 0.8rem",
  textDecoration: "none",
  fontWeight: 600,
  border: "1px solid #94a3b8",
  color: "#0f172a",
} as const;

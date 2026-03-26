import Link from "next/link";
import { conceptProgress, getConceptBySlug } from "../../../features/progress/mock-progress";

// TODO(practice-feature): Optional — use `POST /api/practice/generate-drill` to build a concept-targeted question set instead of linking straight to a demo session id.

type ConceptDetailPageProps = {
  params: {
    conceptSlug: string;
  };
};

export default function ConceptDetailPage({ params }: ConceptDetailPageProps) {
  const concept = getConceptBySlug(params.conceptSlug) ?? conceptProgress[0];

  return (
    <main style={{ margin: "0 auto", maxWidth: 980, padding: "2rem 1.25rem 3rem" }}>
      <header style={{ marginBottom: "1.25rem" }}>
        <p style={{ margin: "0 0 0.35rem" }}>
          {concept.section} | {concept.domain}
        </p>
        <h1 style={{ marginBottom: "0.35rem" }}>{concept.name}</h1>
        <p style={{ margin: 0 }}>
          Mastery: {concept.masteryPercent}% | Recent accuracy: {concept.recentAccuracyPercent}% | Attempts: {concept.attempts}
        </p>
      </header>

      <section style={panelStyle}>
        <h2 style={{ marginTop: 0 }}>Subskill signal</h2>
        <ul style={listStyle}>
          {concept.subskills.map((subskill) => (
            <li key={subskill.name}>
              {subskill.name}: {subskill.masteryPercent}% mastery over {subskill.attempts} attempts
            </li>
          ))}
        </ul>
        <p style={{ marginBottom: 0 }}>Last practiced: {concept.lastPracticedAt}</p>
      </section>

      <section style={{ marginTop: "1.25rem" }}>
        <h2>Deterministic next action</h2>
        <p style={{ marginBottom: "0.6rem" }}>
          Continue focused reps in this concept until mastery reaches at least 75%, then switch to a mixed mini quiz.
        </p>
        <div style={{ display: "flex", flexWrap: "wrap", gap: "0.65rem" }}>
          <Link href="/practice/session/sess-demo-linear" style={primaryButtonStyle}>
            Start concept drill now
          </Link>
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

const primaryButtonStyle = {
  display: "inline-block",
  borderRadius: 8,
  padding: "0.55rem 0.8rem",
  textDecoration: "none",
  fontWeight: 600,
  backgroundColor: "#0f172a",
  color: "#ffffff",
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

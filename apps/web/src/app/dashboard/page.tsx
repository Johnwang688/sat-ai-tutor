import Link from "next/link";
import {
  conceptProgress,
  getDeterministicRecommendation,
  recentSessions,
  sectionProgress,
} from "../../features/progress/mock-progress";

// TODO(progress-feature): Fetch dashboard payload from `GET /api/progress/overview` for the signed-in student only (section rollups, concept snapshot, recent sessions). Replace mock arrays below.

export default function DashboardPage() {
  const recommendation = getDeterministicRecommendation();

  return (
    <main style={{ margin: "0 auto", maxWidth: 1080, padding: "2rem 1.5rem 3rem" }}>
      <header style={{ marginBottom: "1.5rem" }}>
        <h1 style={{ marginBottom: "0.4rem" }}>Dashboard</h1>
        <p style={{ margin: 0 }}>
          Deterministic progress view for the authenticated student. Recommendations are rule-based from recent mastery data.
        </p>
      </header>

      <section style={{ marginBottom: "1.25rem" }}>
        <h2>Section progress</h2>
        <div style={cardGridStyle}>
          {sectionProgress.map((section) => (
            <article key={section.slug} style={cardStyle}>
              <h3 style={{ marginTop: 0 }}>{section.label}</h3>
              <p style={metricTextStyle}>Weighted mastery: {section.weightedMastery}%</p>
              <p style={metricTextStyle}>Accuracy: {section.accuracyPercent}%</p>
              <p style={metricTextStyle}>Attempted questions: {section.attempted}</p>
            </article>
          ))}
        </div>
      </section>

      <section style={{ marginBottom: "1.25rem" }}>
        <h2>Recommended next step</h2>
        <article style={highlightCardStyle}>
          <h3 style={{ marginTop: 0 }}>{recommendation.recommendationTitle}</h3>
          <p>{recommendation.reason}</p>
          <p style={{ marginBottom: 0 }}>
            <Link href={recommendation.targetRoute}>Open concept drill</Link>
          </p>
        </article>
      </section>

      <section style={{ marginBottom: "1.25rem" }}>
        <h2>Recent sessions</h2>
        <table style={tableStyle}>
          <thead>
            <tr>
              <th style={thStyle}>Session</th>
              <th style={thStyle}>Type</th>
              <th style={thStyle}>Section</th>
              <th style={thStyle}>Score</th>
              <th style={thStyle}>Completed</th>
            </tr>
          </thead>
          <tbody>
            {recentSessions.map((session) => (
              <tr key={session.id}>
                <td style={tdStyle}>
                  <Link href={`/review/${session.id}`}>{session.id}</Link>
                </td>
                <td style={tdStyle}>{session.type}</td>
                <td style={tdStyle}>{session.section}</td>
                <td style={tdStyle}>
                  {session.correct}/{session.total}
                </td>
                <td style={tdStyle}>{session.completedAt}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </section>

      <section>
        <h2>Concept focus snapshot</h2>
        <ul style={listStyle}>
          {conceptProgress.map((concept) => (
            <li key={concept.slug}>
              <Link href={`/concepts/${concept.slug}`}>{concept.name}</Link>: {concept.masteryPercent}% mastery,{" "}
              {concept.recentAccuracyPercent}% recent accuracy
            </li>
          ))}
        </ul>
      </section>
    </main>
  );
}

const cardGridStyle = {
  display: "grid",
  gap: "0.9rem",
  gridTemplateColumns: "repeat(auto-fit, minmax(220px, 1fr))",
} as const;

const cardStyle = {
  border: "1px solid #d7dce5",
  borderRadius: 12,
  padding: "0.9rem",
  backgroundColor: "#f8fafc",
} as const;

const highlightCardStyle = {
  border: "1px solid #cbd5e1",
  borderRadius: 12,
  padding: "1rem",
  backgroundColor: "#eef2ff",
} as const;

const metricTextStyle = {
  margin: "0.2rem 0",
} as const;

const tableStyle = {
  width: "100%",
  borderCollapse: "collapse",
} as const;

const thStyle = {
  borderBottom: "1px solid #cbd5e1",
  padding: "0.45rem",
  textAlign: "left",
} as const;

const tdStyle = {
  borderBottom: "1px solid #e2e8f0",
  padding: "0.45rem",
} as const;

const listStyle = {
  margin: "0 0 0 1.1rem",
  padding: 0,
  lineHeight: 1.45,
} as const;

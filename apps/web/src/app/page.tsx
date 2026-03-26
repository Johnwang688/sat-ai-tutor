import Link from "next/link";

const valuePoints = [
  {
    title: "Practice that mirrors the digital SAT",
    body: "Train with SAT-style Reading and Writing and Math modules with clear timing and review flow.",
  },
  {
    title: "Progress by concept, not guesswork",
    body: "Track mastery by section, domain, and concept so your next drill is data-driven.",
  },
  {
    title: "Tutor support without answer leakage",
    body: "Use hints and concept teaching during a session, then full explanations after submission.",
  },
] as const;

export default function HomePage() {
  return (
    <main style={{ margin: "0 auto", maxWidth: 1040, padding: "3rem 1.5rem 4rem" }}>
      <section style={{ marginBottom: "2.5rem" }}>
        <p style={{ fontWeight: 600, letterSpacing: "0.04em", textTransform: "uppercase" }}>
          SAT Prep Platform
        </p>
        <h1 style={{ fontSize: "2.25rem", lineHeight: 1.15, marginBottom: "0.75rem" }}>
          Structured SAT prep with targeted practice and an AI tutor that follows policy.
        </h1>
        <p style={{ maxWidth: 720, lineHeight: 1.5 }}>
          Build score gains with verified question sets, concept-level mastery tracking, and deterministic next-step recommendations.
        </p>
      </section>

      <section
        style={{
          display: "flex",
          flexWrap: "wrap",
          gap: "0.75rem",
          marginBottom: "2rem",
        }}
      >
        <Link href="/signup" style={buttonPrimaryStyle}>
          Start Free and Create Account
        </Link>
        <Link href="/login" style={buttonSecondaryStyle}>
          Login to Continue Practice
        </Link>
      </section>

      <section
        style={{
          display: "grid",
          gap: "1rem",
          gridTemplateColumns: "repeat(auto-fit, minmax(240px, 1fr))",
          marginBottom: "2rem",
        }}
      >
        {valuePoints.map((point) => (
          <article
            key={point.title}
            style={{
              border: "1px solid #d7dce5",
              borderRadius: 12,
              padding: "1rem",
              backgroundColor: "#f8fafc",
            }}
          >
            <h2 style={{ margin: "0 0 0.5rem", fontSize: "1.1rem" }}>{point.title}</h2>
            <p style={{ margin: 0, lineHeight: 1.45 }}>{point.body}</p>
          </article>
        ))}
      </section>

      <section style={{ borderTop: "1px solid #e5eaf3", paddingTop: "1rem" }}>
        <p style={{ margin: 0, lineHeight: 1.45 }}>
          Built for SAT-aligned practice. This app is not affiliated with or endorsed by the College Board.
        </p>
      </section>
    </main>
  );
}

const buttonPrimaryStyle = {
  display: "inline-block",
  backgroundColor: "#0f172a",
  borderRadius: 10,
  color: "#ffffff",
  fontWeight: 600,
  padding: "0.65rem 1rem",
  textDecoration: "none",
} as const;

const buttonSecondaryStyle = {
  display: "inline-block",
  backgroundColor: "#e2e8f0",
  borderRadius: 10,
  color: "#0f172a",
  fontWeight: 600,
  padding: "0.65rem 1rem",
  textDecoration: "none",
} as const;

import Link from "next/link";
import { practiceModes } from "../../features/practice/mock-practice";

const conceptOptions = [
  { slug: "linear-equations", label: "Linear Equations in One Variable" },
  { slug: "transitions", label: "Transitions" },
  { slug: "punctuation", label: "Punctuation" },
] as const;

export default function PracticePage() {
  return (
    <main style={{ margin: "0 auto", maxWidth: 1040, padding: "2rem 1.5rem 3rem" }}>
      <header style={{ marginBottom: "1.5rem" }}>
        <h1 style={{ marginBottom: "0.4rem" }}>Practice Launcher</h1>
        <p style={{ margin: 0 }}>
          Configure a V1 practice session, then call `POST /api/sessions/create` to start and redirect into `/practice/session/[sessionId]`.
        </p>
      </header>

      <section style={{ marginBottom: "1.25rem" }}>
        <h2>Mode options</h2>
        <div style={modeGridStyle}>
          {practiceModes.map((mode) => (
            <article key={mode.slug} style={modeCardStyle}>
              <h3 style={{ marginTop: 0 }}>{mode.title}</h3>
              <p style={{ marginTop: 0 }}>{mode.description}</p>
              <p style={smallTextStyle}>Question count: {mode.questionCount}</p>
              <p style={smallTextStyle}>
                Scored source: {mode.usesVerifiedQuestionsOnly ? "Verified question bank only" : "Mixed source"}
              </p>
            </article>
          ))}
        </div>
      </section>

      <section style={formPanelStyle}>
        <h2 style={{ marginTop: 0 }}>Session setup</h2>
        <form>
          <fieldset style={fieldSetStyle}>
            <legend style={legendStyle}>Session type</legend>
            <label style={optionStyle}>
              <input type="radio" name="sessionType" defaultChecked /> Concept Drill
            </label>
            <label style={optionStyle}>
              <input type="radio" name="sessionType" /> Mini Quiz
            </label>
            <label style={optionStyle}>
              <input type="radio" name="sessionType" /> Full Module
            </label>
          </fieldset>

          <label htmlFor="section" style={labelStyle}>
            Section
          </label>
          <select id="section" name="section" style={inputStyle} defaultValue="math">
            <option value="math">Math</option>
            <option value="reading-writing">Reading and Writing</option>
          </select>

          <label htmlFor="concept" style={labelStyle}>
            Concept filter (for drill mode)
          </label>
          <select id="concept" name="concept" style={inputStyle} defaultValue="linear-equations">
            {conceptOptions.map((concept) => (
              <option key={concept.slug} value={concept.slug}>
                {concept.label}
              </option>
            ))}
          </select>
        </form>

        <div style={{ display: "flex", flexWrap: "wrap", gap: "0.75rem", marginTop: "1rem" }}>
          <Link href="/practice/session/sess-demo-linear" style={startButtonStyle}>
            Start demo session
          </Link>
          <p style={{ margin: "0.4rem 0 0" }}>Server create endpoint wiring can replace this demo link without changing UI structure.</p>
        </div>
      </section>
    </main>
  );
}

const modeGridStyle = {
  display: "grid",
  gap: "0.9rem",
  gridTemplateColumns: "repeat(auto-fit, minmax(220px, 1fr))",
} as const;

const modeCardStyle = {
  border: "1px solid #d7dce5",
  borderRadius: 12,
  padding: "0.9rem",
  backgroundColor: "#f8fafc",
} as const;

const smallTextStyle = {
  margin: "0.25rem 0 0",
} as const;

const formPanelStyle = {
  border: "1px solid #d7dce5",
  borderRadius: 12,
  padding: "1rem",
} as const;

const fieldSetStyle = {
  border: "1px solid #e2e8f0",
  borderRadius: 10,
  padding: "0.6rem 0.75rem",
  marginBottom: "0.8rem",
} as const;

const legendStyle = {
  fontWeight: 600,
} as const;

const optionStyle = {
  display: "block",
  marginBottom: "0.35rem",
} as const;

const labelStyle = {
  display: "block",
  fontWeight: 600,
  marginBottom: "0.3rem",
  marginTop: "0.6rem",
} as const;

const inputStyle = {
  width: "100%",
  border: "1px solid #cbd5e1",
  borderRadius: 8,
  padding: "0.55rem 0.6rem",
} as const;

const startButtonStyle = {
  display: "inline-block",
  backgroundColor: "#0f172a",
  color: "#ffffff",
  borderRadius: 8,
  padding: "0.6rem 0.85rem",
  textDecoration: "none",
  fontWeight: 600,
} as const;

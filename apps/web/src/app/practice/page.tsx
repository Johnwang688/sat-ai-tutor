import { cookies } from "next/headers";
import { redirect } from "next/navigation";
import { parseAuthSessionFromCookies } from "../../features/auth/server";
import { conceptOptions, practiceModes } from "../../features/practice/mock-practice";
import {
  createSession,
  DEFAULT_PRACTICE_USER_ID,
  type SectionSlug,
  type SessionTypeSlug,
} from "../../features/practice/server";

function asSessionType(value: FormDataEntryValue | null): SessionTypeSlug {
  if (
    value === "concept-drill" ||
    value === "mini-quiz" ||
    value === "full-module"
  ) {
    return value;
  }

  return "concept-drill";
}

function asSection(value: FormDataEntryValue | null): SectionSlug {
  return value === "reading-writing" ? "reading-writing" : "math";
}

async function startPracticeAction(formData: FormData) {
  "use server";

  const cookieStore = await cookies();
  const session = parseAuthSessionFromCookies(cookieStore);
  const created = createSession({
    userId: session?.userId ?? DEFAULT_PRACTICE_USER_ID,
    sessionType: asSessionType(formData.get("sessionType")),
    section: asSection(formData.get("section")),
    conceptSlug: String(formData.get("concept") ?? "").trim() || undefined,
  });

  redirect(`/practice/session/${created.sessionId}`);
}

export default function PracticePage() {
  return (
    <main style={{ margin: "0 auto", maxWidth: 1040, padding: "2rem 1.5rem 3rem" }}>
      <header style={{ marginBottom: "1.5rem" }}>
        <h1 style={{ marginBottom: "0.4rem" }}>Practice Launcher</h1>
        <p style={{ margin: 0 }}>
          Configure a V1 practice session, start it immediately, and stay inside the student practice flow.
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
              <p style={smallTextStyle}>Time budget: {Math.floor(mode.durationSeconds / 60)} minutes</p>
              <p style={smallTextStyle}>
                Scored source: {mode.usesVerifiedQuestionsOnly ? "Verified question bank only" : "Mixed source"}
              </p>
            </article>
          ))}
        </div>
      </section>

      <section style={formPanelStyle}>
        <h2 style={{ marginTop: 0 }}>Session setup</h2>
        <form action={startPracticeAction}>
          <fieldset style={fieldSetStyle}>
            <legend style={legendStyle}>Session type</legend>
            <label style={optionStyle}>
              <input type="radio" name="sessionType" value="concept-drill" defaultChecked /> Concept Drill
            </label>
            <label style={optionStyle}>
              <input type="radio" name="sessionType" value="mini-quiz" /> Mini Quiz
            </label>
            <label style={optionStyle}>
              <input type="radio" name="sessionType" value="full-module" /> Full Module
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

          <div style={{ display: "flex", flexWrap: "wrap", gap: "0.75rem", marginTop: "1rem" }}>
            <button type="submit" style={startButtonStyle}>
              Start session
            </button>
            <p style={{ margin: "0.4rem 0 0" }}>
              Login and signup remain separate routes so this page stays focused on practice only.
            </p>
          </div>
        </form>
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
  border: "none",
  padding: "0.6rem 0.85rem",
  fontWeight: 600,
} as const;

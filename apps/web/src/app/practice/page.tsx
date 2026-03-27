import { PracticeLauncherForm } from "../../features/practice/components/practice-launcher-form";
import {
  getPracticeConceptOptions,
  getPracticeModeList,
} from "../../features/practice/server";

export default function PracticePage() {
  const modes = getPracticeModeList();
  const concepts = getPracticeConceptOptions();

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
          {modes.map((mode) => (
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
        <PracticeLauncherForm modes={modes} concepts={concepts} />
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
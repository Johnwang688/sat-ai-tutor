import Link from "next/link";
import { getSessionSnapshot } from "../../../../features/practice/mock-practice";

type PracticeSessionPageProps = {
  params: {
    sessionId: string;
  };
};

export default function PracticeSessionPage({ params }: PracticeSessionPageProps) {
  const session = getSessionSnapshot(params.sessionId);
  const activeQuestion = session.questionOrder[0];
  const minuteText = Math.floor(session.remainingSeconds / 60);
  const secondText = String(session.remainingSeconds % 60).padStart(2, "0");

  return (
    <main style={{ margin: "0 auto", maxWidth: 1160, padding: "1.5rem 1.25rem 2.5rem" }}>
      <header style={headerStyle}>
        <div>
          <h1 style={{ margin: 0 }}>
            Practice Session: {session.sessionType} ({session.section})
          </h1>
          <p style={{ margin: "0.35rem 0 0" }}>Session ID: {session.sessionId}</p>
        </div>
        <div style={timerStyle}>
          Time remaining: {minuteText}:{secondText}
        </div>
      </header>

      <section style={sessionGridStyle}>
        <article style={panelStyle}>
          <h2 style={{ marginTop: 0 }}>Question Navigator</h2>
          <div style={{ display: "flex", gap: "0.5rem", flexWrap: "wrap", marginBottom: "1rem" }}>
            {session.questionOrder.map((question, index) => (
              <button key={question.id} type="button" style={index === 0 ? activePillStyle : pillStyle}>
                {index + 1}
              </button>
            ))}
          </div>

          <h3 style={{ marginBottom: "0.4rem" }}>
            {activeQuestion.section} | {activeQuestion.domain} | {activeQuestion.concept}
          </h3>
          <p style={{ marginTop: 0, lineHeight: 1.5 }}>{activeQuestion.prompt}</p>

          <fieldset style={fieldSetStyle}>
            <legend style={{ fontWeight: 600 }}>Answer choices</legend>
            {activeQuestion.choices.map((choice, index) => (
              <label key={choice} style={choiceStyle}>
                <input type="radio" name="answer" value={index} disabled={activeQuestion.selectedChoiceIndex !== null} />
                <span>{choice}</span>
              </label>
            ))}
          </fieldset>

          <div style={{ display: "flex", gap: "0.6rem", flexWrap: "wrap", marginTop: "1rem" }}>
            <button type="button" style={primaryButtonStyle}>
              Save answer (placeholder)
            </button>
            <button type="button" style={secondaryButtonStyle}>
              Submit session (placeholder)
            </button>
            <Link href={`/review/${session.sessionId}`} style={linkButtonStyle}>
              Open review mock
            </Link>
          </div>
        </article>

        <aside style={panelStyle}>
          <h2 style={{ marginTop: 0 }}>Tutor Panel</h2>
          <p style={{ lineHeight: 1.45 }}>
            Mode: <strong>{session.tutorMode}</strong>. In-session policy allows hints and concept teaching without direct answer reveal.
          </p>
          <textarea
            rows={5}
            placeholder="Ask for a hint or concept explanation"
            style={{ width: "100%", borderRadius: 8, border: "1px solid #cbd5e1", padding: "0.55rem" }}
          />
          <button type="button" style={{ ...primaryButtonStyle, marginTop: "0.75rem", width: "100%" }}>
            Send to tutor (placeholder)
          </button>

          <div style={{ marginTop: "1rem" }}>
            <h3 style={{ marginBottom: "0.35rem" }}>Desmos extension point</h3>
            <p style={{ marginTop: 0 }}>
              {activeQuestion.desmosRelevant
                ? "This question is marked desmos_relevant. Embed calculator panel here when client integration is added."
                : "No calculator panel needed for this question."}
            </p>
          </div>
        </aside>
      </section>
    </main>
  );
}

const headerStyle = {
  display: "flex",
  justifyContent: "space-between",
  alignItems: "center",
  gap: "1rem",
  marginBottom: "1rem",
  flexWrap: "wrap",
} as const;

const timerStyle = {
  fontWeight: 700,
  border: "1px solid #334155",
  borderRadius: 999,
  padding: "0.35rem 0.75rem",
} as const;

const sessionGridStyle = {
  display: "grid",
  gap: "1rem",
  gridTemplateColumns: "repeat(auto-fit, minmax(300px, 1fr))",
} as const;

const panelStyle = {
  border: "1px solid #d7dce5",
  borderRadius: 12,
  padding: "1rem",
  backgroundColor: "#ffffff",
} as const;

const pillStyle = {
  border: "1px solid #94a3b8",
  borderRadius: 999,
  padding: "0.25rem 0.6rem",
  backgroundColor: "#f8fafc",
} as const;

const activePillStyle = {
  ...pillStyle,
  border: "1px solid #0f172a",
  backgroundColor: "#e2e8f0",
  fontWeight: 700,
} as const;

const fieldSetStyle = {
  border: "1px solid #e2e8f0",
  borderRadius: 8,
  padding: "0.65rem 0.75rem",
} as const;

const choiceStyle = {
  display: "flex",
  alignItems: "center",
  gap: "0.45rem",
  marginBottom: "0.45rem",
} as const;

const primaryButtonStyle = {
  border: "none",
  borderRadius: 8,
  padding: "0.55rem 0.8rem",
  backgroundColor: "#0f172a",
  color: "#ffffff",
  fontWeight: 600,
} as const;

const secondaryButtonStyle = {
  border: "1px solid #94a3b8",
  borderRadius: 8,
  padding: "0.55rem 0.8rem",
  backgroundColor: "#f8fafc",
  color: "#0f172a",
  fontWeight: 600,
} as const;

const linkButtonStyle = {
  display: "inline-block",
  border: "1px solid #94a3b8",
  borderRadius: 8,
  padding: "0.55rem 0.8rem",
  textDecoration: "none",
  color: "#0f172a",
  fontWeight: 600,
} as const;

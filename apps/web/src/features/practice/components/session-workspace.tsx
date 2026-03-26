"use client";

import Link from "next/link";
import { useEffect, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import type { SessionSnapshot } from "../server";

type TutorResponse = {
  reply: string;
};

type Props = {
  initialSnapshot: SessionSnapshot;
};

export function SessionWorkspace({ initialSnapshot }: Props) {
  const router = useRouter();
  const [isSavePending, startSaveTransition] = useTransition();
  const [isSubmitPending, startSubmitTransition] = useTransition();
  const [isTutorPending, startTutorTransition] = useTransition();
  const [snapshot, setSnapshot] = useState(initialSnapshot);
  const [activeQuestionIndex, setActiveQuestionIndex] = useState(0);
  const [remainingSeconds, setRemainingSeconds] = useState(
    initialSnapshot.remainingSeconds,
  );
  const [statusMessage, setStatusMessage] = useState<string | null>(null);
  const [tutorPrompt, setTutorPrompt] = useState("");
  const [tutorReply, setTutorReply] = useState<string | null>(null);

  useEffect(() => {
    const timer = window.setInterval(() => {
      setRemainingSeconds((previous) => Math.max(0, previous - 1));
    }, 1000);

    return () => window.clearInterval(timer);
  }, []);

  const activeQuestion = snapshot.questionOrder[activeQuestionIndex];
  const minuteText = Math.floor(remainingSeconds / 60);
  const secondText = String(remainingSeconds % 60).padStart(2, "0");

  if (!activeQuestion) {
    return (
      <main style={{ margin: "0 auto", maxWidth: 880, padding: "2rem 1.25rem" }}>
        <p>No questions are available for this session.</p>
      </main>
    );
  }

  function updateSelectedChoice(choiceIndex: number) {
    setSnapshot((previous) => ({
      ...previous,
      questionOrder: previous.questionOrder.map((question, index) =>
        index === activeQuestionIndex
          ? { ...question, selectedChoiceIndex: choiceIndex }
          : question,
      ),
    }));
  }

  function saveAnswer() {
    if (activeQuestion.selectedChoiceIndex === null) {
      setStatusMessage("Choose an answer before saving.");
      return;
    }

    setStatusMessage(null);
    startSaveTransition(async () => {
      try {
        const response = await fetch(
          `/api/sessions/${snapshot.sessionId}/answer`,
          {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
              questionId: activeQuestion.id,
              choiceIndex: activeQuestion.selectedChoiceIndex,
            }),
          },
        );
        const payload = (await response.json()) as
          | { error?: string; snapshot?: SessionSnapshot; answeredCount?: number; totalQuestions?: number }
          | undefined;
        if (!response.ok || !payload?.snapshot) {
          throw new Error(payload?.error ?? "Unable to save answer.");
        }
        setSnapshot(payload.snapshot);
        setStatusMessage(
          `Saved. ${payload.answeredCount ?? 0}/${payload.totalQuestions ?? 0} answered.`,
        );
      } catch (caughtError) {
        setStatusMessage(
          caughtError instanceof Error ? caughtError.message : "Unable to save answer.",
        );
      }
    });
  }

  function submitSession() {
    setStatusMessage(null);
    startSubmitTransition(async () => {
      try {
        const response = await fetch(`/api/sessions/${snapshot.sessionId}/submit`, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({}),
        });
        const payload = (await response.json()) as
          | { error?: string }
          | undefined;
        if (!response.ok) {
          throw new Error(payload?.error ?? "Unable to submit session.");
        }
        router.push(`/review/${snapshot.sessionId}`);
      } catch (caughtError) {
        setStatusMessage(
          caughtError instanceof Error ? caughtError.message : "Unable to submit session.",
        );
      }
    });
  }

  function sendTutorPrompt() {
    if (!tutorPrompt.trim()) {
      return;
    }
    setTutorReply(null);
    startTutorTransition(async () => {
      try {
        const response = await fetch("/api/tutor/respond", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            sessionId: snapshot.sessionId,
            questionId: activeQuestion.id,
            mode: "hint",
            message: tutorPrompt.trim(),
          }),
        });
        const payload = (await response.json()) as
          | TutorResponse
          | { error?: string };
        if (!response.ok || !("reply" in payload)) {
          throw new Error(
            "error" in payload && payload.error
              ? payload.error
              : "Unable to reach tutor.",
          );
        }
        setTutorReply(payload.reply);
      } catch (caughtError) {
        setTutorReply(
          caughtError instanceof Error ? caughtError.message : "Unable to reach tutor.",
        );
      }
    });
  }

  return (
    <main style={{ margin: "0 auto", maxWidth: 1160, padding: "1.5rem 1.25rem 2.5rem" }}>
      <header style={headerStyle}>
        <div>
          <h1 style={{ margin: 0 }}>
            Practice Session: {snapshot.sessionType} ({snapshot.section})
          </h1>
          <p style={{ margin: "0.35rem 0 0" }}>Session ID: {snapshot.sessionId}</p>
        </div>
        <div style={timerStyle}>
          Time remaining: {minuteText}:{secondText}
        </div>
      </header>

      <section style={sessionGridStyle}>
        <article style={panelStyle}>
          <h2 style={{ marginTop: 0 }}>Question Navigator</h2>
          <div style={{ display: "flex", gap: "0.5rem", flexWrap: "wrap", marginBottom: "1rem" }}>
            {snapshot.questionOrder.map((question, index) => (
              <button
                key={question.id}
                type="button"
                onClick={() => setActiveQuestionIndex(index)}
                style={index === activeQuestionIndex ? activePillStyle : pillStyle}
              >
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
                <input
                  type="radio"
                  name="answer"
                  value={index}
                  checked={activeQuestion.selectedChoiceIndex === index}
                  onChange={() => updateSelectedChoice(index)}
                />
                <span>{choice}</span>
              </label>
            ))}
          </fieldset>

          <div style={{ display: "flex", gap: "0.6rem", flexWrap: "wrap", marginTop: "1rem" }}>
            <button type="button" style={primaryButtonStyle} onClick={saveAnswer} disabled={isSavePending}>
              {isSavePending ? "Saving..." : "Save answer"}
            </button>
            <button type="button" style={secondaryButtonStyle} onClick={submitSession} disabled={isSubmitPending}>
              {isSubmitPending ? "Submitting..." : "Submit session"}
            </button>
            <Link href={`/review/${snapshot.sessionId}`} style={linkButtonStyle}>
              Open review
            </Link>
          </div>
          {statusMessage ? <p style={{ marginTop: "0.8rem" }}>{statusMessage}</p> : null}
        </article>

        <aside style={panelStyle}>
          <h2 style={{ marginTop: 0 }}>Tutor Panel</h2>
          <p style={{ lineHeight: 1.45 }}>
            Mode: <strong>{snapshot.tutorMode}</strong>. In-session policy allows hints and concept teaching without direct answer reveal.
          </p>
          <textarea
            rows={5}
            placeholder="Ask for a hint or concept explanation"
            style={{ width: "100%", borderRadius: 8, border: "1px solid #cbd5e1", padding: "0.55rem" }}
            value={tutorPrompt}
            onChange={(event) => setTutorPrompt(event.target.value)}
          />
          <button
            type="button"
            style={{ ...primaryButtonStyle, marginTop: "0.75rem", width: "100%" }}
            onClick={sendTutorPrompt}
            disabled={isTutorPending}
          >
            {isTutorPending ? "Sending..." : "Send to tutor"}
          </button>
          {tutorReply ? <p style={{ marginTop: "0.8rem", lineHeight: 1.45 }}>{tutorReply}</p> : null}

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
  cursor: "pointer",
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
  cursor: "pointer",
} as const;

const secondaryButtonStyle = {
  border: "1px solid #94a3b8",
  borderRadius: 8,
  padding: "0.55rem 0.8rem",
  backgroundColor: "#f8fafc",
  color: "#0f172a",
  fontWeight: 600,
  cursor: "pointer",
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

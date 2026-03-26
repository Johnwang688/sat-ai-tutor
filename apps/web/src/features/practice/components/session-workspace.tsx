"use client";

import Link from "next/link";
import { useEffect, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import type { CSSProperties } from "react";
import type { SessionSnapshot } from "../server";

type TutorResponse = {
  reply: string;
};

type Props = {
  initialSnapshot: SessionSnapshot;
};

type CalculatorMode = "graphing" | "scientific";
type CalculatorSize = "compact" | "standard" | "expanded";

const calculatorModeOptions: ReadonlyArray<{
  mode: CalculatorMode;
  label: string;
  url: string;
}> = [
  {
    mode: "graphing",
    label: "Graphing",
    url: "https://www.desmos.com/calculator?embed",
  },
  {
    mode: "scientific",
    label: "Scientific",
    url: "https://www.desmos.com/scientific?embed",
  },
];

const calculatorSizeOptions: ReadonlyArray<{
  size: CalculatorSize;
  label: string;
  width: number;
  height: number;
}> = [
  {
    size: "compact",
    label: "Shrink",
    width: 320,
    height: 420,
  },
  {
    size: "standard",
    label: "Standard",
    width: 420,
    height: 560,
  },
  {
    size: "expanded",
    label: "Expand",
    width: 520,
    height: 680,
  },
];

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
  const [isCalculatorHidden, setIsCalculatorHidden] = useState(true);
  const [calculatorMode, setCalculatorMode] = useState<CalculatorMode>("graphing");
  const [calculatorSize, setCalculatorSize] = useState<CalculatorSize>("standard");

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

  const isMathQuestion = activeQuestion.section === "Math";

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

  function openCalculator(nextMode?: CalculatorMode) {
    if (nextMode) {
      setCalculatorMode(nextMode);
    }
    setIsCalculatorHidden(false);
  }

  const activeCalculatorSize =
    calculatorSizeOptions.find((option) => option.size === calculatorSize)
    ?? calculatorSizeOptions[1];
  const activeCalculatorUrl =
    calculatorModeOptions.find((option) => option.mode === calculatorMode)?.url
    ?? calculatorModeOptions[0].url;

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
          {isMathQuestion ? (
            <div style={calculatorLauncherRowStyle}>
              <button
                type="button"
                style={calculatorLauncherButtonStyle}
                onClick={() => openCalculator()}
              >
                {isCalculatorHidden ? "Open calculator" : "Calculator open"}
              </button>
            </div>
          ) : null}
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

          {isMathQuestion ? (
            <div style={{ marginTop: "1rem" }}>
              <h3 style={{ marginBottom: "0.35rem" }}>Calculator Access</h3>
              <p style={{ marginTop: 0, lineHeight: 1.45 }}>
                Use the top-left calculator button to open a floating Desmos window. Switch between graphing and scientific modes, resize it, or hide it without leaving the question.
              </p>
            </div>
          ) : null}
        </aside>
      </section>

      {isMathQuestion && !isCalculatorHidden ? (
        <section
          aria-label="Floating calculator"
          style={{
            ...calculatorWindowStyle,
            width: `min(calc(100vw - 2rem), ${activeCalculatorSize.width}px)`,
            height: `min(calc(100vh - 2rem), ${activeCalculatorSize.height}px)`,
          }}
        >
          <div style={calculatorWindowHeaderStyle}>
            <div>
              <strong>Calculator</strong>
              <p style={calculatorWindowCaptionStyle}>
                {activeQuestion.desmosRelevant
                  ? "Recommended for this question"
                  : "Available for this math question"}
              </p>
            </div>
            <button
              type="button"
              style={calculatorHideButtonStyle}
              onClick={() => setIsCalculatorHidden(true)}
            >
              Hide
            </button>
          </div>

          <div style={calculatorControlBarStyle}>
            <div style={calculatorChipGroupStyle}>
              {calculatorModeOptions.map((option) => (
                <button
                  key={option.mode}
                  type="button"
                  style={
                    option.mode === calculatorMode
                      ? activeCalculatorChipStyle
                      : calculatorChipStyle
                  }
                  onClick={() => openCalculator(option.mode)}
                >
                  {option.label}
                </button>
              ))}
            </div>

            <div style={calculatorChipGroupStyle}>
              {calculatorSizeOptions.map((option) => (
                <button
                  key={option.size}
                  type="button"
                  style={
                    option.size === calculatorSize
                      ? activeCalculatorChipStyle
                      : calculatorChipStyle
                  }
                  onClick={() => setCalculatorSize(option.size)}
                >
                  {option.label}
                </button>
              ))}
            </div>
          </div>

          <div style={calculatorViewportStyle}>
            <iframe
              title={`${calculatorMode} calculator`}
              src={activeCalculatorUrl}
              style={calculatorFrameStyle}
              allow="clipboard-write"
            />
          </div>
        </section>
      ) : null}
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

const calculatorLauncherRowStyle: CSSProperties = {
  display: "flex",
  justifyContent: "flex-start",
  marginBottom: "0.75rem",
};

const calculatorLauncherButtonStyle: CSSProperties = {
  border: "1px solid #0f172a",
  borderRadius: 999,
  padding: "0.45rem 0.85rem",
  backgroundColor: "#eff6ff",
  color: "#0f172a",
  fontWeight: 700,
  cursor: "pointer",
};

const calculatorWindowStyle: CSSProperties = {
  position: "fixed",
  top: "1rem",
  right: "1rem",
  zIndex: 40,
  display: "flex",
  flexDirection: "column",
  border: "1px solid #cbd5e1",
  borderRadius: 18,
  backgroundColor: "#ffffff",
  boxShadow: "0 24px 80px rgba(15, 23, 42, 0.18)",
  overflow: "hidden",
};

const calculatorWindowHeaderStyle: CSSProperties = {
  display: "flex",
  alignItems: "flex-start",
  justifyContent: "space-between",
  gap: "1rem",
  padding: "0.85rem 1rem 0.5rem",
  borderBottom: "1px solid #e2e8f0",
  backgroundColor: "#f8fafc",
};

const calculatorWindowCaptionStyle: CSSProperties = {
  margin: "0.2rem 0 0",
  color: "#475569",
  fontSize: "0.92rem",
};

const calculatorHideButtonStyle: CSSProperties = {
  border: "1px solid #94a3b8",
  borderRadius: 999,
  padding: "0.4rem 0.8rem",
  backgroundColor: "#ffffff",
  color: "#0f172a",
  fontWeight: 600,
  cursor: "pointer",
};

const calculatorControlBarStyle: CSSProperties = {
  display: "flex",
  justifyContent: "space-between",
  gap: "0.75rem",
  flexWrap: "wrap",
  padding: "0.75rem 1rem",
  borderBottom: "1px solid #e2e8f0",
  backgroundColor: "#ffffff",
};

const calculatorChipGroupStyle: CSSProperties = {
  display: "flex",
  gap: "0.5rem",
  flexWrap: "wrap",
};

const calculatorChipStyle: CSSProperties = {
  border: "1px solid #cbd5e1",
  borderRadius: 999,
  padding: "0.4rem 0.75rem",
  backgroundColor: "#ffffff",
  color: "#334155",
  fontWeight: 600,
  cursor: "pointer",
};

const activeCalculatorChipStyle: CSSProperties = {
  ...calculatorChipStyle,
  border: "1px solid #0f172a",
  backgroundColor: "#dbeafe",
  color: "#0f172a",
};

const calculatorViewportStyle: CSSProperties = {
  flex: 1,
  minHeight: 0,
  backgroundColor: "#ffffff",
};

const calculatorFrameStyle: CSSProperties = {
  width: "100%",
  height: "100%",
  border: "none",
  backgroundColor: "#ffffff",
};

"use client";

import Link from "next/link";
import { useEffect, useRef, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import type { CSSProperties } from "react";
import {
  buildStoredPracticeReview,
  buildSubmittedPracticeSession,
  saveStoredPracticeReview,
  saveStoredPracticeSession,
} from "../client-storage";
import type { ClientSessionState } from "../server";

type TutorResponse = {
  reply: string;
};

type Props = {
  initialSession: ClientSessionState;
};

type CalculatorMode = "graphing" | "scientific";
type CalculatorSize = "compact" | "standard" | "expanded";
type CalculatorExpression = {
  id: string;
  latex: string;
};

type DesmosMathBounds = {
  left: number;
  right: number;
  bottom: number;
  top: number;
};

type DesmosExpression = {
  id: string;
  latex?: string;
};

type DesmosGraphingCalculator = {
  setExpression: (expression: DesmosExpression) => void;
  removeExpression: (expression: Pick<DesmosExpression, "id">) => void;
  getMathBounds?: () => DesmosMathBounds;
  setMathBounds?: (bounds: DesmosMathBounds) => void;
  resize: () => void;
  destroy: () => void;
};

declare global {
  interface Window {
    Desmos?: {
      GraphingCalculator: (
        element: HTMLElement,
        options?: Record<string, unknown>,
      ) => DesmosGraphingCalculator;
    };
  }
}

const DESMOS_SCRIPT_ID = "desmos-calculator-api";
const DEFAULT_GRAPH_BOUNDS: DesmosMathBounds = {
  left: -10,
  right: 10,
  bottom: -10,
  top: 10,
};
const DEFAULT_GRAPH_EXPRESSIONS: ReadonlyArray<CalculatorExpression> = [
  { id: "expression-1", latex: "y=x" },
];

let desmosScriptPromise: Promise<void> | null = null;

function ensureDesmosScript(apiKey: string): Promise<void> {
  if (typeof window === "undefined") {
    return Promise.reject(new Error("Desmos can only load in the browser."));
  }

  if (window.Desmos) {
    return Promise.resolve();
  }

  if (desmosScriptPromise) {
    return desmosScriptPromise;
  }

  desmosScriptPromise = new Promise<void>((resolve, reject) => {
    const existingScript = document.getElementById(DESMOS_SCRIPT_ID) as
      | HTMLScriptElement
      | null;

    if (existingScript) {
      existingScript.addEventListener("load", () => resolve(), { once: true });
      existingScript.addEventListener(
        "error",
        () => reject(new Error("Unable to load the Desmos calculator.")),
        { once: true },
      );
      return;
    }

    const script = document.createElement("script");
    script.id = DESMOS_SCRIPT_ID;
    script.src = `https://www.desmos.com/api/v1.11/calculator.js?apiKey=${encodeURIComponent(apiKey)}`;
    script.async = true;
    script.onload = () => resolve();
    script.onerror = () => reject(new Error("Unable to load the Desmos calculator."));
    document.head.appendChild(script);
  });

  return desmosScriptPromise;
}

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

export function SessionWorkspace({ initialSession }: Props) {
  const router = useRouter();
  const [isTutorPending, startTutorTransition] = useTransition();
  const [snapshot, setSnapshot] = useState(initialSession);
  const [activeQuestionIndex, setActiveQuestionIndex] = useState(0);
  const [remainingSeconds, setRemainingSeconds] = useState(
    initialSession.remainingSeconds,
  );
  const [statusMessage, setStatusMessage] = useState<string | null>(null);
  const [lastSavedAt, setLastSavedAt] = useState<string | null>(null);
  const [tutorPrompt, setTutorPrompt] = useState("");
  const [tutorReply, setTutorReply] = useState<string | null>(null);
  const [isTutorOpen, setIsTutorOpen] = useState(true);
  const [isCalculatorHidden, setIsCalculatorHidden] = useState(true);
  const [calculatorMode, setCalculatorMode] = useState<CalculatorMode>("graphing");
  const [calculatorSize, setCalculatorSize] = useState<CalculatorSize>("standard");
  const [graphExpressions, setGraphExpressions] = useState<ReadonlyArray<CalculatorExpression>>(
    DEFAULT_GRAPH_EXPRESSIONS,
  );
  const [calculatorStatusMessage, setCalculatorStatusMessage] = useState<string | null>(
    null,
  );
  const graphContainerRef = useRef<HTMLDivElement | null>(null);
  const graphingCalculatorRef = useRef<DesmosGraphingCalculator | null>(null);
  const syncedExpressionIdsRef = useRef<ReadonlyArray<string>>([]);

  useEffect(() => {
    if (snapshot.status === "submitted") {
      return undefined;
    }

    const timer = window.setInterval(() => {
      setRemainingSeconds((previous) => Math.max(0, previous - 1));
    }, 1000);

    return () => window.clearInterval(timer);
  }, [snapshot.status]);

  const activeQuestion = snapshot.questionOrder[activeQuestionIndex];
  const minuteText = Math.floor(remainingSeconds / 60);
  const secondText = String(remainingSeconds % 60).padStart(2, "0");
  const isSessionSubmitted = snapshot.status === "submitted";

  if (!activeQuestion) {
    return (
      <main style={{ margin: "0 auto", maxWidth: 880, padding: "2rem 1.25rem" }}>
        <p>No questions are available for this session.</p>
      </main>
    );
  }

  const isMathQuestion = activeQuestion.section === "Math";
  const desmosApiKey = process.env.NEXT_PUBLIC_DESMOS_API_KEY?.trim();

  function updateSnapshot(
    updater: (current: ClientSessionState) => ClientSessionState,
  ) {
    setSnapshot((previous) => {
      const next = updater(previous);
      saveStoredPracticeSession(next);
      return next;
    });
  }

  function updateSelectedChoice(choiceIndex: number) {
    updateSnapshot((previous) => ({
      ...previous,
      questionOrder: previous.questionOrder.map((question, index) =>
        index === activeQuestionIndex
          ? { ...question, selectedChoiceIndex: choiceIndex }
          : question,
      ),
    }));
    setLastSavedAt(new Date().toLocaleTimeString([], { hour: "numeric", minute: "2-digit" }));
    setStatusMessage("Answer saved automatically.");
  }

  function submitSession() {
    if (isSessionSubmitted) {
      router.push(`/review/${snapshot.sessionId}`);
      return;
    }

    setStatusMessage(null);
    const submittedSession = buildSubmittedPracticeSession({
      ...snapshot,
      remainingSeconds,
    });
    const review = buildStoredPracticeReview(submittedSession);

    saveStoredPracticeSession(submittedSession);
    saveStoredPracticeReview(review);
    setSnapshot(submittedSession);
    setRemainingSeconds(0);
    router.push(`/review/${snapshot.sessionId}`);
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

  function updateGraphExpression(expressionId: string, latex: string) {
    setGraphExpressions((previous) =>
      previous.map((expression) =>
        expression.id === expressionId ? { ...expression, latex } : expression,
      ),
    );
  }

  function addGraphExpression() {
    setGraphExpressions((previous) => [
      ...previous,
      {
        id: `expression-${previous.length + 1}-${Date.now().toString(36)}`,
        latex: "",
      },
    ]);
  }

  function removeGraphExpression(expressionId: string) {
    setGraphExpressions((previous) => {
      if (previous.length === 1) {
        return [{ ...previous[0], latex: "" }];
      }

      return previous.filter((expression) => expression.id !== expressionId);
    });
  }

  function zoomGraph(scaleFactor: number) {
    const calculator = graphingCalculatorRef.current;
    const bounds = calculator?.getMathBounds?.();
    if (!calculator?.setMathBounds || !bounds) {
      return;
    }

    const centerX = (bounds.left + bounds.right) / 2;
    const centerY = (bounds.top + bounds.bottom) / 2;
    const halfWidth = ((bounds.right - bounds.left) / 2) * scaleFactor;
    const halfHeight = ((bounds.top - bounds.bottom) / 2) * scaleFactor;

    calculator.setMathBounds({
      left: centerX - halfWidth,
      right: centerX + halfWidth,
      bottom: centerY - halfHeight,
      top: centerY + halfHeight,
    });
  }

  function resetGraphView() {
    graphingCalculatorRef.current?.setMathBounds?.(DEFAULT_GRAPH_BOUNDS);
  }

  const activeCalculatorSize =
    calculatorSizeOptions.find((option) => option.size === calculatorSize)
    ?? calculatorSizeOptions[1];
  const activeCalculatorUrl =
    calculatorModeOptions.find((option) => option.mode === calculatorMode)?.url
    ?? calculatorModeOptions[0].url;

  useEffect(() => {
    if (calculatorMode !== "graphing" || isCalculatorHidden) {
      graphingCalculatorRef.current?.destroy();
      graphingCalculatorRef.current = null;
      syncedExpressionIdsRef.current = [];
      return;
    }

    if (!desmosApiKey) {
      setCalculatorStatusMessage(
        "Add NEXT_PUBLIC_DESMOS_API_KEY to enable the interactive graphing calculator.",
      );
      return;
    }

    let isCancelled = false;
    setCalculatorStatusMessage("Loading graphing calculator...");

    void ensureDesmosScript(desmosApiKey)
      .then(() => {
        if (isCancelled) {
          return;
        }

        if (!window.Desmos || !graphContainerRef.current) {
          throw new Error("The graphing calculator did not initialize correctly.");
        }

        const calculator =
          graphingCalculatorRef.current
          ?? window.Desmos.GraphingCalculator(graphContainerRef.current, {
            keypad: true,
            expressions: false,
            settingsMenu: false,
            expressionsTopbar: false,
            zoomButtons: false,
          });
        graphingCalculatorRef.current = calculator;
        calculator.setMathBounds?.(DEFAULT_GRAPH_BOUNDS);
        calculator.resize();
        setCalculatorStatusMessage(null);
      })
      .catch((error: unknown) => {
        if (isCancelled) {
          return;
        }

        setCalculatorStatusMessage(
          error instanceof Error
            ? error.message
            : "Unable to load the graphing calculator.",
        );
      });

    return () => {
      isCancelled = true;
    };
  }, [calculatorMode, desmosApiKey, isCalculatorHidden]);

  useEffect(() => {
    const calculator = graphingCalculatorRef.current;
    if (!calculator) {
      return;
    }

    const currentIds = graphExpressions.map((expression) => expression.id);
    const removedIds = syncedExpressionIdsRef.current.filter(
      (expressionId) => !currentIds.includes(expressionId),
    );

    for (const expressionId of removedIds) {
      calculator.removeExpression({ id: expressionId });
    }

    for (const expression of graphExpressions) {
      if (expression.latex.trim()) {
        calculator.setExpression({
          id: expression.id,
          latex: expression.latex,
        });
      } else {
        calculator.removeExpression({ id: expression.id });
      }
    }

    syncedExpressionIdsRef.current = currentIds;
    calculator.resize();
  }, [graphExpressions]);

  return (
    <main style={{ margin: "0 auto", maxWidth: 1340, padding: "1.5rem 1.25rem 2.5rem" }}>
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
        <article style={questionPanelStyle}>
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

          <section style={questionPromptCardStyle}>
            <h3 style={{ margin: 0, marginBottom: "0.65rem", fontSize: "1.15rem" }}>
              {activeQuestion.section} | {activeQuestion.domain} | {activeQuestion.concept}
            </h3>
            <p style={questionPromptTextStyle}>{activeQuestion.prompt}</p>
          </section>

          <fieldset style={fieldSetStyle}>
            <legend style={answerLegendStyle}>Answer choices</legend>
            {activeQuestion.choices.map((choice, index) => (
              <label key={choice} style={choiceStyle}>
                <input
                  type="radio"
                  name="answer"
                  value={index}
                  checked={activeQuestion.selectedChoiceIndex === index}
                  disabled={isSessionSubmitted}
                  onChange={() => updateSelectedChoice(index)}
                />
                <span style={choiceTextStyle}>{choice}</span>
              </label>
            ))}
          </fieldset>

          <div style={{ display: "flex", gap: "0.6rem", flexWrap: "wrap", marginTop: "1rem" }}>
            <button type="button" style={secondaryButtonStyle} onClick={submitSession}>
              {isSessionSubmitted ? "Open review" : "Submit session"}
            </button>
            <Link href={`/review/${snapshot.sessionId}`} style={linkButtonStyle}>
              Open review
            </Link>
          </div>
          <p style={autoSaveCaptionStyle}>
            Answers save automatically as you click. {lastSavedAt ? `Last saved at ${lastSavedAt}.` : "Choose an option to save your first answer."}
          </p>
          {statusMessage ? <p style={{ marginTop: "0.8rem" }}>{statusMessage}</p> : null}

          {isMathQuestion ? (
            <div style={mathHelperNoteStyle}>
              <h3 style={{ margin: 0, marginBottom: "0.35rem" }}>Calculator Access</h3>
              <p style={{ margin: 0, lineHeight: 1.55 }}>
                Open the floating calculator from the top of this panel to graph equations, zoom the view, and test math ideas without leaving the question.
              </p>
            </div>
          ) : null}
        </article>
      </section>

      {isTutorOpen ? (
        <section
          aria-label="AI tutor"
          style={tutorWindowStyle}
        >
          <div style={tutorWindowHeaderStyle}>
            <div>
              <strong>AI Tutor</strong>
              <p style={tutorWindowCaptionStyle}>
                Mode: <strong>{snapshot.tutorMode}</strong>
              </p>
            </div>
            <button type="button" style={calculatorHideButtonStyle} onClick={() => setIsTutorOpen(false)}>
              Hide
            </button>
          </div>

          <div style={tutorWindowBodyStyle}>
            <p style={tutorWindowHelpTextStyle}>
              Ask for a hint, a concept refresher, or a next step. The tutor stays within the in-session no-answer-reveal policy.
            </p>
            <textarea
              rows={5}
              placeholder="Ask for a hint or concept explanation"
              style={tutorTextareaStyle}
              value={tutorPrompt}
              onChange={(event) => setTutorPrompt(event.target.value)}
            />
            <button
              type="button"
              style={{ ...primaryButtonStyle, width: "100%" }}
              onClick={sendTutorPrompt}
              disabled={isTutorPending}
            >
              {isTutorPending ? "Sending..." : "Send to tutor"}
            </button>
            <div style={tutorResponseShellStyle}>
              {tutorReply ? (
                <p style={tutorResponseTextStyle}>{tutorReply}</p>
              ) : (
                <p style={tutorEmptyStateStyle}>Your tutor response will appear here.</p>
              )}
            </div>
          </div>
        </section>
      ) : (
        <button
          type="button"
          style={tutorLauncherStyle}
          onClick={() => setIsTutorOpen(true)}
        >
          Open AI Tutor
        </button>
      )}

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

            <div style={{ display: "flex", gap: "0.75rem", flexWrap: "wrap", alignItems: "center" }}>
              {calculatorMode === "graphing" ? (
                <div style={calculatorChipGroupStyle}>
                  <button type="button" style={calculatorChipStyle} onClick={() => zoomGraph(0.8)}>
                    Zoom in
                  </button>
                  <button type="button" style={calculatorChipStyle} onClick={() => zoomGraph(1.25)}>
                    Zoom out
                  </button>
                  <button type="button" style={calculatorChipStyle} onClick={resetGraphView}>
                    Reset view
                  </button>
                </div>
              ) : null}

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
          </div>

          <div style={calculatorViewportStyle}>
            {calculatorMode === "graphing" ? (
              <div style={graphingCalculatorLayoutStyle}>
                <section style={graphExpressionPanelStyle}>
                  <div style={graphExpressionHeaderStyle}>
                    <div>
                      <strong>Equations</strong>
                      <p style={graphExpressionCaptionStyle}>
                        Type one expression per row. Example: `y=x^2-4` or `x=3`.
                      </p>
                    </div>
                    <button type="button" style={calculatorChipStyle} onClick={addGraphExpression}>
                      Add equation
                    </button>
                  </div>

                  <div style={graphExpressionListStyle}>
                    {graphExpressions.map((expression, index) => (
                      <div key={expression.id} style={graphExpressionRowStyle}>
                        <label style={graphExpressionLabelStyle} htmlFor={expression.id}>
                          y{index + 1}
                        </label>
                        <input
                          id={expression.id}
                          type="text"
                          value={expression.latex}
                          onChange={(event) =>
                            updateGraphExpression(expression.id, event.target.value)
                          }
                          placeholder="Enter an equation"
                          style={graphExpressionInputStyle}
                        />
                        <button
                          type="button"
                          style={graphExpressionRemoveButtonStyle}
                          onClick={() => removeGraphExpression(expression.id)}
                          aria-label={`Remove equation ${index + 1}`}
                        >
                          Remove
                        </button>
                      </div>
                    ))}
                  </div>

                  {calculatorStatusMessage ? (
                    <p style={calculatorStatusStyle}>{calculatorStatusMessage}</p>
                  ) : (
                    <p style={calculatorStatusHintStyle}>
                      Pan directly on the graph, scroll to zoom, or use the quick zoom buttons above.
                    </p>
                  )}
                </section>

                <div style={graphViewportShellStyle}>
                  <div ref={graphContainerRef} style={graphViewportStyle} />
                </div>
              </div>
            ) : (
              <iframe
                title={`${calculatorMode} calculator`}
                src={activeCalculatorUrl}
                style={calculatorFrameStyle}
                allow="clipboard-write"
              />
            )}
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
  display: "block",
} as const;

const panelStyle = {
  border: "1px solid #d7dce5",
  borderRadius: 12,
  padding: "1rem",
  backgroundColor: "#ffffff",
} as const;

const questionPanelStyle = {
  ...panelStyle,
  padding: "1.35rem",
} as const;

const questionPromptCardStyle = {
  border: "1px solid #dbe4f0",
  borderRadius: 16,
  padding: "1.1rem 1.15rem",
  marginBottom: "1rem",
  backgroundColor: "#f8fbff",
} as const;

const questionPromptTextStyle = {
  margin: 0,
  lineHeight: 1.7,
  fontSize: "1.08rem",
  whiteSpace: "pre-wrap",
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
  borderRadius: 14,
  padding: "0.9rem 1rem",
  backgroundColor: "#ffffff",
} as const;

const choiceStyle = {
  display: "flex",
  alignItems: "flex-start",
  gap: "0.7rem",
  marginBottom: "0.85rem",
  padding: "0.75rem 0.8rem",
  borderRadius: 12,
  backgroundColor: "#f8fafc",
} as const;

const answerLegendStyle = {
  fontWeight: 700,
  padding: "0 0.3rem",
  fontSize: "1rem",
} as const;

const choiceTextStyle = {
  fontSize: "1.03rem",
  lineHeight: 1.6,
} as const;

const autoSaveCaptionStyle = {
  marginTop: "0.9rem",
  color: "#475569",
  lineHeight: 1.5,
} as const;

const mathHelperNoteStyle = {
  marginTop: "1.1rem",
  border: "1px solid #dbe4f0",
  borderRadius: 14,
  padding: "0.95rem 1rem",
  backgroundColor: "#f8fbff",
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

const graphingCalculatorLayoutStyle: CSSProperties = {
  display: "grid",
  gridTemplateColumns: "minmax(260px, 320px) minmax(0, 1fr)",
  gap: "0.75rem",
  height: "100%",
  padding: "0.75rem",
};

const graphExpressionPanelStyle: CSSProperties = {
  display: "flex",
  flexDirection: "column",
  gap: "0.75rem",
  minHeight: 0,
  border: "1px solid #e2e8f0",
  borderRadius: 14,
  backgroundColor: "#f8fafc",
  padding: "0.85rem",
};

const graphExpressionHeaderStyle: CSSProperties = {
  display: "flex",
  justifyContent: "space-between",
  alignItems: "flex-start",
  gap: "0.75rem",
  flexWrap: "wrap",
};

const graphExpressionCaptionStyle: CSSProperties = {
  margin: "0.2rem 0 0",
  color: "#475569",
  fontSize: "0.9rem",
  lineHeight: 1.45,
};

const graphExpressionListStyle: CSSProperties = {
  display: "flex",
  flexDirection: "column",
  gap: "0.65rem",
  overflowY: "auto",
};

const graphExpressionRowStyle: CSSProperties = {
  display: "grid",
  gridTemplateColumns: "48px minmax(0, 1fr)",
  gap: "0.5rem",
  alignItems: "center",
};

const graphExpressionLabelStyle: CSSProperties = {
  fontWeight: 700,
  color: "#0f172a",
};

const graphExpressionInputStyle: CSSProperties = {
  width: "100%",
  border: "1px solid #cbd5e1",
  borderRadius: 10,
  padding: "0.6rem 0.75rem",
  fontSize: "0.98rem",
};

const graphExpressionRemoveButtonStyle: CSSProperties = {
  gridColumn: "2 / 3",
  justifySelf: "flex-start",
  border: "1px solid #cbd5e1",
  borderRadius: 999,
  padding: "0.35rem 0.7rem",
  backgroundColor: "#ffffff",
  color: "#475569",
  fontWeight: 600,
  cursor: "pointer",
};

const calculatorStatusStyle: CSSProperties = {
  margin: 0,
  color: "#7c2d12",
  lineHeight: 1.45,
};

const calculatorStatusHintStyle: CSSProperties = {
  margin: 0,
  color: "#475569",
  lineHeight: 1.45,
};

const graphViewportShellStyle: CSSProperties = {
  minWidth: 0,
  minHeight: 0,
  border: "1px solid #e2e8f0",
  borderRadius: 14,
  overflow: "hidden",
  backgroundColor: "#ffffff",
};

const graphViewportStyle: CSSProperties = {
  width: "100%",
  height: "100%",
  minHeight: 360,
  backgroundColor: "#ffffff",
};

const calculatorFrameStyle: CSSProperties = {
  width: "100%",
  height: "100%",
  border: "none",
  backgroundColor: "#ffffff",
};

const tutorWindowStyle: CSSProperties = {
  position: "fixed",
  right: "1rem",
  bottom: "1rem",
  zIndex: 45,
  width: "min(calc(100vw - 2rem), 380px)",
  minHeight: 460,
  maxHeight: "min(calc(100vh - 2rem), 640px)",
  display: "flex",
  flexDirection: "column",
  border: "1px solid #cbd5e1",
  borderRadius: 20,
  backgroundColor: "#ffffff",
  boxShadow: "0 24px 80px rgba(15, 23, 42, 0.2)",
  overflow: "hidden",
};

const tutorWindowHeaderStyle: CSSProperties = {
  display: "flex",
  justifyContent: "space-between",
  alignItems: "flex-start",
  gap: "1rem",
  padding: "0.95rem 1rem 0.75rem",
  borderBottom: "1px solid #e2e8f0",
  backgroundColor: "#f8fafc",
};

const tutorWindowCaptionStyle: CSSProperties = {
  margin: "0.2rem 0 0",
  color: "#475569",
  fontSize: "0.93rem",
};

const tutorWindowBodyStyle: CSSProperties = {
  display: "flex",
  flexDirection: "column",
  gap: "0.8rem",
  padding: "1rem",
  minHeight: 0,
  flex: 1,
};

const tutorWindowHelpTextStyle: CSSProperties = {
  margin: 0,
  color: "#334155",
  lineHeight: 1.5,
};

const tutorTextareaStyle: CSSProperties = {
  width: "100%",
  minHeight: 110,
  resize: "vertical",
  borderRadius: 12,
  border: "1px solid #cbd5e1",
  padding: "0.7rem 0.8rem",
  lineHeight: 1.5,
};

const tutorResponseShellStyle: CSSProperties = {
  flex: 1,
  minHeight: 140,
  overflowY: "auto",
  border: "1px solid #e2e8f0",
  borderRadius: 14,
  padding: "0.9rem",
  backgroundColor: "#f8fafc",
};

const tutorResponseTextStyle: CSSProperties = {
  margin: 0,
  lineHeight: 1.6,
  whiteSpace: "pre-wrap",
};

const tutorEmptyStateStyle: CSSProperties = {
  margin: 0,
  color: "#64748b",
  lineHeight: 1.5,
};

const tutorLauncherStyle: CSSProperties = {
  position: "fixed",
  right: "1rem",
  bottom: "1rem",
  zIndex: 45,
  border: "none",
  borderRadius: 999,
  padding: "0.85rem 1.15rem",
  backgroundColor: "#0f172a",
  color: "#ffffff",
  fontWeight: 700,
  boxShadow: "0 18px 40px rgba(15, 23, 42, 0.22)",
  cursor: "pointer",
};

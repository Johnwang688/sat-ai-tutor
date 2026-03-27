"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { getStoredPracticeReview } from "../client-storage";
import type { SessionReview } from "../server";

type Props = {
  sessionId: string;
};

export function ReviewWorkspaceLoader({ sessionId }: Props) {
  const [review, setReview] = useState<SessionReview | null>(null);
  const [isResolved, setIsResolved] = useState(false);

  useEffect(() => {
    setReview(getStoredPracticeReview(sessionId));
    setIsResolved(true);
  }, [sessionId]);

  if (!isResolved) {
    return (
      <main style={{ margin: "0 auto", maxWidth: 860, padding: "2rem 1.25rem" }}>
        <p>Loading your review...</p>
      </main>
    );
  }

  if (!review) {
    return (
      <main style={{ margin: "0 auto", maxWidth: 860, padding: "2rem 1.25rem 3rem" }}>
        <h1>Session Review</h1>
        <p>This session has not been submitted yet, so no scored review is available.</p>
        <p>
          <Link href={`/practice/session/${sessionId}`}>Return to your session</Link>
        </p>
      </main>
    );
  }

  return (
    <main style={{ margin: "0 auto", maxWidth: 1040, padding: "2rem 1.25rem 3rem" }}>
      <header style={{ marginBottom: "1.25rem" }}>
        <h1 style={{ marginBottom: "0.45rem" }}>Session Review</h1>
        <p style={{ margin: 0 }}>
          Read-only scoring review for submitted session <strong>{review.sessionId}</strong>.
        </p>
      </header>

      <section style={summaryPanelStyle}>
        <h2 style={{ marginTop: 0 }}>Score summary</h2>
        <p>
          {review.scoreSummary.correct}/{review.scoreSummary.total} correct on {review.scoreSummary.submittedAt}.
        </p>

        <h3>Concept breakdown</h3>
        <ul style={listStyle}>
          {review.conceptBreakdown.map((entry) => (
            <li key={entry.concept}>
              {entry.concept}: {entry.correct}/{entry.total}
            </li>
          ))}
        </ul>
      </section>

      <section style={{ marginTop: "1rem" }}>
        <h2>Question review</h2>
        <div style={{ display: "grid", gap: "0.75rem" }}>
          {review.questions.map((question) => (
            <article key={question.id} style={questionCardStyle}>
              <h3 style={{ marginTop: 0 }}>
                {question.id} {question.isCorrect ? "Correct" : "Needs review"}
              </h3>
              <p>{question.prompt}</p>
              <p style={{ margin: "0.3rem 0" }}>
                Your answer: <strong>{question.selectedChoice}</strong>
              </p>
              <p style={{ margin: "0.3rem 0" }}>
                Correct answer: <strong>{question.correctChoice}</strong>
              </p>
              <p style={{ marginBottom: 0 }}>Explanation: {question.explanation}</p>
            </article>
          ))}
        </div>
      </section>

      <section style={{ marginTop: "1.25rem" }}>
        <h2>Next step</h2>
        <p style={{ marginBottom: "0.45rem" }}>
          Start another focused drill, launch a mixed session, or return to the dashboard.
        </p>
        <p style={{ margin: 0 }}>
          <Link href="/practice">Open practice launcher</Link> or return to <Link href="/dashboard">dashboard</Link>.
        </p>
      </section>
    </main>
  );
}

const summaryPanelStyle = {
  border: "1px solid #d7dce5",
  borderRadius: 12,
  padding: "1rem",
  backgroundColor: "#f8fafc",
} as const;

const questionCardStyle = {
  border: "1px solid #d7dce5",
  borderRadius: 10,
  padding: "0.9rem",
} as const;

const listStyle = {
  margin: "0 0 0 1.1rem",
  padding: 0,
  lineHeight: 1.45,
} as const;
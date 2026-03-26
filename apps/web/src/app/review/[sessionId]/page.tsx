import Link from "next/link";
import { getSessionReview } from "../../../features/practice/mock-practice";
import { getDeterministicRecommendation } from "../../../features/progress/mock-progress";

// TODO(practice-feature): Load review payload from persisted post-submit data for `params.sessionId` (replace `getSessionReview` mock) so explanations and scores match what `submit` stored.

type ReviewPageProps = {
  params: {
    sessionId: string;
  };
};

export default function ReviewPage({ params }: ReviewPageProps) {
  const review = getSessionReview(params.sessionId);
  const recommendation = getDeterministicRecommendation();

  return (
    <main style={{ margin: "0 auto", maxWidth: 1040, padding: "2rem 1.25rem 3rem" }}>
      <header style={{ marginBottom: "1.25rem" }}>
        <h1 style={{ marginBottom: "0.45rem" }}>Session Review</h1>
        <p style={{ margin: 0 }}>
          Read-only scoring review for submitted session <strong>{review.sessionId}</strong>. Full explanations are available after submission.
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
        <h2>Recommended next practice</h2>
        <p style={{ marginBottom: "0.45rem" }}>{recommendation.reason}</p>
        <p style={{ margin: 0 }}>
          <Link href={recommendation.targetRoute}>{recommendation.recommendationTitle}</Link> or return to{" "}
          <Link href="/dashboard">dashboard</Link>.
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

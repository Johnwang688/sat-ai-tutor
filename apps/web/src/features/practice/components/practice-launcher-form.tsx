"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import type { PracticeMode, SessionTypeSlug } from "../server";

type ConceptOption = {
  slug: string;
  label: string;
};

type Props = {
  modes: ReadonlyArray<PracticeMode>;
  concepts: ReadonlyArray<ConceptOption>;
};

export function PracticeLauncherForm({ modes, concepts }: Props) {
  const router = useRouter();
  const [isPending, startTransition] = useTransition();
  const [error, setError] = useState<string | null>(null);
  const [sessionType, setSessionType] = useState<SessionTypeSlug>("concept-drill");
  const [section, setSection] = useState<"math" | "reading-writing">("math");
  const [concept, setConcept] = useState(concepts[0]?.slug ?? "linear-equations");

  function handleSubmit(event: React.FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setError(null);

    startTransition(async () => {
      try {
        const response = await fetch("/api/sessions/create", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            sessionType,
            section,
            conceptSlug: sessionType === "concept-drill" ? concept : undefined,
          }),
        });

        if (!response.ok) {
          const payload = (await response.json().catch(() => null)) as
            | { error?: string }
            | null;
          throw new Error(payload?.error ?? "Unable to create session.");
        }

        const payload = (await response.json()) as {
          sessionId: string;
        };
        router.push(`/practice/session/${payload.sessionId}`);
      } catch (caughtError) {
        setError(
          caughtError instanceof Error
            ? caughtError.message
            : "Unable to create session.",
        );
      }
    });
  }

  return (
    <form onSubmit={handleSubmit}>
      <fieldset style={fieldSetStyle}>
        <legend style={legendStyle}>Session type</legend>
        {modes.map((mode) => (
          <label key={mode.slug} style={optionStyle}>
            <input
              type="radio"
              name="sessionType"
              value={mode.slug}
              checked={sessionType === mode.slug}
              onChange={() => setSessionType(mode.slug)}
            />{" "}
            {mode.title}
          </label>
        ))}
      </fieldset>

      <label htmlFor="section" style={labelStyle}>
        Section
      </label>
      <select
        id="section"
        name="section"
        style={inputStyle}
        value={section}
        onChange={(event) =>
          setSection(event.target.value as "math" | "reading-writing")
        }
      >
        <option value="math">Math</option>
        <option value="reading-writing">Reading and Writing</option>
      </select>

      <label htmlFor="concept" style={labelStyle}>
        Concept filter (for drill mode)
      </label>
      <select
        id="concept"
        name="concept"
        style={inputStyle}
        value={concept}
        onChange={(event) => setConcept(event.target.value)}
        disabled={sessionType !== "concept-drill"}
      >
        {concepts.map((option) => (
          <option key={option.slug} value={option.slug}>
            {option.label}
          </option>
        ))}
      </select>

      <button type="submit" style={startButtonStyle} disabled={isPending}>
        {isPending ? "Starting..." : "Start session"}
      </button>
      {error ? <p style={errorStyle}>{error}</p> : null}
    </form>
  );
}

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
  marginTop: "1rem",
  display: "inline-block",
  backgroundColor: "#0f172a",
  color: "#ffffff",
  borderRadius: 8,
  border: "none",
  padding: "0.6rem 0.85rem",
  textDecoration: "none",
  fontWeight: 600,
  cursor: "pointer",
} as const;

const errorStyle = {
  margin: "0.7rem 0 0",
  color: "#991b1b",
} as const;

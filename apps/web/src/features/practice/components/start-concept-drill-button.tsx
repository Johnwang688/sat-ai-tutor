"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { saveStoredPracticeSession } from "../client-storage";
import type { ClientSessionState } from "../server";

type Props = {
  conceptSlug: string;
  section: "math" | "reading-writing";
};

export function StartConceptDrillButton({ conceptSlug, section }: Props) {
  const router = useRouter();
  const [isPending, startTransition] = useTransition();
  const [error, setError] = useState<string | null>(null);

  function handleStart() {
    setError(null);
    startTransition(async () => {
      try {
        const response = await fetch("/api/sessions/create", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            sessionType: "concept-drill",
            conceptSlug,
            section,
          }),
        });
        const payload = (await response.json()) as
          | { sessionId?: string; clientSession?: ClientSessionState; error?: string }
          | undefined;
        if (!response.ok || !payload?.sessionId || !payload.clientSession) {
          throw new Error(payload?.error ?? "Unable to start concept drill.");
        }
        saveStoredPracticeSession(payload.clientSession);
        router.push(`/practice/session/${payload.sessionId}`);
      } catch (caughtError) {
        setError(
          caughtError instanceof Error
            ? caughtError.message
            : "Unable to start concept drill.",
        );
      }
    });
  }

  return (
    <div>
      <button
        type="button"
        onClick={handleStart}
        disabled={isPending}
        style={primaryButtonStyle}
      >
        {isPending ? "Starting..." : "Start concept drill now"}
      </button>
      {error ? <p style={{ marginTop: "0.6rem", color: "#991b1b" }}>{error}</p> : null}
    </div>
  );
}

const primaryButtonStyle = {
  display: "inline-block",
  borderRadius: 8,
  padding: "0.55rem 0.8rem",
  textDecoration: "none",
  fontWeight: 600,
  backgroundColor: "#0f172a",
  color: "#ffffff",
  border: "none",
  cursor: "pointer",
} as const;

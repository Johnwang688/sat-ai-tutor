"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { getStoredPracticeSession } from "../client-storage";
import type { ClientSessionState } from "../server";
import { SessionWorkspace } from "./session-workspace";

type Props = {
  sessionId: string;
};

export function SessionWorkspaceLoader({ sessionId }: Props) {
  const [session, setSession] = useState<ClientSessionState | null>(null);
  const [isResolved, setIsResolved] = useState(false);

  useEffect(() => {
    setSession(getStoredPracticeSession(sessionId));
    setIsResolved(true);
  }, [sessionId]);

  if (!isResolved) {
    return (
      <main style={{ margin: "0 auto", maxWidth: 880, padding: "2rem 1.25rem" }}>
        <p>Loading your practice session...</p>
      </main>
    );
  }

  if (!session) {
    return (
      <main style={{ margin: "0 auto", maxWidth: 880, padding: "2rem 1.25rem 3rem" }}>
        <h1>Practice Session</h1>
        <p>
          This session is not available in browser storage. Start a new session from the practice launcher or reopen the session on the same browser where it was started.
        </p>
        <p>
          <Link href="/practice">Go to practice launcher</Link>
        </p>
      </main>
    );
  }

  return <SessionWorkspace initialSession={session} />;
}
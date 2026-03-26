import { notFound } from "next/navigation";
import { SessionWorkspace } from "../../../../features/practice/components/session-workspace";
import {
  DEFAULT_PRACTICE_USER_ID,
  getSessionSnapshot,
} from "../../../../features/practice/server";

type PracticeSessionPageProps = {
  params: Promise<{
    sessionId: string;
  }>;
};

export default async function PracticeSessionPage({
  params,
}: PracticeSessionPageProps) {
  const { sessionId } = await params;
  const session = getSessionSnapshot(sessionId, DEFAULT_PRACTICE_USER_ID);

  if (!session) {
    notFound();
  }

  return <SessionWorkspace initialSnapshot={session} />;
}

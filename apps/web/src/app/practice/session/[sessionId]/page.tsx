import { SessionWorkspaceLoader } from "../../../../features/practice/components/session-workspace-loader";

type PracticeSessionPageProps = {
  params: Promise<{
    sessionId: string;
  }>;
};

export default async function PracticeSessionPage({
  params,
}: PracticeSessionPageProps) {
  const { sessionId } = await params;

  return <SessionWorkspaceLoader sessionId={sessionId} />;
}

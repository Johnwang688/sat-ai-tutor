import { ReviewWorkspaceLoader } from "../../../features/practice/components/review-workspace-loader";

type ReviewPageProps = {
  params: Promise<{
    sessionId: string;
  }>;
};

export default async function ReviewPage({ params }: ReviewPageProps) {
  const { sessionId } = await params;
  return <ReviewWorkspaceLoader sessionId={sessionId} />;
}

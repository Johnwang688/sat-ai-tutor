import { RouteScreen } from "../../../components/route-screen";

export default function AdminReviewQueuePage() {
  return (
    <RouteScreen
      title="Admin Review Queue"
      summary="Review workflow for AI-generated variants before approval or rejection."
      nextFiles={["apps/web/src/app/api/README.md", "apps/web/src/features/README.md"]}
    />
  );
}

/*
TODO(admin-review-queue):
Implement the admin review queue here.

Scope:
- Show pending generated variants with validation context.
- Support approve and reject actions with audit logging.
- Keep this page focused on review workflow, not question authoring.

Naming:
- Use `ReviewQueue...` for queue UI and `Variant...` for generated content UI.
- Do not call generated items `questions` in code when they are still pending
  review.
*/

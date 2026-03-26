import { RouteScreen } from "../../../components/route-screen";

export default function ReviewPage() {
  return (
    <RouteScreen
      title="Session Review"
      summary="Post-session review with correctness, explanations, and suggested next practice."
      nextFiles={["apps/web/src/app/dashboard/page.tsx", "apps/web/src/app/api/README.md"]}
    />
  );
}

/*
TODO(session-review):
Implement the completed-session review route here.

Scope:
- Show final score summary, question-by-question review, and concept breakdown.
- Allow full explanations because the session is already submitted.
- Link the student to the next recommended drill or concept page.
- Keep review data read-only; do not mutate scoring results from this screen.

Naming:
- Files for completed-session review should use the `review` noun, not
  `results`, so route and code terms stay aligned.
*/

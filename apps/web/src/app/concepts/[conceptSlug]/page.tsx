import { RouteScreen } from "../../../components/route-screen";

export default function ConceptDetailPage() {
  return (
    <RouteScreen
      title="Concept Detail"
      summary="Concept-focused view for mastery details, subskills, and follow-up drill entry points."
      nextFiles={["apps/web/src/app/practice/page.tsx", "apps/web/src/features/README.md"]}
    />
  );
}

/*
TODO(concept-detail-page):
Implement the concept detail route here.

Scope:
- Load the concept by slug and show its related subskills.
- Show the student's current mastery state and recent practice signal.
- Offer a direct drill CTA for this concept.
- Keep V1 recommendations deterministic and data-backed.

Naming:
- Route params should stay `conceptSlug`.
- Use the `Concept...` prefix for route-specific components.
*/

import { RouteScreen } from "../../components/route-screen";

export default function DashboardPage() {
  return (
    <RouteScreen
      title="Dashboard"
      summary="Student progress overview with mastery, recent sessions, and recommended next steps."
      nextFiles={["apps/web/src/features/README.md", "apps/web/src/app/review/[sessionId]/page.tsx"]}
    />
  );
}

/*
TODO(progress-dashboard):
Implement the student dashboard using deterministic progress data.

Scope:
- Show section/domain/concept progress at a high level.
- Include recent sessions and next recommended practice.
- Keep V1 recommendations rule-based; do not add AI study planning yet.
- Protect this route so students only see their own data.

Naming:
- Dashboard components should use the `Dashboard...` prefix only if they are
  specific to this route.
- Cross-route progress components should use the `Progress...` prefix.
*/

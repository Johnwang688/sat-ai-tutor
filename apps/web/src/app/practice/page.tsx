import { RouteScreen } from "../../components/route-screen";

export default function PracticePage() {
  return (
    <RouteScreen
      title="Practice"
      summary="Launcher for concept drills, mini quizzes, and full section-style modules."
      nextFiles={["apps/web/src/app/practice/session/[sessionId]/page.tsx", "apps/web/src/app/api/README.md"]}
    />
  );
}

/*
TODO(practice-launcher):
Implement the session creation screen for all V1 practice modes.

Scope:
- Let the student choose session type and section.
- Allow concept filtering for drill mode.
- Call the future `POST /api/sessions/create` route and redirect into the
  created session.
- Keep this page focused on setup; do not render live question logic here.

Naming:
- Use `Practice...` for shared practice UI and `Session...` for active-session
  code only.
*/

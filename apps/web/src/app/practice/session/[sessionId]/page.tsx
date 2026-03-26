import { RouteScreen } from "../../../../components/route-screen";

export default function PracticeSessionPage() {
  return (
    <RouteScreen
      title="Practice Session"
      summary="Active question session with timer, question renderer, tutor panel, and optional Desmos."
      nextFiles={["apps/web/src/features/README.md", "apps/web/src/app/api/README.md"]}
    />
  );
}

/*
TODO(practice-session-shell):
Implement the live practice session route here.

Scope:
- Load the session snapshot and ordered questions by `sessionId`.
- Render question UI for Reading/Writing and Math with a clear extension point
  for Desmos on relevant Math items.
- Support answer submission, timer display, question navigation, and tutor side
  panel integration.
- Keep scoring and persistence on the server; the client should only manage
  route-local interaction state.

Naming:
- Route-local components can use `Session...` names.
- Reusable question components should use `Question...` names and live in the
  practice feature slice.
*/

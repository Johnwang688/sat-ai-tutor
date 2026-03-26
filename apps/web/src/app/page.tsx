import { RouteScreen } from "../components/route-screen";

export default function HomePage() {
  return (
    <RouteScreen
      title="SAT AI Tutor"
      summary="Marketing landing page and first entry point for students, parents, and admins."
      nextFiles={["apps/web/src/app/login/page.tsx", "apps/web/src/app/signup/page.tsx"]}
    />
  );
}

/*
TODO(marketing-home):
Implement the V1 landing page here.

Scope:
- Explain the product in plain SAT-focused language.
- Add clear calls to action for sign up and login.
- Keep this page lightweight; do not add pricing or billing flows in V1.

Naming:
- Marketing-only components can use the `Marketing...` prefix if they are not
  reused elsewhere.
*/

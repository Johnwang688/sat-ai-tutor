import { RouteScreen } from "../../components/route-screen";

export default function LoginPage() {
  return (
    <RouteScreen
      title="Login"
      summary="Student and admin login entry point for Supabase Auth."
      nextFiles={["apps/web/src/features/README.md", "apps/web/src/server/env.ts"]}
    />
  );
}

/*
TODO(auth-login-flow):
Implement the V1 login route with Supabase Auth.

Scope:
- Support email/password first.
- Leave magic link as an optional secondary path, not a required dependency.
- Redirect students to `/dashboard` and admins to `/admin` after success.
- Keep form UI simple and move shared auth form pieces into the `auth` feature
  slice once they exist.

Naming:
- Shared auth components should use the `Auth...` prefix.
- Server auth helpers should use verb-first names like `requireUser`.
*/

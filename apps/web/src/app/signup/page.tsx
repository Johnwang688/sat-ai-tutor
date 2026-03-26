import { RouteScreen } from "../../components/route-screen";

export default function SignupPage() {
  return (
    <RouteScreen
      title="Sign Up"
      summary="Account creation flow for new SAT students before profile bootstrap."
      nextFiles={["apps/web/src/features/README.md", "supabase/migrations/0001_core_schema.sql"]}
    />
  );
}

/*
TODO(auth-signup-flow):
Implement the V1 sign-up flow and profile bootstrap here.

Scope:
- Create the auth account.
- Create the matching `profiles` row after successful sign up.
- Keep optional settings/profile enrichment minimal in V1.
- Send new users to `/dashboard` after account creation is complete.

Naming:
- Profile bootstrap files should use the `profile` noun in the file name.
- Do not mix `user` and `profile` names when the code is touching the public
  profile table.
*/

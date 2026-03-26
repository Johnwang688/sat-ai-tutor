import { RouteScreen } from "../../components/route-screen";

export default function SettingsPage() {
  return (
    <RouteScreen
      title="Settings"
      summary="Student profile and lightweight app preferences."
      nextFiles={["supabase/migrations/0001_core_schema.sql", "apps/web/src/features/README.md"]}
    />
  );
}

/*
TODO(settings-page):
Implement the minimal V1 settings route here.

Scope:
- Let the student view/update lightweight profile data.
- Keep this route limited to user-owned settings and preferences.
- Do not add billing or subscription management yet.

Naming:
- Use `Settings...` for route-only components.
- Use `Profile...` when the code is specifically about the `profiles` table.
*/

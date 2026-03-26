import { RouteScreen } from "../../components/route-screen";

export default function AdminPage() {
  return (
    <RouteScreen
      title="Admin"
      summary="Admin landing page for content operations, review queue, and taxonomy tools."
      nextFiles={[
        "apps/web/src/app/admin/questions/page.tsx",
        "apps/web/src/app/admin/review-queue/page.tsx",
        "apps/web/src/app/admin/concepts/page.tsx",
      ]}
    />
  );
}

/*
TODO(admin-home):
Implement the minimal admin landing page here.

Scope:
- Show links and lightweight counts for draft questions, review queue, and
  taxonomy maintenance.
- Protect this route with a server-side admin role check.
- Keep admin-specific UI separate from student dashboard code.

Naming:
- Admin route components should use the `Admin...` prefix.
- Server role checks should use explicit names like `requireAdmin`.
*/

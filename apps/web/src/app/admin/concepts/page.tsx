import { RouteScreen } from "../../../components/route-screen";

export default function AdminConceptsPage() {
  return (
    <RouteScreen
      title="Admin Concepts"
      summary="Taxonomy management for sections, domains, concepts, and subskills."
      nextFiles={["supabase/migrations/0001_core_schema.sql", "apps/web/src/features/README.md"]}
    />
  );
}

/*
TODO(admin-taxonomy-tools):
Implement the taxonomy management route here.

Scope:
- Manage sections, domains, concepts, and subskills with stable slugs and
  display order.
- Keep taxonomy editing explicit and auditable.
- Prevent naming drift between database records, route slugs, and question tags.

Naming:
- Use the SAT hierarchy terms exactly as written in the design doc:
  `section`, `domain`, `concept`, `subskill`.
*/

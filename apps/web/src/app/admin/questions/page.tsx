import { RouteScreen } from "../../../components/route-screen";

export default function AdminQuestionsPage() {
  return (
    <RouteScreen
      title="Admin Questions"
      summary="Question creation and editing area for vetted SAT content."
      nextFiles={["apps/web/src/app/api/README.md", "supabase/migrations/0001_core_schema.sql"]}
    />
  );
}

/*
TODO(admin-question-editor):
Implement the admin question editor here.

Scope:
- Support draft creation and updates for vetted question content.
- Capture taxonomy links, answer schema, explanation content, and calculator
  flags.
- Keep question editing separate from variant review logic.

Naming:
- Use `QuestionEditor...` for editor-specific UI.
- Use `question` for vetted base content and `variant` only for generated
  derivative content.
*/

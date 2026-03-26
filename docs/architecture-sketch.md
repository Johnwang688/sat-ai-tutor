# SAT AI Tutor App Architecture Sketch

This is a minimal V1 scaffold based on `requirements/engineering-design-document.md`.

The goal of this sketch is to lock the file layout, route names, and naming rules before feature work starts. It intentionally avoids deep abstractions and does not try to fully implement Next.js, Supabase, or OpenAI wiring yet.

## Repository Shape

```text
/apps
  /web
    /src
      /app
        layout.tsx
        page.tsx
        /login/page.tsx
        /signup/page.tsx
        /dashboard/page.tsx
        /practice/page.tsx
        /practice/session/[sessionId]/page.tsx
        /review/[sessionId]/page.tsx
        /concepts/[conceptSlug]/page.tsx
        /settings/page.tsx
        /admin/page.tsx
        /admin/questions/page.tsx
        /admin/review-queue/page.tsx
        /admin/concepts/page.tsx
        /api/README.md
      /components
        route-screen.tsx
      /features
        README.md
      /server
        env.ts
        /db/client.ts
/packages
  /schemas
    /src/index.ts
  /prompts
    /src/index.ts
/supabase
  /migrations
    0001_core_schema.sql
/.env.example
```

## Naming Rules

- Route segments stay lowercase and match the URL exactly: `practice`, `review-queue`, `settings`.
- Dynamic route folders use camelCase inside brackets: `[sessionId]`, `[conceptSlug]`, `[questionId]`, `[variantId]`.
- Shared files use kebab-case names: `route-screen.tsx`, `client.ts`.
- Next.js reserved files keep framework names: `page.tsx`, `layout.tsx`, `route.ts`.
- Exported React components use PascalCase: `RouteScreen`, `PracticePage`, `AdminQuestionsPage`.
- Functions use camelCase verbs: `createSession`, `submitAnswer`, `respondToTutor`.
- Feature folders stay lowercase and singular at the top level: `auth`, `practice`, `tutor`, `progress`, `admin`.
- Database tables use plural snake_case: `practice_sessions`, `session_answers`, `mastery_scores`.
- Database columns use snake_case. Foreign keys are `<table>_id`. JSON payload columns end in `_json`. Timestamps end in `_at`.
- Zod schema exports should use `XSchema` names. Request/response schemas should use `CreateSessionInputSchema`, `TutorResponseSchema`, and similar verb-first names.
- Prompt exports should use clear IDs instead of vague names: `tutorSystemPrompt`, `tutorRevealPolicyPrompt`.

## Minimal Feature Ownership

- `auth`: sign up, log in, profile bootstrap, route protection.
- `practice`: session creation, question rendering, answer submission, session scoring, review flow.
- `tutor`: tutor context builder, reveal policy, prompt assembly, streaming, tutor panel UI.
- `progress`: dashboard queries, mastery rollups, recommendations.
- `admin`: taxonomy tools, question editor, review queue, publishing workflow.

## Build Order

1. Taxonomy schema and migrations
2. Auth and profile bootstrap
3. Question bank and admin editor
4. Practice session engine
5. Review and scoring
6. Progress dashboard
7. Tutor orchestration
8. Desmos integration

## Intentional Omissions

- No shared state library yet
- No custom design system package yet
- No heavy service/repository abstraction layer
- No background jobs package yet
- No billing or analytics implementation yet

Keep new files small. Add layers only when a concrete feature needs them.

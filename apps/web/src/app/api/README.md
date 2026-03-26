# API Route Sketch

Create the Next.js route handlers below when implementation starts:

```text
/api
  /sessions
    /create/route.ts
    /[sessionId]/answer/route.ts
    /[sessionId]/submit/route.ts
  /progress
    /overview/route.ts
  /tutor
    /respond/route.ts
  /practice
    /generate-drill/route.ts
  /admin
    /questions/route.ts
    /questions/[questionId]/route.ts
    /questions/[questionId]/publish/route.ts
    /generate-variants/route.ts
    /review/[variantId]/approve/route.ts
    /review/[variantId]/reject/route.ts
```

## TODO(session-routes)

Implement the session APIs first.

- `POST /api/sessions/create`: create a practice session and return ordered question snapshots.
- `POST /api/sessions/[sessionId]/answer`: persist a single answer attempt and return updated progress state.
- `POST /api/sessions/[sessionId]/submit`: finalize scoring, persist review data, and trigger mastery updates.

## TODO(progress-route)

- `GET /api/progress/overview`: return dashboard-ready data for the authenticated student only.

## TODO(tutor-route)

- `POST /api/tutor/respond`: build tutor context server-side, enforce reveal policy, call the model, and log the interaction.

## TODO(admin-routes)

- Keep all admin routes behind a server-side admin role check.
- Separate vetted question editing from generated variant review.
- Write audit events for publish, approve, and reject actions.

## Naming

- All route handler files must be named `route.ts`.
- Request validators should use `XInputSchema` names.
- Response validators should use `XResponseSchema` names.
- Server helpers should stay verb-first: `createSession`, `submitAnswer`, `publishQuestion`, `approveVariant`.

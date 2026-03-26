# Feature Slice Sketch

Create one folder per feature:

```text
/features
  /auth
    /components
    /server
    types.ts
  /practice
    /components
    /server
    types.ts
  /tutor
    /components
    /server
    /prompts
    /policies
    types.ts
  /progress
    /components
    /server
    types.ts
  /admin
    /components
    /server
    types.ts
```

## TODO(auth-feature)

- Implement login, signup, profile bootstrap, and route protection.
- Keep auth UI separate from student-facing practice UI.
- Use `Auth...` for shared components and verb-first names for server helpers.

## TODO(practice-feature)

- Implement session creation, question rendering, answer submission, scoring handoff, and review data loading.
- Keep question UI, timer UI, and session navigation in this slice.
- Use `Practice...` for shared feature components and `Session...` for active-session-only code.

## TODO(tutor-feature)

- Implement tutor context building, reveal policy checks, prompt assembly, streaming, and tutor panel UI.
- Keep all model calls behind server code.
- Use `Tutor...` for UI, `build...` for prompt/context helpers, and `enforce...` for policy functions.

## TODO(progress-feature)

- Implement dashboard queries, mastery rollups, and deterministic next-step recommendations.
- Keep V1 recommendation logic rule-based.
- Use `Progress...` for reusable progress components and `Dashboard...` only for dashboard-specific UI.

## TODO(admin-feature)

- Implement taxonomy tools, question editor, review queue, and publishing actions.
- Separate vetted question workflows from generated variant workflows.
- Use `Question...` for vetted content tools and `Variant...` for generated-review tools.

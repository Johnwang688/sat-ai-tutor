# SAT Taxonomy

The canonical SAT concept list now lives in [apps/web/src/features/taxonomy/core-concepts.ts](/c:/Users/johnw/OneDrive/Desktop/sat-prep-app/apps/web/src/features/taxonomy/core-concepts.ts).

It defines:

- the 2 SAT sections: `reading-writing` and `math`
- the 8 SAT domains/subdomains under those sections
- the 30 canonical core concepts with exact display labels and stable slugs

## Database Shape

The database already models taxonomy in normalized tables:

- `sections`
- `domains`
- `concepts`
- `subskills`

Questions belong to exactly one concept through `question_bank.concept_id`.

The canonical taxonomy is seeded into Supabase by [supabase/migrations/0002_seed_canonical_sat_taxonomy.sql](/c:/Users/johnw/OneDrive/Desktop/sat-prep-app/supabase/migrations/0002_seed_canonical_sat_taxonomy.sql).

Apply migrations before relying on the taxonomy in a real database environment.

## App Usage

The current app layer uses concept slugs as the stable machine key in mock-backed flows.

- Practice and progress use concept slugs for routing and drill selection.
- Admin question drafts now store `conceptSlug` plus denormalized `conceptName` and `domainName`.
- Admin question creation should choose a canonical concept slug instead of typing free-text domain/concept labels.

## Assigning Concepts To Questions

For mock/in-memory app flows:

- assign `conceptSlug`
- derive section/domain/concept labels from the canonical taxonomy

For Supabase-backed question records:

1. resolve the concept row by slug from `concepts`
2. store its `id` in `question_bank.concept_id`
3. store the matching `domain_id` and `section_id` from the same taxonomy branch

That keeps every question linked to one canonical concept while preserving section and domain grouping.

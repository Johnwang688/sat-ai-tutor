# SAT AI Tutor App — Engineering Design Document

## 1. Executive Summary

This document defines the architecture and implementation plan for a web-based SAT study application with four primary differentiators:

1. A test-like digital SAT practice experience
2. A concept-tagged question bank with adaptive drills
3. An integrated AI tutor that can explain, hint, diagnose, and generate extra practice
4. Embedded Desmos-powered graphing support for Math

The product is not an official SAT client and must not reuse College Board branding, logos, or copyrighted question content. The system will instead provide an original, skill-aligned practice experience inspired by the digital SAT format.

The design philosophy is:

* **database-first, generation-augmented**
* **scored content must be vetted**
* **AI should operate on a concept graph, not just chat blindly**
* **all model calls and secrets stay server-side**
* **student progress must be measurable at the concept and subskill level**

---

## 2. Product Goals

### 2.1 Primary Goals

* Deliver realistic SAT-style practice modules for Reading & Writing and Math
* Track mastery by domain, concept, and subskill
* Provide context-aware AI tutoring during and after practice
* Allow students to request additional drills on weak areas
* Support graphing and calculator workflows for Math through Desmos
* Build an architecture that can launch quickly but scale cleanly

### 2.2 Secondary Goals

* Support adaptive difficulty over time
* Support premium subscriptions later
* Support an internal admin workflow for reviewing and promoting new questions
* Support parallel question generation and automated practice sets

### 2.3 Non-Goals for V1

* Full proctoring or anti-cheat system
* Official SAT score prediction with psychometric calibration
* Mobile native apps
* Teacher dashboard
* Collaborative classrooms
* Direct import of official College Board questions

---

## 3. User Personas

### 3.1 Student

Needs:

* Fast sign in
* Test-like practice experience
* Clear explanations
* Targeted remediation
* Visible progress over time

### 3.2 Parent

Needs:

* Confidence that the app is structured and educational
* Simple progress overview
* Subscription management later

### 3.3 Admin / Content Reviewer

Needs:

* Create and edit questions
* Review AI-generated variants
* Publish vetted questions to production
* View quality issues and flagged items

---

## 4. Product Scope

## 4.1 V1 Features

* User authentication
* SAT concept taxonomy
* Curated question bank
* Practice modes:

  * concept drill
  * mini quiz
  * full section-style module
* Reading & Writing question UI
* Math question UI with Desmos embed when relevant
* AI tutor panel with hint / teach / full explanation modes
* Review mode for completed sessions
* Progress dashboard by concept
* Admin content management for question review

### 4.2 V2 Features

* Adaptive sequencing
* AI-generated parallel practice
* Tutor memory across sessions
* Study plan generation
* Subscription billing
* A/B testing and analytics optimizations

---

## 5. High-Level Architecture

```text
Browser (Next.js frontend)
  |
  | HTTPS
  v
Next.js App on Vercel
  |- App Router pages / layouts
  |- Server Actions / Route Handlers / Functions
  |- Tutor orchestration layer
  |- Session scoring engine
  |- Admin APIs
  |
  +--> Supabase Auth
  +--> Supabase Postgres
  +--> Supabase Storage
  +--> OpenAI API
  +--> Desmos API (frontend embed; server config if needed)
  +--> Optional: Redis cache / rate limiter
  +--> Optional: PostHog / Sentry / Stripe / Resend
```

### 5.1 Recommended Stack

#### Frontend

* Next.js
* React
* TypeScript
* Tailwind CSS
* shadcn/ui or equivalent component primitives
* React Query or SWR for client-side fetching and cache invalidation
* Zustand or small local state store for session/tutor UI state if needed

#### Backend

* Next.js Route Handlers or Server Actions hosted on Vercel
* Zod for request/response validation
* Prisma or Drizzle ORM, or direct Supabase queries
* Background work using serverless jobs later if needed

#### Data Layer

* Supabase Postgres
* Supabase Auth
* Supabase Storage
* Row Level Security enabled on user-owned tables

#### AI + External Services

* OpenAI API
* Desmos API
* Optional Redis / Upstash for caching and rate limiting
* Optional PostHog for analytics
* Optional Sentry for error monitoring
* Optional Stripe for billing
* Optional Resend for email

### 5.2 Architecture Principles

* The browser never receives privileged API keys
* The AI tutor is mediated through a server orchestration layer
* Scored questions only come from vetted content tables
* Generated questions are never automatically treated as trusted assessments
* Every student action that affects progress is written to durable event tables
* Question display data is decoupled from scoring logic

---

## 6. SAT Domain Model

The application will model the SAT using a hierarchy:

* Section
* Domain
* Concept
* Subskill
* Question Template
* Question Variant

### 6.1 Top-Level Sections

* Reading and Writing
* Math

### 6.2 Domains

#### Reading and Writing

* Information and Ideas
* Craft and Structure
* Expression of Ideas
* Standard English Conventions

#### Math

* Algebra
* Advanced Math
* Problem-Solving and Data Analysis
* Geometry and Trigonometry

### 6.3 Example Concepts

#### Math

* Linear equations in one variable
* Linear functions
* Systems of linear equations
* Quadratic functions
* Exponential functions
* Polynomials
* Ratios and proportions
* Percentages
* Data analysis
* Scatter plots and data modeling
* Circle equations
* Area and volume
* Right triangle trigonometry

#### Reading and Writing

* Main idea
* Command of evidence
* Inference
* Vocabulary in context
* Rhetorical synthesis
* Transitions
* Sentence boundaries
* Parallel structure
* Modifier placement
* Punctuation
* Subject-verb agreement
* Concision
* Verb tense consistency
* Pronoun clarity

### 6.4 Why This Matters

This taxonomy powers:

* question retrieval
* adaptive practice
* mastery analytics
* tutor diagnosis
* study recommendations
* content generation prompts

---

## 7. Question System Design

## 7.1 Core Strategy

Use a hybrid content model:

### Tier 1: Verified Core Questions

Human-reviewed, canonical questions used for:

* scored sessions
* diagnostics
* progress tracking
* adaptive calibration

### Tier 2: AI-Generated Variants From Approved Seeds

Used for:

* extra practice
* weak-skill drills
* homework mode

### Tier 3: Fully Dynamic Tutor Examples

Used for:

* concept teaching
* worked examples
* optional bonus practice

Only Tier 1 content should affect official progress metrics in V1.

## 7.2 Question Object Structure

Each question should store:

* question id
* section
* domain
* concept
* subskill
* difficulty (1-5)
* source type (`verified`, `generated_variant`, `generated_dynamic`)
* prompt stem
* passage text or stimulus block
* answer choices or free-response schema
* correct answer
* explanation
* distractor rationales
* calculator allowed
* desmos relevant
* estimated solve time
* metadata flags
* review status
* version number

### 7.3 Reading & Writing Content Format

A Reading & Writing item may include:

* a short passage or notes block
* question stem
* four choices
* correct answer index
* explanation
* grammar tags or rhetoric tags

### 7.4 Math Content Format

A Math item may include:

* text stem
* optional graph or table data
* optional equation block
* multiple choice or student-produced response schema
* calculator flag
* desmos flag
* explanation steps
* numerical tolerance rules if needed

## 7.5 Question Templates

To scale safely, define reusable templates.

Examples:

* slope from two points
* choose best transition
* repair comma splice
* interpret quadratic in vertex form
* solve system by substitution

A template stores:

* structural pattern
* concept constraints
* parameter schema
* answer-generation logic
* distractor-generation rules
* validation rules

## 7.6 Generation Pipeline

### Offline Variant Generation Flow

1. Select a verified seed question or template
2. Build a controlled prompt with concept, difficulty, and style constraints
3. Generate candidate variants with AI
4. Run automated validations
5. Send to admin review queue
6. Approve and publish to `question_variants`
7. Optionally promote best variants to verified bank

### Automated Validations

* answer key consistency
* multiple-choice uniqueness
* no duplicate choices
* no malformed equations
* no impossible data values
* grammar sanity checks
* reading ambiguity checks where feasible
* difficulty estimate heuristics

### Human Review Required For

* scored content
* all Reading & Writing variants before promotion
* complex Math items with multi-step logic

## 7.7 Why Not Pure Real-Time Generation

Pure live generation creates unacceptable risk in:

* ambiguity
* answer correctness
* difficulty consistency
* analytics quality
* trust

Therefore, generation is supportive, not foundational.

---

## 8. AI Tutor Design

## 8.1 Tutor Goals

The tutor should not behave like a generic chatbot. It should:

* know the active question
* know the question concept and subskill
* know whether the student is mid-attempt or post-attempt
* know the student’s recent weakness history
* choose the right tutoring mode

## 8.2 Tutor Modes

* **Hint only**: small nudge, no answer reveal
* **Teach concept**: explain the underlying concept independent of the exact problem
* **Guided solve**: break problem into steps, may ask small questions back
* **Full explanation**: after answer submission or explicit request
* **Generate 3 more like this**: produce bonus practice

## 8.3 Tutor Context Inputs

Each tutor request should include:

* user id
* practice session id
* current question id
* current question content
* section/domain/concept/subskill tags
* whether student already answered
* selected answer if any
* correctness if known
* recent mastery snapshot
* tutor mode
* safety/system instruction profile

## 8.4 Tutor Orchestration Layer

The backend should build tutor prompts from structured data rather than letting the model infer context from raw UI text.

Responsibilities:

* gather question and student context
* enforce reveal policy
* choose allowed response style
* stream output to client
* log interaction metadata
* optionally cache reusable explanations

## 8.5 Reveal Policy

Before answer submission:

* hints allowed
* concept explanation allowed
* no direct answer unless user explicitly leaves test mode or uses a reveal override in practice mode

After answer submission:

* full explanation allowed
* compare chosen answer with correct answer
* explain distractors
* recommend follow-up drill

## 8.6 Tutor Memory

V1 memory should be lightweight:

* last few weak concepts
* recent misunderstood subskills
* preferred explanation style if collected

Avoid open-ended long-term memory in V1.

## 8.7 AI Guardrails

* never claim official College Board affiliation
* never expose hidden answer directly in timed mode unless policy allows it
* never invent score equivalence without clear labeling
* avoid hallucinated citations
* avoid unsupported legal or admissions advice

---

## 9. Desmos Integration Design

## 9.1 Purpose

Desmos provides graphing and calculator capabilities for relevant Math questions.

## 9.2 Integration Model

The Desmos calculator runs client-side in the browser as an embedded component inside the Math experience.

### Use Cases

* graph linear and quadratic functions
* inspect intersections
* verify roots
* test transformations
* compute with calculator support

## 9.3 Feature Flags Per Question

Each Math question stores:

* `calculator_allowed`
* `desmos_relevant`
* `desmos_preset_state` (optional)

`desmos_preset_state` may preload:

* graph window bounds
* equations
* points
* table values
* grid preferences

## 9.4 UI Rules

* calculator panel collapsible on desktop
* mobile layout deferred unless fully designed
* preserve calculator state while student remains on question
* reset state only on explicit action or session restart

## 9.5 Logging

For V1, do not over-log calculator details. Optionally log:

* calculator opened
* graph preset loaded
* time spent with calculator open

Avoid collecting sensitive fine-grained behavior unless needed.

---

## 10. Practice Session Engine

## 10.1 Session Types

* full section-style module
* concept drill
* mixed mini quiz
* review session
* tutor-generated practice set

## 10.2 Session Lifecycle

1. user starts session
2. backend creates `practice_session`
3. backend selects questions according to mode
4. frontend renders sequence
5. student submits answers incrementally or at end
6. backend scores responses
7. backend updates progress and mastery aggregates
8. frontend shows review and recommendations

## 10.3 Question Selection Logic

### Full Module Mode

* select only verified questions
* mix concepts according to configured blueprint
* control difficulty distribution
* prevent recent repeats

### Concept Drill Mode

* select verified questions for chosen concept
* optionally add generated variants after threshold

### Review Mode

* prioritize previously missed questions or same subskill replacements

## 10.4 Timing Model

For full modules:

* server stores start time and expected duration
* frontend displays timer
* answers accepted until session expiry rules are reached

V1 can trust normal client UX while also storing server timestamps for sanity checks.

## 10.5 Scoring

Store raw question-level correctness first. Aggregate later into:

* concept accuracy
* domain accuracy
* recent streaks
* attempted vs mastered ratios

Do not overfit score prediction in V1.

---

## 11. Progress and Mastery System

## 11.1 Why Mastery Matters

The app should answer:

* what is the student good at?
* what is weak?
* what improved recently?
* what should they practice next?

## 11.2 Mastery Model

Maintain a rolling mastery score per user per concept and subskill.

Inputs:

* correctness
* question difficulty
* recency
* repeated success/failure patterns
* optionally hint usage penalty or separate annotation

### Simplified V1 Formula

For each concept:

* recent weighted accuracy
* minimum attempt threshold
* confidence score based on sample size

Example stored outputs:

* `raw_accuracy`
* `weighted_mastery`
* `attempt_count`
* `recent_attempt_count`
* `confidence_level`
* `last_practiced_at`

## 11.3 Dashboard Views

* overall section summary
* domain bars
* concept heatmap
* weak-skill recommendations
* recent sessions

## 11.4 Recommendation Engine

Given mastery data, recommend:

* next concept drill
* next mixed set
* review of recently missed items
* tutor concept lesson

V1 can use deterministic rules. AI-generated study plans can be added later.

---

## 12. Admin Content System

## 12.1 Admin Needs

* create and edit concepts
* create questions
* preview rendering
* validate answer keys
* review generated variants
* publish or reject content
* archive broken items

## 12.2 Admin Interface

Protected admin routes in Next.js:

* `/admin/concepts`
* `/admin/questions`
* `/admin/review-queue`
* `/admin/sessions`
* `/admin/flags`

## 12.3 Workflow States

For each question:

* `draft`
* `generated_pending_review`
* `reviewed`
* `published`
* `archived`
* `flagged`

## 12.4 Quality Review Checklist

* exactly one correct answer
* no ambiguous prompt
* concept tags accurate
* explanation matches answer
* difficulty appropriate
* rendering correct on frontend
* no copyrighted text copied from prohibited sources

---

## 13. Authentication and User Management

## 13.1 Auth Provider

Use Supabase Auth.

### V1 auth methods

* email/password
* magic link optional
* Google login optional after launch

## 13.2 User Objects

* auth user record
* public profile table
* settings table
* subscription record later

## 13.3 Access Control

* student users can only access their own sessions and progress
* admins require elevated role stored in database and enforced server-side

## 13.4 Row Level Security

Enable RLS for user-owned data tables such as:

* practice_sessions
* session_answers
* mastery_scores
* tutor_conversations
* user_settings

Admin-only tables should be protected via service-role-backed server logic.

---

## 14. Database Schema

Below is the recommended logical schema.

## 14.1 Core Taxonomy Tables

### `sections`

* id
* slug
* name
* display_order

### `domains`

* id
* section_id
* slug
* name
* display_order

### `concepts`

* id
* domain_id
* slug
* name
* description
* display_order

### `subskills`

* id
* concept_id
* slug
* name
* description
* display_order

## 14.2 Question Tables

### `question_bank`

* id (uuid)
* source_type
* section_id
* domain_id
* concept_id
* subskill_id
* difficulty
* question_type
* prompt_json
* answer_schema_json
* explanation_json
* calculator_allowed
* desmos_relevant
* desmos_preset_state_json
* status
* version
* created_by
* created_at
* updated_at
* published_at

### `question_variants`

* id
* parent_question_id
* generation_method
* prompt_json
* answer_schema_json
* explanation_json
* validation_report_json
* review_status
* created_at

### `question_flags`

* id
* question_id
* flagged_by_user_id
* reason
* notes
* created_at

## 14.3 User and Progress Tables

### `profiles`

* id (matches auth user id)
* display_name
* role
* created_at

### `practice_sessions`

* id
* user_id
* session_type
* section_id
* config_json
* started_at
* submitted_at
* completed_at
* score_summary_json
* status

### `practice_session_questions`

* id
* session_id
* question_id
* order_index
* source_type
* snapshot_json

### `session_answers`

* id
* session_id
* question_id
* user_id
* answer_json
* is_correct
* time_spent_seconds
* hint_count
* tutor_used
* submitted_at

### `mastery_scores`

* id
* user_id
* concept_id
* subskill_id nullable
* raw_accuracy
* weighted_mastery
* confidence_level
* attempt_count
* recent_attempt_count
* last_practiced_at
* updated_at

### `tutor_conversations`

* id
* user_id
* session_id nullable
* question_id nullable
* mode
* request_payload_json
* response_payload_json
* created_at

## 14.4 Admin and Audit Tables

### `generation_jobs`

* id
* template_id
* concept_id
* prompt_version
* status
* output_json
* created_at
* reviewed_at

### `audit_events`

* id
* actor_user_id
* event_type
* target_type
* target_id
* payload_json
* created_at

---

## 15. API Design

The frontend should never call OpenAI directly. It should call your backend.

### 15.1 Public App APIs

#### `POST /api/sessions/create`

Creates a new practice session.

Input:

* session type
* section
* concept filters optional
* difficulty preferences optional

Output:

* session id
* ordered question snapshots
* timer config

#### `POST /api/sessions/:id/answer`

Submits an answer for a single question.

Input:

* question id
* answer payload
* time spent

Output:

* correctness optional depending on mode
* progress state

#### `POST /api/sessions/:id/submit`

Finalizes and scores a session.

Output:

* score summary
* concept breakdown
* recommended next steps

#### `GET /api/progress/overview`

Returns dashboard data.

#### `POST /api/tutor/respond`

Creates a tutor response.

Input:

* session id optional
* question id optional
* tutor mode
* student message
* reveal policy state

Output:

* streamed tutor response
* optional follow-up recommendations

#### `POST /api/practice/generate-drill`

Creates a drill set from a concept or missed-question cluster.

### 15.2 Admin APIs

#### `POST /api/admin/questions`

Create draft question.

#### `PATCH /api/admin/questions/:id`

Update question.

#### `POST /api/admin/questions/:id/publish`

Publish reviewed question.

#### `POST /api/admin/generate-variants`

Start generation job.

#### `POST /api/admin/review/:variantId/approve`

Approve generated variant.

#### `POST /api/admin/review/:variantId/reject`

Reject generated variant.

---

## 16. Frontend Application Structure

## 16.1 App Routes

### Public

* `/`
* `/login`
* `/signup`
* `/pricing` later

### Authenticated Student Routes

* `/dashboard`
* `/practice`
* `/practice/session/[id]`
* `/review/[sessionId]`
* `/concepts/[slug]`
* `/settings`

### Admin Routes

* `/admin`
* `/admin/questions`
* `/admin/review-queue`
* `/admin/concepts`

## 16.2 Component Areas

### Shared Layout Components

* top navigation
* sidebar
* auth guard wrappers
* loading and error states

### Practice Components

* question card renderer
* answer choice selector
* free response input
* timer
* navigation panel
* tutor side panel
* Desmos embed component

### Dashboard Components

* concept mastery cards
* domain progress bars
* recent session table
* recommendation tiles

### Admin Components

* question editor form
* taxonomy selector
* review diff panel
* preview renderer

## 16.3 Rendering Strategy

Use server components where useful for data-heavy pages and client components for interactive practice views.

Likely client-heavy routes:

* session page
* tutor panel
* Desmos embed

---

## 17. AI Prompting Strategy

## 17.1 Prompt Layers

### System Layer

Defines tutor identity and rules:

* skilled SAT tutor
* concise and accurate
* no answer leakage during protected states
* explain at target student level

### Policy Layer

Defines product-specific behavior:

* timed mode restrictions
* hint policy
* practice mode flexibility

### Context Layer

Injects structured current data:

* question content
* correct answer if allowed
* concept tags
* student mastery snapshot

### User Layer

Student’s actual message

## 17.2 Prompt Versioning

Store prompt templates with version identifiers so prompt changes can be evaluated and rolled back.

## 17.3 Streaming

Tutor responses should stream to the client for perceived responsiveness.

## 17.4 Caching

Cache safe, repeatable tutor outputs where useful:

* concept explanations
* full explanations for canonical questions

Do not cache personalized sensitive content without careful scoping.

---

## 18. Security Design

## 18.1 Secrets

Keep these server-side only:

* OpenAI API key
* Supabase service role key
* admin-only tokens
* Stripe secret keys later

Client may use:

* Supabase anon key with RLS
* public analytics keys
* Desmos client configuration if applicable

## 18.2 Authorization

All privileged operations must be enforced server-side.

Examples:

* admin publish actions
* question generation jobs
* review workflows
* access to service-role queries

## 18.3 Abuse Prevention

Add basic rate limits for:

* tutor calls
* session creation spam
* auth endpoints

## 18.4 Data Protection

* minimize sensitive personal data
* do not store more than needed for tutoring
* provide account deletion path later
* redact logs where appropriate

---

## 19. Observability and Analytics

## 19.1 Product Analytics

Track:

* signups
* first practice session start
* session completion
* tutor opened
* hint requested
* review completed
* concept drill created
* subscription conversion later

## 19.2 Error Monitoring

Capture:

* route handler errors
* tutor failures
* scoring failures
* content render failures
* admin publish failures

## 19.3 Content Quality Metrics

Track:

* question flag rate
* tutor dissatisfaction signals
* ambiguous item reports
* generated variant approval rate

---

## 20. Deployment and Environments

## 20.1 Environments

* local
* preview / staging
* production

## 20.2 Environment Variables

### App / Supabase

* `NEXT_PUBLIC_SUPABASE_URL`
* `NEXT_PUBLIC_SUPABASE_ANON_KEY`
* `SUPABASE_SERVICE_ROLE_KEY`
* `DATABASE_URL` or Supabase connection string

### AI / Tutor

* `OPENAI_API_KEY`
* `OPENAI_MODEL_TUTOR`
* `OPENAI_MODEL_GENERATION`

### Desmos

* `NEXT_PUBLIC_DESMOS_API_KEY` if needed by the integration model

### Observability

* `NEXT_PUBLIC_POSTHOG_KEY`
* `SENTRY_DSN`

### Billing / Email later

* `STRIPE_SECRET_KEY`
* `RESEND_API_KEY`

## 20.3 Deployment Flow

1. push branch
2. preview deploy on Vercel
3. run database migrations
4. run smoke tests
5. promote to production

## 20.4 Database Migrations

Use a migration system and treat schema changes as code-reviewed artifacts.

---

## 21. Testing Strategy

## 21.1 Unit Tests

* scoring logic
* mastery update logic
* question selector
* validator functions
* tutor orchestration utilities

## 21.2 Integration Tests

* auth flow
* session creation
* answer submission
* session scoring
* tutor call lifecycle
* admin publish workflow

## 21.3 End-to-End Tests

* student signup to first session completion
* complete math session with Desmos visible
* complete reading session and review
* admin approves generated variant and publishes question

## 21.4 Content Validation Tests

* question render snapshots
* choice uniqueness
* correct answer presence
* JSON schema conformance

---

## 22. Rollout Plan

## 22.1 Phase 0 — Foundations

* initialize Next.js app
* connect Supabase
* implement auth
* build taxonomy tables
* implement admin question editor

## 22.2 Phase 1 — Core Practice MVP

* canonical question bank
* session engine
* question renderer
* scoring pipeline
* dashboard basics

## 22.3 Phase 2 — AI Tutor MVP

* tutor side panel
* hint and explanation modes
* server orchestration layer
* tutor logs

## 22.4 Phase 3 — Desmos + Math Enhancements

* Desmos embed
* per-question graph presets
* calculator-friendly UI refinements

## 22.5 Phase 4 — Content Scale Tools

* generation pipeline
* review queue
* automated validators
* promote approved variants

## 22.6 Phase 5 — Growth

* adaptive sequencing
* subscriptions
* study plans
* mobile polish

---

## 23. Suggested Repository Structure

```text
/apps
  /web
    /src
      /app
      /components
      /lib
      /server
      /features
        /auth
        /practice
        /tutor
        /progress
        /admin
      /types
      /styles
/packages
  /ui
  /schemas
  /config
  /prompts
  /content-tools
/supabase
  /migrations
  /seed
/docs
```

### Feature Folder Ideas

#### `/features/practice`

* session creation
* question rendering
* answer submission
* review mode

#### `/features/tutor`

* prompt builders
* policy guards
* streaming hooks
* tutor panel UI

#### `/features/admin`

* question form
* review queue
* publish actions

---

## 24. Key Product Decisions

### Decision 1: Use Next.js + Vercel + Supabase

Reason: fastest path to a robust web app with low ops overhead.

### Decision 2: Database-first question bank

Reason: reliability and scoring trust.

### Decision 3: AI generation is supportive, not primary

Reason: preserve content quality and analytics consistency.

### Decision 4: Tutor is context-aware and policy-aware

Reason: avoid generic chat behavior and answer leakage.

### Decision 5: Verified content only for scored modules

Reason: trust and measurement.

---

## 25. Risks and Mitigations

### Risk: AI-generated bad questions

Mitigation:

* validators
* human review
* keep generated content unscored until approved

### Risk: Tutor leaks answers during timed mode

Mitigation:

* server-side reveal policy
* prompt constraints
* mode gating

### Risk: Content feels unlike SAT

Mitigation:

* strong template library
* style guidelines
* human content review

### Risk: Overly complex V1

Mitigation:

* launch with verified bank + tutor + dashboard only
* defer psychometrics and subscriptions

### Risk: Admin tooling gets neglected

Mitigation:

* build minimal review queue early
* content operations are core, not optional

---

## 26. Open Questions

These decisions can be finalized during implementation:

1. ORM choice: Prisma, Drizzle, or direct SQL
2. Whether to use Redis in V1
3. Whether tutor conversations should be fully persisted or partially summarized
4. Whether student-produced response Math items ship in V1 or later
5. Whether to support Google login at launch
6. Whether question authoring lives inside the app or a separate CMS

---

## 27. Recommended V1 Build Order

1. Taxonomy schema
2. Auth and user profiles
3. Question bank schema and admin editor
4. Practice session engine
5. Session review and scoring
6. Progress dashboard
7. Tutor orchestration and panel
8. Desmos integration
9. Review queue for generated content

---

## 28. Conclusion

This application should be built as a structured learning system, not just a chat wrapper around SAT-style prompts. The durable asset of the product is the combination of:

* a clean SAT concept graph
* a reliable vetted question bank
* a measurable progress engine
* a context-aware AI tutor
* a scalable content pipeline

The recommended implementation is a modern web stack centered on Next.js, Vercel, Supabase, OpenAI, and Desmos. The first release should prioritize reliability, content quality, and tutor usefulness over flashy breadth. Once those foundations are in place, adaptive generation and premium growth features can be added without rewriting the core architecture.

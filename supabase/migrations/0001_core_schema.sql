-- SAT AI Tutor V1 core schema migration

create extension if not exists pgcrypto;

-- Shared trigger helper for timestamp maintenance.
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

-- Taxonomy tables
create table if not exists public.sections (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  name text not null,
  display_order integer not null default 0 check (display_order >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.domains (
  id uuid primary key default gen_random_uuid(),
  section_id uuid not null references public.sections (id) on delete cascade,
  slug text not null,
  name text not null,
  display_order integer not null default 0 check (display_order >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (section_id, slug)
);

create table if not exists public.concepts (
  id uuid primary key default gen_random_uuid(),
  domain_id uuid not null references public.domains (id) on delete cascade,
  slug text not null,
  name text not null,
  description text not null default '',
  display_order integer not null default 0 check (display_order >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (domain_id, slug)
);

create table if not exists public.subskills (
  id uuid primary key default gen_random_uuid(),
  concept_id uuid not null references public.concepts (id) on delete cascade,
  slug text not null,
  name text not null,
  description text not null default '',
  display_order integer not null default 0 check (display_order >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (concept_id, slug)
);

-- Question and content tables
create table if not exists public.question_bank (
  id uuid primary key default gen_random_uuid(),
  source_type text not null check (source_type in ('verified', 'generated_variant', 'generated_dynamic')),
  section_id uuid not null references public.sections (id),
  domain_id uuid not null references public.domains (id),
  concept_id uuid not null references public.concepts (id),
  subskill_id uuid references public.subskills (id),
  difficulty integer not null check (difficulty between 1 and 5),
  question_type text not null,
  prompt_json jsonb not null,
  answer_schema_json jsonb not null,
  explanation_json jsonb not null,
  calculator_allowed boolean not null default false,
  desmos_relevant boolean not null default false,
  desmos_preset_state_json jsonb,
  status text not null default 'draft'
    check (status in ('draft', 'generated_pending_review', 'reviewed', 'published', 'archived', 'flagged')),
  version integer not null default 1 check (version >= 1),
  created_by uuid references auth.users (id),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  published_at timestamptz
);

create table if not exists public.question_variants (
  id uuid primary key default gen_random_uuid(),
  parent_question_id uuid not null references public.question_bank (id) on delete cascade,
  generation_method text not null,
  prompt_json jsonb not null,
  answer_schema_json jsonb not null,
  explanation_json jsonb not null,
  validation_report_json jsonb not null default '{}'::jsonb,
  review_status text not null default 'pending'
    check (review_status in ('pending', 'approved', 'rejected')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.question_flags (
  id uuid primary key default gen_random_uuid(),
  question_id uuid not null references public.question_bank (id) on delete cascade,
  flagged_by_user_id uuid not null references auth.users (id) on delete cascade,
  reason text not null,
  notes text not null default '',
  created_at timestamptz not null default now(),
  unique (question_id, flagged_by_user_id)
);

-- User and progress tables
create table if not exists public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  display_name text,
  role text not null default 'student' check (role in ('student', 'admin')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.practice_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  session_type text not null check (session_type in ('full_module', 'concept_drill', 'mini_quiz', 'review', 'generated_drill')),
  section_id uuid references public.sections (id),
  config_json jsonb not null default '{}'::jsonb,
  started_at timestamptz not null default now(),
  submitted_at timestamptz,
  completed_at timestamptz,
  score_summary_json jsonb,
  status text not null default 'in_progress' check (status in ('in_progress', 'submitted', 'completed', 'abandoned')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.practice_session_questions (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references public.practice_sessions (id) on delete cascade,
  question_id uuid not null references public.question_bank (id),
  order_index integer not null check (order_index >= 0),
  source_type text not null check (source_type in ('verified', 'generated_variant', 'generated_dynamic')),
  snapshot_json jsonb not null,
  created_at timestamptz not null default now(),
  unique (session_id, order_index),
  unique (session_id, question_id)
);

create table if not exists public.session_answers (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references public.practice_sessions (id) on delete cascade,
  question_id uuid not null references public.question_bank (id),
  user_id uuid not null references auth.users (id) on delete cascade,
  answer_json jsonb not null,
  is_correct boolean,
  time_spent_seconds integer not null default 0 check (time_spent_seconds >= 0),
  hint_count integer not null default 0 check (hint_count >= 0),
  tutor_used boolean not null default false,
  submitted_at timestamptz not null default now(),
  unique (session_id, question_id, user_id)
);

create table if not exists public.mastery_scores (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  concept_id uuid not null references public.concepts (id),
  subskill_id uuid references public.subskills (id),
  raw_accuracy numeric(5,4) not null default 0 check (raw_accuracy >= 0 and raw_accuracy <= 1),
  weighted_mastery numeric(5,4) not null default 0 check (weighted_mastery >= 0 and weighted_mastery <= 1),
  confidence_level text not null default 'low' check (confidence_level in ('low', 'medium', 'high')),
  attempt_count integer not null default 0 check (attempt_count >= 0),
  recent_attempt_count integer not null default 0 check (recent_attempt_count >= 0),
  last_practiced_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, concept_id, subskill_id)
);

create table if not exists public.tutor_conversations (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  session_id uuid references public.practice_sessions (id) on delete set null,
  question_id uuid references public.question_bank (id) on delete set null,
  mode text not null check (mode in ('hint', 'teach', 'guided_solve', 'full_explanation', 'generate_drill')),
  request_payload_json jsonb not null,
  response_payload_json jsonb not null,
  created_at timestamptz not null default now()
);

-- Admin and audit tables
create table if not exists public.generation_jobs (
  id uuid primary key default gen_random_uuid(),
  template_id text not null,
  concept_id uuid references public.concepts (id),
  prompt_version text not null,
  status text not null default 'queued' check (status in ('queued', 'running', 'completed', 'failed', 'cancelled')),
  output_json jsonb,
  created_by uuid references auth.users (id),
  created_at timestamptz not null default now(),
  reviewed_at timestamptz,
  updated_at timestamptz not null default now()
);

create table if not exists public.audit_events (
  id uuid primary key default gen_random_uuid(),
  actor_user_id uuid references auth.users (id),
  event_type text not null,
  target_type text not null,
  target_id uuid,
  payload_json jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

-- Indexes
create index if not exists idx_domains_section_id on public.domains (section_id);
create index if not exists idx_concepts_domain_id on public.concepts (domain_id);
create index if not exists idx_subskills_concept_id on public.subskills (concept_id);

create index if not exists idx_question_bank_status on public.question_bank (status);
create index if not exists idx_question_bank_source_type on public.question_bank (source_type);
create index if not exists idx_question_bank_section_domain on public.question_bank (section_id, domain_id);
create index if not exists idx_question_bank_concept_subskill on public.question_bank (concept_id, subskill_id);
create index if not exists idx_question_variants_parent_question_id on public.question_variants (parent_question_id);
create index if not exists idx_question_flags_question_id on public.question_flags (question_id);
create index if not exists idx_question_flags_flagged_by_user_id on public.question_flags (flagged_by_user_id);

create index if not exists idx_practice_sessions_user_id on public.practice_sessions (user_id);
create index if not exists idx_practice_sessions_status on public.practice_sessions (status);
create index if not exists idx_practice_session_questions_session_id on public.practice_session_questions (session_id);
create index if not exists idx_session_answers_session_id on public.session_answers (session_id);
create index if not exists idx_session_answers_user_id on public.session_answers (user_id);
create index if not exists idx_mastery_scores_user_id on public.mastery_scores (user_id);
create index if not exists idx_mastery_scores_concept_id on public.mastery_scores (concept_id);
create index if not exists idx_tutor_conversations_user_id on public.tutor_conversations (user_id);
create index if not exists idx_tutor_conversations_session_id on public.tutor_conversations (session_id);
create index if not exists idx_generation_jobs_status on public.generation_jobs (status);
create index if not exists idx_audit_events_actor_user_id on public.audit_events (actor_user_id);
create index if not exists idx_audit_events_target on public.audit_events (target_type, target_id);

-- Triggers for updated_at
drop trigger if exists set_sections_updated_at on public.sections;
create trigger set_sections_updated_at
before update on public.sections
for each row execute procedure public.set_updated_at();

drop trigger if exists set_domains_updated_at on public.domains;
create trigger set_domains_updated_at
before update on public.domains
for each row execute procedure public.set_updated_at();

drop trigger if exists set_concepts_updated_at on public.concepts;
create trigger set_concepts_updated_at
before update on public.concepts
for each row execute procedure public.set_updated_at();

drop trigger if exists set_subskills_updated_at on public.subskills;
create trigger set_subskills_updated_at
before update on public.subskills
for each row execute procedure public.set_updated_at();

drop trigger if exists set_question_bank_updated_at on public.question_bank;
create trigger set_question_bank_updated_at
before update on public.question_bank
for each row execute procedure public.set_updated_at();

drop trigger if exists set_question_variants_updated_at on public.question_variants;
create trigger set_question_variants_updated_at
before update on public.question_variants
for each row execute procedure public.set_updated_at();

drop trigger if exists set_profiles_updated_at on public.profiles;
create trigger set_profiles_updated_at
before update on public.profiles
for each row execute procedure public.set_updated_at();

drop trigger if exists set_practice_sessions_updated_at on public.practice_sessions;
create trigger set_practice_sessions_updated_at
before update on public.practice_sessions
for each row execute procedure public.set_updated_at();

drop trigger if exists set_mastery_scores_updated_at on public.mastery_scores;
create trigger set_mastery_scores_updated_at
before update on public.mastery_scores
for each row execute procedure public.set_updated_at();

drop trigger if exists set_generation_jobs_updated_at on public.generation_jobs;
create trigger set_generation_jobs_updated_at
before update on public.generation_jobs
for each row execute procedure public.set_updated_at();

-- Row Level Security for user-owned tables.
alter table public.profiles enable row level security;
alter table public.practice_sessions enable row level security;
alter table public.practice_session_questions enable row level security;
alter table public.session_answers enable row level security;
alter table public.mastery_scores enable row level security;
alter table public.tutor_conversations enable row level security;
alter table public.question_flags enable row level security;

drop policy if exists "profiles_select_own" on public.profiles;
create policy "profiles_select_own"
on public.profiles
for select
to authenticated
using (id = auth.uid());

drop policy if exists "profiles_insert_own" on public.profiles;
create policy "profiles_insert_own"
on public.profiles
for insert
to authenticated
with check (id = auth.uid());

drop policy if exists "profiles_update_own" on public.profiles;
create policy "profiles_update_own"
on public.profiles
for update
to authenticated
using (id = auth.uid())
with check (id = auth.uid());

drop policy if exists "practice_sessions_select_own" on public.practice_sessions;
create policy "practice_sessions_select_own"
on public.practice_sessions
for select
to authenticated
using (user_id = auth.uid());

drop policy if exists "practice_sessions_insert_own" on public.practice_sessions;
create policy "practice_sessions_insert_own"
on public.practice_sessions
for insert
to authenticated
with check (user_id = auth.uid());

drop policy if exists "practice_sessions_update_own" on public.practice_sessions;
create policy "practice_sessions_update_own"
on public.practice_sessions
for update
to authenticated
using (user_id = auth.uid())
with check (user_id = auth.uid());

drop policy if exists "practice_session_questions_select_by_session_owner" on public.practice_session_questions;
create policy "practice_session_questions_select_by_session_owner"
on public.practice_session_questions
for select
to authenticated
using (
  exists (
    select 1
    from public.practice_sessions ps
    where ps.id = practice_session_questions.session_id
      and ps.user_id = auth.uid()
  )
);

drop policy if exists "session_answers_select_own" on public.session_answers;
create policy "session_answers_select_own"
on public.session_answers
for select
to authenticated
using (user_id = auth.uid());

drop policy if exists "session_answers_insert_own" on public.session_answers;
create policy "session_answers_insert_own"
on public.session_answers
for insert
to authenticated
with check (user_id = auth.uid());

drop policy if exists "session_answers_update_own" on public.session_answers;
create policy "session_answers_update_own"
on public.session_answers
for update
to authenticated
using (user_id = auth.uid())
with check (user_id = auth.uid());

drop policy if exists "mastery_scores_select_own" on public.mastery_scores;
create policy "mastery_scores_select_own"
on public.mastery_scores
for select
to authenticated
using (user_id = auth.uid());

drop policy if exists "tutor_conversations_select_own" on public.tutor_conversations;
create policy "tutor_conversations_select_own"
on public.tutor_conversations
for select
to authenticated
using (user_id = auth.uid());

drop policy if exists "tutor_conversations_insert_own" on public.tutor_conversations;
create policy "tutor_conversations_insert_own"
on public.tutor_conversations
for insert
to authenticated
with check (user_id = auth.uid());

drop policy if exists "question_flags_select_own" on public.question_flags;
create policy "question_flags_select_own"
on public.question_flags
for select
to authenticated
using (flagged_by_user_id = auth.uid());

drop policy if exists "question_flags_insert_own" on public.question_flags;
create policy "question_flags_insert_own"
on public.question_flags
for insert
to authenticated
with check (flagged_by_user_id = auth.uid());

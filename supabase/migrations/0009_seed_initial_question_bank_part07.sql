-- Continuation of initial question bank seed (part 7 of 20).
-- Requires migrations 0001, 0002, and prior question-bank parts.

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-boundaries-punctuation',
  '{"stem":"The concert ended early ____ the storm moved in quickly.","body":"kind: rw-boundaries-punctuation\n\nthemeId: clause-boundaries\n\nlabel: clause boundaries\n\nThe concert ended early ____ the storm moved in quickly.\n\nfocus: semicolon","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: clause-boundaries\n\nlabel: clause boundaries\n\nThe concert ended early ____ the storm moved in quickly.\n\nfocus: semicolon","metadata":{"questionKey":"rw-boundaries-punctuation-01","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:clause-boundaries"]}}'::jsonb,
  '{"type":"multiple_choice","choices":[";",",",":","no punctuation"],"correctIndex":0}'::jsonb,
  '{"summary":"A semicolon can join two related independent clauses.","whyCorrect":"A semicolon can join two related independent clauses."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-boundaries-punctuation',
  '{"stem":"Mina packed her notebook ____ her pencil before leaving.","body":"kind: rw-boundaries-punctuation\n\nthemeId: clause-boundaries\n\nlabel: clause boundaries\n\nMina packed her notebook ____ her pencil before leaving.\n\nfocus: list","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: clause-boundaries\n\nlabel: clause boundaries\n\nMina packed her notebook ____ her pencil before leaving.\n\nfocus: list","metadata":{"questionKey":"rw-boundaries-punctuation-02","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:clause-boundaries"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["and",";",":","no punctuation"],"correctIndex":0}'::jsonb,
  '{"summary":"A simple conjunction connects the list items.","whyCorrect":"A simple conjunction connects the list items."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-boundaries-punctuation',
  '{"stem":"The volunteers arrived on time ____ as planned, the cleanup began at noon.","body":"kind: rw-boundaries-punctuation\n\nthemeId: clause-boundaries\n\nlabel: clause boundaries\n\nThe volunteers arrived on time ____ as planned, the cleanup began at noon.\n\nfocus: semicolon","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: clause-boundaries\n\nlabel: clause boundaries\n\nThe volunteers arrived on time ____ as planned, the cleanup began at noon.\n\nfocus: semicolon","metadata":{"questionKey":"rw-boundaries-punctuation-03","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:clause-boundaries"]}}'::jsonb,
  '{"type":"multiple_choice","choices":[",",";",":","no punctuation"],"correctIndex":1}'::jsonb,
  '{"summary":"A semicolon can separate independent clauses here.","whyCorrect":"A semicolon can separate independent clauses here."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-boundaries-punctuation',
  '{"stem":"The coach shouted instructions ____ the players ran drills.","body":"kind: rw-boundaries-punctuation\n\nthemeId: clause-boundaries\n\nlabel: clause boundaries\n\nThe coach shouted instructions ____ the players ran drills.\n\nfocus: subordination","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: clause-boundaries\n\nlabel: clause boundaries\n\nThe coach shouted instructions ____ the players ran drills.\n\nfocus: subordination","metadata":{"questionKey":"rw-boundaries-punctuation-04","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:clause-boundaries"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["while",";",":","no punctuation"],"correctIndex":0}'::jsonb,
  '{"summary":"While correctly links the two actions.","whyCorrect":"While correctly links the two actions."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-boundaries-punctuation',
  '{"stem":"The recipe was simple ____ flour, water, and salt.","body":"kind: rw-boundaries-punctuation\n\nthemeId: clause-boundaries\n\nlabel: clause boundaries\n\nThe recipe was simple ____ flour, water, and salt.\n\nfocus: colon","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: clause-boundaries\n\nlabel: clause boundaries\n\nThe recipe was simple ____ flour, water, and salt.\n\nfocus: colon","metadata":{"questionKey":"rw-boundaries-punctuation-05","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:clause-boundaries"]}}'::jsonb,
  '{"type":"multiple_choice","choices":[":",",",";","no punctuation"],"correctIndex":0}'::jsonb,
  '{"summary":"A colon can introduce a list after a complete clause.","whyCorrect":"A colon can introduce a list after a complete clause."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-boundaries-punctuation',
  '{"stem":"The city library ____ the oldest building downtown, is open on Sundays.","body":"kind: rw-boundaries-punctuation\n\nthemeId: appositives\n\nlabel: appositives\n\nThe city library ____ the oldest building downtown, is open on Sundays.\n\nfocus: appositive","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: appositives\n\nlabel: appositives\n\nThe city library ____ the oldest building downtown, is open on Sundays.\n\nfocus: appositive","metadata":{"questionKey":"rw-boundaries-punctuation-06","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:appositives"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["which is",", which is","that is","; which is"],"correctIndex":1}'::jsonb,
  '{"summary":"The appositive clause is set off with commas.","whyCorrect":"The appositive clause is set off with commas."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-boundaries-punctuation',
  '{"stem":"Our guide ____ a retired engineer, explained the bridge design.","body":"kind: rw-boundaries-punctuation\n\nthemeId: appositives\n\nlabel: appositives\n\nOur guide ____ a retired engineer, explained the bridge design.\n\nfocus: appositive","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: appositives\n\nlabel: appositives\n\nOur guide ____ a retired engineer, explained the bridge design.\n\nfocus: appositive","metadata":{"questionKey":"rw-boundaries-punctuation-07","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:appositives"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["who was",", a retired engineer,","that was","; a retired engineer"],"correctIndex":1}'::jsonb,
  '{"summary":"The appositive should be enclosed in commas.","whyCorrect":"The appositive should be enclosed in commas."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-boundaries-punctuation',
  '{"stem":"The mural ____ painted by local students, brightened the hallway.","body":"kind: rw-boundaries-punctuation\n\nthemeId: appositives\n\nlabel: appositives\n\nThe mural ____ painted by local students, brightened the hallway.\n\nfocus: appositive","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: appositives\n\nlabel: appositives\n\nThe mural ____ painted by local students, brightened the hallway.\n\nfocus: appositive","metadata":{"questionKey":"rw-boundaries-punctuation-08","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:appositives"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["was",", was","being","; was"],"correctIndex":0}'::jsonb,
  '{"summary":"The sentence is correct without extra punctuation before the verb.","whyCorrect":"The sentence is correct without extra punctuation before the verb."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-boundaries-punctuation',
  '{"stem":"Jules ____ the team captain, organized the fundraiser.","body":"kind: rw-boundaries-punctuation\n\nthemeId: appositives\n\nlabel: appositives\n\nJules ____ the team captain, organized the fundraiser.\n\nfocus: appositive","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: appositives\n\nlabel: appositives\n\nJules ____ the team captain, organized the fundraiser.\n\nfocus: appositive","metadata":{"questionKey":"rw-boundaries-punctuation-09","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:appositives"]}}'::jsonb,
  '{"type":"multiple_choice","choices":[", the team captain,","; the team captain",": the team captain","the team captain"],"correctIndex":0}'::jsonb,
  '{"summary":"The appositive is correctly set off by commas.","whyCorrect":"The appositive is correctly set off by commas."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-boundaries-punctuation',
  '{"stem":"The exhibit ____ a collection of handmade maps, drew many visitors.","body":"kind: rw-boundaries-punctuation\n\nthemeId: appositives\n\nlabel: appositives\n\nThe exhibit ____ a collection of handmade maps, drew many visitors.\n\nfocus: appositive","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: appositives\n\nlabel: appositives\n\nThe exhibit ____ a collection of handmade maps, drew many visitors.\n\nfocus: appositive","metadata":{"questionKey":"rw-boundaries-punctuation-10","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:appositives"]}}'::jsonb,
  '{"type":"multiple_choice","choices":[": a collection of handmade maps",", a collection of handmade maps,","; a collection of handmade maps","no punctuation"],"correctIndex":1}'::jsonb,
  '{"summary":"The appositive phrase belongs between commas.","whyCorrect":"The appositive phrase belongs between commas."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-boundaries-punctuation',
  '{"stem":"____ after the lecture ended, the students asked several questions.","body":"kind: rw-boundaries-punctuation\n\nthemeId: introductory-elements\n\nlabel: introductory elements\n\n____ after the lecture ended, the students asked several questions.\n\nfocus: introductory element","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: introductory-elements\n\nlabel: introductory elements\n\n____ after the lecture ended, the students asked several questions.\n\nfocus: introductory element","metadata":{"questionKey":"rw-boundaries-punctuation-11","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:introductory-elements"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Quietly","However","Besides","Therefore"],"correctIndex":0}'::jsonb,
  '{"summary":"An introductory adverb is fine without extra punctuation here.","whyCorrect":"An introductory adverb is fine without extra punctuation here."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-boundaries-punctuation',
  '{"stem":"____ the rain stopped, the volunteers resumed painting the fence.","body":"kind: rw-boundaries-punctuation\n\nthemeId: introductory-elements\n\nlabel: introductory elements\n\n____ the rain stopped, the volunteers resumed painting the fence.\n\nfocus: introductory element","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: introductory-elements\n\nlabel: introductory elements\n\n____ the rain stopped, the volunteers resumed painting the fence.\n\nfocus: introductory element","metadata":{"questionKey":"rw-boundaries-punctuation-12","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:introductory-elements"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Because","After","Before","Unless"],"correctIndex":1}'::jsonb,
  '{"summary":"After correctly introduces the time relationship.","whyCorrect":"After correctly introduces the time relationship."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-boundaries-punctuation',
  '{"stem":"____ the concert was over, the crowd slowly left the hall.","body":"kind: rw-boundaries-punctuation\n\nthemeId: introductory-elements\n\nlabel: introductory elements\n\n____ the concert was over, the crowd slowly left the hall.\n\nfocus: introductory element","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: introductory-elements\n\nlabel: introductory elements\n\n____ the concert was over, the crowd slowly left the hall.\n\nfocus: introductory element","metadata":{"questionKey":"rw-boundaries-punctuation-13","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:introductory-elements"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Once","Although","Meanwhile","Instead"],"correctIndex":0}'::jsonb,
  '{"summary":"Once correctly introduces the dependent clause.","whyCorrect":"Once correctly introduces the dependent clause."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-boundaries-punctuation',
  '{"stem":"____ the meeting was short, the team still solved the main problem.","body":"kind: rw-boundaries-punctuation\n\nthemeId: introductory-elements\n\nlabel: introductory elements\n\n____ the meeting was short, the team still solved the main problem.\n\nfocus: introductory element","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: introductory-elements\n\nlabel: introductory elements\n\n____ the meeting was short, the team still solved the main problem.\n\nfocus: introductory element","metadata":{"questionKey":"rw-boundaries-punctuation-14","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:introductory-elements"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Although","Besides","Likewise","Afterward"],"correctIndex":0}'::jsonb,
  '{"summary":"Although sets up the contrast between the two clauses.","whyCorrect":"Although sets up the contrast between the two clauses."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-boundaries-punctuation',
  '{"stem":"____ the bell rang, everyone packed up their notebooks.","body":"kind: rw-boundaries-punctuation\n\nthemeId: introductory-elements\n\nlabel: introductory elements\n\n____ the bell rang, everyone packed up their notebooks.\n\nfocus: introductory element","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: introductory-elements\n\nlabel: introductory elements\n\n____ the bell rang, everyone packed up their notebooks.\n\nfocus: introductory element","metadata":{"questionKey":"rw-boundaries-punctuation-15","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:introductory-elements"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["When","Yet","Indeed","Moreover"],"correctIndex":0}'::jsonb,
  '{"summary":"When works well to introduce the time clause.","whyCorrect":"When works well to introduce the time clause."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-boundaries-punctuation',
  '{"stem":"The hallway was quiet ____ the doors had already locked.","body":"kind: rw-boundaries-punctuation\n\nthemeId: end-boundaries\n\nlabel: end boundaries\n\nThe hallway was quiet ____ the doors had already locked.\n\nfocus: period","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: end-boundaries\n\nlabel: end boundaries\n\nThe hallway was quiet ____ the doors had already locked.\n\nfocus: period","metadata":{"questionKey":"rw-boundaries-punctuation-16","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:end-boundaries"]}}'::jsonb,
  '{"type":"multiple_choice","choices":[".",",",";",":"],"correctIndex":0}'::jsonb,
  '{"summary":"A period ends the complete sentence correctly.","whyCorrect":"A period ends the complete sentence correctly."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-boundaries-punctuation',
  '{"stem":"The notice read ____ ''Please return the keys by 5 p.m.''","body":"kind: rw-boundaries-punctuation\n\nthemeId: end-boundaries\n\nlabel: end boundaries\n\nThe notice read ____ ''Please return the keys by 5 p.m.''\n\nfocus: colon","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: end-boundaries\n\nlabel: end boundaries\n\nThe notice read ____ ''Please return the keys by 5 p.m.''\n\nfocus: colon","metadata":{"questionKey":"rw-boundaries-punctuation-17","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:end-boundaries"]}}'::jsonb,
  '{"type":"multiple_choice","choices":[":",";",",","no punctuation"],"correctIndex":0}'::jsonb,
  '{"summary":"A colon can introduce the quotation.","whyCorrect":"A colon can introduce the quotation."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-boundaries-punctuation',
  '{"stem":"The coach spoke calmly ____ the players listened closely.","body":"kind: rw-boundaries-punctuation\n\nthemeId: end-boundaries\n\nlabel: end boundaries\n\nThe coach spoke calmly ____ the players listened closely.\n\nfocus: semicolon","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: end-boundaries\n\nlabel: end boundaries\n\nThe coach spoke calmly ____ the players listened closely.\n\nfocus: semicolon","metadata":{"questionKey":"rw-boundaries-punctuation-18","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:end-boundaries"]}}'::jsonb,
  '{"type":"multiple_choice","choices":[",",";",":","."],"correctIndex":1}'::jsonb,
  '{"summary":"A semicolon can join the two independent clauses.","whyCorrect":"A semicolon can join the two independent clauses."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-boundaries-punctuation',
  '{"stem":"The speakers arrived late ____ the event started on time.","body":"kind: rw-boundaries-punctuation\n\nthemeId: end-boundaries\n\nlabel: end boundaries\n\nThe speakers arrived late ____ the event started on time.\n\nfocus: comma","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: end-boundaries\n\nlabel: end boundaries\n\nThe speakers arrived late ____ the event started on time.\n\nfocus: comma","metadata":{"questionKey":"rw-boundaries-punctuation-19","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:end-boundaries"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["but",", but","; but",": but"],"correctIndex":1}'::jsonb,
  '{"summary":"A comma is needed before the coordinating conjunction.","whyCorrect":"A comma is needed before the coordinating conjunction."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'boundaries-punctuation'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-boundaries-punctuation',
  '{"stem":"The sample was labeled carefully ____ the lab workers could track it.","body":"kind: rw-boundaries-punctuation\n\nthemeId: end-boundaries\n\nlabel: end boundaries\n\nThe sample was labeled carefully ____ the lab workers could track it.\n\nfocus: comma","promptText":"kind: rw-boundaries-punctuation\n\nthemeId: end-boundaries\n\nlabel: end boundaries\n\nThe sample was labeled carefully ____ the lab workers could track it.\n\nfocus: comma","metadata":{"questionKey":"rw-boundaries-punctuation-20","generationSource":"generated_from_research","tags":["reading-writing","boundaries-punctuation","theme:end-boundaries"]}}'::jsonb,
  '{"type":"multiple_choice","choices":[",",";",":","no punctuation"],"correctIndex":0}'::jsonb,
  '{"summary":"A comma is correct here because the second clause follows naturally with the first.","whyCorrect":"A comma is correct here because the second clause follows naturally with the first."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-form-structure-and-sense-grammar',
  '{"stem":"Each of the students ____ a notebook and a pencil.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: agreement\n\nlabel: subject-verb agreement\n\nEach of the students ____ a notebook and a pencil.\n\nfocus: subject-verb agreement","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: agreement\n\nlabel: subject-verb agreement\n\nEach of the students ____ a notebook and a pencil.\n\nfocus: subject-verb agreement","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-01","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:agreement"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["have","has","having","had been"],"correctIndex":1}'::jsonb,
  '{"summary":"Each is singular, so has is correct.","whyCorrect":"Each is singular, so has is correct."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-form-structure-and-sense-grammar',
  '{"stem":"The series of lectures ____ scheduled for Friday afternoon.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: agreement\n\nlabel: subject-verb agreement\n\nThe series of lectures ____ scheduled for Friday afternoon.\n\nfocus: subject-verb agreement","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: agreement\n\nlabel: subject-verb agreement\n\nThe series of lectures ____ scheduled for Friday afternoon.\n\nfocus: subject-verb agreement","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-02","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:agreement"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["were","was","are","have been"],"correctIndex":1}'::jsonb,
  '{"summary":"The subject series is singular, so was is correct.","whyCorrect":"The subject series is singular, so was is correct."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-form-structure-and-sense-grammar',
  '{"stem":"Neither the manager nor the assistants ____ available at the moment.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: agreement\n\nlabel: subject-verb agreement\n\nNeither the manager nor the assistants ____ available at the moment.\n\nfocus: subject-verb agreement","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: agreement\n\nlabel: subject-verb agreement\n\nNeither the manager nor the assistants ____ available at the moment.\n\nfocus: subject-verb agreement","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-03","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:agreement"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["is","are","was","has been"],"correctIndex":1}'::jsonb,
  '{"summary":"The verb agrees with the nearer plural subject assistants.","whyCorrect":"The verb agrees with the nearer plural subject assistants."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-form-structure-and-sense-grammar',
  '{"stem":"A stack of reports ____ on the desk before class started.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: agreement\n\nlabel: subject-verb agreement\n\nA stack of reports ____ on the desk before class started.\n\nfocus: subject-verb agreement","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: agreement\n\nlabel: subject-verb agreement\n\nA stack of reports ____ on the desk before class started.\n\nfocus: subject-verb agreement","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-04","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:agreement"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["were","was","are","be"],"correctIndex":1}'::jsonb,
  '{"summary":"A stack is singular, so was is correct.","whyCorrect":"A stack is singular, so was is correct."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-form-structure-and-sense-grammar',
  '{"stem":"The pair of gloves ____ missing from the shelf.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: agreement\n\nlabel: subject-verb agreement\n\nThe pair of gloves ____ missing from the shelf.\n\nfocus: subject-verb agreement","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: agreement\n\nlabel: subject-verb agreement\n\nThe pair of gloves ____ missing from the shelf.\n\nfocus: subject-verb agreement","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-05","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:agreement"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["were","was","are","have"],"correctIndex":1}'::jsonb,
  '{"summary":"The subject pair is singular, so was is correct.","whyCorrect":"The subject pair is singular, so was is correct."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-form-structure-and-sense-grammar',
  '{"stem":"The project requires planning, testing, and ____ the results.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: parallelism\n\nlabel: parallel structure\n\nThe project requires planning, testing, and ____ the results.\n\nfocus: parallelism","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: parallelism\n\nlabel: parallel structure\n\nThe project requires planning, testing, and ____ the results.\n\nfocus: parallelism","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-06","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:parallelism"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["to explain","explaining","explains","explain"],"correctIndex":1}'::jsonb,
  '{"summary":"The items in the list should be parallel gerunds.","whyCorrect":"The items in the list should be parallel gerunds."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-form-structure-and-sense-grammar',
  '{"stem":"The speaker promised to be clear, to be brief, and ____ respectful.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: parallelism\n\nlabel: parallel structure\n\nThe speaker promised to be clear, to be brief, and ____ respectful.\n\nfocus: parallelism","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: parallelism\n\nlabel: parallel structure\n\nThe speaker promised to be clear, to be brief, and ____ respectful.\n\nfocus: parallelism","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-07","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:parallelism"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["is","being","to be","be"],"correctIndex":2}'::jsonb,
  '{"summary":"The verbs in the series should match the infinitive structure.","whyCorrect":"The verbs in the series should match the infinitive structure."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-form-structure-and-sense-grammar',
  '{"stem":"The class practiced reading, writing, and ____ carefully.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: parallelism\n\nlabel: parallel structure\n\nThe class practiced reading, writing, and ____ carefully.\n\nfocus: parallelism","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: parallelism\n\nlabel: parallel structure\n\nThe class practiced reading, writing, and ____ carefully.\n\nfocus: parallelism","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-08","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:parallelism"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["speaks","to speak","speaking","spoken"],"correctIndex":2}'::jsonb,
  '{"summary":"The three actions should be parallel gerunds.","whyCorrect":"The three actions should be parallel gerunds."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-form-structure-and-sense-grammar',
  '{"stem":"The article is interesting, detailed, and ____.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: parallelism\n\nlabel: parallel structure\n\nThe article is interesting, detailed, and ____.\n\nfocus: parallelism","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: parallelism\n\nlabel: parallel structure\n\nThe article is interesting, detailed, and ____.\n\nfocus: parallelism","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-09","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:parallelism"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["well organized","organizing well","organizes well","well organizing"],"correctIndex":0}'::jsonb,
  '{"summary":"The adjectives in the series should be parallel.","whyCorrect":"The adjectives in the series should be parallel."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-form-structure-and-sense-grammar',
  '{"stem":"The team hoped to finish the report, to check the figures, and ____ it to the teacher.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: parallelism\n\nlabel: parallel structure\n\nThe team hoped to finish the report, to check the figures, and ____ it to the teacher.\n\nfocus: parallelism","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: parallelism\n\nlabel: parallel structure\n\nThe team hoped to finish the report, to check the figures, and ____ it to the teacher.\n\nfocus: parallelism","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-10","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:parallelism"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["submit","submitting","submitted","to submitting"],"correctIndex":0}'::jsonb,
  '{"summary":"The series should use parallel infinitives.","whyCorrect":"The series should use parallel infinitives."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

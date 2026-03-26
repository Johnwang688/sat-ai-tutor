-- Continuation of initial question bank seed (part 5 of 20).
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-cross-text-connections',
  '{"stem":"How would the writer of Passage B most likely respond to the idea in Passage A?","body":"kind: rw-cross-text-connections\n\nthemeId: shared-access\n\npassageA: Passage A argues that community workshops help residents trust their own ability to fix simple problems.\n\npassageB: Passage B says that repair workshops matter because they make practical skills easier to share across a neighborhood.\n\nHow would the writer of Passage B most likely respond to the idea in Passage A?","promptText":"kind: rw-cross-text-connections\n\nthemeId: shared-access\n\npassageA: Passage A argues that community workshops help residents trust their own ability to fix simple problems.\n\npassageB: Passage B says that repair workshops matter because they make practical skills easier to share across a neighborhood.\n\nHow would the writer of Passage B most likely respond to the idea in Passage A?","metadata":{"questionKey":"rw-cross-text-connections-01","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:shared-access"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Both passages support the value of repair workshops, though they emphasize different benefits.","Passage A focuses on confidence while Passage B focuses on sharing practical skills.","Both writers see community repair as worthwhile.","The writers would likely agree that workshops can help neighborhoods."],"correctIndex":0}'::jsonb,
  '{"summary":"Both passages support the value of repair workshops, though they emphasize different benefits.","whyCorrect":"Both passages support the value of repair workshops, though they emphasize different benefits."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-cross-text-connections',
  '{"stem":"What would both passages most likely agree about?","body":"kind: rw-cross-text-connections\n\nthemeId: shared-access\n\npassageA: Passage A argues that community workshops help residents trust their own ability to fix simple problems.\n\npassageB: Passage B says that repair workshops matter because they make practical skills easier to share across a neighborhood.\n\nWhat would both passages most likely agree about?","promptText":"kind: rw-cross-text-connections\n\nthemeId: shared-access\n\npassageA: Passage A argues that community workshops help residents trust their own ability to fix simple problems.\n\npassageB: Passage B says that repair workshops matter because they make practical skills easier to share across a neighborhood.\n\nWhat would both passages most likely agree about?","metadata":{"questionKey":"rw-cross-text-connections-02","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:shared-access"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Both passages support the value of repair workshops, though they emphasize different benefits.","Both writers see community repair as worthwhile.","The writers would likely agree that workshops can help neighborhoods.","Passage A focuses on confidence while Passage B focuses on sharing practical skills."],"correctIndex":1}'::jsonb,
  '{"summary":"Passage A focuses on confidence while Passage B focuses on sharing practical skills.","whyCorrect":"Passage A focuses on confidence while Passage B focuses on sharing practical skills."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-cross-text-connections',
  '{"stem":"Which choice best describes a relationship between the two passages?","body":"kind: rw-cross-text-connections\n\nthemeId: shared-access\n\npassageA: Passage A argues that community workshops help residents trust their own ability to fix simple problems.\n\npassageB: Passage B says that repair workshops matter because they make practical skills easier to share across a neighborhood.\n\nWhich choice best describes a relationship between the two passages?","promptText":"kind: rw-cross-text-connections\n\nthemeId: shared-access\n\npassageA: Passage A argues that community workshops help residents trust their own ability to fix simple problems.\n\npassageB: Passage B says that repair workshops matter because they make practical skills easier to share across a neighborhood.\n\nWhich choice best describes a relationship between the two passages?","metadata":{"questionKey":"rw-cross-text-connections-03","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:shared-access"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Passage A focuses on confidence while Passage B focuses on sharing practical skills.","The writers would likely agree that workshops can help neighborhoods.","Both writers see community repair as worthwhile.","Both passages support the value of repair workshops, though they emphasize different benefits."],"correctIndex":2}'::jsonb,
  '{"summary":"Both writers see community repair as worthwhile.","whyCorrect":"Both writers see community repair as worthwhile."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-cross-text-connections',
  '{"stem":"What claim would the writers most likely share?","body":"kind: rw-cross-text-connections\n\nthemeId: shared-access\n\npassageA: Passage A argues that community workshops help residents trust their own ability to fix simple problems.\n\npassageB: Passage B says that repair workshops matter because they make practical skills easier to share across a neighborhood.\n\nWhat claim would the writers most likely share?","promptText":"kind: rw-cross-text-connections\n\nthemeId: shared-access\n\npassageA: Passage A argues that community workshops help residents trust their own ability to fix simple problems.\n\npassageB: Passage B says that repair workshops matter because they make practical skills easier to share across a neighborhood.\n\nWhat claim would the writers most likely share?","metadata":{"questionKey":"rw-cross-text-connections-04","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:shared-access"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Both writers see community repair as worthwhile.","The writers would likely agree that workshops can help neighborhoods.","Both passages support the value of repair workshops, though they emphasize different benefits.","Passage A focuses on confidence while Passage B focuses on sharing practical skills."],"correctIndex":3}'::jsonb,
  '{"summary":"The writers would likely agree that workshops can help neighborhoods.","whyCorrect":"The writers would likely agree that workshops can help neighborhoods."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-cross-text-connections',
  '{"stem":"Which choice best captures the connection between the passages?","body":"kind: rw-cross-text-connections\n\nthemeId: shared-access\n\npassageA: Passage A argues that community workshops help residents trust their own ability to fix simple problems.\n\npassageB: Passage B says that repair workshops matter because they make practical skills easier to share across a neighborhood.\n\nWhich choice best captures the connection between the passages?","promptText":"kind: rw-cross-text-connections\n\nthemeId: shared-access\n\npassageA: Passage A argues that community workshops help residents trust their own ability to fix simple problems.\n\npassageB: Passage B says that repair workshops matter because they make practical skills easier to share across a neighborhood.\n\nWhich choice best captures the connection between the passages?","metadata":{"questionKey":"rw-cross-text-connections-05","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:shared-access"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passages connect repair skills with community value.","Both passages support the value of repair workshops, though they emphasize different benefits.","Passage A focuses on confidence while Passage B focuses on sharing practical skills.","Both writers see community repair as worthwhile."],"correctIndex":0}'::jsonb,
  '{"summary":"The passages connect repair skills with community value.","whyCorrect":"The passages connect repair skills with community value."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-cross-text-connections',
  '{"stem":"How would the writer of Passage B most likely respond to the idea in Passage A?","body":"kind: rw-cross-text-connections\n\nthemeId: urban-gardens\n\npassageA: Passage A says rooftop gardens mostly matter because they provide fresh produce in tight urban spaces.\n\npassageB: Passage B argues that rooftop gardens are useful because they create places where neighbors can work together.\n\nHow would the writer of Passage B most likely respond to the idea in Passage A?","promptText":"kind: rw-cross-text-connections\n\nthemeId: urban-gardens\n\npassageA: Passage A says rooftop gardens mostly matter because they provide fresh produce in tight urban spaces.\n\npassageB: Passage B argues that rooftop gardens are useful because they create places where neighbors can work together.\n\nHow would the writer of Passage B most likely respond to the idea in Passage A?","metadata":{"questionKey":"rw-cross-text-connections-06","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:urban-gardens"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passages agree that rooftop gardens matter, but for different reasons.","Passage A emphasizes food access while Passage B emphasizes cooperation.","Both writers value rooftop gardens.","The writers would likely agree that gardens can serve cities well."],"correctIndex":0}'::jsonb,
  '{"summary":"The passages agree that rooftop gardens matter, but for different reasons.","whyCorrect":"The passages agree that rooftop gardens matter, but for different reasons."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-cross-text-connections',
  '{"stem":"What would both passages most likely agree about?","body":"kind: rw-cross-text-connections\n\nthemeId: urban-gardens\n\npassageA: Passage A says rooftop gardens mostly matter because they provide fresh produce in tight urban spaces.\n\npassageB: Passage B argues that rooftop gardens are useful because they create places where neighbors can work together.\n\nWhat would both passages most likely agree about?","promptText":"kind: rw-cross-text-connections\n\nthemeId: urban-gardens\n\npassageA: Passage A says rooftop gardens mostly matter because they provide fresh produce in tight urban spaces.\n\npassageB: Passage B argues that rooftop gardens are useful because they create places where neighbors can work together.\n\nWhat would both passages most likely agree about?","metadata":{"questionKey":"rw-cross-text-connections-07","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:urban-gardens"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passages agree that rooftop gardens matter, but for different reasons.","Both writers value rooftop gardens.","The writers would likely agree that gardens can serve cities well.","Passage A emphasizes food access while Passage B emphasizes cooperation."],"correctIndex":1}'::jsonb,
  '{"summary":"Passage A emphasizes food access while Passage B emphasizes cooperation.","whyCorrect":"Passage A emphasizes food access while Passage B emphasizes cooperation."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-cross-text-connections',
  '{"stem":"Which choice best describes a relationship between the two passages?","body":"kind: rw-cross-text-connections\n\nthemeId: urban-gardens\n\npassageA: Passage A says rooftop gardens mostly matter because they provide fresh produce in tight urban spaces.\n\npassageB: Passage B argues that rooftop gardens are useful because they create places where neighbors can work together.\n\nWhich choice best describes a relationship between the two passages?","promptText":"kind: rw-cross-text-connections\n\nthemeId: urban-gardens\n\npassageA: Passage A says rooftop gardens mostly matter because they provide fresh produce in tight urban spaces.\n\npassageB: Passage B argues that rooftop gardens are useful because they create places where neighbors can work together.\n\nWhich choice best describes a relationship between the two passages?","metadata":{"questionKey":"rw-cross-text-connections-08","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:urban-gardens"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Passage A emphasizes food access while Passage B emphasizes cooperation.","The writers would likely agree that gardens can serve cities well.","Both writers value rooftop gardens.","The passages agree that rooftop gardens matter, but for different reasons."],"correctIndex":2}'::jsonb,
  '{"summary":"Both writers value rooftop gardens.","whyCorrect":"Both writers value rooftop gardens."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-cross-text-connections',
  '{"stem":"What claim would the writers most likely share?","body":"kind: rw-cross-text-connections\n\nthemeId: urban-gardens\n\npassageA: Passage A says rooftop gardens mostly matter because they provide fresh produce in tight urban spaces.\n\npassageB: Passage B argues that rooftop gardens are useful because they create places where neighbors can work together.\n\nWhat claim would the writers most likely share?","promptText":"kind: rw-cross-text-connections\n\nthemeId: urban-gardens\n\npassageA: Passage A says rooftop gardens mostly matter because they provide fresh produce in tight urban spaces.\n\npassageB: Passage B argues that rooftop gardens are useful because they create places where neighbors can work together.\n\nWhat claim would the writers most likely share?","metadata":{"questionKey":"rw-cross-text-connections-09","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:urban-gardens"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Both writers value rooftop gardens.","The writers would likely agree that gardens can serve cities well.","The passages agree that rooftop gardens matter, but for different reasons.","Passage A emphasizes food access while Passage B emphasizes cooperation."],"correctIndex":3}'::jsonb,
  '{"summary":"The writers would likely agree that gardens can serve cities well.","whyCorrect":"The writers would likely agree that gardens can serve cities well."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-cross-text-connections',
  '{"stem":"Which choice best captures the connection between the passages?","body":"kind: rw-cross-text-connections\n\nthemeId: urban-gardens\n\npassageA: Passage A says rooftop gardens mostly matter because they provide fresh produce in tight urban spaces.\n\npassageB: Passage B argues that rooftop gardens are useful because they create places where neighbors can work together.\n\nWhich choice best captures the connection between the passages?","promptText":"kind: rw-cross-text-connections\n\nthemeId: urban-gardens\n\npassageA: Passage A says rooftop gardens mostly matter because they provide fresh produce in tight urban spaces.\n\npassageB: Passage B argues that rooftop gardens are useful because they create places where neighbors can work together.\n\nWhich choice best captures the connection between the passages?","metadata":{"questionKey":"rw-cross-text-connections-10","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:urban-gardens"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The connection between the passages is that each highlights a different benefit.","The passages agree that rooftop gardens matter, but for different reasons.","Passage A emphasizes food access while Passage B emphasizes cooperation.","Both writers value rooftop gardens."],"correctIndex":0}'::jsonb,
  '{"summary":"The connection between the passages is that each highlights a different benefit.","whyCorrect":"The connection between the passages is that each highlights a different benefit."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-cross-text-connections',
  '{"stem":"How would the writer of Passage B most likely respond to the idea in Passage A?","body":"kind: rw-cross-text-connections\n\nthemeId: archive-memory\n\npassageA: Passage A says oral history projects preserve details that official records often miss.\n\npassageB: Passage B argues that oral history projects help students see how memory shapes community identity.\n\nHow would the writer of Passage B most likely respond to the idea in Passage A?","promptText":"kind: rw-cross-text-connections\n\nthemeId: archive-memory\n\npassageA: Passage A says oral history projects preserve details that official records often miss.\n\npassageB: Passage B argues that oral history projects help students see how memory shapes community identity.\n\nHow would the writer of Passage B most likely respond to the idea in Passage A?","metadata":{"questionKey":"rw-cross-text-connections-11","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:archive-memory"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Both passages support oral history projects as useful, but for different purposes.","Passage A values the projects for preserving overlooked details.","Passage B values the projects for shaping identity through memory.","The writers would likely agree that memory can be valuable."],"correctIndex":0}'::jsonb,
  '{"summary":"Both passages support oral history projects as useful, but for different purposes.","whyCorrect":"Both passages support oral history projects as useful, but for different purposes."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-cross-text-connections',
  '{"stem":"What would both passages most likely agree about?","body":"kind: rw-cross-text-connections\n\nthemeId: archive-memory\n\npassageA: Passage A says oral history projects preserve details that official records often miss.\n\npassageB: Passage B argues that oral history projects help students see how memory shapes community identity.\n\nWhat would both passages most likely agree about?","promptText":"kind: rw-cross-text-connections\n\nthemeId: archive-memory\n\npassageA: Passage A says oral history projects preserve details that official records often miss.\n\npassageB: Passage B argues that oral history projects help students see how memory shapes community identity.\n\nWhat would both passages most likely agree about?","metadata":{"questionKey":"rw-cross-text-connections-12","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:archive-memory"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Both passages support oral history projects as useful, but for different purposes.","Passage B values the projects for shaping identity through memory.","The writers would likely agree that memory can be valuable.","Passage A values the projects for preserving overlooked details."],"correctIndex":1}'::jsonb,
  '{"summary":"Passage A values the projects for preserving overlooked details.","whyCorrect":"Passage A values the projects for preserving overlooked details."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-cross-text-connections',
  '{"stem":"Which choice best describes a relationship between the two passages?","body":"kind: rw-cross-text-connections\n\nthemeId: archive-memory\n\npassageA: Passage A says oral history projects preserve details that official records often miss.\n\npassageB: Passage B argues that oral history projects help students see how memory shapes community identity.\n\nWhich choice best describes a relationship between the two passages?","promptText":"kind: rw-cross-text-connections\n\nthemeId: archive-memory\n\npassageA: Passage A says oral history projects preserve details that official records often miss.\n\npassageB: Passage B argues that oral history projects help students see how memory shapes community identity.\n\nWhich choice best describes a relationship between the two passages?","metadata":{"questionKey":"rw-cross-text-connections-13","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:archive-memory"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Passage A values the projects for preserving overlooked details.","The writers would likely agree that memory can be valuable.","Passage B values the projects for shaping identity through memory.","Both passages support oral history projects as useful, but for different purposes."],"correctIndex":2}'::jsonb,
  '{"summary":"Passage B values the projects for shaping identity through memory.","whyCorrect":"Passage B values the projects for shaping identity through memory."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-cross-text-connections',
  '{"stem":"What claim would the writers most likely share?","body":"kind: rw-cross-text-connections\n\nthemeId: archive-memory\n\npassageA: Passage A says oral history projects preserve details that official records often miss.\n\npassageB: Passage B argues that oral history projects help students see how memory shapes community identity.\n\nWhat claim would the writers most likely share?","promptText":"kind: rw-cross-text-connections\n\nthemeId: archive-memory\n\npassageA: Passage A says oral history projects preserve details that official records often miss.\n\npassageB: Passage B argues that oral history projects help students see how memory shapes community identity.\n\nWhat claim would the writers most likely share?","metadata":{"questionKey":"rw-cross-text-connections-14","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:archive-memory"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Passage B values the projects for shaping identity through memory.","The writers would likely agree that memory can be valuable.","Both passages support oral history projects as useful, but for different purposes.","Passage A values the projects for preserving overlooked details."],"correctIndex":3}'::jsonb,
  '{"summary":"The writers would likely agree that memory can be valuable.","whyCorrect":"The writers would likely agree that memory can be valuable."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-cross-text-connections',
  '{"stem":"Which choice best captures the connection between the passages?","body":"kind: rw-cross-text-connections\n\nthemeId: archive-memory\n\npassageA: Passage A says oral history projects preserve details that official records often miss.\n\npassageB: Passage B argues that oral history projects help students see how memory shapes community identity.\n\nWhich choice best captures the connection between the passages?","promptText":"kind: rw-cross-text-connections\n\nthemeId: archive-memory\n\npassageA: Passage A says oral history projects preserve details that official records often miss.\n\npassageB: Passage B argues that oral history projects help students see how memory shapes community identity.\n\nWhich choice best captures the connection between the passages?","metadata":{"questionKey":"rw-cross-text-connections-15","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:archive-memory"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passages show two related but distinct reasons for using oral history.","Both passages support oral history projects as useful, but for different purposes.","Passage A values the projects for preserving overlooked details.","Passage B values the projects for shaping identity through memory."],"correctIndex":0}'::jsonb,
  '{"summary":"The passages show two related but distinct reasons for using oral history.","whyCorrect":"The passages show two related but distinct reasons for using oral history."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-cross-text-connections',
  '{"stem":"How would the writer of Passage B most likely respond to the idea in Passage A?","body":"kind: rw-cross-text-connections\n\nthemeId: storm-prep\n\npassageA: Passage A says emergency text alerts matter because they quickly share practical warnings.\n\npassageB: Passage B says emergency text alerts matter because they reduce uncertainty in the first hour after a storm.\n\nHow would the writer of Passage B most likely respond to the idea in Passage A?","promptText":"kind: rw-cross-text-connections\n\nthemeId: storm-prep\n\npassageA: Passage A says emergency text alerts matter because they quickly share practical warnings.\n\npassageB: Passage B says emergency text alerts matter because they reduce uncertainty in the first hour after a storm.\n\nHow would the writer of Passage B most likely respond to the idea in Passage A?","metadata":{"questionKey":"rw-cross-text-connections-16","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:storm-prep"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Both passages support emergency alerts as useful, but they stress different outcomes.","Passage A emphasizes speed and practical warnings.","Passage B emphasizes reducing uncertainty.","The writers would likely agree that alerts help people respond."],"correctIndex":0}'::jsonb,
  '{"summary":"Both passages support emergency alerts as useful, but they stress different outcomes.","whyCorrect":"Both passages support emergency alerts as useful, but they stress different outcomes."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-cross-text-connections',
  '{"stem":"What would both passages most likely agree about?","body":"kind: rw-cross-text-connections\n\nthemeId: storm-prep\n\npassageA: Passage A says emergency text alerts matter because they quickly share practical warnings.\n\npassageB: Passage B says emergency text alerts matter because they reduce uncertainty in the first hour after a storm.\n\nWhat would both passages most likely agree about?","promptText":"kind: rw-cross-text-connections\n\nthemeId: storm-prep\n\npassageA: Passage A says emergency text alerts matter because they quickly share practical warnings.\n\npassageB: Passage B says emergency text alerts matter because they reduce uncertainty in the first hour after a storm.\n\nWhat would both passages most likely agree about?","metadata":{"questionKey":"rw-cross-text-connections-17","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:storm-prep"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Both passages support emergency alerts as useful, but they stress different outcomes.","Passage B emphasizes reducing uncertainty.","The writers would likely agree that alerts help people respond.","Passage A emphasizes speed and practical warnings."],"correctIndex":1}'::jsonb,
  '{"summary":"Passage A emphasizes speed and practical warnings.","whyCorrect":"Passage A emphasizes speed and practical warnings."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-cross-text-connections',
  '{"stem":"Which choice best describes a relationship between the two passages?","body":"kind: rw-cross-text-connections\n\nthemeId: storm-prep\n\npassageA: Passage A says emergency text alerts matter because they quickly share practical warnings.\n\npassageB: Passage B says emergency text alerts matter because they reduce uncertainty in the first hour after a storm.\n\nWhich choice best describes a relationship between the two passages?","promptText":"kind: rw-cross-text-connections\n\nthemeId: storm-prep\n\npassageA: Passage A says emergency text alerts matter because they quickly share practical warnings.\n\npassageB: Passage B says emergency text alerts matter because they reduce uncertainty in the first hour after a storm.\n\nWhich choice best describes a relationship between the two passages?","metadata":{"questionKey":"rw-cross-text-connections-18","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:storm-prep"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Passage A emphasizes speed and practical warnings.","The writers would likely agree that alerts help people respond.","Passage B emphasizes reducing uncertainty.","Both passages support emergency alerts as useful, but they stress different outcomes."],"correctIndex":2}'::jsonb,
  '{"summary":"Passage B emphasizes reducing uncertainty.","whyCorrect":"Passage B emphasizes reducing uncertainty."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-cross-text-connections',
  '{"stem":"What claim would the writers most likely share?","body":"kind: rw-cross-text-connections\n\nthemeId: storm-prep\n\npassageA: Passage A says emergency text alerts matter because they quickly share practical warnings.\n\npassageB: Passage B says emergency text alerts matter because they reduce uncertainty in the first hour after a storm.\n\nWhat claim would the writers most likely share?","promptText":"kind: rw-cross-text-connections\n\nthemeId: storm-prep\n\npassageA: Passage A says emergency text alerts matter because they quickly share practical warnings.\n\npassageB: Passage B says emergency text alerts matter because they reduce uncertainty in the first hour after a storm.\n\nWhat claim would the writers most likely share?","metadata":{"questionKey":"rw-cross-text-connections-19","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:storm-prep"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Passage B emphasizes reducing uncertainty.","The writers would likely agree that alerts help people respond.","Both passages support emergency alerts as useful, but they stress different outcomes.","Passage A emphasizes speed and practical warnings."],"correctIndex":3}'::jsonb,
  '{"summary":"The writers would likely agree that alerts help people respond.","whyCorrect":"The writers would likely agree that alerts help people respond."}'::jsonb,
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
    and d.slug = 'craft-and-structure'
    and c.slug = 'cross-text-connections'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-cross-text-connections',
  '{"stem":"Which choice best captures the connection between the passages?","body":"kind: rw-cross-text-connections\n\nthemeId: storm-prep\n\npassageA: Passage A says emergency text alerts matter because they quickly share practical warnings.\n\npassageB: Passage B says emergency text alerts matter because they reduce uncertainty in the first hour after a storm.\n\nWhich choice best captures the connection between the passages?","promptText":"kind: rw-cross-text-connections\n\nthemeId: storm-prep\n\npassageA: Passage A says emergency text alerts matter because they quickly share practical warnings.\n\npassageB: Passage B says emergency text alerts matter because they reduce uncertainty in the first hour after a storm.\n\nWhich choice best captures the connection between the passages?","metadata":{"questionKey":"rw-cross-text-connections-20","generationSource":"generated_from_research","tags":["reading-writing","cross-text-connections","theme:storm-prep"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passages show complementary reasons to use text alerts.","Both passages support emergency alerts as useful, but they stress different outcomes.","Passage A emphasizes speed and practical warnings.","Passage B emphasizes reducing uncertainty."],"correctIndex":0}'::jsonb,
  '{"summary":"The passages show complementary reasons to use text alerts.","whyCorrect":"The passages show complementary reasons to use text alerts."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-transitions',
  '{"stem":"The path was icy. ____ the school delayed opening by two hours.","body":"kind: rw-transitions\n\nthemeId: cause-effect\n\nlabel: cause and effect\n\nThe path was icy. ____ the school delayed opening by two hours.\n\nfocus: cause-and-effect","promptText":"kind: rw-transitions\n\nthemeId: cause-effect\n\nlabel: cause and effect\n\nThe path was icy. ____ the school delayed opening by two hours.\n\nfocus: cause-and-effect","metadata":{"questionKey":"rw-transitions-01","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:cause-effect"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["However","Therefore","For example","Meanwhile"],"correctIndex":1}'::jsonb,
  '{"summary":"Therefore shows a cause-and-effect relationship.","whyCorrect":"Therefore shows a cause-and-effect relationship."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-transitions',
  '{"stem":"The team added more signs around campus. ____ visitors found the building faster.","body":"kind: rw-transitions\n\nthemeId: cause-effect\n\nlabel: cause and effect\n\nThe team added more signs around campus. ____ visitors found the building faster.\n\nfocus: cause-and-effect","promptText":"kind: rw-transitions\n\nthemeId: cause-effect\n\nlabel: cause and effect\n\nThe team added more signs around campus. ____ visitors found the building faster.\n\nfocus: cause-and-effect","metadata":{"questionKey":"rw-transitions-02","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:cause-effect"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["As a result","By contrast","For instance","Similarly"],"correctIndex":0}'::jsonb,
  '{"summary":"As a result signals a consequence.","whyCorrect":"As a result signals a consequence."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-transitions',
  '{"stem":"The lights were dimmed. ____ the room became easier to focus in.","body":"kind: rw-transitions\n\nthemeId: cause-effect\n\nlabel: cause and effect\n\nThe lights were dimmed. ____ the room became easier to focus in.\n\nfocus: cause-and-effect","promptText":"kind: rw-transitions\n\nthemeId: cause-effect\n\nlabel: cause and effect\n\nThe lights were dimmed. ____ the room became easier to focus in.\n\nfocus: cause-and-effect","metadata":{"questionKey":"rw-transitions-03","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:cause-effect"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Otherwise","Consequently","Likewise","Nevertheless"],"correctIndex":1}'::jsonb,
  '{"summary":"Consequently signals an outcome that follows the first action.","whyCorrect":"Consequently signals an outcome that follows the first action."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-transitions',
  '{"stem":"The city installed new bike racks. ____ more commuters chose to cycle.","body":"kind: rw-transitions\n\nthemeId: cause-effect\n\nlabel: cause and effect\n\nThe city installed new bike racks. ____ more commuters chose to cycle.\n\nfocus: cause-and-effect","promptText":"kind: rw-transitions\n\nthemeId: cause-effect\n\nlabel: cause and effect\n\nThe city installed new bike racks. ____ more commuters chose to cycle.\n\nfocus: cause-and-effect","metadata":{"questionKey":"rw-transitions-04","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:cause-effect"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Accordingly","Meanwhile","Instead","For example"],"correctIndex":0}'::jsonb,
  '{"summary":"Accordingly signals that the second idea follows from the first.","whyCorrect":"Accordingly signals that the second idea follows from the first."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-transitions',
  '{"stem":"The fundraiser advertised on social media. ____ attendance rose sharply.","body":"kind: rw-transitions\n\nthemeId: cause-effect\n\nlabel: cause and effect\n\nThe fundraiser advertised on social media. ____ attendance rose sharply.\n\nfocus: cause-and-effect","promptText":"kind: rw-transitions\n\nthemeId: cause-effect\n\nlabel: cause and effect\n\nThe fundraiser advertised on social media. ____ attendance rose sharply.\n\nfocus: cause-and-effect","metadata":{"questionKey":"rw-transitions-05","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:cause-effect"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Thus","Conversely","At least","In addition"],"correctIndex":0}'::jsonb,
  '{"summary":"Thus shows that the second clause is a result.","whyCorrect":"Thus shows that the second clause is a result."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-transitions',
  '{"stem":"The old theater was elegant. ____ the new one was plain but efficient.","body":"kind: rw-transitions\n\nthemeId: contrast\n\nlabel: contrast\n\nThe old theater was elegant. ____ the new one was plain but efficient.\n\nfocus: contrast","promptText":"kind: rw-transitions\n\nthemeId: contrast\n\nlabel: contrast\n\nThe old theater was elegant. ____ the new one was plain but efficient.\n\nfocus: contrast","metadata":{"questionKey":"rw-transitions-06","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:contrast"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Similarly","In contrast","As a result","For instance"],"correctIndex":1}'::jsonb,
  '{"summary":"In contrast signals a difference between the two ideas.","whyCorrect":"In contrast signals a difference between the two ideas."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-transitions',
  '{"stem":"The first draft was crowded with details. ____ the revision was more focused.","body":"kind: rw-transitions\n\nthemeId: contrast\n\nlabel: contrast\n\nThe first draft was crowded with details. ____ the revision was more focused.\n\nfocus: contrast","promptText":"kind: rw-transitions\n\nthemeId: contrast\n\nlabel: contrast\n\nThe first draft was crowded with details. ____ the revision was more focused.\n\nfocus: contrast","metadata":{"questionKey":"rw-transitions-07","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:contrast"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["On the other hand","For example","Therefore","Meanwhile"],"correctIndex":0}'::jsonb,
  '{"summary":"On the other hand introduces a contrasting idea.","whyCorrect":"On the other hand introduces a contrasting idea."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-transitions',
  '{"stem":"The garden looked small from the street. ____ it felt much larger once visitors entered.","body":"kind: rw-transitions\n\nthemeId: contrast\n\nlabel: contrast\n\nThe garden looked small from the street. ____ it felt much larger once visitors entered.\n\nfocus: contrast","promptText":"kind: rw-transitions\n\nthemeId: contrast\n\nlabel: contrast\n\nThe garden looked small from the street. ____ it felt much larger once visitors entered.\n\nfocus: contrast","metadata":{"questionKey":"rw-transitions-08","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:contrast"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["However","Since","Moreover","Likewise"],"correctIndex":0}'::jsonb,
  '{"summary":"However signals a contrast with the previous statement.","whyCorrect":"However signals a contrast with the previous statement."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-transitions',
  '{"stem":"The article praised the program''s reach. ____ it also noted the program''s limited funding.","body":"kind: rw-transitions\n\nthemeId: contrast\n\nlabel: contrast\n\nThe article praised the program''s reach. ____ it also noted the program''s limited funding.\n\nfocus: contrast","promptText":"kind: rw-transitions\n\nthemeId: contrast\n\nlabel: contrast\n\nThe article praised the program''s reach. ____ it also noted the program''s limited funding.\n\nfocus: contrast","metadata":{"questionKey":"rw-transitions-09","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:contrast"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Yet","Accordingly","In order to","As a result"],"correctIndex":0}'::jsonb,
  '{"summary":"Yet introduces a contrasting point.","whyCorrect":"Yet introduces a contrasting point."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-transitions',
  '{"stem":"The exhibit was small. ____ the display felt carefully curated.","body":"kind: rw-transitions\n\nthemeId: contrast\n\nlabel: contrast\n\nThe exhibit was small. ____ the display felt carefully curated.\n\nfocus: contrast","promptText":"kind: rw-transitions\n\nthemeId: contrast\n\nlabel: contrast\n\nThe exhibit was small. ____ the display felt carefully curated.\n\nfocus: contrast","metadata":{"questionKey":"rw-transitions-10","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:contrast"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Still","Because","For example","Then"],"correctIndex":0}'::jsonb,
  '{"summary":"Still shows that the second idea contrasts with the first.","whyCorrect":"Still shows that the second idea contrasts with the first."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

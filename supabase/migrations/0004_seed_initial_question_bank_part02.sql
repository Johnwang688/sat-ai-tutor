-- Continuation of initial question bank seed (part 2 of 20).
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-textual'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice best supports the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: clinic-schedule\n\nA neighborhood clinic changed its appointment schedule so that patients could book earlier check-ins on Tuesdays and Thursdays. Staff members said the new system shortened the waiting line in the lobby and reduced the number of people who left before being seen. The manager described the change as a practical way to improve access.\n\nThe clinic''s new schedule improved access for patients.\n\nWhich choice best supports the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: clinic-schedule\n\nA neighborhood clinic changed its appointment schedule so that patients could book earlier check-ins on Tuesdays and Thursdays. Staff members said the new system shortened the waiting line in the lobby and reduced the number of people who left before being seen. The manager described the change as a practical way to improve access.\n\nThe clinic''s new schedule improved access for patients.\n\nWhich choice best supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-11","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:clinic-schedule"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The manager described the change as a practical way to improve access.","The new system shortened the waiting line in the lobby.","The change reduced the number of people who left before being seen.","Patients could book earlier check-ins on Tuesdays and Thursdays."],"correctIndex":0}'::jsonb,
  '{"summary":"The manager described the change as a practical way to improve access.","whyCorrect":"The manager described the change as a practical way to improve access."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-textual'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice provides the strongest textual evidence for the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: clinic-schedule\n\nA neighborhood clinic changed its appointment schedule so that patients could book earlier check-ins on Tuesdays and Thursdays. Staff members said the new system shortened the waiting line in the lobby and reduced the number of people who left before being seen. The manager described the change as a practical way to improve access.\n\nThe clinic''s new schedule improved access for patients.\n\nWhich choice provides the strongest textual evidence for the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: clinic-schedule\n\nA neighborhood clinic changed its appointment schedule so that patients could book earlier check-ins on Tuesdays and Thursdays. Staff members said the new system shortened the waiting line in the lobby and reduced the number of people who left before being seen. The manager described the change as a practical way to improve access.\n\nThe clinic''s new schedule improved access for patients.\n\nWhich choice provides the strongest textual evidence for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-12","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:clinic-schedule"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The manager described the change as a practical way to improve access.","The change reduced the number of people who left before being seen.","Patients could book earlier check-ins on Tuesdays and Thursdays.","The new system shortened the waiting line in the lobby."],"correctIndex":1}'::jsonb,
  '{"summary":"The new system shortened the waiting line in the lobby.","whyCorrect":"The new system shortened the waiting line in the lobby."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-textual'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice would the author most likely cite as support for the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: clinic-schedule\n\nA neighborhood clinic changed its appointment schedule so that patients could book earlier check-ins on Tuesdays and Thursdays. Staff members said the new system shortened the waiting line in the lobby and reduced the number of people who left before being seen. The manager described the change as a practical way to improve access.\n\nThe clinic''s new schedule improved access for patients.\n\nWhich choice would the author most likely cite as support for the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: clinic-schedule\n\nA neighborhood clinic changed its appointment schedule so that patients could book earlier check-ins on Tuesdays and Thursdays. Staff members said the new system shortened the waiting line in the lobby and reduced the number of people who left before being seen. The manager described the change as a practical way to improve access.\n\nThe clinic''s new schedule improved access for patients.\n\nWhich choice would the author most likely cite as support for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-13","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:clinic-schedule"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The new system shortened the waiting line in the lobby.","Patients could book earlier check-ins on Tuesdays and Thursdays.","The change reduced the number of people who left before being seen.","The manager described the change as a practical way to improve access."],"correctIndex":2}'::jsonb,
  '{"summary":"The change reduced the number of people who left before being seen.","whyCorrect":"The change reduced the number of people who left before being seen."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-textual'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice most directly backs the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: clinic-schedule\n\nA neighborhood clinic changed its appointment schedule so that patients could book earlier check-ins on Tuesdays and Thursdays. Staff members said the new system shortened the waiting line in the lobby and reduced the number of people who left before being seen. The manager described the change as a practical way to improve access.\n\nThe clinic''s new schedule improved access for patients.\n\nWhich choice most directly backs the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: clinic-schedule\n\nA neighborhood clinic changed its appointment schedule so that patients could book earlier check-ins on Tuesdays and Thursdays. Staff members said the new system shortened the waiting line in the lobby and reduced the number of people who left before being seen. The manager described the change as a practical way to improve access.\n\nThe clinic''s new schedule improved access for patients.\n\nWhich choice most directly backs the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-14","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:clinic-schedule"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The change reduced the number of people who left before being seen.","Patients could book earlier check-ins on Tuesdays and Thursdays.","The manager described the change as a practical way to improve access.","The new system shortened the waiting line in the lobby."],"correctIndex":3}'::jsonb,
  '{"summary":"Patients could book earlier check-ins on Tuesdays and Thursdays.","whyCorrect":"Patients could book earlier check-ins on Tuesdays and Thursdays."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-textual'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice best confirms the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: clinic-schedule\n\nA neighborhood clinic changed its appointment schedule so that patients could book earlier check-ins on Tuesdays and Thursdays. Staff members said the new system shortened the waiting line in the lobby and reduced the number of people who left before being seen. The manager described the change as a practical way to improve access.\n\nThe clinic''s new schedule improved access for patients.\n\nWhich choice best confirms the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: clinic-schedule\n\nA neighborhood clinic changed its appointment schedule so that patients could book earlier check-ins on Tuesdays and Thursdays. Staff members said the new system shortened the waiting line in the lobby and reduced the number of people who left before being seen. The manager described the change as a practical way to improve access.\n\nThe clinic''s new schedule improved access for patients.\n\nWhich choice best confirms the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-15","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:clinic-schedule"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Staff members changed the schedule to match patient availability.","The manager described the change as a practical way to improve access.","The new system shortened the waiting line in the lobby.","The change reduced the number of people who left before being seen."],"correctIndex":0}'::jsonb,
  '{"summary":"Staff members changed the schedule to match patient availability.","whyCorrect":"Staff members changed the schedule to match patient availability."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-textual'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice best supports the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: tree-planting\n\nVolunteers planting shade trees on a hot schoolyard tracked the difference in temperature before and after the project. The surface near the trees stayed cooler at midday, and teachers said students now used the courtyard more often during lunch. The group shared the results with the district to support future planting plans.\n\nThe tree-planting project made the courtyard more usable during the day.\n\nWhich choice best supports the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: tree-planting\n\nVolunteers planting shade trees on a hot schoolyard tracked the difference in temperature before and after the project. The surface near the trees stayed cooler at midday, and teachers said students now used the courtyard more often during lunch. The group shared the results with the district to support future planting plans.\n\nThe tree-planting project made the courtyard more usable during the day.\n\nWhich choice best supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-16","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:tree-planting"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The surface near the trees stayed cooler at midday.","Teachers said students used the courtyard more often during lunch.","The group shared the results with the district.","Volunteers tracked the difference in temperature before and after the project."],"correctIndex":0}'::jsonb,
  '{"summary":"The surface near the trees stayed cooler at midday.","whyCorrect":"The surface near the trees stayed cooler at midday."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-textual'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice provides the strongest textual evidence for the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: tree-planting\n\nVolunteers planting shade trees on a hot schoolyard tracked the difference in temperature before and after the project. The surface near the trees stayed cooler at midday, and teachers said students now used the courtyard more often during lunch. The group shared the results with the district to support future planting plans.\n\nThe tree-planting project made the courtyard more usable during the day.\n\nWhich choice provides the strongest textual evidence for the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: tree-planting\n\nVolunteers planting shade trees on a hot schoolyard tracked the difference in temperature before and after the project. The surface near the trees stayed cooler at midday, and teachers said students now used the courtyard more often during lunch. The group shared the results with the district to support future planting plans.\n\nThe tree-planting project made the courtyard more usable during the day.\n\nWhich choice provides the strongest textual evidence for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-17","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:tree-planting"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The surface near the trees stayed cooler at midday.","The group shared the results with the district.","Volunteers tracked the difference in temperature before and after the project.","Teachers said students used the courtyard more often during lunch."],"correctIndex":1}'::jsonb,
  '{"summary":"Teachers said students used the courtyard more often during lunch.","whyCorrect":"Teachers said students used the courtyard more often during lunch."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-textual'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice would the author most likely cite as support for the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: tree-planting\n\nVolunteers planting shade trees on a hot schoolyard tracked the difference in temperature before and after the project. The surface near the trees stayed cooler at midday, and teachers said students now used the courtyard more often during lunch. The group shared the results with the district to support future planting plans.\n\nThe tree-planting project made the courtyard more usable during the day.\n\nWhich choice would the author most likely cite as support for the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: tree-planting\n\nVolunteers planting shade trees on a hot schoolyard tracked the difference in temperature before and after the project. The surface near the trees stayed cooler at midday, and teachers said students now used the courtyard more often during lunch. The group shared the results with the district to support future planting plans.\n\nThe tree-planting project made the courtyard more usable during the day.\n\nWhich choice would the author most likely cite as support for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-18","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:tree-planting"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Teachers said students used the courtyard more often during lunch.","Volunteers tracked the difference in temperature before and after the project.","The group shared the results with the district.","The surface near the trees stayed cooler at midday."],"correctIndex":2}'::jsonb,
  '{"summary":"The group shared the results with the district.","whyCorrect":"The group shared the results with the district."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-textual'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice most directly backs the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: tree-planting\n\nVolunteers planting shade trees on a hot schoolyard tracked the difference in temperature before and after the project. The surface near the trees stayed cooler at midday, and teachers said students now used the courtyard more often during lunch. The group shared the results with the district to support future planting plans.\n\nThe tree-planting project made the courtyard more usable during the day.\n\nWhich choice most directly backs the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: tree-planting\n\nVolunteers planting shade trees on a hot schoolyard tracked the difference in temperature before and after the project. The surface near the trees stayed cooler at midday, and teachers said students now used the courtyard more often during lunch. The group shared the results with the district to support future planting plans.\n\nThe tree-planting project made the courtyard more usable during the day.\n\nWhich choice most directly backs the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-19","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:tree-planting"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The group shared the results with the district.","Volunteers tracked the difference in temperature before and after the project.","The surface near the trees stayed cooler at midday.","Teachers said students used the courtyard more often during lunch."],"correctIndex":3}'::jsonb,
  '{"summary":"Volunteers tracked the difference in temperature before and after the project.","whyCorrect":"Volunteers tracked the difference in temperature before and after the project."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-textual'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice best confirms the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: tree-planting\n\nVolunteers planting shade trees on a hot schoolyard tracked the difference in temperature before and after the project. The surface near the trees stayed cooler at midday, and teachers said students now used the courtyard more often during lunch. The group shared the results with the district to support future planting plans.\n\nThe tree-planting project made the courtyard more usable during the day.\n\nWhich choice best confirms the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: tree-planting\n\nVolunteers planting shade trees on a hot schoolyard tracked the difference in temperature before and after the project. The surface near the trees stayed cooler at midday, and teachers said students now used the courtyard more often during lunch. The group shared the results with the district to support future planting plans.\n\nThe tree-planting project made the courtyard more usable during the day.\n\nWhich choice best confirms the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-20","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:tree-planting"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The project added shade trees to a hot schoolyard.","The surface near the trees stayed cooler at midday.","Teachers said students used the courtyard more often during lunch.","The group shared the results with the district."],"correctIndex":0}'::jsonb,
  '{"summary":"The project added shade trees to a hot schoolyard.","whyCorrect":"The project added shade trees to a hot schoolyard."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice best supports the claim below using the data provided?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: library-usage\n\nA survey of 120 students found that 72 borrowed a book more than once a month, 36 borrowed books only a few times a semester, and 12 rarely borrowed books.\n\nMost surveyed students borrowed books regularly.\n\nWhich choice best supports the claim below using the data provided?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: library-usage\n\nA survey of 120 students found that 72 borrowed a book more than once a month, 36 borrowed books only a few times a semester, and 12 rarely borrowed books.\n\nMost surveyed students borrowed books regularly.\n\nWhich choice best supports the claim below using the data provided?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-01","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:library-usage"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Seventy-two students borrowed a book more than once a month.","Seventy-two is greater than the combined total of the other two groups.","The regular borrowers outnumbered the rare borrowers by sixty.","Only twelve students said they rarely borrowed books."],"correctIndex":0}'::jsonb,
  '{"summary":"Seventy-two students borrowed a book more than once a month.","whyCorrect":"Seventy-two students borrowed a book more than once a month."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice provides the strongest quantitative evidence for the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: library-usage\n\nA survey of 120 students found that 72 borrowed a book more than once a month, 36 borrowed books only a few times a semester, and 12 rarely borrowed books.\n\nMost surveyed students borrowed books regularly.\n\nWhich choice provides the strongest quantitative evidence for the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: library-usage\n\nA survey of 120 students found that 72 borrowed a book more than once a month, 36 borrowed books only a few times a semester, and 12 rarely borrowed books.\n\nMost surveyed students borrowed books regularly.\n\nWhich choice provides the strongest quantitative evidence for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-02","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:library-usage"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Seventy-two students borrowed a book more than once a month.","The regular borrowers outnumbered the rare borrowers by sixty.","Only twelve students said they rarely borrowed books.","Seventy-two is greater than the combined total of the other two groups."],"correctIndex":1}'::jsonb,
  '{"summary":"Seventy-two is greater than the combined total of the other two groups.","whyCorrect":"Seventy-two is greater than the combined total of the other two groups."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice is most consistent with the data and supports the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: library-usage\n\nA survey of 120 students found that 72 borrowed a book more than once a month, 36 borrowed books only a few times a semester, and 12 rarely borrowed books.\n\nMost surveyed students borrowed books regularly.\n\nWhich choice is most consistent with the data and supports the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: library-usage\n\nA survey of 120 students found that 72 borrowed a book more than once a month, 36 borrowed books only a few times a semester, and 12 rarely borrowed books.\n\nMost surveyed students borrowed books regularly.\n\nWhich choice is most consistent with the data and supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-03","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:library-usage"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Seventy-two is greater than the combined total of the other two groups.","Only twelve students said they rarely borrowed books.","The regular borrowers outnumbered the rare borrowers by sixty.","Seventy-two students borrowed a book more than once a month."],"correctIndex":2}'::jsonb,
  '{"summary":"The regular borrowers outnumbered the rare borrowers by sixty.","whyCorrect":"The regular borrowers outnumbered the rare borrowers by sixty."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice would best justify the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: library-usage\n\nA survey of 120 students found that 72 borrowed a book more than once a month, 36 borrowed books only a few times a semester, and 12 rarely borrowed books.\n\nMost surveyed students borrowed books regularly.\n\nWhich choice would best justify the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: library-usage\n\nA survey of 120 students found that 72 borrowed a book more than once a month, 36 borrowed books only a few times a semester, and 12 rarely borrowed books.\n\nMost surveyed students borrowed books regularly.\n\nWhich choice would best justify the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-04","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:library-usage"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The regular borrowers outnumbered the rare borrowers by sixty.","Only twelve students said they rarely borrowed books.","Seventy-two students borrowed a book more than once a month.","Seventy-two is greater than the combined total of the other two groups."],"correctIndex":3}'::jsonb,
  '{"summary":"Only twelve students said they rarely borrowed books.","whyCorrect":"Only twelve students said they rarely borrowed books."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice best matches the trend shown in the data and supports the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: library-usage\n\nA survey of 120 students found that 72 borrowed a book more than once a month, 36 borrowed books only a few times a semester, and 12 rarely borrowed books.\n\nMost surveyed students borrowed books regularly.\n\nWhich choice best matches the trend shown in the data and supports the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: library-usage\n\nA survey of 120 students found that 72 borrowed a book more than once a month, 36 borrowed books only a few times a semester, and 12 rarely borrowed books.\n\nMost surveyed students borrowed books regularly.\n\nWhich choice best matches the trend shown in the data and supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-05","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:library-usage"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The survey included 120 students in all.","Seventy-two students borrowed a book more than once a month.","Seventy-two is greater than the combined total of the other two groups.","The regular borrowers outnumbered the rare borrowers by sixty."],"correctIndex":0}'::jsonb,
  '{"summary":"The survey included 120 students in all.","whyCorrect":"The survey included 120 students in all."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice best supports the claim below using the data provided?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: commute-times\n\nA transportation study tracked average commute times for three neighborhoods. Neighborhood A averaged 18 minutes, Neighborhood B averaged 26 minutes, and Neighborhood C averaged 31 minutes after a bus route change.\n\nThe route change was associated with different commute times across neighborhoods.\n\nWhich choice best supports the claim below using the data provided?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: commute-times\n\nA transportation study tracked average commute times for three neighborhoods. Neighborhood A averaged 18 minutes, Neighborhood B averaged 26 minutes, and Neighborhood C averaged 31 minutes after a bus route change.\n\nThe route change was associated with different commute times across neighborhoods.\n\nWhich choice best supports the claim below using the data provided?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-06","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:commute-times"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The study reported average commute times for three neighborhoods.","Neighborhood A averaged 18 minutes.","Neighborhood B averaged 26 minutes.","Neighborhood C averaged 31 minutes."],"correctIndex":0}'::jsonb,
  '{"summary":"The study reported average commute times for three neighborhoods.","whyCorrect":"The study reported average commute times for three neighborhoods."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice provides the strongest quantitative evidence for the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: commute-times\n\nA transportation study tracked average commute times for three neighborhoods. Neighborhood A averaged 18 minutes, Neighborhood B averaged 26 minutes, and Neighborhood C averaged 31 minutes after a bus route change.\n\nThe route change was associated with different commute times across neighborhoods.\n\nWhich choice provides the strongest quantitative evidence for the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: commute-times\n\nA transportation study tracked average commute times for three neighborhoods. Neighborhood A averaged 18 minutes, Neighborhood B averaged 26 minutes, and Neighborhood C averaged 31 minutes after a bus route change.\n\nThe route change was associated with different commute times across neighborhoods.\n\nWhich choice provides the strongest quantitative evidence for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-07","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:commute-times"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The study reported average commute times for three neighborhoods.","Neighborhood B averaged 26 minutes.","Neighborhood C averaged 31 minutes.","Neighborhood A averaged 18 minutes."],"correctIndex":1}'::jsonb,
  '{"summary":"Neighborhood A averaged 18 minutes.","whyCorrect":"Neighborhood A averaged 18 minutes."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice is most consistent with the data and supports the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: commute-times\n\nA transportation study tracked average commute times for three neighborhoods. Neighborhood A averaged 18 minutes, Neighborhood B averaged 26 minutes, and Neighborhood C averaged 31 minutes after a bus route change.\n\nThe route change was associated with different commute times across neighborhoods.\n\nWhich choice is most consistent with the data and supports the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: commute-times\n\nA transportation study tracked average commute times for three neighborhoods. Neighborhood A averaged 18 minutes, Neighborhood B averaged 26 minutes, and Neighborhood C averaged 31 minutes after a bus route change.\n\nThe route change was associated with different commute times across neighborhoods.\n\nWhich choice is most consistent with the data and supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-08","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:commute-times"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Neighborhood A averaged 18 minutes.","Neighborhood C averaged 31 minutes.","Neighborhood B averaged 26 minutes.","The study reported average commute times for three neighborhoods."],"correctIndex":2}'::jsonb,
  '{"summary":"Neighborhood B averaged 26 minutes.","whyCorrect":"Neighborhood B averaged 26 minutes."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice would best justify the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: commute-times\n\nA transportation study tracked average commute times for three neighborhoods. Neighborhood A averaged 18 minutes, Neighborhood B averaged 26 minutes, and Neighborhood C averaged 31 minutes after a bus route change.\n\nThe route change was associated with different commute times across neighborhoods.\n\nWhich choice would best justify the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: commute-times\n\nA transportation study tracked average commute times for three neighborhoods. Neighborhood A averaged 18 minutes, Neighborhood B averaged 26 minutes, and Neighborhood C averaged 31 minutes after a bus route change.\n\nThe route change was associated with different commute times across neighborhoods.\n\nWhich choice would best justify the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-09","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:commute-times"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Neighborhood B averaged 26 minutes.","Neighborhood C averaged 31 minutes.","The study reported average commute times for three neighborhoods.","Neighborhood A averaged 18 minutes."],"correctIndex":3}'::jsonb,
  '{"summary":"Neighborhood C averaged 31 minutes.","whyCorrect":"Neighborhood C averaged 31 minutes."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice best matches the trend shown in the data and supports the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: commute-times\n\nA transportation study tracked average commute times for three neighborhoods. Neighborhood A averaged 18 minutes, Neighborhood B averaged 26 minutes, and Neighborhood C averaged 31 minutes after a bus route change.\n\nThe route change was associated with different commute times across neighborhoods.\n\nWhich choice best matches the trend shown in the data and supports the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: commute-times\n\nA transportation study tracked average commute times for three neighborhoods. Neighborhood A averaged 18 minutes, Neighborhood B averaged 26 minutes, and Neighborhood C averaged 31 minutes after a bus route change.\n\nThe route change was associated with different commute times across neighborhoods.\n\nWhich choice best matches the trend shown in the data and supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-10","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:commute-times"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The route change was associated with different commute times across neighborhoods.","The study reported average commute times for three neighborhoods.","Neighborhood A averaged 18 minutes.","Neighborhood B averaged 26 minutes."],"correctIndex":0}'::jsonb,
  '{"summary":"The route change was associated with different commute times across neighborhoods.","whyCorrect":"The route change was associated with different commute times across neighborhoods."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice best supports the claim below using the data provided?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: garden-harvest\n\nA school garden logged produce over four weeks: week 1, 14 pounds; week 2, 17 pounds; week 3, 21 pounds; week 4, 24 pounds.\n\nThe garden harvest generally increased over the month.\n\nWhich choice best supports the claim below using the data provided?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: garden-harvest\n\nA school garden logged produce over four weeks: week 1, 14 pounds; week 2, 17 pounds; week 3, 21 pounds; week 4, 24 pounds.\n\nThe garden harvest generally increased over the month.\n\nWhich choice best supports the claim below using the data provided?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-11","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:garden-harvest"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The harvest rose from 14 pounds in week 1 to 24 pounds in week 4.","Each week produced more pounds than the previous week.","The final week produced the highest total.","The data show a general increase over the month."],"correctIndex":0}'::jsonb,
  '{"summary":"The harvest rose from 14 pounds in week 1 to 24 pounds in week 4.","whyCorrect":"The harvest rose from 14 pounds in week 1 to 24 pounds in week 4."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice provides the strongest quantitative evidence for the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: garden-harvest\n\nA school garden logged produce over four weeks: week 1, 14 pounds; week 2, 17 pounds; week 3, 21 pounds; week 4, 24 pounds.\n\nThe garden harvest generally increased over the month.\n\nWhich choice provides the strongest quantitative evidence for the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: garden-harvest\n\nA school garden logged produce over four weeks: week 1, 14 pounds; week 2, 17 pounds; week 3, 21 pounds; week 4, 24 pounds.\n\nThe garden harvest generally increased over the month.\n\nWhich choice provides the strongest quantitative evidence for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-12","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:garden-harvest"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The harvest rose from 14 pounds in week 1 to 24 pounds in week 4.","The final week produced the highest total.","The data show a general increase over the month.","Each week produced more pounds than the previous week."],"correctIndex":1}'::jsonb,
  '{"summary":"Each week produced more pounds than the previous week.","whyCorrect":"Each week produced more pounds than the previous week."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice is most consistent with the data and supports the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: garden-harvest\n\nA school garden logged produce over four weeks: week 1, 14 pounds; week 2, 17 pounds; week 3, 21 pounds; week 4, 24 pounds.\n\nThe garden harvest generally increased over the month.\n\nWhich choice is most consistent with the data and supports the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: garden-harvest\n\nA school garden logged produce over four weeks: week 1, 14 pounds; week 2, 17 pounds; week 3, 21 pounds; week 4, 24 pounds.\n\nThe garden harvest generally increased over the month.\n\nWhich choice is most consistent with the data and supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-13","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:garden-harvest"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Each week produced more pounds than the previous week.","The data show a general increase over the month.","The final week produced the highest total.","The harvest rose from 14 pounds in week 1 to 24 pounds in week 4."],"correctIndex":2}'::jsonb,
  '{"summary":"The final week produced the highest total.","whyCorrect":"The final week produced the highest total."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice would best justify the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: garden-harvest\n\nA school garden logged produce over four weeks: week 1, 14 pounds; week 2, 17 pounds; week 3, 21 pounds; week 4, 24 pounds.\n\nThe garden harvest generally increased over the month.\n\nWhich choice would best justify the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: garden-harvest\n\nA school garden logged produce over four weeks: week 1, 14 pounds; week 2, 17 pounds; week 3, 21 pounds; week 4, 24 pounds.\n\nThe garden harvest generally increased over the month.\n\nWhich choice would best justify the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-14","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:garden-harvest"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The final week produced the highest total.","The data show a general increase over the month.","The harvest rose from 14 pounds in week 1 to 24 pounds in week 4.","Each week produced more pounds than the previous week."],"correctIndex":3}'::jsonb,
  '{"summary":"The data show a general increase over the month.","whyCorrect":"The data show a general increase over the month."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice best matches the trend shown in the data and supports the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: garden-harvest\n\nA school garden logged produce over four weeks: week 1, 14 pounds; week 2, 17 pounds; week 3, 21 pounds; week 4, 24 pounds.\n\nThe garden harvest generally increased over the month.\n\nWhich choice best matches the trend shown in the data and supports the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: garden-harvest\n\nA school garden logged produce over four weeks: week 1, 14 pounds; week 2, 17 pounds; week 3, 21 pounds; week 4, 24 pounds.\n\nThe garden harvest generally increased over the month.\n\nWhich choice best matches the trend shown in the data and supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-15","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:garden-harvest"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The garden logged produce over four weeks.","The harvest rose from 14 pounds in week 1 to 24 pounds in week 4.","Each week produced more pounds than the previous week.","The final week produced the highest total."],"correctIndex":0}'::jsonb,
  '{"summary":"The garden logged produce over four weeks.","whyCorrect":"The garden logged produce over four weeks."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice best supports the claim below using the data provided?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: workshop-attendance\n\nA weekend workshop series drew 40 attendees on day one, 55 on day two, and 58 on day three. Staff said the higher turnout happened after the event was advertised more widely online.\n\nAdvertising the workshop more widely was linked to higher turnout.\n\nWhich choice best supports the claim below using the data provided?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: workshop-attendance\n\nA weekend workshop series drew 40 attendees on day one, 55 on day two, and 58 on day three. Staff said the higher turnout happened after the event was advertised more widely online.\n\nAdvertising the workshop more widely was linked to higher turnout.\n\nWhich choice best supports the claim below using the data provided?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-16","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:workshop-attendance"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Attendance increased from 40 to 58 across the three days.","Staff said turnout rose after the event was advertised online.","The largest audience came on day three.","The workshop series drew 55 attendees on day two."],"correctIndex":0}'::jsonb,
  '{"summary":"Attendance increased from 40 to 58 across the three days.","whyCorrect":"Attendance increased from 40 to 58 across the three days."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice provides the strongest quantitative evidence for the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: workshop-attendance\n\nA weekend workshop series drew 40 attendees on day one, 55 on day two, and 58 on day three. Staff said the higher turnout happened after the event was advertised more widely online.\n\nAdvertising the workshop more widely was linked to higher turnout.\n\nWhich choice provides the strongest quantitative evidence for the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: workshop-attendance\n\nA weekend workshop series drew 40 attendees on day one, 55 on day two, and 58 on day three. Staff said the higher turnout happened after the event was advertised more widely online.\n\nAdvertising the workshop more widely was linked to higher turnout.\n\nWhich choice provides the strongest quantitative evidence for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-17","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:workshop-attendance"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Attendance increased from 40 to 58 across the three days.","The largest audience came on day three.","The workshop series drew 55 attendees on day two.","Staff said turnout rose after the event was advertised online."],"correctIndex":1}'::jsonb,
  '{"summary":"Staff said turnout rose after the event was advertised online.","whyCorrect":"Staff said turnout rose after the event was advertised online."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice is most consistent with the data and supports the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: workshop-attendance\n\nA weekend workshop series drew 40 attendees on day one, 55 on day two, and 58 on day three. Staff said the higher turnout happened after the event was advertised more widely online.\n\nAdvertising the workshop more widely was linked to higher turnout.\n\nWhich choice is most consistent with the data and supports the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: workshop-attendance\n\nA weekend workshop series drew 40 attendees on day one, 55 on day two, and 58 on day three. Staff said the higher turnout happened after the event was advertised more widely online.\n\nAdvertising the workshop more widely was linked to higher turnout.\n\nWhich choice is most consistent with the data and supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-18","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:workshop-attendance"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Staff said turnout rose after the event was advertised online.","The workshop series drew 55 attendees on day two.","The largest audience came on day three.","Attendance increased from 40 to 58 across the three days."],"correctIndex":2}'::jsonb,
  '{"summary":"The largest audience came on day three.","whyCorrect":"The largest audience came on day three."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice would best justify the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: workshop-attendance\n\nA weekend workshop series drew 40 attendees on day one, 55 on day two, and 58 on day three. Staff said the higher turnout happened after the event was advertised more widely online.\n\nAdvertising the workshop more widely was linked to higher turnout.\n\nWhich choice would best justify the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: workshop-attendance\n\nA weekend workshop series drew 40 attendees on day one, 55 on day two, and 58 on day three. Staff said the higher turnout happened after the event was advertised more widely online.\n\nAdvertising the workshop more widely was linked to higher turnout.\n\nWhich choice would best justify the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-19","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:workshop-attendance"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The largest audience came on day three.","The workshop series drew 55 attendees on day two.","Attendance increased from 40 to 58 across the three days.","Staff said turnout rose after the event was advertised online."],"correctIndex":3}'::jsonb,
  '{"summary":"The workshop series drew 55 attendees on day two.","whyCorrect":"The workshop series drew 55 attendees on day two."}'::jsonb,
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
    and d.slug = 'information-and-ideas'
    and c.slug = 'command-of-evidence-quantitative'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-command-of-evidence-quantitative',
  '{"stem":"Which choice best matches the trend shown in the data and supports the claim below?","body":"kind: rw-command-of-evidence-quantitative\n\nthemeId: workshop-attendance\n\nA weekend workshop series drew 40 attendees on day one, 55 on day two, and 58 on day three. Staff said the higher turnout happened after the event was advertised more widely online.\n\nAdvertising the workshop more widely was linked to higher turnout.\n\nWhich choice best matches the trend shown in the data and supports the claim below?","promptText":"kind: rw-command-of-evidence-quantitative\n\nthemeId: workshop-attendance\n\nA weekend workshop series drew 40 attendees on day one, 55 on day two, and 58 on day three. Staff said the higher turnout happened after the event was advertised more widely online.\n\nAdvertising the workshop more widely was linked to higher turnout.\n\nWhich choice best matches the trend shown in the data and supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-quantitative-20","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-quantitative","theme:workshop-attendance"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The event was held over a weekend.","Attendance increased from 40 to 58 across the three days.","Staff said turnout rose after the event was advertised online.","The largest audience came on day three."],"correctIndex":0}'::jsonb,
  '{"summary":"The event was held over a weekend.","whyCorrect":"The event was held over a weekend."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

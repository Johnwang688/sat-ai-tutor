-- Continuation of initial question bank seed (part 3 of 20).
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-inferences',
  '{"stem":"Which choice is best supported by the passage?","body":"kind: rw-inferences\n\nthemeId: late-shift-bakery\n\nThe bakery opens before sunrise, and the first tray of bread is usually gone by 7:30 a.m. Customers line up outside even when the weather is cold because the owner bakes only small batches. By noon, the shelves are empty and the oven is already cooling for the next day.\n\nWhich choice is best supported by the passage?","promptText":"kind: rw-inferences\n\nthemeId: late-shift-bakery\n\nThe bakery opens before sunrise, and the first tray of bread is usually gone by 7:30 a.m. Customers line up outside even when the weather is cold because the owner bakes only small batches. By noon, the shelves are empty and the oven is already cooling for the next day.\n\nWhich choice is best supported by the passage?","metadata":{"questionKey":"rw-inferences-01","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:late-shift-bakery"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The bakery likely has a steady customer base that values fresh bread.","The owner probably prefers quality and freshness over large-scale production.","The bakery probably sells most of its bread early in the day.","The small batches likely help the bread stay fresh."],"correctIndex":0}'::jsonb,
  '{"summary":"The bakery likely has a steady customer base that values fresh bread.","whyCorrect":"The bakery likely has a steady customer base that values fresh bread."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-inferences',
  '{"stem":"Which choice is the most reasonable inference from the passage?","body":"kind: rw-inferences\n\nthemeId: late-shift-bakery\n\nThe bakery opens before sunrise, and the first tray of bread is usually gone by 7:30 a.m. Customers line up outside even when the weather is cold because the owner bakes only small batches. By noon, the shelves are empty and the oven is already cooling for the next day.\n\nWhich choice is the most reasonable inference from the passage?","promptText":"kind: rw-inferences\n\nthemeId: late-shift-bakery\n\nThe bakery opens before sunrise, and the first tray of bread is usually gone by 7:30 a.m. Customers line up outside even when the weather is cold because the owner bakes only small batches. By noon, the shelves are empty and the oven is already cooling for the next day.\n\nWhich choice is the most reasonable inference from the passage?","metadata":{"questionKey":"rw-inferences-02","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:late-shift-bakery"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The bakery likely has a steady customer base that values fresh bread.","The bakery probably sells most of its bread early in the day.","The small batches likely help the bread stay fresh.","The owner probably prefers quality and freshness over large-scale production."],"correctIndex":1}'::jsonb,
  '{"summary":"The owner probably prefers quality and freshness over large-scale production.","whyCorrect":"The owner probably prefers quality and freshness over large-scale production."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-inferences',
  '{"stem":"Which choice is most strongly suggested by the passage?","body":"kind: rw-inferences\n\nthemeId: late-shift-bakery\n\nThe bakery opens before sunrise, and the first tray of bread is usually gone by 7:30 a.m. Customers line up outside even when the weather is cold because the owner bakes only small batches. By noon, the shelves are empty and the oven is already cooling for the next day.\n\nWhich choice is most strongly suggested by the passage?","promptText":"kind: rw-inferences\n\nthemeId: late-shift-bakery\n\nThe bakery opens before sunrise, and the first tray of bread is usually gone by 7:30 a.m. Customers line up outside even when the weather is cold because the owner bakes only small batches. By noon, the shelves are empty and the oven is already cooling for the next day.\n\nWhich choice is most strongly suggested by the passage?","metadata":{"questionKey":"rw-inferences-03","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:late-shift-bakery"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The owner probably prefers quality and freshness over large-scale production.","The small batches likely help the bread stay fresh.","The bakery probably sells most of its bread early in the day.","The bakery likely has a steady customer base that values fresh bread."],"correctIndex":2}'::jsonb,
  '{"summary":"The bakery probably sells most of its bread early in the day.","whyCorrect":"The bakery probably sells most of its bread early in the day."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-inferences',
  '{"stem":"Which choice follows logically from the passage?","body":"kind: rw-inferences\n\nthemeId: late-shift-bakery\n\nThe bakery opens before sunrise, and the first tray of bread is usually gone by 7:30 a.m. Customers line up outside even when the weather is cold because the owner bakes only small batches. By noon, the shelves are empty and the oven is already cooling for the next day.\n\nWhich choice follows logically from the passage?","promptText":"kind: rw-inferences\n\nthemeId: late-shift-bakery\n\nThe bakery opens before sunrise, and the first tray of bread is usually gone by 7:30 a.m. Customers line up outside even when the weather is cold because the owner bakes only small batches. By noon, the shelves are empty and the oven is already cooling for the next day.\n\nWhich choice follows logically from the passage?","metadata":{"questionKey":"rw-inferences-04","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:late-shift-bakery"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The bakery probably sells most of its bread early in the day.","The small batches likely help the bread stay fresh.","The bakery likely has a steady customer base that values fresh bread.","The owner probably prefers quality and freshness over large-scale production."],"correctIndex":3}'::jsonb,
  '{"summary":"The small batches likely help the bread stay fresh.","whyCorrect":"The small batches likely help the bread stay fresh."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-inferences',
  '{"stem":"Which choice is most consistent with what the passage implies?","body":"kind: rw-inferences\n\nthemeId: late-shift-bakery\n\nThe bakery opens before sunrise, and the first tray of bread is usually gone by 7:30 a.m. Customers line up outside even when the weather is cold because the owner bakes only small batches. By noon, the shelves are empty and the oven is already cooling for the next day.\n\nWhich choice is most consistent with what the passage implies?","promptText":"kind: rw-inferences\n\nthemeId: late-shift-bakery\n\nThe bakery opens before sunrise, and the first tray of bread is usually gone by 7:30 a.m. Customers line up outside even when the weather is cold because the owner bakes only small batches. By noon, the shelves are empty and the oven is already cooling for the next day.\n\nWhich choice is most consistent with what the passage implies?","metadata":{"questionKey":"rw-inferences-05","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:late-shift-bakery"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The bakery is probably busiest in the morning.","The bakery likely has a steady customer base that values fresh bread.","The owner probably prefers quality and freshness over large-scale production.","The bakery probably sells most of its bread early in the day."],"correctIndex":0}'::jsonb,
  '{"summary":"The bakery is probably busiest in the morning.","whyCorrect":"The bakery is probably busiest in the morning."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-inferences',
  '{"stem":"Which choice is best supported by the passage?","body":"kind: rw-inferences\n\nthemeId: evening-reading-room\n\nThe public library opened an evening reading room with soft lamps, quiet tables, and a separate area for group study. After the room opened, students began staying longer after school, and some nearby parents stopped by to finish paperwork before going home. The librarian said the room was designed to make the building useful at different hours.\n\nWhich choice is best supported by the passage?","promptText":"kind: rw-inferences\n\nthemeId: evening-reading-room\n\nThe public library opened an evening reading room with soft lamps, quiet tables, and a separate area for group study. After the room opened, students began staying longer after school, and some nearby parents stopped by to finish paperwork before going home. The librarian said the room was designed to make the building useful at different hours.\n\nWhich choice is best supported by the passage?","metadata":{"questionKey":"rw-inferences-06","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:evening-reading-room"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The library probably wanted to serve more kinds of visitors after school.","Students likely stayed longer because the new room made the library more comfortable.","The evening reading room likely made the building useful at different hours.","Some visitors probably used the room for focused work."],"correctIndex":0}'::jsonb,
  '{"summary":"The library probably wanted to serve more kinds of visitors after school.","whyCorrect":"The library probably wanted to serve more kinds of visitors after school."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-inferences',
  '{"stem":"Which choice is the most reasonable inference from the passage?","body":"kind: rw-inferences\n\nthemeId: evening-reading-room\n\nThe public library opened an evening reading room with soft lamps, quiet tables, and a separate area for group study. After the room opened, students began staying longer after school, and some nearby parents stopped by to finish paperwork before going home. The librarian said the room was designed to make the building useful at different hours.\n\nWhich choice is the most reasonable inference from the passage?","promptText":"kind: rw-inferences\n\nthemeId: evening-reading-room\n\nThe public library opened an evening reading room with soft lamps, quiet tables, and a separate area for group study. After the room opened, students began staying longer after school, and some nearby parents stopped by to finish paperwork before going home. The librarian said the room was designed to make the building useful at different hours.\n\nWhich choice is the most reasonable inference from the passage?","metadata":{"questionKey":"rw-inferences-07","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:evening-reading-room"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The library probably wanted to serve more kinds of visitors after school.","The evening reading room likely made the building useful at different hours.","Some visitors probably used the room for focused work.","Students likely stayed longer because the new room made the library more comfortable."],"correctIndex":1}'::jsonb,
  '{"summary":"Students likely stayed longer because the new room made the library more comfortable.","whyCorrect":"Students likely stayed longer because the new room made the library more comfortable."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-inferences',
  '{"stem":"Which choice is most strongly suggested by the passage?","body":"kind: rw-inferences\n\nthemeId: evening-reading-room\n\nThe public library opened an evening reading room with soft lamps, quiet tables, and a separate area for group study. After the room opened, students began staying longer after school, and some nearby parents stopped by to finish paperwork before going home. The librarian said the room was designed to make the building useful at different hours.\n\nWhich choice is most strongly suggested by the passage?","promptText":"kind: rw-inferences\n\nthemeId: evening-reading-room\n\nThe public library opened an evening reading room with soft lamps, quiet tables, and a separate area for group study. After the room opened, students began staying longer after school, and some nearby parents stopped by to finish paperwork before going home. The librarian said the room was designed to make the building useful at different hours.\n\nWhich choice is most strongly suggested by the passage?","metadata":{"questionKey":"rw-inferences-08","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:evening-reading-room"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Students likely stayed longer because the new room made the library more comfortable.","Some visitors probably used the room for focused work.","The evening reading room likely made the building useful at different hours.","The library probably wanted to serve more kinds of visitors after school."],"correctIndex":2}'::jsonb,
  '{"summary":"The evening reading room likely made the building useful at different hours.","whyCorrect":"The evening reading room likely made the building useful at different hours."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-inferences',
  '{"stem":"Which choice follows logically from the passage?","body":"kind: rw-inferences\n\nthemeId: evening-reading-room\n\nThe public library opened an evening reading room with soft lamps, quiet tables, and a separate area for group study. After the room opened, students began staying longer after school, and some nearby parents stopped by to finish paperwork before going home. The librarian said the room was designed to make the building useful at different hours.\n\nWhich choice follows logically from the passage?","promptText":"kind: rw-inferences\n\nthemeId: evening-reading-room\n\nThe public library opened an evening reading room with soft lamps, quiet tables, and a separate area for group study. After the room opened, students began staying longer after school, and some nearby parents stopped by to finish paperwork before going home. The librarian said the room was designed to make the building useful at different hours.\n\nWhich choice follows logically from the passage?","metadata":{"questionKey":"rw-inferences-09","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:evening-reading-room"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The evening reading room likely made the building useful at different hours.","Some visitors probably used the room for focused work.","The library probably wanted to serve more kinds of visitors after school.","Students likely stayed longer because the new room made the library more comfortable."],"correctIndex":3}'::jsonb,
  '{"summary":"Some visitors probably used the room for focused work.","whyCorrect":"Some visitors probably used the room for focused work."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-inferences',
  '{"stem":"Which choice is most consistent with what the passage implies?","body":"kind: rw-inferences\n\nthemeId: evening-reading-room\n\nThe public library opened an evening reading room with soft lamps, quiet tables, and a separate area for group study. After the room opened, students began staying longer after school, and some nearby parents stopped by to finish paperwork before going home. The librarian said the room was designed to make the building useful at different hours.\n\nWhich choice is most consistent with what the passage implies?","promptText":"kind: rw-inferences\n\nthemeId: evening-reading-room\n\nThe public library opened an evening reading room with soft lamps, quiet tables, and a separate area for group study. After the room opened, students began staying longer after school, and some nearby parents stopped by to finish paperwork before going home. The librarian said the room was designed to make the building useful at different hours.\n\nWhich choice is most consistent with what the passage implies?","metadata":{"questionKey":"rw-inferences-10","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:evening-reading-room"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The room likely encouraged people to use the library after regular school hours.","The library probably wanted to serve more kinds of visitors after school.","Students likely stayed longer because the new room made the library more comfortable.","The evening reading room likely made the building useful at different hours."],"correctIndex":0}'::jsonb,
  '{"summary":"The room likely encouraged people to use the library after regular school hours.","whyCorrect":"The room likely encouraged people to use the library after regular school hours."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-inferences',
  '{"stem":"Which choice is best supported by the passage?","body":"kind: rw-inferences\n\nthemeId: field-notes\n\nA student club spent the semester taking notes about birds in the park and comparing sightings from one week to the next. Their chart showed that certain birds appeared more often after the club planted native shrubs. The advisor said the club had begun to notice how habitat choices affect wildlife.\n\nWhich choice is best supported by the passage?","promptText":"kind: rw-inferences\n\nthemeId: field-notes\n\nA student club spent the semester taking notes about birds in the park and comparing sightings from one week to the next. Their chart showed that certain birds appeared more often after the club planted native shrubs. The advisor said the club had begun to notice how habitat choices affect wildlife.\n\nWhich choice is best supported by the passage?","metadata":{"questionKey":"rw-inferences-11","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:field-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The club likely concluded that habitat changes can influence which birds appear in the park.","The planted shrubs probably helped attract certain birds.","The advisor probably wanted students to connect habitat choices and wildlife.","The chart likely showed a pattern across several weeks."],"correctIndex":0}'::jsonb,
  '{"summary":"The club likely concluded that habitat changes can influence which birds appear in the park.","whyCorrect":"The club likely concluded that habitat changes can influence which birds appear in the park."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-inferences',
  '{"stem":"Which choice is the most reasonable inference from the passage?","body":"kind: rw-inferences\n\nthemeId: field-notes\n\nA student club spent the semester taking notes about birds in the park and comparing sightings from one week to the next. Their chart showed that certain birds appeared more often after the club planted native shrubs. The advisor said the club had begun to notice how habitat choices affect wildlife.\n\nWhich choice is the most reasonable inference from the passage?","promptText":"kind: rw-inferences\n\nthemeId: field-notes\n\nA student club spent the semester taking notes about birds in the park and comparing sightings from one week to the next. Their chart showed that certain birds appeared more often after the club planted native shrubs. The advisor said the club had begun to notice how habitat choices affect wildlife.\n\nWhich choice is the most reasonable inference from the passage?","metadata":{"questionKey":"rw-inferences-12","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:field-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The club likely concluded that habitat changes can influence which birds appear in the park.","The advisor probably wanted students to connect habitat choices and wildlife.","The chart likely showed a pattern across several weeks.","The planted shrubs probably helped attract certain birds."],"correctIndex":1}'::jsonb,
  '{"summary":"The planted shrubs probably helped attract certain birds.","whyCorrect":"The planted shrubs probably helped attract certain birds."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-inferences',
  '{"stem":"Which choice is most strongly suggested by the passage?","body":"kind: rw-inferences\n\nthemeId: field-notes\n\nA student club spent the semester taking notes about birds in the park and comparing sightings from one week to the next. Their chart showed that certain birds appeared more often after the club planted native shrubs. The advisor said the club had begun to notice how habitat choices affect wildlife.\n\nWhich choice is most strongly suggested by the passage?","promptText":"kind: rw-inferences\n\nthemeId: field-notes\n\nA student club spent the semester taking notes about birds in the park and comparing sightings from one week to the next. Their chart showed that certain birds appeared more often after the club planted native shrubs. The advisor said the club had begun to notice how habitat choices affect wildlife.\n\nWhich choice is most strongly suggested by the passage?","metadata":{"questionKey":"rw-inferences-13","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:field-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The planted shrubs probably helped attract certain birds.","The chart likely showed a pattern across several weeks.","The advisor probably wanted students to connect habitat choices and wildlife.","The club likely concluded that habitat changes can influence which birds appear in the park."],"correctIndex":2}'::jsonb,
  '{"summary":"The advisor probably wanted students to connect habitat choices and wildlife.","whyCorrect":"The advisor probably wanted students to connect habitat choices and wildlife."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-inferences',
  '{"stem":"Which choice follows logically from the passage?","body":"kind: rw-inferences\n\nthemeId: field-notes\n\nA student club spent the semester taking notes about birds in the park and comparing sightings from one week to the next. Their chart showed that certain birds appeared more often after the club planted native shrubs. The advisor said the club had begun to notice how habitat choices affect wildlife.\n\nWhich choice follows logically from the passage?","promptText":"kind: rw-inferences\n\nthemeId: field-notes\n\nA student club spent the semester taking notes about birds in the park and comparing sightings from one week to the next. Their chart showed that certain birds appeared more often after the club planted native shrubs. The advisor said the club had begun to notice how habitat choices affect wildlife.\n\nWhich choice follows logically from the passage?","metadata":{"questionKey":"rw-inferences-14","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:field-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The advisor probably wanted students to connect habitat choices and wildlife.","The chart likely showed a pattern across several weeks.","The club likely concluded that habitat changes can influence which birds appear in the park.","The planted shrubs probably helped attract certain birds."],"correctIndex":3}'::jsonb,
  '{"summary":"The chart likely showed a pattern across several weeks.","whyCorrect":"The chart likely showed a pattern across several weeks."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-inferences',
  '{"stem":"Which choice is most consistent with what the passage implies?","body":"kind: rw-inferences\n\nthemeId: field-notes\n\nA student club spent the semester taking notes about birds in the park and comparing sightings from one week to the next. Their chart showed that certain birds appeared more often after the club planted native shrubs. The advisor said the club had begun to notice how habitat choices affect wildlife.\n\nWhich choice is most consistent with what the passage implies?","promptText":"kind: rw-inferences\n\nthemeId: field-notes\n\nA student club spent the semester taking notes about birds in the park and comparing sightings from one week to the next. Their chart showed that certain birds appeared more often after the club planted native shrubs. The advisor said the club had begun to notice how habitat choices affect wildlife.\n\nWhich choice is most consistent with what the passage implies?","metadata":{"questionKey":"rw-inferences-15","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:field-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The club likely noticed a relationship between the shrubs and bird sightings.","The club likely concluded that habitat changes can influence which birds appear in the park.","The planted shrubs probably helped attract certain birds.","The advisor probably wanted students to connect habitat choices and wildlife."],"correctIndex":0}'::jsonb,
  '{"summary":"The club likely noticed a relationship between the shrubs and bird sightings.","whyCorrect":"The club likely noticed a relationship between the shrubs and bird sightings."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-inferences',
  '{"stem":"Which choice is best supported by the passage?","body":"kind: rw-inferences\n\nthemeId: repair-cafe\n\nAt the repair cafe, volunteers fixed lamps, hemmed jackets, and replaced missing buttons while owners waited at nearby tables. People left carrying items they had thought were useless only an hour earlier. The organizers said the event worked because it paired practical help with a relaxed social setting.\n\nWhich choice is best supported by the passage?","promptText":"kind: rw-inferences\n\nthemeId: repair-cafe\n\nAt the repair cafe, volunteers fixed lamps, hemmed jackets, and replaced missing buttons while owners waited at nearby tables. People left carrying items they had thought were useless only an hour earlier. The organizers said the event worked because it paired practical help with a relaxed social setting.\n\nWhich choice is best supported by the passage?","metadata":{"questionKey":"rw-inferences-16","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:repair-cafe"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The organizers likely believed the social atmosphere helped the event succeed.","The cafe probably encouraged people to keep and reuse belongings instead of throwing them away.","The volunteers likely offered a range of simple repair skills.","Visitors probably felt relieved to salvage items they had expected to discard."],"correctIndex":0}'::jsonb,
  '{"summary":"The organizers likely believed the social atmosphere helped the event succeed.","whyCorrect":"The organizers likely believed the social atmosphere helped the event succeed."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-inferences',
  '{"stem":"Which choice is the most reasonable inference from the passage?","body":"kind: rw-inferences\n\nthemeId: repair-cafe\n\nAt the repair cafe, volunteers fixed lamps, hemmed jackets, and replaced missing buttons while owners waited at nearby tables. People left carrying items they had thought were useless only an hour earlier. The organizers said the event worked because it paired practical help with a relaxed social setting.\n\nWhich choice is the most reasonable inference from the passage?","promptText":"kind: rw-inferences\n\nthemeId: repair-cafe\n\nAt the repair cafe, volunteers fixed lamps, hemmed jackets, and replaced missing buttons while owners waited at nearby tables. People left carrying items they had thought were useless only an hour earlier. The organizers said the event worked because it paired practical help with a relaxed social setting.\n\nWhich choice is the most reasonable inference from the passage?","metadata":{"questionKey":"rw-inferences-17","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:repair-cafe"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The organizers likely believed the social atmosphere helped the event succeed.","The volunteers likely offered a range of simple repair skills.","Visitors probably felt relieved to salvage items they had expected to discard.","The cafe probably encouraged people to keep and reuse belongings instead of throwing them away."],"correctIndex":1}'::jsonb,
  '{"summary":"The cafe probably encouraged people to keep and reuse belongings instead of throwing them away.","whyCorrect":"The cafe probably encouraged people to keep and reuse belongings instead of throwing them away."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-inferences',
  '{"stem":"Which choice is most strongly suggested by the passage?","body":"kind: rw-inferences\n\nthemeId: repair-cafe\n\nAt the repair cafe, volunteers fixed lamps, hemmed jackets, and replaced missing buttons while owners waited at nearby tables. People left carrying items they had thought were useless only an hour earlier. The organizers said the event worked because it paired practical help with a relaxed social setting.\n\nWhich choice is most strongly suggested by the passage?","promptText":"kind: rw-inferences\n\nthemeId: repair-cafe\n\nAt the repair cafe, volunteers fixed lamps, hemmed jackets, and replaced missing buttons while owners waited at nearby tables. People left carrying items they had thought were useless only an hour earlier. The organizers said the event worked because it paired practical help with a relaxed social setting.\n\nWhich choice is most strongly suggested by the passage?","metadata":{"questionKey":"rw-inferences-18","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:repair-cafe"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The cafe probably encouraged people to keep and reuse belongings instead of throwing them away.","Visitors probably felt relieved to salvage items they had expected to discard.","The volunteers likely offered a range of simple repair skills.","The organizers likely believed the social atmosphere helped the event succeed."],"correctIndex":2}'::jsonb,
  '{"summary":"The volunteers likely offered a range of simple repair skills.","whyCorrect":"The volunteers likely offered a range of simple repair skills."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-inferences',
  '{"stem":"Which choice follows logically from the passage?","body":"kind: rw-inferences\n\nthemeId: repair-cafe\n\nAt the repair cafe, volunteers fixed lamps, hemmed jackets, and replaced missing buttons while owners waited at nearby tables. People left carrying items they had thought were useless only an hour earlier. The organizers said the event worked because it paired practical help with a relaxed social setting.\n\nWhich choice follows logically from the passage?","promptText":"kind: rw-inferences\n\nthemeId: repair-cafe\n\nAt the repair cafe, volunteers fixed lamps, hemmed jackets, and replaced missing buttons while owners waited at nearby tables. People left carrying items they had thought were useless only an hour earlier. The organizers said the event worked because it paired practical help with a relaxed social setting.\n\nWhich choice follows logically from the passage?","metadata":{"questionKey":"rw-inferences-19","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:repair-cafe"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The volunteers likely offered a range of simple repair skills.","Visitors probably felt relieved to salvage items they had expected to discard.","The organizers likely believed the social atmosphere helped the event succeed.","The cafe probably encouraged people to keep and reuse belongings instead of throwing them away."],"correctIndex":3}'::jsonb,
  '{"summary":"Visitors probably felt relieved to salvage items they had expected to discard.","whyCorrect":"Visitors probably felt relieved to salvage items they had expected to discard."}'::jsonb,
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
    and c.slug = 'inferences'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-inferences',
  '{"stem":"Which choice is most consistent with what the passage implies?","body":"kind: rw-inferences\n\nthemeId: repair-cafe\n\nAt the repair cafe, volunteers fixed lamps, hemmed jackets, and replaced missing buttons while owners waited at nearby tables. People left carrying items they had thought were useless only an hour earlier. The organizers said the event worked because it paired practical help with a relaxed social setting.\n\nWhich choice is most consistent with what the passage implies?","promptText":"kind: rw-inferences\n\nthemeId: repair-cafe\n\nAt the repair cafe, volunteers fixed lamps, hemmed jackets, and replaced missing buttons while owners waited at nearby tables. People left carrying items they had thought were useless only an hour earlier. The organizers said the event worked because it paired practical help with a relaxed social setting.\n\nWhich choice is most consistent with what the passage implies?","metadata":{"questionKey":"rw-inferences-20","generationSource":"generated_from_research","tags":["reading-writing","inferences","theme:repair-cafe"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The event likely combined practical service with community interaction.","The organizers likely believed the social atmosphere helped the event succeed.","The cafe probably encouraged people to keep and reuse belongings instead of throwing them away.","The volunteers likely offered a range of simple repair skills."],"correctIndex":0}'::jsonb,
  '{"summary":"The event likely combined practical service with community interaction.","whyCorrect":"The event likely combined practical service with community interaction."}'::jsonb,
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
    and c.slug = 'words-in-context'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-words-in-context',
  '{"stem":"The curator''s explanation was so clear that even younger visitors could ____ the exhibit''s main point.","body":"kind: rw-words-in-context\n\nthemeId: museum-labels\n\nlabel: academic vocabulary\n\nThe curator''s explanation was so clear that even younger visitors could ____ the exhibit''s main point.\n\nfocus: discern","promptText":"kind: rw-words-in-context\n\nthemeId: museum-labels\n\nlabel: academic vocabulary\n\nThe curator''s explanation was so clear that even younger visitors could ____ the exhibit''s main point.\n\nfocus: discern","metadata":{"questionKey":"rw-words-in-context-01","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:museum-labels"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["ignore","discern","delay","dilute"],"correctIndex":1}'::jsonb,
  '{"summary":"discern means to understand or recognize clearly","whyCorrect":"discern means to understand or recognize clearly"}'::jsonb,
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
    and c.slug = 'words-in-context'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-words-in-context',
  '{"stem":"The committee hoped the new rules would ____ a sense of trust rather than confusion.","body":"kind: rw-words-in-context\n\nthemeId: museum-labels\n\nlabel: academic vocabulary\n\nThe committee hoped the new rules would ____ a sense of trust rather than confusion.\n\nfocus: foster","promptText":"kind: rw-words-in-context\n\nthemeId: museum-labels\n\nlabel: academic vocabulary\n\nThe committee hoped the new rules would ____ a sense of trust rather than confusion.\n\nfocus: foster","metadata":{"questionKey":"rw-words-in-context-02","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:museum-labels"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["foster","discard","compress","interrupt"],"correctIndex":0}'::jsonb,
  '{"summary":"foster means to encourage the growth of","whyCorrect":"foster means to encourage the growth of"}'::jsonb,
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
    and c.slug = 'words-in-context'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-words-in-context',
  '{"stem":"After several revisions, the article became more ____ and easier to follow.","body":"kind: rw-words-in-context\n\nthemeId: museum-labels\n\nlabel: academic vocabulary\n\nAfter several revisions, the article became more ____ and easier to follow.\n\nfocus: coherent","promptText":"kind: rw-words-in-context\n\nthemeId: museum-labels\n\nlabel: academic vocabulary\n\nAfter several revisions, the article became more ____ and easier to follow.\n\nfocus: coherent","metadata":{"questionKey":"rw-words-in-context-03","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:museum-labels"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["opaque","coherent","frail","rushed"],"correctIndex":1}'::jsonb,
  '{"summary":"coherent means logically connected and easy to understand","whyCorrect":"coherent means logically connected and easy to understand"}'::jsonb,
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
    and c.slug = 'words-in-context'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-words-in-context',
  '{"stem":"The scientist''s tone was ____ rather than dramatic, which made the report feel reliable.","body":"kind: rw-words-in-context\n\nthemeId: museum-labels\n\nlabel: academic vocabulary\n\nThe scientist''s tone was ____ rather than dramatic, which made the report feel reliable.\n\nfocus: measured","promptText":"kind: rw-words-in-context\n\nthemeId: museum-labels\n\nlabel: academic vocabulary\n\nThe scientist''s tone was ____ rather than dramatic, which made the report feel reliable.\n\nfocus: measured","metadata":{"questionKey":"rw-words-in-context-04","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:museum-labels"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["measured","ornate","reckless","frantic"],"correctIndex":0}'::jsonb,
  '{"summary":"measured means calm and carefully controlled","whyCorrect":"measured means calm and carefully controlled"}'::jsonb,
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
    and c.slug = 'words-in-context'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-words-in-context',
  '{"stem":"The coach''s remarks were meant to ____ the players after a difficult loss.","body":"kind: rw-words-in-context\n\nthemeId: museum-labels\n\nlabel: academic vocabulary\n\nThe coach''s remarks were meant to ____ the players after a difficult loss.\n\nfocus: reassure","promptText":"kind: rw-words-in-context\n\nthemeId: museum-labels\n\nlabel: academic vocabulary\n\nThe coach''s remarks were meant to ____ the players after a difficult loss.\n\nfocus: reassure","metadata":{"questionKey":"rw-words-in-context-05","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:museum-labels"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["scold","reassure","scatter","flatten"],"correctIndex":1}'::jsonb,
  '{"summary":"reassure means to make someone feel less worried","whyCorrect":"reassure means to make someone feel less worried"}'::jsonb,
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
    and c.slug = 'words-in-context'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-words-in-context',
  '{"stem":"The repair guide was written in a ____ style so volunteers could read it quickly.","body":"kind: rw-words-in-context\n\nthemeId: workshop-notes\n\nlabel: workshop vocabulary\n\nThe repair guide was written in a ____ style so volunteers could read it quickly.\n\nfocus: concise","promptText":"kind: rw-words-in-context\n\nthemeId: workshop-notes\n\nlabel: workshop vocabulary\n\nThe repair guide was written in a ____ style so volunteers could read it quickly.\n\nfocus: concise","metadata":{"questionKey":"rw-words-in-context-06","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:workshop-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["concise","ceremonial","lengthy","mysterious"],"correctIndex":0}'::jsonb,
  '{"summary":"concise means brief and to the point","whyCorrect":"concise means brief and to the point"}'::jsonb,
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
    and c.slug = 'words-in-context'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-words-in-context',
  '{"stem":"The class hoped to ____ the crowd by demonstrating the project before the fair opened.","body":"kind: rw-words-in-context\n\nthemeId: workshop-notes\n\nlabel: workshop vocabulary\n\nThe class hoped to ____ the crowd by demonstrating the project before the fair opened.\n\nfocus: engage","promptText":"kind: rw-words-in-context\n\nthemeId: workshop-notes\n\nlabel: workshop vocabulary\n\nThe class hoped to ____ the crowd by demonstrating the project before the fair opened.\n\nfocus: engage","metadata":{"questionKey":"rw-words-in-context-07","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:workshop-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["deter","engage","erase","stifle"],"correctIndex":1}'::jsonb,
  '{"summary":"engage means to attract and involve","whyCorrect":"engage means to attract and involve"}'::jsonb,
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
    and c.slug = 'words-in-context'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-words-in-context',
  '{"stem":"The author added one final example to ____ the claim that the method worked.","body":"kind: rw-words-in-context\n\nthemeId: workshop-notes\n\nlabel: workshop vocabulary\n\nThe author added one final example to ____ the claim that the method worked.\n\nfocus: corroborate","promptText":"kind: rw-words-in-context\n\nthemeId: workshop-notes\n\nlabel: workshop vocabulary\n\nThe author added one final example to ____ the claim that the method worked.\n\nfocus: corroborate","metadata":{"questionKey":"rw-words-in-context-08","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:workshop-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["undermine","corroborate","complicate","hide"],"correctIndex":1}'::jsonb,
  '{"summary":"corroborate means to confirm or support","whyCorrect":"corroborate means to confirm or support"}'::jsonb,
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
    and c.slug = 'words-in-context'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-words-in-context',
  '{"stem":"The group made a ____ effort to include both new and longtime residents.","body":"kind: rw-words-in-context\n\nthemeId: workshop-notes\n\nlabel: workshop vocabulary\n\nThe group made a ____ effort to include both new and longtime residents.\n\nfocus: deliberate","promptText":"kind: rw-words-in-context\n\nthemeId: workshop-notes\n\nlabel: workshop vocabulary\n\nThe group made a ____ effort to include both new and longtime residents.\n\nfocus: deliberate","metadata":{"questionKey":"rw-words-in-context-09","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:workshop-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["selective","deliberate","careless","haphazard"],"correctIndex":1}'::jsonb,
  '{"summary":"deliberate means done intentionally and carefully","whyCorrect":"deliberate means done intentionally and carefully"}'::jsonb,
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
    and c.slug = 'words-in-context'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-words-in-context',
  '{"stem":"The leader wanted the survey results to be as ____ as possible.","body":"kind: rw-words-in-context\n\nthemeId: workshop-notes\n\nlabel: workshop vocabulary\n\nThe leader wanted the survey results to be as ____ as possible.\n\nfocus: transparent","promptText":"kind: rw-words-in-context\n\nthemeId: workshop-notes\n\nlabel: workshop vocabulary\n\nThe leader wanted the survey results to be as ____ as possible.\n\nfocus: transparent","metadata":{"questionKey":"rw-words-in-context-10","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:workshop-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["ambiguous","transparent","fragile","vague"],"correctIndex":1}'::jsonb,
  '{"summary":"transparent means clear and easy to see or understand","whyCorrect":"transparent means clear and easy to see or understand"}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

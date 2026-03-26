-- Seed the initial research-informed SAT question bank.
-- Questions are original, generated from public pattern research, and linked to canonical taxonomy rows by slug.

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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best states the main idea of the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: tool-library\n\nA neighborhood tool library opened in an unused bus depot. Members can borrow ladders, drills, and garden tools instead of buying items they will use only once or twice. The program also offers short weekend workshops for simple repairs.\n\nWhich choice best states the main idea of the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: tool-library\n\nA neighborhood tool library opened in an unused bus depot. Members can borrow ladders, drills, and garden tools instead of buying items they will use only once or twice. The program also offers short weekend workshops for simple repairs.\n\nWhich choice best states the main idea of the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-01","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:tool-library"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage shows that the tool library makes repairs more affordable and accessible for residents.","The passage states that the program offers weekend workshops on simple repairs.","The passage notes that borrowing tools can reduce waste by limiting unnecessary purchases.","The passage explains that the library operates in a repurposed bus depot."],"correctIndex":0}'::jsonb,
  '{"summary":"The passage shows that the tool library makes repairs more affordable and accessible for residents.","whyCorrect":"The passage shows that the tool library makes repairs more affordable and accessible for residents."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best describes a detail stated in the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: tool-library\n\nA neighborhood tool library opened in an unused bus depot. Members can borrow ladders, drills, and garden tools instead of buying items they will use only once or twice. The program also offers short weekend workshops for simple repairs.\n\nWhich choice best describes a detail stated in the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: tool-library\n\nA neighborhood tool library opened in an unused bus depot. Members can borrow ladders, drills, and garden tools instead of buying items they will use only once or twice. The program also offers short weekend workshops for simple repairs.\n\nWhich choice best describes a detail stated in the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-02","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:tool-library"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage shows that the tool library makes repairs more affordable and accessible for residents.","The passage notes that borrowing tools can reduce waste by limiting unnecessary purchases.","The passage explains that the library operates in a repurposed bus depot.","The passage states that the program offers weekend workshops on simple repairs."],"correctIndex":1}'::jsonb,
  '{"summary":"The passage states that the program offers weekend workshops on simple repairs.","whyCorrect":"The passage states that the program offers weekend workshops on simple repairs."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best reflects another detail directly supported by the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: tool-library\n\nA neighborhood tool library opened in an unused bus depot. Members can borrow ladders, drills, and garden tools instead of buying items they will use only once or twice. The program also offers short weekend workshops for simple repairs.\n\nWhich choice best reflects another detail directly supported by the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: tool-library\n\nA neighborhood tool library opened in an unused bus depot. Members can borrow ladders, drills, and garden tools instead of buying items they will use only once or twice. The program also offers short weekend workshops for simple repairs.\n\nWhich choice best reflects another detail directly supported by the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-03","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:tool-library"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage states that the program offers weekend workshops on simple repairs.","The passage explains that the library operates in a repurposed bus depot.","The passage notes that borrowing tools can reduce waste by limiting unnecessary purchases.","The passage shows that the tool library makes repairs more affordable and accessible for residents."],"correctIndex":2}'::jsonb,
  '{"summary":"The passage notes that borrowing tools can reduce waste by limiting unnecessary purchases.","whyCorrect":"The passage notes that borrowing tools can reduce waste by limiting unnecessary purchases."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best captures the passage''s emphasis?","body":"kind: rw-central-ideas-and-details\n\nthemeId: tool-library\n\nA neighborhood tool library opened in an unused bus depot. Members can borrow ladders, drills, and garden tools instead of buying items they will use only once or twice. The program also offers short weekend workshops for simple repairs.\n\nWhich choice best captures the passage''s emphasis?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: tool-library\n\nA neighborhood tool library opened in an unused bus depot. Members can borrow ladders, drills, and garden tools instead of buying items they will use only once or twice. The program also offers short weekend workshops for simple repairs.\n\nWhich choice best captures the passage''s emphasis?","metadata":{"questionKey":"rw-central-ideas-and-details-04","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:tool-library"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage notes that borrowing tools can reduce waste by limiting unnecessary purchases.","The passage explains that the library operates in a repurposed bus depot.","The passage shows that the tool library makes repairs more affordable and accessible for residents.","The passage states that the program offers weekend workshops on simple repairs."],"correctIndex":3}'::jsonb,
  '{"summary":"The passage explains that the library operates in a repurposed bus depot.","whyCorrect":"The passage explains that the library operates in a repurposed bus depot."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-central-ideas-and-details',
  '{"stem":"Which choice is most consistent with the passage overall?","body":"kind: rw-central-ideas-and-details\n\nthemeId: tool-library\n\nA neighborhood tool library opened in an unused bus depot. Members can borrow ladders, drills, and garden tools instead of buying items they will use only once or twice. The program also offers short weekend workshops for simple repairs.\n\nWhich choice is most consistent with the passage overall?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: tool-library\n\nA neighborhood tool library opened in an unused bus depot. Members can borrow ladders, drills, and garden tools instead of buying items they will use only once or twice. The program also offers short weekend workshops for simple repairs.\n\nWhich choice is most consistent with the passage overall?","metadata":{"questionKey":"rw-central-ideas-and-details-05","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:tool-library"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage mentions that members can check out tools such as ladders and drills.","The passage shows that the tool library makes repairs more affordable and accessible for residents.","The passage states that the program offers weekend workshops on simple repairs.","The passage notes that borrowing tools can reduce waste by limiting unnecessary purchases."],"correctIndex":0}'::jsonb,
  '{"summary":"The passage mentions that members can check out tools such as ladders and drills.","whyCorrect":"The passage mentions that members can check out tools such as ladders and drills."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best states the main idea of the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: rooftop-garden\n\nAn apartment complex turned its flat roof into a garden with raised beds, rain barrels, and a small herb corner. Neighbors water the plants in rotating shifts, and the harvest is shared among the building''s residents. The garden has also become a place where children learn how compost supports new growth.\n\nWhich choice best states the main idea of the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: rooftop-garden\n\nAn apartment complex turned its flat roof into a garden with raised beds, rain barrels, and a small herb corner. Neighbors water the plants in rotating shifts, and the harvest is shared among the building''s residents. The garden has also become a place where children learn how compost supports new growth.\n\nWhich choice best states the main idea of the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-06","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:rooftop-garden"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage presents the rooftop garden as a shared project that benefits the building''s residents.","The passage says neighbors take turns watering the plants.","The passage notes that children learn how compost helps new growth.","The passage explains that the harvest is divided among the residents."],"correctIndex":0}'::jsonb,
  '{"summary":"The passage presents the rooftop garden as a shared project that benefits the building''s residents.","whyCorrect":"The passage presents the rooftop garden as a shared project that benefits the building''s residents."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best describes a detail stated in the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: rooftop-garden\n\nAn apartment complex turned its flat roof into a garden with raised beds, rain barrels, and a small herb corner. Neighbors water the plants in rotating shifts, and the harvest is shared among the building''s residents. The garden has also become a place where children learn how compost supports new growth.\n\nWhich choice best describes a detail stated in the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: rooftop-garden\n\nAn apartment complex turned its flat roof into a garden with raised beds, rain barrels, and a small herb corner. Neighbors water the plants in rotating shifts, and the harvest is shared among the building''s residents. The garden has also become a place where children learn how compost supports new growth.\n\nWhich choice best describes a detail stated in the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-07","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:rooftop-garden"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage presents the rooftop garden as a shared project that benefits the building''s residents.","The passage notes that children learn how compost helps new growth.","The passage explains that the harvest is divided among the residents.","The passage says neighbors take turns watering the plants."],"correctIndex":1}'::jsonb,
  '{"summary":"The passage says neighbors take turns watering the plants.","whyCorrect":"The passage says neighbors take turns watering the plants."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best reflects another detail directly supported by the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: rooftop-garden\n\nAn apartment complex turned its flat roof into a garden with raised beds, rain barrels, and a small herb corner. Neighbors water the plants in rotating shifts, and the harvest is shared among the building''s residents. The garden has also become a place where children learn how compost supports new growth.\n\nWhich choice best reflects another detail directly supported by the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: rooftop-garden\n\nAn apartment complex turned its flat roof into a garden with raised beds, rain barrels, and a small herb corner. Neighbors water the plants in rotating shifts, and the harvest is shared among the building''s residents. The garden has also become a place where children learn how compost supports new growth.\n\nWhich choice best reflects another detail directly supported by the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-08","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:rooftop-garden"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage says neighbors take turns watering the plants.","The passage explains that the harvest is divided among the residents.","The passage notes that children learn how compost helps new growth.","The passage presents the rooftop garden as a shared project that benefits the building''s residents."],"correctIndex":2}'::jsonb,
  '{"summary":"The passage notes that children learn how compost helps new growth.","whyCorrect":"The passage notes that children learn how compost helps new growth."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best captures the passage''s emphasis?","body":"kind: rw-central-ideas-and-details\n\nthemeId: rooftop-garden\n\nAn apartment complex turned its flat roof into a garden with raised beds, rain barrels, and a small herb corner. Neighbors water the plants in rotating shifts, and the harvest is shared among the building''s residents. The garden has also become a place where children learn how compost supports new growth.\n\nWhich choice best captures the passage''s emphasis?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: rooftop-garden\n\nAn apartment complex turned its flat roof into a garden with raised beds, rain barrels, and a small herb corner. Neighbors water the plants in rotating shifts, and the harvest is shared among the building''s residents. The garden has also become a place where children learn how compost supports new growth.\n\nWhich choice best captures the passage''s emphasis?","metadata":{"questionKey":"rw-central-ideas-and-details-09","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:rooftop-garden"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage notes that children learn how compost helps new growth.","The passage explains that the harvest is divided among the residents.","The passage presents the rooftop garden as a shared project that benefits the building''s residents.","The passage says neighbors take turns watering the plants."],"correctIndex":3}'::jsonb,
  '{"summary":"The passage explains that the harvest is divided among the residents.","whyCorrect":"The passage explains that the harvest is divided among the residents."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-central-ideas-and-details',
  '{"stem":"Which choice is most consistent with the passage overall?","body":"kind: rw-central-ideas-and-details\n\nthemeId: rooftop-garden\n\nAn apartment complex turned its flat roof into a garden with raised beds, rain barrels, and a small herb corner. Neighbors water the plants in rotating shifts, and the harvest is shared among the building''s residents. The garden has also become a place where children learn how compost supports new growth.\n\nWhich choice is most consistent with the passage overall?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: rooftop-garden\n\nAn apartment complex turned its flat roof into a garden with raised beds, rain barrels, and a small herb corner. Neighbors water the plants in rotating shifts, and the harvest is shared among the building''s residents. The garden has also become a place where children learn how compost supports new growth.\n\nWhich choice is most consistent with the passage overall?","metadata":{"questionKey":"rw-central-ideas-and-details-10","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:rooftop-garden"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage states that the roof was turned into a garden with raised beds and rain barrels.","The passage presents the rooftop garden as a shared project that benefits the building''s residents.","The passage says neighbors take turns watering the plants.","The passage notes that children learn how compost helps new growth."],"correctIndex":0}'::jsonb,
  '{"summary":"The passage states that the roof was turned into a garden with raised beds and rain barrels.","whyCorrect":"The passage states that the roof was turned into a garden with raised beds and rain barrels."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best states the main idea of the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: oral-history-project\n\nStudents at a local high school interviewed longtime residents about the neighborhood''s changing storefronts and street names. They transcribed the interviews, created short captions, and placed the results in the library archive. Teachers said the project helped students notice how personal memory can preserve community history.\n\nWhich choice best states the main idea of the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: oral-history-project\n\nStudents at a local high school interviewed longtime residents about the neighborhood''s changing storefronts and street names. They transcribed the interviews, created short captions, and placed the results in the library archive. Teachers said the project helped students notice how personal memory can preserve community history.\n\nWhich choice best states the main idea of the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-11","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:oral-history-project"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage shows that the project uses interviews to preserve neighborhood history.","The passage says students transcribed the interviews.","The passage notes that the final materials were placed in the library archive.","The passage explains that teachers believed the work helped students see how memory preserves history."],"correctIndex":0}'::jsonb,
  '{"summary":"The passage shows that the project uses interviews to preserve neighborhood history.","whyCorrect":"The passage shows that the project uses interviews to preserve neighborhood history."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best describes a detail stated in the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: oral-history-project\n\nStudents at a local high school interviewed longtime residents about the neighborhood''s changing storefronts and street names. They transcribed the interviews, created short captions, and placed the results in the library archive. Teachers said the project helped students notice how personal memory can preserve community history.\n\nWhich choice best describes a detail stated in the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: oral-history-project\n\nStudents at a local high school interviewed longtime residents about the neighborhood''s changing storefronts and street names. They transcribed the interviews, created short captions, and placed the results in the library archive. Teachers said the project helped students notice how personal memory can preserve community history.\n\nWhich choice best describes a detail stated in the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-12","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:oral-history-project"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage shows that the project uses interviews to preserve neighborhood history.","The passage notes that the final materials were placed in the library archive.","The passage explains that teachers believed the work helped students see how memory preserves history.","The passage says students transcribed the interviews."],"correctIndex":1}'::jsonb,
  '{"summary":"The passage says students transcribed the interviews.","whyCorrect":"The passage says students transcribed the interviews."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best reflects another detail directly supported by the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: oral-history-project\n\nStudents at a local high school interviewed longtime residents about the neighborhood''s changing storefronts and street names. They transcribed the interviews, created short captions, and placed the results in the library archive. Teachers said the project helped students notice how personal memory can preserve community history.\n\nWhich choice best reflects another detail directly supported by the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: oral-history-project\n\nStudents at a local high school interviewed longtime residents about the neighborhood''s changing storefronts and street names. They transcribed the interviews, created short captions, and placed the results in the library archive. Teachers said the project helped students notice how personal memory can preserve community history.\n\nWhich choice best reflects another detail directly supported by the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-13","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:oral-history-project"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage says students transcribed the interviews.","The passage explains that teachers believed the work helped students see how memory preserves history.","The passage notes that the final materials were placed in the library archive.","The passage shows that the project uses interviews to preserve neighborhood history."],"correctIndex":2}'::jsonb,
  '{"summary":"The passage notes that the final materials were placed in the library archive.","whyCorrect":"The passage notes that the final materials were placed in the library archive."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best captures the passage''s emphasis?","body":"kind: rw-central-ideas-and-details\n\nthemeId: oral-history-project\n\nStudents at a local high school interviewed longtime residents about the neighborhood''s changing storefronts and street names. They transcribed the interviews, created short captions, and placed the results in the library archive. Teachers said the project helped students notice how personal memory can preserve community history.\n\nWhich choice best captures the passage''s emphasis?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: oral-history-project\n\nStudents at a local high school interviewed longtime residents about the neighborhood''s changing storefronts and street names. They transcribed the interviews, created short captions, and placed the results in the library archive. Teachers said the project helped students notice how personal memory can preserve community history.\n\nWhich choice best captures the passage''s emphasis?","metadata":{"questionKey":"rw-central-ideas-and-details-14","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:oral-history-project"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage notes that the final materials were placed in the library archive.","The passage explains that teachers believed the work helped students see how memory preserves history.","The passage shows that the project uses interviews to preserve neighborhood history.","The passage says students transcribed the interviews."],"correctIndex":3}'::jsonb,
  '{"summary":"The passage explains that teachers believed the work helped students see how memory preserves history.","whyCorrect":"The passage explains that teachers believed the work helped students see how memory preserves history."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-central-ideas-and-details',
  '{"stem":"Which choice is most consistent with the passage overall?","body":"kind: rw-central-ideas-and-details\n\nthemeId: oral-history-project\n\nStudents at a local high school interviewed longtime residents about the neighborhood''s changing storefronts and street names. They transcribed the interviews, created short captions, and placed the results in the library archive. Teachers said the project helped students notice how personal memory can preserve community history.\n\nWhich choice is most consistent with the passage overall?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: oral-history-project\n\nStudents at a local high school interviewed longtime residents about the neighborhood''s changing storefronts and street names. They transcribed the interviews, created short captions, and placed the results in the library archive. Teachers said the project helped students notice how personal memory can preserve community history.\n\nWhich choice is most consistent with the passage overall?","metadata":{"questionKey":"rw-central-ideas-and-details-15","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:oral-history-project"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage states that residents discussed changing storefronts and street names.","The passage shows that the project uses interviews to preserve neighborhood history.","The passage says students transcribed the interviews.","The passage notes that the final materials were placed in the library archive."],"correctIndex":0}'::jsonb,
  '{"summary":"The passage states that residents discussed changing storefronts and street names.","whyCorrect":"The passage states that residents discussed changing storefronts and street names."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best states the main idea of the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: storm-alert-network\n\nAfter several storms damaged local roads, volunteers built a text-message network that warns residents about blocked bridges and downed trees. The messages arrive quickly, in plain language, and are translated into three languages. Emergency crews say the system has reduced confusion during the first hour after severe weather.\n\nWhich choice best states the main idea of the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: storm-alert-network\n\nAfter several storms damaged local roads, volunteers built a text-message network that warns residents about blocked bridges and downed trees. The messages arrive quickly, in plain language, and are translated into three languages. Emergency crews say the system has reduced confusion during the first hour after severe weather.\n\nWhich choice best states the main idea of the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-16","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:storm-alert-network"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage shows that the text-message network helps residents respond more safely after storms.","The passage says the messages are translated into three languages.","The passage notes that the system warns people about blocked bridges and downed trees.","The passage explains that emergency crews think the network reduces confusion after severe weather."],"correctIndex":0}'::jsonb,
  '{"summary":"The passage shows that the text-message network helps residents respond more safely after storms.","whyCorrect":"The passage shows that the text-message network helps residents respond more safely after storms."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best describes a detail stated in the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: storm-alert-network\n\nAfter several storms damaged local roads, volunteers built a text-message network that warns residents about blocked bridges and downed trees. The messages arrive quickly, in plain language, and are translated into three languages. Emergency crews say the system has reduced confusion during the first hour after severe weather.\n\nWhich choice best describes a detail stated in the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: storm-alert-network\n\nAfter several storms damaged local roads, volunteers built a text-message network that warns residents about blocked bridges and downed trees. The messages arrive quickly, in plain language, and are translated into three languages. Emergency crews say the system has reduced confusion during the first hour after severe weather.\n\nWhich choice best describes a detail stated in the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-17","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:storm-alert-network"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage shows that the text-message network helps residents respond more safely after storms.","The passage notes that the system warns people about blocked bridges and downed trees.","The passage explains that emergency crews think the network reduces confusion after severe weather.","The passage says the messages are translated into three languages."],"correctIndex":1}'::jsonb,
  '{"summary":"The passage says the messages are translated into three languages.","whyCorrect":"The passage says the messages are translated into three languages."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best reflects another detail directly supported by the passage?","body":"kind: rw-central-ideas-and-details\n\nthemeId: storm-alert-network\n\nAfter several storms damaged local roads, volunteers built a text-message network that warns residents about blocked bridges and downed trees. The messages arrive quickly, in plain language, and are translated into three languages. Emergency crews say the system has reduced confusion during the first hour after severe weather.\n\nWhich choice best reflects another detail directly supported by the passage?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: storm-alert-network\n\nAfter several storms damaged local roads, volunteers built a text-message network that warns residents about blocked bridges and downed trees. The messages arrive quickly, in plain language, and are translated into three languages. Emergency crews say the system has reduced confusion during the first hour after severe weather.\n\nWhich choice best reflects another detail directly supported by the passage?","metadata":{"questionKey":"rw-central-ideas-and-details-18","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:storm-alert-network"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage says the messages are translated into three languages.","The passage explains that emergency crews think the network reduces confusion after severe weather.","The passage notes that the system warns people about blocked bridges and downed trees.","The passage shows that the text-message network helps residents respond more safely after storms."],"correctIndex":2}'::jsonb,
  '{"summary":"The passage notes that the system warns people about blocked bridges and downed trees.","whyCorrect":"The passage notes that the system warns people about blocked bridges and downed trees."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-central-ideas-and-details',
  '{"stem":"Which choice best captures the passage''s emphasis?","body":"kind: rw-central-ideas-and-details\n\nthemeId: storm-alert-network\n\nAfter several storms damaged local roads, volunteers built a text-message network that warns residents about blocked bridges and downed trees. The messages arrive quickly, in plain language, and are translated into three languages. Emergency crews say the system has reduced confusion during the first hour after severe weather.\n\nWhich choice best captures the passage''s emphasis?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: storm-alert-network\n\nAfter several storms damaged local roads, volunteers built a text-message network that warns residents about blocked bridges and downed trees. The messages arrive quickly, in plain language, and are translated into three languages. Emergency crews say the system has reduced confusion during the first hour after severe weather.\n\nWhich choice best captures the passage''s emphasis?","metadata":{"questionKey":"rw-central-ideas-and-details-19","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:storm-alert-network"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage notes that the system warns people about blocked bridges and downed trees.","The passage explains that emergency crews think the network reduces confusion after severe weather.","The passage shows that the text-message network helps residents respond more safely after storms.","The passage says the messages are translated into three languages."],"correctIndex":3}'::jsonb,
  '{"summary":"The passage explains that emergency crews think the network reduces confusion after severe weather.","whyCorrect":"The passage explains that emergency crews think the network reduces confusion after severe weather."}'::jsonb,
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
    and c.slug = 'central-ideas-and-details'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-central-ideas-and-details',
  '{"stem":"Which choice is most consistent with the passage overall?","body":"kind: rw-central-ideas-and-details\n\nthemeId: storm-alert-network\n\nAfter several storms damaged local roads, volunteers built a text-message network that warns residents about blocked bridges and downed trees. The messages arrive quickly, in plain language, and are translated into three languages. Emergency crews say the system has reduced confusion during the first hour after severe weather.\n\nWhich choice is most consistent with the passage overall?","promptText":"kind: rw-central-ideas-and-details\n\nthemeId: storm-alert-network\n\nAfter several storms damaged local roads, volunteers built a text-message network that warns residents about blocked bridges and downed trees. The messages arrive quickly, in plain language, and are translated into three languages. Emergency crews say the system has reduced confusion during the first hour after severe weather.\n\nWhich choice is most consistent with the passage overall?","metadata":{"questionKey":"rw-central-ideas-and-details-20","generationSource":"generated_from_research","tags":["reading-writing","central-ideas-and-details","theme:storm-alert-network"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage states that the messages arrive quickly and in plain language.","The passage shows that the text-message network helps residents respond more safely after storms.","The passage says the messages are translated into three languages.","The passage notes that the system warns people about blocked bridges and downed trees."],"correctIndex":0}'::jsonb,
  '{"summary":"The passage states that the messages arrive quickly and in plain language.","whyCorrect":"The passage states that the messages arrive quickly and in plain language."}'::jsonb,
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
  2, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice best supports the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: transit-passes\n\nCity planners tested monthly bus passes that cost less than the usual fare bundle. Riders with the passes took more trips in the evening, and they reported fewer missed connections because they were less worried about each transfer. The report concluded that the new pass made transit feel more flexible.\n\nThe monthly bus pass made public transit feel more flexible for riders.\n\nWhich choice best supports the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: transit-passes\n\nCity planners tested monthly bus passes that cost less than the usual fare bundle. Riders with the passes took more trips in the evening, and they reported fewer missed connections because they were less worried about each transfer. The report concluded that the new pass made transit feel more flexible.\n\nThe monthly bus pass made public transit feel more flexible for riders.\n\nWhich choice best supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-01","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:transit-passes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Riders with the passes took more trips in the evening.","Riders reported fewer missed connections because they worried less about each transfer.","The report concluded that the new pass made transit feel more flexible.","The passes cost less than the usual fare bundle."],"correctIndex":0}'::jsonb,
  '{"summary":"Riders with the passes took more trips in the evening.","whyCorrect":"Riders with the passes took more trips in the evening."}'::jsonb,
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
  2, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice provides the strongest textual evidence for the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: transit-passes\n\nCity planners tested monthly bus passes that cost less than the usual fare bundle. Riders with the passes took more trips in the evening, and they reported fewer missed connections because they were less worried about each transfer. The report concluded that the new pass made transit feel more flexible.\n\nThe monthly bus pass made public transit feel more flexible for riders.\n\nWhich choice provides the strongest textual evidence for the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: transit-passes\n\nCity planners tested monthly bus passes that cost less than the usual fare bundle. Riders with the passes took more trips in the evening, and they reported fewer missed connections because they were less worried about each transfer. The report concluded that the new pass made transit feel more flexible.\n\nThe monthly bus pass made public transit feel more flexible for riders.\n\nWhich choice provides the strongest textual evidence for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-02","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:transit-passes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Riders with the passes took more trips in the evening.","The report concluded that the new pass made transit feel more flexible.","The passes cost less than the usual fare bundle.","Riders reported fewer missed connections because they worried less about each transfer."],"correctIndex":1}'::jsonb,
  '{"summary":"Riders reported fewer missed connections because they worried less about each transfer.","whyCorrect":"Riders reported fewer missed connections because they worried less about each transfer."}'::jsonb,
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
  2, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice would the author most likely cite as support for the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: transit-passes\n\nCity planners tested monthly bus passes that cost less than the usual fare bundle. Riders with the passes took more trips in the evening, and they reported fewer missed connections because they were less worried about each transfer. The report concluded that the new pass made transit feel more flexible.\n\nThe monthly bus pass made public transit feel more flexible for riders.\n\nWhich choice would the author most likely cite as support for the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: transit-passes\n\nCity planners tested monthly bus passes that cost less than the usual fare bundle. Riders with the passes took more trips in the evening, and they reported fewer missed connections because they were less worried about each transfer. The report concluded that the new pass made transit feel more flexible.\n\nThe monthly bus pass made public transit feel more flexible for riders.\n\nWhich choice would the author most likely cite as support for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-03","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:transit-passes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Riders reported fewer missed connections because they worried less about each transfer.","The passes cost less than the usual fare bundle.","The report concluded that the new pass made transit feel more flexible.","Riders with the passes took more trips in the evening."],"correctIndex":2}'::jsonb,
  '{"summary":"The report concluded that the new pass made transit feel more flexible.","whyCorrect":"The report concluded that the new pass made transit feel more flexible."}'::jsonb,
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
  2, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice most directly backs the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: transit-passes\n\nCity planners tested monthly bus passes that cost less than the usual fare bundle. Riders with the passes took more trips in the evening, and they reported fewer missed connections because they were less worried about each transfer. The report concluded that the new pass made transit feel more flexible.\n\nThe monthly bus pass made public transit feel more flexible for riders.\n\nWhich choice most directly backs the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: transit-passes\n\nCity planners tested monthly bus passes that cost less than the usual fare bundle. Riders with the passes took more trips in the evening, and they reported fewer missed connections because they were less worried about each transfer. The report concluded that the new pass made transit feel more flexible.\n\nThe monthly bus pass made public transit feel more flexible for riders.\n\nWhich choice most directly backs the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-04","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:transit-passes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The report concluded that the new pass made transit feel more flexible.","The passes cost less than the usual fare bundle.","Riders with the passes took more trips in the evening.","Riders reported fewer missed connections because they worried less about each transfer."],"correctIndex":3}'::jsonb,
  '{"summary":"The passes cost less than the usual fare bundle.","whyCorrect":"The passes cost less than the usual fare bundle."}'::jsonb,
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
  2, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice best confirms the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: transit-passes\n\nCity planners tested monthly bus passes that cost less than the usual fare bundle. Riders with the passes took more trips in the evening, and they reported fewer missed connections because they were less worried about each transfer. The report concluded that the new pass made transit feel more flexible.\n\nThe monthly bus pass made public transit feel more flexible for riders.\n\nWhich choice best confirms the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: transit-passes\n\nCity planners tested monthly bus passes that cost less than the usual fare bundle. Riders with the passes took more trips in the evening, and they reported fewer missed connections because they were less worried about each transfer. The report concluded that the new pass made transit feel more flexible.\n\nThe monthly bus pass made public transit feel more flexible for riders.\n\nWhich choice best confirms the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-05","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:transit-passes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["City planners tested the passes before expanding the program.","Riders with the passes took more trips in the evening.","Riders reported fewer missed connections because they worried less about each transfer.","The report concluded that the new pass made transit feel more flexible."],"correctIndex":0}'::jsonb,
  '{"summary":"City planners tested the passes before expanding the program.","whyCorrect":"City planners tested the passes before expanding the program."}'::jsonb,
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
  2, 'rw-command-of-evidence-textual',
  '{"stem":"Which choice best supports the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: music-program\n\nA middle school added a string ensemble after several students said they wanted a quieter way to perform together. Rehearsals were held before classes, and attendance stayed high because students enjoyed the small-group setting. The orchestra director said the ensemble helped more students stay engaged in music.\n\nThe string ensemble helped more students stay engaged in music.\n\nWhich choice best supports the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: music-program\n\nA middle school added a string ensemble after several students said they wanted a quieter way to perform together. Rehearsals were held before classes, and attendance stayed high because students enjoyed the small-group setting. The orchestra director said the ensemble helped more students stay engaged in music.\n\nThe string ensemble helped more students stay engaged in music.\n\nWhich choice best supports the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-06","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:music-program"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Attendance stayed high because students enjoyed the small-group setting.","The orchestra director said the ensemble helped more students stay engaged in music.","The ensemble was added after students asked for a quieter way to perform together.","Rehearsals were held before classes."],"correctIndex":0}'::jsonb,
  '{"summary":"Attendance stayed high because students enjoyed the small-group setting.","whyCorrect":"Attendance stayed high because students enjoyed the small-group setting."}'::jsonb,
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
  '{"stem":"Which choice provides the strongest textual evidence for the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: music-program\n\nA middle school added a string ensemble after several students said they wanted a quieter way to perform together. Rehearsals were held before classes, and attendance stayed high because students enjoyed the small-group setting. The orchestra director said the ensemble helped more students stay engaged in music.\n\nThe string ensemble helped more students stay engaged in music.\n\nWhich choice provides the strongest textual evidence for the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: music-program\n\nA middle school added a string ensemble after several students said they wanted a quieter way to perform together. Rehearsals were held before classes, and attendance stayed high because students enjoyed the small-group setting. The orchestra director said the ensemble helped more students stay engaged in music.\n\nThe string ensemble helped more students stay engaged in music.\n\nWhich choice provides the strongest textual evidence for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-07","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:music-program"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Attendance stayed high because students enjoyed the small-group setting.","The ensemble was added after students asked for a quieter way to perform together.","Rehearsals were held before classes.","The orchestra director said the ensemble helped more students stay engaged in music."],"correctIndex":1}'::jsonb,
  '{"summary":"The orchestra director said the ensemble helped more students stay engaged in music.","whyCorrect":"The orchestra director said the ensemble helped more students stay engaged in music."}'::jsonb,
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
  '{"stem":"Which choice would the author most likely cite as support for the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: music-program\n\nA middle school added a string ensemble after several students said they wanted a quieter way to perform together. Rehearsals were held before classes, and attendance stayed high because students enjoyed the small-group setting. The orchestra director said the ensemble helped more students stay engaged in music.\n\nThe string ensemble helped more students stay engaged in music.\n\nWhich choice would the author most likely cite as support for the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: music-program\n\nA middle school added a string ensemble after several students said they wanted a quieter way to perform together. Rehearsals were held before classes, and attendance stayed high because students enjoyed the small-group setting. The orchestra director said the ensemble helped more students stay engaged in music.\n\nThe string ensemble helped more students stay engaged in music.\n\nWhich choice would the author most likely cite as support for the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-08","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:music-program"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The orchestra director said the ensemble helped more students stay engaged in music.","Rehearsals were held before classes.","The ensemble was added after students asked for a quieter way to perform together.","Attendance stayed high because students enjoyed the small-group setting."],"correctIndex":2}'::jsonb,
  '{"summary":"The ensemble was added after students asked for a quieter way to perform together.","whyCorrect":"The ensemble was added after students asked for a quieter way to perform together."}'::jsonb,
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
  '{"stem":"Which choice most directly backs the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: music-program\n\nA middle school added a string ensemble after several students said they wanted a quieter way to perform together. Rehearsals were held before classes, and attendance stayed high because students enjoyed the small-group setting. The orchestra director said the ensemble helped more students stay engaged in music.\n\nThe string ensemble helped more students stay engaged in music.\n\nWhich choice most directly backs the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: music-program\n\nA middle school added a string ensemble after several students said they wanted a quieter way to perform together. Rehearsals were held before classes, and attendance stayed high because students enjoyed the small-group setting. The orchestra director said the ensemble helped more students stay engaged in music.\n\nThe string ensemble helped more students stay engaged in music.\n\nWhich choice most directly backs the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-09","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:music-program"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The ensemble was added after students asked for a quieter way to perform together.","Rehearsals were held before classes.","Attendance stayed high because students enjoyed the small-group setting.","The orchestra director said the ensemble helped more students stay engaged in music."],"correctIndex":3}'::jsonb,
  '{"summary":"Rehearsals were held before classes.","whyCorrect":"Rehearsals were held before classes."}'::jsonb,
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
  '{"stem":"Which choice best confirms the claim below?","body":"kind: rw-command-of-evidence-textual\n\nthemeId: music-program\n\nA middle school added a string ensemble after several students said they wanted a quieter way to perform together. Rehearsals were held before classes, and attendance stayed high because students enjoyed the small-group setting. The orchestra director said the ensemble helped more students stay engaged in music.\n\nThe string ensemble helped more students stay engaged in music.\n\nWhich choice best confirms the claim below?","promptText":"kind: rw-command-of-evidence-textual\n\nthemeId: music-program\n\nA middle school added a string ensemble after several students said they wanted a quieter way to perform together. Rehearsals were held before classes, and attendance stayed high because students enjoyed the small-group setting. The orchestra director said the ensemble helped more students stay engaged in music.\n\nThe string ensemble helped more students stay engaged in music.\n\nWhich choice best confirms the claim below?","metadata":{"questionKey":"rw-command-of-evidence-textual-10","generationSource":"generated_from_research","tags":["reading-writing","command-of-evidence-textual","theme:music-program"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Students wanted a quieter way to perform together.","Attendance stayed high because students enjoyed the small-group setting.","The orchestra director said the ensemble helped more students stay engaged in music.","The ensemble was added after students asked for a quieter way to perform together."],"correctIndex":0}'::jsonb,
  '{"summary":"Students wanted a quieter way to perform together.","whyCorrect":"Students wanted a quieter way to perform together."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

-- Continuation of initial question bank seed (part 4 of 20).
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
  '{"stem":"The mural''s colors were so vivid that the scene seemed to ____ in the sunlight.","body":"kind: rw-words-in-context\n\nthemeId: public-art\n\nlabel: public art vocabulary\n\nThe mural''s colors were so vivid that the scene seemed to ____ in the sunlight.\n\nfocus: glimmer","promptText":"kind: rw-words-in-context\n\nthemeId: public-art\n\nlabel: public art vocabulary\n\nThe mural''s colors were so vivid that the scene seemed to ____ in the sunlight.\n\nfocus: glimmer","metadata":{"questionKey":"rw-words-in-context-11","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:public-art"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["wilt","glimmer","collapse","blur"],"correctIndex":1}'::jsonb,
  '{"summary":"glimmer means to shine with a soft light","whyCorrect":"glimmer means to shine with a soft light"}'::jsonb,
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
  '{"stem":"The designer chose a ____ layout so visitors could move through the space without confusion.","body":"kind: rw-words-in-context\n\nthemeId: public-art\n\nlabel: public art vocabulary\n\nThe designer chose a ____ layout so visitors could move through the space without confusion.\n\nfocus: ordered","promptText":"kind: rw-words-in-context\n\nthemeId: public-art\n\nlabel: public art vocabulary\n\nThe designer chose a ____ layout so visitors could move through the space without confusion.\n\nfocus: ordered","metadata":{"questionKey":"rw-words-in-context-12","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:public-art"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["ordered","chaotic","hidden","stiff"],"correctIndex":0}'::jsonb,
  '{"summary":"ordered means arranged in a clear, logical way","whyCorrect":"ordered means arranged in a clear, logical way"}'::jsonb,
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
  '{"stem":"The speaker''s comment was intended to ____ the audience to act, not to just admire the idea.","body":"kind: rw-words-in-context\n\nthemeId: public-art\n\nlabel: public art vocabulary\n\nThe speaker''s comment was intended to ____ the audience to act, not to just admire the idea.\n\nfocus: provoke","promptText":"kind: rw-words-in-context\n\nthemeId: public-art\n\nlabel: public art vocabulary\n\nThe speaker''s comment was intended to ____ the audience to act, not to just admire the idea.\n\nfocus: provoke","metadata":{"questionKey":"rw-words-in-context-13","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:public-art"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["provoke","distract","conceal","weaken"],"correctIndex":0}'::jsonb,
  '{"summary":"provoke means to stir someone to action or thought","whyCorrect":"provoke means to stir someone to action or thought"}'::jsonb,
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
  '{"stem":"The gallery used a ____ statement to explain why the exhibit mattered.","body":"kind: rw-words-in-context\n\nthemeId: public-art\n\nlabel: public art vocabulary\n\nThe gallery used a ____ statement to explain why the exhibit mattered.\n\nfocus: succinct","promptText":"kind: rw-words-in-context\n\nthemeId: public-art\n\nlabel: public art vocabulary\n\nThe gallery used a ____ statement to explain why the exhibit mattered.\n\nfocus: succinct","metadata":{"questionKey":"rw-words-in-context-14","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:public-art"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["trivial","succinct","wandering","noisy"],"correctIndex":1}'::jsonb,
  '{"summary":"succinct means brief and clearly expressed","whyCorrect":"succinct means brief and clearly expressed"}'::jsonb,
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
  4, 'rw-words-in-context',
  '{"stem":"The final panel helped ____ the theme of shared responsibility.","body":"kind: rw-words-in-context\n\nthemeId: public-art\n\nlabel: public art vocabulary\n\nThe final panel helped ____ the theme of shared responsibility.\n\nfocus: clarify","promptText":"kind: rw-words-in-context\n\nthemeId: public-art\n\nlabel: public art vocabulary\n\nThe final panel helped ____ the theme of shared responsibility.\n\nfocus: clarify","metadata":{"questionKey":"rw-words-in-context-15","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:public-art"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["clarify","fracture","burden","neutralize"],"correctIndex":0}'::jsonb,
  '{"summary":"clarify means to make something easier to understand","whyCorrect":"clarify means to make something easier to understand"}'::jsonb,
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
  4, 'rw-words-in-context',
  '{"stem":"The researcher was careful not to ____ the data with personal opinion.","body":"kind: rw-words-in-context\n\nthemeId: field-journal\n\nlabel: field journal vocabulary\n\nThe researcher was careful not to ____ the data with personal opinion.\n\nfocus: contaminate","promptText":"kind: rw-words-in-context\n\nthemeId: field-journal\n\nlabel: field journal vocabulary\n\nThe researcher was careful not to ____ the data with personal opinion.\n\nfocus: contaminate","metadata":{"questionKey":"rw-words-in-context-16","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:field-journal"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["contaminate","celebrate","extend","publish"],"correctIndex":0}'::jsonb,
  '{"summary":"contaminate means to make something less pure or reliable","whyCorrect":"contaminate means to make something less pure or reliable"}'::jsonb,
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
  4, 'rw-words-in-context',
  '{"stem":"The hiker followed a ____ path that curved around the lake.","body":"kind: rw-words-in-context\n\nthemeId: field-journal\n\nlabel: field journal vocabulary\n\nThe hiker followed a ____ path that curved around the lake.\n\nfocus: tortuous","promptText":"kind: rw-words-in-context\n\nthemeId: field-journal\n\nlabel: field journal vocabulary\n\nThe hiker followed a ____ path that curved around the lake.\n\nfocus: tortuous","metadata":{"questionKey":"rw-words-in-context-17","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:field-journal"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["direct","tortuous","massive","silent"],"correctIndex":1}'::jsonb,
  '{"summary":"tortuous means winding or twisting","whyCorrect":"tortuous means winding or twisting"}'::jsonb,
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
  4, 'rw-words-in-context',
  '{"stem":"The editor asked for a more ____ statement of the problem.","body":"kind: rw-words-in-context\n\nthemeId: field-journal\n\nlabel: field journal vocabulary\n\nThe editor asked for a more ____ statement of the problem.\n\nfocus: succinct","promptText":"kind: rw-words-in-context\n\nthemeId: field-journal\n\nlabel: field journal vocabulary\n\nThe editor asked for a more ____ statement of the problem.\n\nfocus: succinct","metadata":{"questionKey":"rw-words-in-context-18","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:field-journal"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["elaborate","succinct","ornamental","hesitant"],"correctIndex":1}'::jsonb,
  '{"summary":"succinct means expressed in a few clear words","whyCorrect":"succinct means expressed in a few clear words"}'::jsonb,
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
  4, 'rw-words-in-context',
  '{"stem":"The new policy was meant to ____ delays at the front desk.","body":"kind: rw-words-in-context\n\nthemeId: field-journal\n\nlabel: field journal vocabulary\n\nThe new policy was meant to ____ delays at the front desk.\n\nfocus: accelerate","promptText":"kind: rw-words-in-context\n\nthemeId: field-journal\n\nlabel: field journal vocabulary\n\nThe new policy was meant to ____ delays at the front desk.\n\nfocus: accelerate","metadata":{"questionKey":"rw-words-in-context-19","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:field-journal"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["accelerate","intensify","restore","mimic"],"correctIndex":0}'::jsonb,
  '{"summary":"accelerate means to speed up","whyCorrect":"accelerate means to speed up"}'::jsonb,
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
  4, 'rw-words-in-context',
  '{"stem":"The coach gave a ____ explanation, repeating the key steps slowly.","body":"kind: rw-words-in-context\n\nthemeId: field-journal\n\nlabel: field journal vocabulary\n\nThe coach gave a ____ explanation, repeating the key steps slowly.\n\nfocus: patient","promptText":"kind: rw-words-in-context\n\nthemeId: field-journal\n\nlabel: field journal vocabulary\n\nThe coach gave a ____ explanation, repeating the key steps slowly.\n\nfocus: patient","metadata":{"questionKey":"rw-words-in-context-20","generationSource":"generated_from_research","tags":["reading-writing","words-in-context","theme:field-journal"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["patient","temperamental","private","fickle"],"correctIndex":0}'::jsonb,
  '{"summary":"patient means calm and willing to take time","whyCorrect":"patient means calm and willing to take time"}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-text-structure-and-purpose',
  '{"stem":"What is the main purpose of the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: opening-anecdote\n\nThe article opens with a description of a child tracing raindrops down a window. It then shifts to a discussion of how water cycles through a city. The first image is used to move the reader from a familiar scene to a larger scientific point.\n\nWhat is the main purpose of the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: opening-anecdote\n\nThe article opens with a description of a child tracing raindrops down a window. It then shifts to a discussion of how water cycles through a city. The first image is used to move the reader from a familiar scene to a larger scientific point.\n\nWhat is the main purpose of the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-01","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:opening-anecdote"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The opening image helps the author move from a familiar scene to a scientific explanation.","The passage begins with a child''s observation of raindrops on a window.","The article then shifts to a discussion of the city water cycle.","The author uses the first image to set up the larger point."],"correctIndex":0}'::jsonb,
  '{"summary":"The opening image helps the author move from a familiar scene to a scientific explanation.","whyCorrect":"The opening image helps the author move from a familiar scene to a scientific explanation."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-text-structure-and-purpose',
  '{"stem":"How does the underlined sentence function in the passage?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: opening-anecdote\n\nThe article opens with a description of a child tracing raindrops down a window. It then shifts to a discussion of how water cycles through a city. The first image is used to move the reader from a familiar scene to a larger scientific point.\n\nHow does the underlined sentence function in the passage?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: opening-anecdote\n\nThe article opens with a description of a child tracing raindrops down a window. It then shifts to a discussion of how water cycles through a city. The first image is used to move the reader from a familiar scene to a larger scientific point.\n\nHow does the underlined sentence function in the passage?","metadata":{"questionKey":"rw-text-structure-and-purpose-02","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:opening-anecdote"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The opening image helps the author move from a familiar scene to a scientific explanation.","The article then shifts to a discussion of the city water cycle.","The author uses the first image to set up the larger point.","The passage begins with a child''s observation of raindrops on a window."],"correctIndex":1}'::jsonb,
  '{"summary":"The passage begins with a child''s observation of raindrops on a window.","whyCorrect":"The passage begins with a child''s observation of raindrops on a window."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-text-structure-and-purpose',
  '{"stem":"What role does the underlined sentence play in the author''s argument?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: opening-anecdote\n\nThe article opens with a description of a child tracing raindrops down a window. It then shifts to a discussion of how water cycles through a city. The first image is used to move the reader from a familiar scene to a larger scientific point.\n\nWhat role does the underlined sentence play in the author''s argument?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: opening-anecdote\n\nThe article opens with a description of a child tracing raindrops down a window. It then shifts to a discussion of how water cycles through a city. The first image is used to move the reader from a familiar scene to a larger scientific point.\n\nWhat role does the underlined sentence play in the author''s argument?","metadata":{"questionKey":"rw-text-structure-and-purpose-03","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:opening-anecdote"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage begins with a child''s observation of raindrops on a window.","The author uses the first image to set up the larger point.","The article then shifts to a discussion of the city water cycle.","The opening image helps the author move from a familiar scene to a scientific explanation."],"correctIndex":2}'::jsonb,
  '{"summary":"The article then shifts to a discussion of the city water cycle.","whyCorrect":"The article then shifts to a discussion of the city water cycle."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-text-structure-and-purpose',
  '{"stem":"Why does the author include the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: opening-anecdote\n\nThe article opens with a description of a child tracing raindrops down a window. It then shifts to a discussion of how water cycles through a city. The first image is used to move the reader from a familiar scene to a larger scientific point.\n\nWhy does the author include the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: opening-anecdote\n\nThe article opens with a description of a child tracing raindrops down a window. It then shifts to a discussion of how water cycles through a city. The first image is used to move the reader from a familiar scene to a larger scientific point.\n\nWhy does the author include the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-04","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:opening-anecdote"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The article then shifts to a discussion of the city water cycle.","The author uses the first image to set up the larger point.","The opening image helps the author move from a familiar scene to a scientific explanation.","The passage begins with a child''s observation of raindrops on a window."],"correctIndex":3}'::jsonb,
  '{"summary":"The author uses the first image to set up the larger point.","whyCorrect":"The author uses the first image to set up the larger point."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-text-structure-and-purpose',
  '{"stem":"What best describes the contribution of the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: opening-anecdote\n\nThe article opens with a description of a child tracing raindrops down a window. It then shifts to a discussion of how water cycles through a city. The first image is used to move the reader from a familiar scene to a larger scientific point.\n\nWhat best describes the contribution of the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: opening-anecdote\n\nThe article opens with a description of a child tracing raindrops down a window. It then shifts to a discussion of how water cycles through a city. The first image is used to move the reader from a familiar scene to a larger scientific point.\n\nWhat best describes the contribution of the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-05","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:opening-anecdote"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The structure shows a transition from concrete example to broader idea.","The opening image helps the author move from a familiar scene to a scientific explanation.","The passage begins with a child''s observation of raindrops on a window.","The article then shifts to a discussion of the city water cycle."],"correctIndex":0}'::jsonb,
  '{"summary":"The structure shows a transition from concrete example to broader idea.","whyCorrect":"The structure shows a transition from concrete example to broader idea."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-text-structure-and-purpose',
  '{"stem":"What is the main purpose of the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: contrast-structure\n\nThe first paragraph describes a park that looked dull in winter. The second paragraph explains how the same park becomes active in spring, and the final sentence argues that the change reveals the value of patient planning. The arrangement lets the writer contrast appearance and long-term effect.\n\nWhat is the main purpose of the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: contrast-structure\n\nThe first paragraph describes a park that looked dull in winter. The second paragraph explains how the same park becomes active in spring, and the final sentence argues that the change reveals the value of patient planning. The arrangement lets the writer contrast appearance and long-term effect.\n\nWhat is the main purpose of the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-06","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:contrast-structure"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The writer uses contrast to show how the park changes over time.","The first paragraph presents the park in winter.","The final sentence links the change to patient planning.","The second paragraph describes the park in spring."],"correctIndex":0}'::jsonb,
  '{"summary":"The writer uses contrast to show how the park changes over time.","whyCorrect":"The writer uses contrast to show how the park changes over time."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-text-structure-and-purpose',
  '{"stem":"How does the underlined sentence function in the passage?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: contrast-structure\n\nThe first paragraph describes a park that looked dull in winter. The second paragraph explains how the same park becomes active in spring, and the final sentence argues that the change reveals the value of patient planning. The arrangement lets the writer contrast appearance and long-term effect.\n\nHow does the underlined sentence function in the passage?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: contrast-structure\n\nThe first paragraph describes a park that looked dull in winter. The second paragraph explains how the same park becomes active in spring, and the final sentence argues that the change reveals the value of patient planning. The arrangement lets the writer contrast appearance and long-term effect.\n\nHow does the underlined sentence function in the passage?","metadata":{"questionKey":"rw-text-structure-and-purpose-07","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:contrast-structure"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The writer uses contrast to show how the park changes over time.","The final sentence links the change to patient planning.","The second paragraph describes the park in spring.","The first paragraph presents the park in winter."],"correctIndex":1}'::jsonb,
  '{"summary":"The first paragraph presents the park in winter.","whyCorrect":"The first paragraph presents the park in winter."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-text-structure-and-purpose',
  '{"stem":"What role does the underlined sentence play in the author''s argument?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: contrast-structure\n\nThe first paragraph describes a park that looked dull in winter. The second paragraph explains how the same park becomes active in spring, and the final sentence argues that the change reveals the value of patient planning. The arrangement lets the writer contrast appearance and long-term effect.\n\nWhat role does the underlined sentence play in the author''s argument?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: contrast-structure\n\nThe first paragraph describes a park that looked dull in winter. The second paragraph explains how the same park becomes active in spring, and the final sentence argues that the change reveals the value of patient planning. The arrangement lets the writer contrast appearance and long-term effect.\n\nWhat role does the underlined sentence play in the author''s argument?","metadata":{"questionKey":"rw-text-structure-and-purpose-08","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:contrast-structure"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The first paragraph presents the park in winter.","The second paragraph describes the park in spring.","The final sentence links the change to patient planning.","The writer uses contrast to show how the park changes over time."],"correctIndex":2}'::jsonb,
  '{"summary":"The final sentence links the change to patient planning.","whyCorrect":"The final sentence links the change to patient planning."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-text-structure-and-purpose',
  '{"stem":"Why does the author include the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: contrast-structure\n\nThe first paragraph describes a park that looked dull in winter. The second paragraph explains how the same park becomes active in spring, and the final sentence argues that the change reveals the value of patient planning. The arrangement lets the writer contrast appearance and long-term effect.\n\nWhy does the author include the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: contrast-structure\n\nThe first paragraph describes a park that looked dull in winter. The second paragraph explains how the same park becomes active in spring, and the final sentence argues that the change reveals the value of patient planning. The arrangement lets the writer contrast appearance and long-term effect.\n\nWhy does the author include the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-09","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:contrast-structure"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The final sentence links the change to patient planning.","The second paragraph describes the park in spring.","The writer uses contrast to show how the park changes over time.","The first paragraph presents the park in winter."],"correctIndex":3}'::jsonb,
  '{"summary":"The second paragraph describes the park in spring.","whyCorrect":"The second paragraph describes the park in spring."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-text-structure-and-purpose',
  '{"stem":"What best describes the contribution of the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: contrast-structure\n\nThe first paragraph describes a park that looked dull in winter. The second paragraph explains how the same park becomes active in spring, and the final sentence argues that the change reveals the value of patient planning. The arrangement lets the writer contrast appearance and long-term effect.\n\nWhat best describes the contribution of the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: contrast-structure\n\nThe first paragraph describes a park that looked dull in winter. The second paragraph explains how the same park becomes active in spring, and the final sentence argues that the change reveals the value of patient planning. The arrangement lets the writer contrast appearance and long-term effect.\n\nWhat best describes the contribution of the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-10","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:contrast-structure"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The structure sets up a contrast between appearance and outcome.","The writer uses contrast to show how the park changes over time.","The first paragraph presents the park in winter.","The final sentence links the change to patient planning."],"correctIndex":0}'::jsonb,
  '{"summary":"The structure sets up a contrast between appearance and outcome.","whyCorrect":"The structure sets up a contrast between appearance and outcome."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-text-structure-and-purpose',
  '{"stem":"What is the main purpose of the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: definition-example\n\nThe author defines a maker space as a room where people can test ideas, then gives examples such as sewing machines, 3-D printers, and shared worktables. The explanation helps readers understand that the term refers to both tools and the habits of collaboration that form around them.\n\nWhat is the main purpose of the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: definition-example\n\nThe author defines a maker space as a room where people can test ideas, then gives examples such as sewing machines, 3-D printers, and shared worktables. The explanation helps readers understand that the term refers to both tools and the habits of collaboration that form around them.\n\nWhat is the main purpose of the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-11","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:definition-example"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The author defines a term and then illustrates it with examples.","The passage explains that a maker space includes tools and collaboration.","The author gives examples such as sewing machines and 3-D printers.","The definition helps readers understand the term more clearly."],"correctIndex":0}'::jsonb,
  '{"summary":"The author defines a term and then illustrates it with examples.","whyCorrect":"The author defines a term and then illustrates it with examples."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-text-structure-and-purpose',
  '{"stem":"How does the underlined sentence function in the passage?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: definition-example\n\nThe author defines a maker space as a room where people can test ideas, then gives examples such as sewing machines, 3-D printers, and shared worktables. The explanation helps readers understand that the term refers to both tools and the habits of collaboration that form around them.\n\nHow does the underlined sentence function in the passage?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: definition-example\n\nThe author defines a maker space as a room where people can test ideas, then gives examples such as sewing machines, 3-D printers, and shared worktables. The explanation helps readers understand that the term refers to both tools and the habits of collaboration that form around them.\n\nHow does the underlined sentence function in the passage?","metadata":{"questionKey":"rw-text-structure-and-purpose-12","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:definition-example"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The author defines a term and then illustrates it with examples.","The author gives examples such as sewing machines and 3-D printers.","The definition helps readers understand the term more clearly.","The passage explains that a maker space includes tools and collaboration."],"correctIndex":1}'::jsonb,
  '{"summary":"The passage explains that a maker space includes tools and collaboration.","whyCorrect":"The passage explains that a maker space includes tools and collaboration."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-text-structure-and-purpose',
  '{"stem":"What role does the underlined sentence play in the author''s argument?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: definition-example\n\nThe author defines a maker space as a room where people can test ideas, then gives examples such as sewing machines, 3-D printers, and shared worktables. The explanation helps readers understand that the term refers to both tools and the habits of collaboration that form around them.\n\nWhat role does the underlined sentence play in the author''s argument?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: definition-example\n\nThe author defines a maker space as a room where people can test ideas, then gives examples such as sewing machines, 3-D printers, and shared worktables. The explanation helps readers understand that the term refers to both tools and the habits of collaboration that form around them.\n\nWhat role does the underlined sentence play in the author''s argument?","metadata":{"questionKey":"rw-text-structure-and-purpose-13","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:definition-example"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The passage explains that a maker space includes tools and collaboration.","The definition helps readers understand the term more clearly.","The author gives examples such as sewing machines and 3-D printers.","The author defines a term and then illustrates it with examples."],"correctIndex":2}'::jsonb,
  '{"summary":"The author gives examples such as sewing machines and 3-D printers.","whyCorrect":"The author gives examples such as sewing machines and 3-D printers."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-text-structure-and-purpose',
  '{"stem":"Why does the author include the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: definition-example\n\nThe author defines a maker space as a room where people can test ideas, then gives examples such as sewing machines, 3-D printers, and shared worktables. The explanation helps readers understand that the term refers to both tools and the habits of collaboration that form around them.\n\nWhy does the author include the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: definition-example\n\nThe author defines a maker space as a room where people can test ideas, then gives examples such as sewing machines, 3-D printers, and shared worktables. The explanation helps readers understand that the term refers to both tools and the habits of collaboration that form around them.\n\nWhy does the author include the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-14","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:definition-example"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The author gives examples such as sewing machines and 3-D printers.","The definition helps readers understand the term more clearly.","The author defines a term and then illustrates it with examples.","The passage explains that a maker space includes tools and collaboration."],"correctIndex":3}'::jsonb,
  '{"summary":"The definition helps readers understand the term more clearly.","whyCorrect":"The definition helps readers understand the term more clearly."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-text-structure-and-purpose',
  '{"stem":"What best describes the contribution of the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: definition-example\n\nThe author defines a maker space as a room where people can test ideas, then gives examples such as sewing machines, 3-D printers, and shared worktables. The explanation helps readers understand that the term refers to both tools and the habits of collaboration that form around them.\n\nWhat best describes the contribution of the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: definition-example\n\nThe author defines a maker space as a room where people can test ideas, then gives examples such as sewing machines, 3-D printers, and shared worktables. The explanation helps readers understand that the term refers to both tools and the habits of collaboration that form around them.\n\nWhat best describes the contribution of the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-15","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:definition-example"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The structure pairs explanation with concrete examples.","The author defines a term and then illustrates it with examples.","The passage explains that a maker space includes tools and collaboration.","The author gives examples such as sewing machines and 3-D printers."],"correctIndex":0}'::jsonb,
  '{"summary":"The structure pairs explanation with concrete examples.","whyCorrect":"The structure pairs explanation with concrete examples."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-text-structure-and-purpose',
  '{"stem":"What is the main purpose of the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: conclusion-structure\n\nAfter describing several short experiments, the writer concludes that small adjustments can lead to larger improvements. The final sentence does not introduce new evidence; instead, it ties the examples together and signals the article''s main lesson.\n\nWhat is the main purpose of the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: conclusion-structure\n\nAfter describing several short experiments, the writer concludes that small adjustments can lead to larger improvements. The final sentence does not introduce new evidence; instead, it ties the examples together and signals the article''s main lesson.\n\nWhat is the main purpose of the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-16","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:conclusion-structure"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The final sentence draws a conclusion from the earlier examples.","The writer argues that small adjustments can produce larger improvements.","The final sentence ties the examples together.","The article uses several short experiments to build its point."],"correctIndex":0}'::jsonb,
  '{"summary":"The final sentence draws a conclusion from the earlier examples.","whyCorrect":"The final sentence draws a conclusion from the earlier examples."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-text-structure-and-purpose',
  '{"stem":"How does the underlined sentence function in the passage?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: conclusion-structure\n\nAfter describing several short experiments, the writer concludes that small adjustments can lead to larger improvements. The final sentence does not introduce new evidence; instead, it ties the examples together and signals the article''s main lesson.\n\nHow does the underlined sentence function in the passage?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: conclusion-structure\n\nAfter describing several short experiments, the writer concludes that small adjustments can lead to larger improvements. The final sentence does not introduce new evidence; instead, it ties the examples together and signals the article''s main lesson.\n\nHow does the underlined sentence function in the passage?","metadata":{"questionKey":"rw-text-structure-and-purpose-17","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:conclusion-structure"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The final sentence draws a conclusion from the earlier examples.","The final sentence ties the examples together.","The article uses several short experiments to build its point.","The writer argues that small adjustments can produce larger improvements."],"correctIndex":1}'::jsonb,
  '{"summary":"The writer argues that small adjustments can produce larger improvements.","whyCorrect":"The writer argues that small adjustments can produce larger improvements."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-text-structure-and-purpose',
  '{"stem":"What role does the underlined sentence play in the author''s argument?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: conclusion-structure\n\nAfter describing several short experiments, the writer concludes that small adjustments can lead to larger improvements. The final sentence does not introduce new evidence; instead, it ties the examples together and signals the article''s main lesson.\n\nWhat role does the underlined sentence play in the author''s argument?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: conclusion-structure\n\nAfter describing several short experiments, the writer concludes that small adjustments can lead to larger improvements. The final sentence does not introduce new evidence; instead, it ties the examples together and signals the article''s main lesson.\n\nWhat role does the underlined sentence play in the author''s argument?","metadata":{"questionKey":"rw-text-structure-and-purpose-18","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:conclusion-structure"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The writer argues that small adjustments can produce larger improvements.","The article uses several short experiments to build its point.","The final sentence ties the examples together.","The final sentence draws a conclusion from the earlier examples."],"correctIndex":2}'::jsonb,
  '{"summary":"The final sentence ties the examples together.","whyCorrect":"The final sentence ties the examples together."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-text-structure-and-purpose',
  '{"stem":"Why does the author include the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: conclusion-structure\n\nAfter describing several short experiments, the writer concludes that small adjustments can lead to larger improvements. The final sentence does not introduce new evidence; instead, it ties the examples together and signals the article''s main lesson.\n\nWhy does the author include the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: conclusion-structure\n\nAfter describing several short experiments, the writer concludes that small adjustments can lead to larger improvements. The final sentence does not introduce new evidence; instead, it ties the examples together and signals the article''s main lesson.\n\nWhy does the author include the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-19","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:conclusion-structure"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The final sentence ties the examples together.","The article uses several short experiments to build its point.","The final sentence draws a conclusion from the earlier examples.","The writer argues that small adjustments can produce larger improvements."],"correctIndex":3}'::jsonb,
  '{"summary":"The article uses several short experiments to build its point.","whyCorrect":"The article uses several short experiments to build its point."}'::jsonb,
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
    and c.slug = 'text-structure-and-purpose'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-text-structure-and-purpose',
  '{"stem":"What best describes the contribution of the underlined sentence?","body":"kind: rw-text-structure-and-purpose\n\nthemeId: conclusion-structure\n\nAfter describing several short experiments, the writer concludes that small adjustments can lead to larger improvements. The final sentence does not introduce new evidence; instead, it ties the examples together and signals the article''s main lesson.\n\nWhat best describes the contribution of the underlined sentence?","promptText":"kind: rw-text-structure-and-purpose\n\nthemeId: conclusion-structure\n\nAfter describing several short experiments, the writer concludes that small adjustments can lead to larger improvements. The final sentence does not introduce new evidence; instead, it ties the examples together and signals the article''s main lesson.\n\nWhat best describes the contribution of the underlined sentence?","metadata":{"questionKey":"rw-text-structure-and-purpose-20","generationSource":"generated_from_research","tags":["reading-writing","text-structure-and-purpose","theme:conclusion-structure"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The structure ends by stating the main lesson of the article.","The final sentence draws a conclusion from the earlier examples.","The writer argues that small adjustments can produce larger improvements.","The final sentence ties the examples together."],"correctIndex":0}'::jsonb,
  '{"summary":"The structure ends by stating the main lesson of the article.","whyCorrect":"The structure ends by stating the main lesson of the article."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

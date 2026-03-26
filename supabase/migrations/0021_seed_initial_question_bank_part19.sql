-- Continuation of initial question bank seed (part 19 of 20).
-- Requires migrations 0001, 0002, and prior question-bank parts.

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Two supplementary angles are shown. If one angle measures 40, what is the other angle?","body":"Two supplementary angles are shown. If one angle measures 40, what is the other angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: supplementary-angles","promptText":"Two supplementary angles are shown. If one angle measures 40, what is the other angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: supplementary-angles","metadata":{"questionKey":"math-lines-angles-and-triangles-01","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","supplementary-angles","angles","supplementary"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["140","220","20","40"],"correctIndex":0}'::jsonb,
  '{"summary":"Supplementary angles add to 180 degrees.","strategy":"Subtract the given angle from 180. The result is the supplementary angle. Write the measure in degrees."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A triangle has angles measuring 50, 60, and x. What is x?","body":"A triangle has angles measuring 50, 60, and x. What is x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: triangle-sum","promptText":"A triangle has angles measuring 50, 60, and x. What is x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: triangle-sum","metadata":{"questionKey":"math-lines-angles-and-triangles-02","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","triangle-sum","triangle","angle-sum"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["110","130","120","70"],"correctIndex":3}'::jsonb,
  '{"summary":"The angles of a triangle add to 180 degrees.","strategy":"Add the known angles. Subtract their sum from 180. The missing angle is 70."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Two parallel lines are cut by a transversal. If one angle measures 110, what is the corresponding angle?","body":"Two parallel lines are cut by a transversal. If one angle measures 110, what is the corresponding angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: parallel-lines","promptText":"Two parallel lines are cut by a transversal. If one angle measures 110, what is the corresponding angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: parallel-lines","metadata":{"questionKey":"math-lines-angles-and-triangles-03","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","parallel-lines","transversal","parallel-lines"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["130","90","110","70"],"correctIndex":2}'::jsonb,
  '{"summary":"Corresponding angles formed by parallel lines are equal.","strategy":"Identify the angle relationship. Corresponding angles have the same measure. The matching angle is ${angle}."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Two similar triangles have side-length ratio 1:2. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?","body":"Two similar triangles have side-length ratio 1:2. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: similar-triangles","promptText":"Two similar triangles have side-length ratio 1:2. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: similar-triangles","metadata":{"questionKey":"math-lines-angles-and-triangles-04","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","similar-triangles","similarity","triangles"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["4","8","6","2"],"correctIndex":1}'::jsonb,
  '{"summary":"Similar triangles have proportional side lengths.","strategy":"Use the scale factor between the triangles. Multiply the smaller side by the scale factor. Write the corresponding side length."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"In a triangle, two angles measure 2 and 5. What is the third angle?","body":"In a triangle, two angles measure 2 and 5. What is the third angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: angle-chase","promptText":"In a triangle, two angles measure 2 and 5. What is the third angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: angle-chase","metadata":{"questionKey":"math-lines-angles-and-triangles-05","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","angle-chase","angles","triangle"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["173","7","178","175"],"correctIndex":0}'::jsonb,
  '{"summary":"Use the triangle angle sum theorem and subtract the known angles from 180.","strategy":"Add the known angles. Subtract from 180. The remainder is the missing angle."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Two supplementary angles are shown. If one angle measures 50, what is the other angle?","body":"Two supplementary angles are shown. If one angle measures 50, what is the other angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: supplementary-angles","promptText":"Two supplementary angles are shown. If one angle measures 50, what is the other angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: supplementary-angles","metadata":{"questionKey":"math-lines-angles-and-triangles-06","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","supplementary-angles","angles","supplementary"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["230","25","50","130"],"correctIndex":3}'::jsonb,
  '{"summary":"Supplementary angles add to 180 degrees.","strategy":"Subtract the given angle from 180. The result is the supplementary angle. Write the measure in degrees."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A triangle has angles measuring 55, 55, and x. What is x?","body":"A triangle has angles measuring 55, 55, and x. What is x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: triangle-sum","promptText":"A triangle has angles measuring 55, 55, and x. What is x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: triangle-sum","metadata":{"questionKey":"math-lines-angles-and-triangles-07","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","triangle-sum","triangle","angle-sum"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["125","125","70","110"],"correctIndex":2}'::jsonb,
  '{"summary":"The angles of a triangle add to 180 degrees.","strategy":"Add the known angles. Subtract their sum from 180. The missing angle is 70."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Two parallel lines are cut by a transversal. If one angle measures 105, what is the corresponding angle?","body":"Two parallel lines are cut by a transversal. If one angle measures 105, what is the corresponding angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: parallel-lines","promptText":"Two parallel lines are cut by a transversal. If one angle measures 105, what is the corresponding angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: parallel-lines","metadata":{"questionKey":"math-lines-angles-and-triangles-08","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","parallel-lines","transversal","parallel-lines"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["85","105","75","125"],"correctIndex":1}'::jsonb,
  '{"summary":"Corresponding angles formed by parallel lines are equal.","strategy":"Identify the angle relationship. Corresponding angles have the same measure. The matching angle is ${angle}."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Two similar triangles have side-length ratio 1:3. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?","body":"Two similar triangles have side-length ratio 1:3. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: similar-triangles","promptText":"Two similar triangles have side-length ratio 1:3. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: similar-triangles","metadata":{"questionKey":"math-lines-angles-and-triangles-09","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","similar-triangles","similarity","triangles"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12","7","1.3333333333333333","8"],"correctIndex":0}'::jsonb,
  '{"summary":"Similar triangles have proportional side lengths.","strategy":"Use the scale factor between the triangles. Multiply the smaller side by the scale factor. Write the corresponding side length."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"In a triangle, two angles measure 3 and 6. What is the third angle?","body":"In a triangle, two angles measure 3 and 6. What is the third angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: angle-chase","promptText":"In a triangle, two angles measure 3 and 6. What is the third angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: angle-chase","metadata":{"questionKey":"math-lines-angles-and-triangles-10","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","angle-chase","angles","triangle"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["9","177","174","171"],"correctIndex":3}'::jsonb,
  '{"summary":"Use the triangle angle sum theorem and subtract the known angles from 180.","strategy":"Add the known angles. Subtract from 180. The remainder is the missing angle."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Two supplementary angles are shown. If one angle measures 60, what is the other angle?","body":"Two supplementary angles are shown. If one angle measures 60, what is the other angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: supplementary-angles","promptText":"Two supplementary angles are shown. If one angle measures 60, what is the other angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: supplementary-angles","metadata":{"questionKey":"math-lines-angles-and-triangles-11","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","supplementary-angles","angles","supplementary"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["30","60","120","240"],"correctIndex":2}'::jsonb,
  '{"summary":"Supplementary angles add to 180 degrees.","strategy":"Subtract the given angle from 180. The result is the supplementary angle. Write the measure in degrees."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A triangle has angles measuring 60, 50, and x. What is x?","body":"A triangle has angles measuring 60, 50, and x. What is x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: triangle-sum","promptText":"A triangle has angles measuring 60, 50, and x. What is x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: triangle-sum","metadata":{"questionKey":"math-lines-angles-and-triangles-12","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","triangle-sum","triangle","angle-sum"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["130","70","110","120"],"correctIndex":1}'::jsonb,
  '{"summary":"The angles of a triangle add to 180 degrees.","strategy":"Add the known angles. Subtract their sum from 180. The missing angle is 70."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Two parallel lines are cut by a transversal. If one angle measures 100, what is the corresponding angle?","body":"Two parallel lines are cut by a transversal. If one angle measures 100, what is the corresponding angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: parallel-lines","promptText":"Two parallel lines are cut by a transversal. If one angle measures 100, what is the corresponding angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: parallel-lines","metadata":{"questionKey":"math-lines-angles-and-triangles-13","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","parallel-lines","transversal","parallel-lines"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["100","80","120","80"],"correctIndex":0}'::jsonb,
  '{"summary":"Corresponding angles formed by parallel lines are equal.","strategy":"Identify the angle relationship. Corresponding angles have the same measure. The matching angle is ${angle}."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Two similar triangles have side-length ratio 1:4. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?","body":"Two similar triangles have side-length ratio 1:4. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: similar-triangles","promptText":"Two similar triangles have side-length ratio 1:4. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: similar-triangles","metadata":{"questionKey":"math-lines-angles-and-triangles-14","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","similar-triangles","similarity","triangles"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["8","1","12","16"],"correctIndex":3}'::jsonb,
  '{"summary":"Similar triangles have proportional side lengths.","strategy":"Use the scale factor between the triangles. Multiply the smaller side by the scale factor. Write the corresponding side length."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"In a triangle, two angles measure 4 and 7. What is the third angle?","body":"In a triangle, two angles measure 4 and 7. What is the third angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: angle-chase","promptText":"In a triangle, two angles measure 4 and 7. What is the third angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: angle-chase","metadata":{"questionKey":"math-lines-angles-and-triangles-15","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","angle-chase","angles","triangle"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["176","173","169","11"],"correctIndex":2}'::jsonb,
  '{"summary":"Use the triangle angle sum theorem and subtract the known angles from 180.","strategy":"Add the known angles. Subtract from 180. The remainder is the missing angle."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Two supplementary angles are shown. If one angle measures 70, what is the other angle?","body":"Two supplementary angles are shown. If one angle measures 70, what is the other angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: supplementary-angles","promptText":"Two supplementary angles are shown. If one angle measures 70, what is the other angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: supplementary-angles","metadata":{"questionKey":"math-lines-angles-and-triangles-16","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","supplementary-angles","angles","supplementary"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["70","110","250","35"],"correctIndex":1}'::jsonb,
  '{"summary":"Supplementary angles add to 180 degrees.","strategy":"Subtract the given angle from 180. The result is the supplementary angle. Write the measure in degrees."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A triangle has angles measuring 65, 45, and x. What is x?","body":"A triangle has angles measuring 65, 45, and x. What is x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: triangle-sum","promptText":"A triangle has angles measuring 65, 45, and x. What is x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: triangle-sum","metadata":{"questionKey":"math-lines-angles-and-triangles-17","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","triangle-sum","triangle","angle-sum"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["70","110","115","135"],"correctIndex":0}'::jsonb,
  '{"summary":"The angles of a triangle add to 180 degrees.","strategy":"Add the known angles. Subtract their sum from 180. The missing angle is 70."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Two parallel lines are cut by a transversal. If one angle measures 95, what is the corresponding angle?","body":"Two parallel lines are cut by a transversal. If one angle measures 95, what is the corresponding angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: parallel-lines","promptText":"Two parallel lines are cut by a transversal. If one angle measures 95, what is the corresponding angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: parallel-lines","metadata":{"questionKey":"math-lines-angles-and-triangles-18","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","parallel-lines","transversal","parallel-lines"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["85","115","75","95"],"correctIndex":3}'::jsonb,
  '{"summary":"Corresponding angles formed by parallel lines are equal.","strategy":"Identify the angle relationship. Corresponding angles have the same measure. The matching angle is ${angle}."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Two similar triangles have side-length ratio 1:5. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?","body":"Two similar triangles have side-length ratio 1:5. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: similar-triangles","promptText":"Two similar triangles have side-length ratio 1:5. If a corresponding side in the smaller triangle is 4, what is the matching side in the larger triangle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: similar-triangles","metadata":{"questionKey":"math-lines-angles-and-triangles-19","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","similar-triangles","similarity","triangles"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["0.8","16","20","9"],"correctIndex":2}'::jsonb,
  '{"summary":"Similar triangles have proportional side lengths.","strategy":"Use the scale factor between the triangles. Multiply the smaller side by the scale factor. Write the corresponding side length."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'lines-angles-and-triangles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"In a triangle, two angles measure 5 and 8. What is the third angle?","body":"In a triangle, two angles measure 5 and 8. What is the third angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: angle-chase","promptText":"In a triangle, two angles measure 5 and 8. What is the third angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: angle-chase","metadata":{"questionKey":"math-lines-angles-and-triangles-20","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","lines-angles-and-triangles","angle-chase","angles","triangle"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["172","167","13","175"],"correctIndex":1}'::jsonb,
  '{"summary":"Use the triangle angle sum theorem and subtract the known angles from 180.","strategy":"Add the known angles. Subtract from 180. The remainder is the missing angle."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A right triangle has legs 3 and 4. What is the length of the hypotenuse?","body":"A right triangle has legs 3 and 4. What is the length of the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: pythagorean-theorem","promptText":"A right triangle has legs 3 and 4. What is the length of the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: pythagorean-theorem","metadata":{"questionKey":"math-right-triangles-and-trigonometry-01","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","pythagorean-theorem","right-triangle","pythagorean"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5","7","1","12"],"correctIndex":0}'::jsonb,
  '{"summary":"Use the Pythagorean theorem a^2 + b^2 = c^2.","strategy":"Square both legs. Add the squares. Take the square root."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"In a 45-45-90 triangle, one leg is 5. What is the hypotenuse?","body":"In a 45-45-90 triangle, one leg is 5. What is the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: special-right-triangle","promptText":"In a 45-45-90 triangle, one leg is 5. What is the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: special-right-triangle","metadata":{"questionKey":"math-right-triangles-and-trigonometry-02","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","special-right-triangle","special-triangle","hypotenuse"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["10","5/2","5sqrt3","5sqrt2"],"correctIndex":3}'::jsonb,
  '{"summary":"In a 45-45-90 triangle, the hypotenuse equals a leg times sqrt2.","strategy":"Recall the side ratio 1:1:sqrt2. Multiply the leg by sqrt2. Write the hypotenuse."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"In a right triangle, the side opposite the angle is 3 and the adjacent side is 4. What is tan of the angle?","body":"In a right triangle, the side opposite the angle is 3 and the adjacent side is 4. What is tan of the angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: trig-ratio","promptText":"In a right triangle, the side opposite the angle is 3 and the adjacent side is 4. What is tan of the angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: trig-ratio","metadata":{"questionKey":"math-right-triangles-and-trigonometry-03","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","trig-ratio","trigonometry","tangent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["3/7","1/4","3/4","4/3"],"correctIndex":2}'::jsonb,
  '{"summary":"Tangent equals opposite over adjacent.","strategy":"Identify the opposite side. Identify the adjacent side. Write opposite over adjacent."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A tree casts a shadow of length 8. The angle of elevation to the top is 30 degrees. Which trig ratio would relate the tree''s height and the shadow?","body":"A tree casts a shadow of length 8. The angle of elevation to the top is 30 degrees. Which trig ratio would relate the tree''s height and the shadow?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: angle-of-elevation","promptText":"A tree casts a shadow of length 8. The angle of elevation to the top is 30 degrees. Which trig ratio would relate the tree''s height and the shadow?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: angle-of-elevation","metadata":{"questionKey":"math-right-triangles-and-trigonometry-04","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","angle-of-elevation","trigonometry","elevation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["sec","tan","sin","cos"],"correctIndex":1}'::jsonb,
  '{"summary":"Use tangent to relate opposite and adjacent sides in an angle-of-elevation problem.","strategy":"Identify the opposite side as the height. Identify the adjacent side as the shadow. Use tangent."}'::jsonb,
  true,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"For angle A in a right triangle, which ratio equals sin(angle A)?","body":"For angle A in a right triangle, which ratio equals sin(angle A)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: ratio-selection","promptText":"For angle A in a right triangle, which ratio equals sin(angle A)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: ratio-selection","metadata":{"questionKey":"math-right-triangles-and-trigonometry-05","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","ratio-selection","trigonometry","sine"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["opposite / hypotenuse","adjacent / hypotenuse","opposite / adjacent","hypotenuse / opposite"],"correctIndex":0}'::jsonb,
  '{"summary":"Sine is opposite over hypotenuse.","strategy":"Recall SOH-CAH-TOA. Match sine with opposite over hypotenuse. Choose the matching ratio."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A right triangle has legs 4 and 5. What is the length of the hypotenuse?","body":"A right triangle has legs 4 and 5. What is the length of the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: pythagorean-theorem","promptText":"A right triangle has legs 4 and 5. What is the length of the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: pythagorean-theorem","metadata":{"questionKey":"math-right-triangles-and-trigonometry-06","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","pythagorean-theorem","right-triangle","pythagorean"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["9","1","20","6.4031242374328485"],"correctIndex":3}'::jsonb,
  '{"summary":"Use the Pythagorean theorem a^2 + b^2 = c^2.","strategy":"Square both legs. Add the squares. Take the square root."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"In a 45-45-90 triangle, one leg is 6. What is the hypotenuse?","body":"In a 45-45-90 triangle, one leg is 6. What is the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: special-right-triangle","promptText":"In a 45-45-90 triangle, one leg is 6. What is the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: special-right-triangle","metadata":{"questionKey":"math-right-triangles-and-trigonometry-07","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","special-right-triangle","special-triangle","hypotenuse"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6/2","6sqrt3","6sqrt2","12"],"correctIndex":2}'::jsonb,
  '{"summary":"In a 45-45-90 triangle, the hypotenuse equals a leg times sqrt2.","strategy":"Recall the side ratio 1:1:sqrt2. Multiply the leg by sqrt2. Write the hypotenuse."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"In a right triangle, the side opposite the angle is 4 and the adjacent side is 5. What is tan of the angle?","body":"In a right triangle, the side opposite the angle is 4 and the adjacent side is 5. What is tan of the angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: trig-ratio","promptText":"In a right triangle, the side opposite the angle is 4 and the adjacent side is 5. What is tan of the angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: trig-ratio","metadata":{"questionKey":"math-right-triangles-and-trigonometry-08","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","trig-ratio","trigonometry","tangent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1/5","4/5","5/4","4/9"],"correctIndex":1}'::jsonb,
  '{"summary":"Tangent equals opposite over adjacent.","strategy":"Identify the opposite side. Identify the adjacent side. Write opposite over adjacent."}'::jsonb,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A tree casts a shadow of length 9. The angle of elevation to the top is 35 degrees. Which trig ratio would relate the tree''s height and the shadow?","body":"A tree casts a shadow of length 9. The angle of elevation to the top is 35 degrees. Which trig ratio would relate the tree''s height and the shadow?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: angle-of-elevation","promptText":"A tree casts a shadow of length 9. The angle of elevation to the top is 35 degrees. Which trig ratio would relate the tree''s height and the shadow?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: angle-of-elevation","metadata":{"questionKey":"math-right-triangles-and-trigonometry-09","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","angle-of-elevation","trigonometry","elevation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["tan","sin","cos","sec"],"correctIndex":0}'::jsonb,
  '{"summary":"Use tangent to relate opposite and adjacent sides in an angle-of-elevation problem.","strategy":"Identify the opposite side as the height. Identify the adjacent side as the shadow. Use tangent."}'::jsonb,
  true,
  true,
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
  where s.slug = 'math'
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"For angle B in a right triangle, which ratio equals sin(angle B)?","body":"For angle B in a right triangle, which ratio equals sin(angle B)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: ratio-selection","promptText":"For angle B in a right triangle, which ratio equals sin(angle B)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: ratio-selection","metadata":{"questionKey":"math-right-triangles-and-trigonometry-10","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","ratio-selection","trigonometry","sine"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["adjacent / hypotenuse","opposite / adjacent","hypotenuse / opposite","opposite / hypotenuse"],"correctIndex":3}'::jsonb,
  '{"summary":"Sine is opposite over hypotenuse.","strategy":"Recall SOH-CAH-TOA. Match sine with opposite over hypotenuse. Choose the matching ratio."}'::jsonb,
  true,
  false,
  'published', now()
from taxonomy;

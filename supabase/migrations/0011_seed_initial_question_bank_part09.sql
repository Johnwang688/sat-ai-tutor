-- Continuation of initial question bank seed (part 9 of 20).
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"In the equation 3x + 2y = 14, what is y when x = 2?","body":"In the equation 3x + 2y = 14, what is y when x = 2?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: solve-for-y","promptText":"In the equation 3x + 2y = 14, what is y when x = 2?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: solve-for-y","metadata":{"questionKey":"math-linear-equations-in-two-variables-01","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","solve-for-y","two-variables","solve-for-y"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["4","5","2","7"],"correctIndex":0}'::jsonb,
  '{"summary":"Substitute the given x-value, then solve for y.","strategy":"Replace x with 2. Subtract the x-term from both sides. Divide by the coefficient of y."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which equation has slope 2 and y-intercept -3?","body":"Which equation has slope 2 and y-intercept -3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: slope-intercept","promptText":"Which equation has slope 2 and y-intercept -3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: slope-intercept","metadata":{"questionKey":"math-linear-equations-in-two-variables-02","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","slope-intercept","slope-intercept","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = -2x - 3","y = 2x + 5","y = 3x - 3","y = 2x - 3"],"correctIndex":3}'::jsonb,
  '{"summary":"Use slope-intercept form y = mx + b.","strategy":"The slope is 2. The y-intercept is -3. Write the equation in slope-intercept form."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A line passes through (1, 5) and (4, 11). What is its equation?","body":"A line passes through (1, 5) and (4, 11). What is its equation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: line-from-points","promptText":"A line passes through (1, 5) and (4, 11). What is its equation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: line-from-points","metadata":{"questionKey":"math-linear-equations-in-two-variables-03","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","line-from-points","points","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = 2x + 5","y = 3x + 3","y = 2x + 3","y = -2x + 3"],"correctIndex":2}'::jsonb,
  '{"summary":"Find the slope from two points and then solve for the intercept.","strategy":"Compute rise over run. Use one point to find b. Write the equation."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A taxi charges a base fee of $4 plus $3 per mile. Which equation represents the total cost C for m miles?","body":"A taxi charges a base fee of $4 plus $3 per mile. Which equation represents the total cost C for m miles?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: context-linear-equation","promptText":"A taxi charges a base fee of $4 plus $3 per mile. Which equation represents the total cost C for m miles?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: context-linear-equation","metadata":{"questionKey":"math-linear-equations-in-two-variables-04","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","context-linear-equation","context","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["C = 7m","C = 4 + 3m","C = 4m + 3","C = 3 + 4m"],"correctIndex":1}'::jsonb,
  '{"summary":"A fixed fee becomes the constant term, and the per-mile charge multiplies the miles.","strategy":"Let m represent miles. Use the base fee as the constant. Multiply the per-mile charge by m."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Which ordered pair satisfies the equation y = 2x + -1?","body":"Which ordered pair satisfies the equation y = 2x + -1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: point-satisfaction","promptText":"Which ordered pair satisfies the equation y = 2x + -1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: point-satisfaction","metadata":{"questionKey":"math-linear-equations-in-two-variables-05","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","point-satisfaction","ordered-pairs","two-variables"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(2, 3)","(3, 3)","(2, 5)","(1, 2)"],"correctIndex":0}'::jsonb,
  '{"summary":"Substitute each ordered pair and check whether both sides are equal.","strategy":"Use the pair in the equation. Check whether the result matches. Only one choice makes the equation true."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"In the equation 4x + 3y = 30, what is y when x = 3?","body":"In the equation 4x + 3y = 30, what is y when x = 3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: solve-for-y","promptText":"In the equation 4x + 3y = 30, what is y when x = 3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: solve-for-y","metadata":{"questionKey":"math-linear-equations-in-two-variables-06","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","solve-for-y","two-variables","solve-for-y"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["8","3","10","6"],"correctIndex":3}'::jsonb,
  '{"summary":"Substitute the given x-value, then solve for y.","strategy":"Replace x with 3. Subtract the x-term from both sides. Divide by the coefficient of y."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which equation has slope 3 and y-intercept -2?","body":"Which equation has slope 3 and y-intercept -2?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: slope-intercept","promptText":"Which equation has slope 3 and y-intercept -2?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: slope-intercept","metadata":{"questionKey":"math-linear-equations-in-two-variables-07","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","slope-intercept","slope-intercept","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = 3x + 4","y = 4x - 2","y = 3x - 2","y = -3x - 2"],"correctIndex":2}'::jsonb,
  '{"summary":"Use slope-intercept form y = mx + b.","strategy":"The slope is 3. The y-intercept is -2. Write the equation in slope-intercept form."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A line passes through (2, 6) and (5, 13). What is its equation?","body":"A line passes through (2, 6) and (5, 13). What is its equation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: line-from-points","promptText":"A line passes through (2, 6) and (5, 13). What is its equation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: line-from-points","metadata":{"questionKey":"math-linear-equations-in-two-variables-08","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","line-from-points","points","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = 3.3333333333333335x + 1.333333333333333","y = 2.3333333333333335x + 1.333333333333333","y = -2.3333333333333335x + 1.333333333333333","y = 2.3333333333333335x + 3.333333333333333"],"correctIndex":1}'::jsonb,
  '{"summary":"Find the slope from two points and then solve for the intercept.","strategy":"Compute rise over run. Use one point to find b. Write the equation."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A taxi charges a base fee of $5 plus $4 per mile. Which equation represents the total cost C for m miles?","body":"A taxi charges a base fee of $5 plus $4 per mile. Which equation represents the total cost C for m miles?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-linear-equation","promptText":"A taxi charges a base fee of $5 plus $4 per mile. Which equation represents the total cost C for m miles?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-linear-equation","metadata":{"questionKey":"math-linear-equations-in-two-variables-09","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","context-linear-equation","context","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["C = 5 + 4m","C = 5m + 4","C = 4 + 5m","C = 9m"],"correctIndex":0}'::jsonb,
  '{"summary":"A fixed fee becomes the constant term, and the per-mile charge multiplies the miles.","strategy":"Let m represent miles. Use the base fee as the constant. Multiply the per-mile charge by m."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which ordered pair satisfies the equation y = 2x + -2?","body":"Which ordered pair satisfies the equation y = 2x + -2?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: point-satisfaction","promptText":"Which ordered pair satisfies the equation y = 2x + -2?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: point-satisfaction","metadata":{"questionKey":"math-linear-equations-in-two-variables-10","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","point-satisfaction","ordered-pairs","two-variables"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(5, 4)","(3, 7)","(1, 2)","(3, 4)"],"correctIndex":3}'::jsonb,
  '{"summary":"Substitute each ordered pair and check whether both sides are equal.","strategy":"Use the pair in the equation. Check whether the result matches. Only one choice makes the equation true."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"In the equation 5x + 4y = 52, what is y when x = 4?","body":"In the equation 5x + 4y = 52, what is y when x = 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: solve-for-y","promptText":"In the equation 5x + 4y = 52, what is y when x = 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: solve-for-y","metadata":{"questionKey":"math-linear-equations-in-two-variables-11","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","solve-for-y","two-variables","solve-for-y"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["4","13","8","11"],"correctIndex":2}'::jsonb,
  '{"summary":"Substitute the given x-value, then solve for y.","strategy":"Replace x with 4. Subtract the x-term from both sides. Divide by the coefficient of y."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which equation has slope 4 and y-intercept -1?","body":"Which equation has slope 4 and y-intercept -1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: slope-intercept","promptText":"Which equation has slope 4 and y-intercept -1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: slope-intercept","metadata":{"questionKey":"math-linear-equations-in-two-variables-12","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","slope-intercept","slope-intercept","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = 5x - 1","y = 4x - 1","y = -4x - 1","y = 4x + 3"],"correctIndex":1}'::jsonb,
  '{"summary":"Use slope-intercept form y = mx + b.","strategy":"The slope is 4. The y-intercept is -1. Write the equation in slope-intercept form."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A line passes through (3, 7) and (6, 15). What is its equation?","body":"A line passes through (3, 7) and (6, 15). What is its equation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: line-from-points","promptText":"A line passes through (3, 7) and (6, 15). What is its equation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: line-from-points","metadata":{"questionKey":"math-linear-equations-in-two-variables-13","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","line-from-points","points","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = 2.6666666666666665x - 1","y = -2.6666666666666665x - 1","y = 2.6666666666666665x + 1","y = 3.6666666666666665x - 1"],"correctIndex":0}'::jsonb,
  '{"summary":"Find the slope from two points and then solve for the intercept.","strategy":"Compute rise over run. Use one point to find b. Write the equation."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A taxi charges a base fee of $6 plus $5 per mile. Which equation represents the total cost C for m miles?","body":"A taxi charges a base fee of $6 plus $5 per mile. Which equation represents the total cost C for m miles?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-linear-equation","promptText":"A taxi charges a base fee of $6 plus $5 per mile. Which equation represents the total cost C for m miles?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-linear-equation","metadata":{"questionKey":"math-linear-equations-in-two-variables-14","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","context-linear-equation","context","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["C = 6m + 5","C = 5 + 6m","C = 11m","C = 6 + 5m"],"correctIndex":3}'::jsonb,
  '{"summary":"A fixed fee becomes the constant term, and the per-mile charge multiplies the miles.","strategy":"Let m represent miles. Use the base fee as the constant. Multiply the per-mile charge by m."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Which ordered pair satisfies the equation y = 2x + -3?","body":"Which ordered pair satisfies the equation y = 2x + -3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: point-satisfaction","promptText":"Which ordered pair satisfies the equation y = 2x + -3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: point-satisfaction","metadata":{"questionKey":"math-linear-equations-in-two-variables-15","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","point-satisfaction","ordered-pairs","two-variables"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(4, 9)","(1, 2)","(4, 5)","(7, 5)"],"correctIndex":2}'::jsonb,
  '{"summary":"Substitute each ordered pair and check whether both sides are equal.","strategy":"Use the pair in the equation. Check whether the result matches. Only one choice makes the equation true."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"In the equation 6x + 5y = 80, what is y when x = 5?","body":"In the equation 6x + 5y = 80, what is y when x = 5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: solve-for-y","promptText":"In the equation 6x + 5y = 80, what is y when x = 5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: solve-for-y","metadata":{"questionKey":"math-linear-equations-in-two-variables-16","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","solve-for-y","two-variables","solve-for-y"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["16","10","14","5"],"correctIndex":1}'::jsonb,
  '{"summary":"Substitute the given x-value, then solve for y.","strategy":"Replace x with 5. Subtract the x-term from both sides. Divide by the coefficient of y."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Which equation has slope 5 and y-intercept 0?","body":"Which equation has slope 5 and y-intercept 0?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: slope-intercept","promptText":"Which equation has slope 5 and y-intercept 0?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: slope-intercept","metadata":{"questionKey":"math-linear-equations-in-two-variables-17","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","slope-intercept","slope-intercept","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = 5x + 0","y = -5x + 0","y = 5x + 2","y = 6x + 0"],"correctIndex":0}'::jsonb,
  '{"summary":"Use slope-intercept form y = mx + b.","strategy":"The slope is 5. The y-intercept is 0. Write the equation in slope-intercept form."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A line passes through (4, 8) and (7, 17). What is its equation?","body":"A line passes through (4, 8) and (7, 17). What is its equation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: line-from-points","promptText":"A line passes through (4, 8) and (7, 17). What is its equation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: line-from-points","metadata":{"questionKey":"math-linear-equations-in-two-variables-18","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","line-from-points","points","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = -3x - 4","y = 3x - 2","y = 4x - 4","y = 3x - 4"],"correctIndex":3}'::jsonb,
  '{"summary":"Find the slope from two points and then solve for the intercept.","strategy":"Compute rise over run. Use one point to find b. Write the equation."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A taxi charges a base fee of $7 plus $6 per mile. Which equation represents the total cost C for m miles?","body":"A taxi charges a base fee of $7 plus $6 per mile. Which equation represents the total cost C for m miles?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: context-linear-equation","promptText":"A taxi charges a base fee of $7 plus $6 per mile. Which equation represents the total cost C for m miles?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: context-linear-equation","metadata":{"questionKey":"math-linear-equations-in-two-variables-19","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","context-linear-equation","context","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["C = 6 + 7m","C = 13m","C = 7 + 6m","C = 7m + 6"],"correctIndex":2}'::jsonb,
  '{"summary":"A fixed fee becomes the constant term, and the per-mile charge multiplies the miles.","strategy":"Let m represent miles. Use the base fee as the constant. Multiply the per-mile charge by m."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Which ordered pair satisfies the equation y = 2x + -4?","body":"Which ordered pair satisfies the equation y = 2x + -4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: point-satisfaction","promptText":"Which ordered pair satisfies the equation y = 2x + -4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: point-satisfaction","metadata":{"questionKey":"math-linear-equations-in-two-variables-20","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-two-variables","point-satisfaction","ordered-pairs","two-variables"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(1, 2)","(5, 6)","(9, 6)","(5, 11)"],"correctIndex":1}'::jsonb,
  '{"summary":"Substitute each ordered pair and check whether both sides are equal.","strategy":"Use the pair in the equation. Check whether the result matches. Only one choice makes the equation true."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A linear function is shown in the table. What is the rate of change?","body":"A linear function is shown in the table. What is the rate of change?\n\nheaders: x\n\nheaders: f(x)\n\nrows: 0\n\nrows: 6\n\nrows: 1\n\nrows: 9\n\nrows: 2\n\nrows: 12\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: table-rate","promptText":"A linear function is shown in the table. What is the rate of change?\n\nheaders: x\n\nheaders: f(x)\n\nrows: 0\n\nrows: 6\n\nrows: 1\n\nrows: 9\n\nrows: 2\n\nrows: 12\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: table-rate","metadata":{"questionKey":"math-linear-functions-01","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","table-rate","table","rate"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["3","4","1","6"],"correctIndex":0}'::jsonb,
  '{"summary":"Compare consecutive outputs to find the constant change in y for each 1-unit increase in x.","strategy":"Look at the change from x = 0 to x = 1. Confirm the same change appears from x = 1 to x = 2. That constant change is the rate of change."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"If f(x) = y = 2x + 5, what is f(3)?","body":"If f(x) = y = 2x + 5, what is f(3)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: evaluate-function","promptText":"If f(x) = y = 2x + 5, what is f(3)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: evaluate-function","metadata":{"questionKey":"math-linear-functions-02","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","evaluate-function","function","evaluation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12","9","14","11"],"correctIndex":3}'::jsonb,
  '{"summary":"Substitute the input into the function and simplify.","strategy":"Replace x with 3. Multiply by the slope and add the intercept. The output is 11."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A savings plan starts with $4 and increases by $6 each week. What is the starting value of the function?","body":"A savings plan starts with $4 and increases by $6 each week. What is the starting value of the function?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: starting-value","promptText":"A savings plan starts with $4 and increases by $6 each week. What is the starting value of the function?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: starting-value","metadata":{"questionKey":"math-linear-functions-03","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","starting-value","intercept","starting-value"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$6","$3","$4","$10"],"correctIndex":2}'::jsonb,
  '{"summary":"The starting value is the output when the input is 0.","strategy":"Identify the amount at week 0. That amount is the starting value. No growth has happened yet."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Two lines are described by y = y = 3x + 2 and y = y = 4x + 0. Which line has the greater rate of change?","body":"Two lines are described by y = y = 3x + 2 and y = y = 4x + 0. Which line has the greater rate of change?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: compare-rates","promptText":"Two lines are described by y = y = 3x + 2 and y = y = 4x + 0. Which line has the greater rate of change?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: compare-rates","metadata":{"questionKey":"math-linear-functions-04","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","compare-rates","slope","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["They have the same rate of change","The line with slope 4","The line with slope 3","The line with the larger intercept"],"correctIndex":1}'::jsonb,
  '{"summary":"The rate of change is the slope, so compare the coefficients of x.","strategy":"Identify the slope of each function. Compare the coefficients of x. The larger coefficient means the greater rate of change."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A linear function passes through (0, 7) and (4, 15). What is its slope?","body":"A linear function passes through (0, 7) and (4, 15). What is its slope?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: two-points","promptText":"A linear function passes through (0, 7) and (4, 15). What is its slope?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: two-points","metadata":{"questionKey":"math-linear-functions-05","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","two-points","points","slope"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["2","3","0","5"],"correctIndex":0}'::jsonb,
  '{"summary":"Find the slope from two points using rise over run.","strategy":"Subtract the y-values. Subtract the x-values. Divide the change in y by the change in x."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A linear function is shown in the table. What is the rate of change?","body":"A linear function is shown in the table. What is the rate of change?\n\nheaders: x\n\nheaders: f(x)\n\nrows: 0\n\nrows: 8\n\nrows: 1\n\nrows: 12\n\nrows: 2\n\nrows: 16\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: table-rate","promptText":"A linear function is shown in the table. What is the rate of change?\n\nheaders: x\n\nheaders: f(x)\n\nrows: 0\n\nrows: 8\n\nrows: 1\n\nrows: 12\n\nrows: 2\n\nrows: 16\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: table-rate","metadata":{"questionKey":"math-linear-functions-06","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","table-rate","table","rate"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6","1","8","4"],"correctIndex":3}'::jsonb,
  '{"summary":"Compare consecutive outputs to find the constant change in y for each 1-unit increase in x.","strategy":"Look at the change from x = 0 to x = 1. Confirm the same change appears from x = 1 to x = 2. That constant change is the rate of change."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"If f(x) = y = 3x + 6, what is f(4)?","body":"If f(x) = y = 3x + 6, what is f(4)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: evaluate-function","promptText":"If f(x) = y = 3x + 6, what is f(4)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: evaluate-function","metadata":{"questionKey":"math-linear-functions-07","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","evaluate-function","function","evaluation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["15","22","18","20"],"correctIndex":2}'::jsonb,
  '{"summary":"Substitute the input into the function and simplify.","strategy":"Replace x with 4. Multiply by the slope and add the intercept. The output is 18."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A savings plan starts with $5 and increases by $7 each week. What is the starting value of the function?","body":"A savings plan starts with $5 and increases by $7 each week. What is the starting value of the function?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: starting-value","promptText":"A savings plan starts with $5 and increases by $7 each week. What is the starting value of the function?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: starting-value","metadata":{"questionKey":"math-linear-functions-08","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","starting-value","intercept","starting-value"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$4","$5","$12","$7"],"correctIndex":1}'::jsonb,
  '{"summary":"The starting value is the output when the input is 0.","strategy":"Identify the amount at week 0. That amount is the starting value. No growth has happened yet."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Two lines are described by y = y = 4x + 3 and y = y = 5x + 1. Which line has the greater rate of change?","body":"Two lines are described by y = y = 4x + 3 and y = y = 5x + 1. Which line has the greater rate of change?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-rates","promptText":"Two lines are described by y = y = 4x + 3 and y = y = 5x + 1. Which line has the greater rate of change?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-rates","metadata":{"questionKey":"math-linear-functions-09","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","compare-rates","slope","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The line with slope 5","The line with slope 4","The line with the larger intercept","They have the same rate of change"],"correctIndex":0}'::jsonb,
  '{"summary":"The rate of change is the slope, so compare the coefficients of x.","strategy":"Identify the slope of each function. Compare the coefficients of x. The larger coefficient means the greater rate of change."}'::jsonb,
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
    and d.slug = 'algebra'
    and c.slug = 'linear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A linear function passes through (0, 8) and (5, 23). What is its slope?","body":"A linear function passes through (0, 8) and (5, 23). What is its slope?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: two-points","promptText":"A linear function passes through (0, 8) and (5, 23). What is its slope?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: two-points","metadata":{"questionKey":"math-linear-functions-10","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","two-points","points","slope"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5","0","7","3"],"correctIndex":3}'::jsonb,
  '{"summary":"Find the slope from two points using rise over run.","strategy":"Subtract the y-values. Subtract the x-values. Divide the change in y by the change in x."}'::jsonb,
  true,
  true,
  'published', now()
from taxonomy;

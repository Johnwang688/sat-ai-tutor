-- Continuation of initial question bank seed (part 13 of 20).
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A quadratic function has vertex at x = 4 and opens downward. What is the maximum value if the vertex is (4, 12)?","body":"A quadratic function has vertex at x = 4 and opens downward. What is the maximum value if the vertex is (4, 12)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: quadratic-vertex","promptText":"A quadratic function has vertex at x = 4 and opens downward. What is the maximum value if the vertex is (4, 12)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: quadratic-vertex","metadata":{"questionKey":"math-nonlinear-functions-01","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","quadratic-vertex","quadratic","vertex"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12","13","10","15"],"correctIndex":0}'::jsonb,
  '{"summary":"For a downward-opening parabola, the y-value of the vertex is the maximum.","strategy":"Identify the vertex. Because the parabola opens downward, the vertex gives the maximum. The maximum value is 12."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A population starts at 2 and is multiplied by 1.2 each year. What is the value after one year?","body":"A population starts at 2 and is multiplied by 1.2 each year. What is the value after one year?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: exponential-growth","promptText":"A population starts at 2 and is multiplied by 1.2 each year. What is the value after one year?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: exponential-growth","metadata":{"questionKey":"math-nonlinear-functions-02","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","exponential-growth","exponential","growth"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["3.2","3.4","1.4","2.4"],"correctIndex":3}'::jsonb,
  '{"summary":"Exponential growth multiplies by the growth factor each period.","strategy":"Multiply the starting value by the growth factor. Do not add the factor. Write the result after one year."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A function is defined by f(x) = (x + 1)(x + 3). What is f(2)?","body":"A function is defined by f(x) = (x + 1)(x + 3). What is f(2)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: table-nonlinear","promptText":"A function is defined by f(x) = (x + 1)(x + 3). What is f(2)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: table-nonlinear","metadata":{"questionKey":"math-nonlinear-functions-03","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","table-nonlinear","nonlinear","table"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["13","18","15","16"],"correctIndex":2}'::jsonb,
  '{"summary":"Substitute the input into both factors and multiply.","strategy":"Replace x with the given value. Evaluate each factor. Multiply the results."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"The graph of y = x^2 is shifted up by 2 units. Which function is produced?","body":"The graph of y = x^2 is shifted up by 2 units. Which function is produced?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: transformation","promptText":"The graph of y = x^2 is shifted up by 2 units. Which function is produced?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: transformation","metadata":{"questionKey":"math-nonlinear-functions-04","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","transformation","transformations","quadratic"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = 2x^2","y = x^2 + 2","y = (x + 2)^2","y = x^2 - 2"],"correctIndex":1}'::jsonb,
  '{"summary":"A vertical shift changes the constant term, not the x inside the square.","strategy":"Start with the parent function y = x^2. Add the vertical shift to the output. Write the transformed function."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Which type of function best matches values that are multiplied by 2 each time x increases by 1?","body":"Which type of function best matches values that are multiplied by 2 each time x increases by 1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: function-comparison","promptText":"Which type of function best matches values that are multiplied by 2 each time x increases by 1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: function-comparison","metadata":{"questionKey":"math-nonlinear-functions-05","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","function-comparison","exponential","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Exponential","Linear","Quadratic","Constant"],"correctIndex":0}'::jsonb,
  '{"summary":"Repeated multiplication by the same factor is exponential behavior.","strategy":"Look for a constant ratio, not a constant difference. Multiplying by 2 each time creates a repeated ratio. That pattern is exponential."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A quadratic function has vertex at x = 5 and opens downward. What is the maximum value if the vertex is (5, 14)?","body":"A quadratic function has vertex at x = 5 and opens downward. What is the maximum value if the vertex is (5, 14)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: quadratic-vertex","promptText":"A quadratic function has vertex at x = 5 and opens downward. What is the maximum value if the vertex is (5, 14)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: quadratic-vertex","metadata":{"questionKey":"math-nonlinear-functions-06","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","quadratic-vertex","quadratic","vertex"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["16","11","18","14"],"correctIndex":3}'::jsonb,
  '{"summary":"For a downward-opening parabola, the y-value of the vertex is the maximum.","strategy":"Identify the vertex. Because the parabola opens downward, the vertex gives the maximum. The maximum value is 14."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A population starts at 3 and is multiplied by 1.3 each year. What is the value after one year?","body":"A population starts at 3 and is multiplied by 1.3 each year. What is the value after one year?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: exponential-growth","promptText":"A population starts at 3 and is multiplied by 1.3 each year. What is the value after one year?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: exponential-growth","metadata":{"questionKey":"math-nonlinear-functions-07","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","exponential-growth","exponential","growth"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["4.9","2.9","3.9","4.3"],"correctIndex":2}'::jsonb,
  '{"summary":"Exponential growth multiplies by the growth factor each period.","strategy":"Multiply the starting value by the growth factor. Do not add the factor. Write the result after one year."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A function is defined by f(x) = (x + 1)(x + 3). What is f(3)?","body":"A function is defined by f(x) = (x + 1)(x + 3). What is f(3)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: table-nonlinear","promptText":"A function is defined by f(x) = (x + 1)(x + 3). What is f(3)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: table-nonlinear","metadata":{"questionKey":"math-nonlinear-functions-08","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","table-nonlinear","nonlinear","table"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["28","24","26","21"],"correctIndex":1}'::jsonb,
  '{"summary":"Substitute the input into both factors and multiply.","strategy":"Replace x with the given value. Evaluate each factor. Multiply the results."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"The graph of y = x^2 is shifted up by 3 units. Which function is produced?","body":"The graph of y = x^2 is shifted up by 3 units. Which function is produced?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: transformation","promptText":"The graph of y = x^2 is shifted up by 3 units. Which function is produced?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: transformation","metadata":{"questionKey":"math-nonlinear-functions-09","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","transformation","transformations","quadratic"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = x^2 + 3","y = (x + 3)^2","y = x^2 - 3","y = 3x^2"],"correctIndex":0}'::jsonb,
  '{"summary":"A vertical shift changes the constant term, not the x inside the square.","strategy":"Start with the parent function y = x^2. Add the vertical shift to the output. Write the transformed function."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which type of function best matches values that are multiplied by 3 each time x increases by 1?","body":"Which type of function best matches values that are multiplied by 3 each time x increases by 1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: function-comparison","promptText":"Which type of function best matches values that are multiplied by 3 each time x increases by 1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: function-comparison","metadata":{"questionKey":"math-nonlinear-functions-10","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","function-comparison","exponential","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Linear","Quadratic","Constant","Exponential"],"correctIndex":3}'::jsonb,
  '{"summary":"Repeated multiplication by the same factor is exponential behavior.","strategy":"Look for a constant ratio, not a constant difference. Multiplying by 3 each time creates a repeated ratio. That pattern is exponential."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A quadratic function has vertex at x = 6 and opens downward. What is the maximum value if the vertex is (6, 16)?","body":"A quadratic function has vertex at x = 6 and opens downward. What is the maximum value if the vertex is (6, 16)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: quadratic-vertex","promptText":"A quadratic function has vertex at x = 6 and opens downward. What is the maximum value if the vertex is (6, 16)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: quadratic-vertex","metadata":{"questionKey":"math-nonlinear-functions-11","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","quadratic-vertex","quadratic","vertex"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12","21","16","19"],"correctIndex":2}'::jsonb,
  '{"summary":"For a downward-opening parabola, the y-value of the vertex is the maximum.","strategy":"Identify the vertex. Because the parabola opens downward, the vertex gives the maximum. The maximum value is 16."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A population starts at 4 and is multiplied by 1.4 each year. What is the value after one year?","body":"A population starts at 4 and is multiplied by 1.4 each year. What is the value after one year?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: exponential-growth","promptText":"A population starts at 4 and is multiplied by 1.4 each year. What is the value after one year?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: exponential-growth","metadata":{"questionKey":"math-nonlinear-functions-12","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","exponential-growth","exponential","growth"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["4.6","5.6","5.4","6.6"],"correctIndex":1}'::jsonb,
  '{"summary":"Exponential growth multiplies by the growth factor each period.","strategy":"Multiply the starting value by the growth factor. Do not add the factor. Write the result after one year."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A function is defined by f(x) = (x + 1)(x + 3). What is f(4)?","body":"A function is defined by f(x) = (x + 1)(x + 3). What is f(4)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: table-nonlinear","promptText":"A function is defined by f(x) = (x + 1)(x + 3). What is f(4)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: table-nonlinear","metadata":{"questionKey":"math-nonlinear-functions-13","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","table-nonlinear","nonlinear","table"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["35","38","31","40"],"correctIndex":0}'::jsonb,
  '{"summary":"Substitute the input into both factors and multiply.","strategy":"Replace x with the given value. Evaluate each factor. Multiply the results."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"The graph of y = x^2 is shifted up by 4 units. Which function is produced?","body":"The graph of y = x^2 is shifted up by 4 units. Which function is produced?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: transformation","promptText":"The graph of y = x^2 is shifted up by 4 units. Which function is produced?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: transformation","metadata":{"questionKey":"math-nonlinear-functions-14","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","transformation","transformations","quadratic"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = (x + 4)^2","y = x^2 - 4","y = 4x^2","y = x^2 + 4"],"correctIndex":3}'::jsonb,
  '{"summary":"A vertical shift changes the constant term, not the x inside the square.","strategy":"Start with the parent function y = x^2. Add the vertical shift to the output. Write the transformed function."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Which type of function best matches values that are multiplied by 4 each time x increases by 1?","body":"Which type of function best matches values that are multiplied by 4 each time x increases by 1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: function-comparison","promptText":"Which type of function best matches values that are multiplied by 4 each time x increases by 1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: function-comparison","metadata":{"questionKey":"math-nonlinear-functions-15","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","function-comparison","exponential","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Quadratic","Constant","Exponential","Linear"],"correctIndex":2}'::jsonb,
  '{"summary":"Repeated multiplication by the same factor is exponential behavior.","strategy":"Look for a constant ratio, not a constant difference. Multiplying by 4 each time creates a repeated ratio. That pattern is exponential."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A quadratic function has vertex at x = 7 and opens downward. What is the maximum value if the vertex is (7, 18)?","body":"A quadratic function has vertex at x = 7 and opens downward. What is the maximum value if the vertex is (7, 18)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: quadratic-vertex","promptText":"A quadratic function has vertex at x = 7 and opens downward. What is the maximum value if the vertex is (7, 18)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: quadratic-vertex","metadata":{"questionKey":"math-nonlinear-functions-16","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","quadratic-vertex","quadratic","vertex"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["24","18","22","13"],"correctIndex":1}'::jsonb,
  '{"summary":"For a downward-opening parabola, the y-value of the vertex is the maximum.","strategy":"Identify the vertex. Because the parabola opens downward, the vertex gives the maximum. The maximum value is 18."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A population starts at 5 and is multiplied by 1.5 each year. What is the value after one year?","body":"A population starts at 5 and is multiplied by 1.5 each year. What is the value after one year?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: exponential-growth","promptText":"A population starts at 5 and is multiplied by 1.5 each year. What is the value after one year?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: exponential-growth","metadata":{"questionKey":"math-nonlinear-functions-17","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","exponential-growth","exponential","growth"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7.5","6.5","8.5","6.5"],"correctIndex":0}'::jsonb,
  '{"summary":"Exponential growth multiplies by the growth factor each period.","strategy":"Multiply the starting value by the growth factor. Do not add the factor. Write the result after one year."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A function is defined by f(x) = (x + 1)(x + 3). What is f(5)?","body":"A function is defined by f(x) = (x + 1)(x + 3). What is f(5)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: table-nonlinear","promptText":"A function is defined by f(x) = (x + 1)(x + 3). What is f(5)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: table-nonlinear","metadata":{"questionKey":"math-nonlinear-functions-18","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","table-nonlinear","nonlinear","table"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["52","43","54","48"],"correctIndex":3}'::jsonb,
  '{"summary":"Substitute the input into both factors and multiply.","strategy":"Replace x with the given value. Evaluate each factor. Multiply the results."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"The graph of y = x^2 is shifted up by 5 units. Which function is produced?","body":"The graph of y = x^2 is shifted up by 5 units. Which function is produced?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: transformation","promptText":"The graph of y = x^2 is shifted up by 5 units. Which function is produced?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: transformation","metadata":{"questionKey":"math-nonlinear-functions-19","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","transformation","transformations","quadratic"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["y = x^2 - 5","y = 5x^2","y = x^2 + 5","y = (x + 5)^2"],"correctIndex":2}'::jsonb,
  '{"summary":"A vertical shift changes the constant term, not the x inside the square.","strategy":"Start with the parent function y = x^2. Add the vertical shift to the output. Write the transformed function."}'::jsonb,
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
    and d.slug = 'advanced-math'
    and c.slug = 'nonlinear-functions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Which type of function best matches values that are multiplied by 5 each time x increases by 1?","body":"Which type of function best matches values that are multiplied by 5 each time x increases by 1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: function-comparison","promptText":"Which type of function best matches values that are multiplied by 5 each time x increases by 1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: function-comparison","metadata":{"questionKey":"math-nonlinear-functions-20","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-functions","function-comparison","exponential","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Constant","Exponential","Linear","Quadratic"],"correctIndex":1}'::jsonb,
  '{"summary":"Repeated multiplication by the same factor is exponential behavior.","strategy":"Look for a constant ratio, not a constant difference. Multiplying by 5 each time creates a repeated ratio. That pattern is exponential."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'ratios-rates-proportional-relationships-and-units'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A car travels 120 miles in 3 hours. What is its unit rate in miles per hour?","body":"A car travels 120 miles in 3 hours. What is its unit rate in miles per hour?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: unit-rate","promptText":"A car travels 120 miles in 3 hours. What is its unit rate in miles per hour?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: unit-rate","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-01","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","unit-rate","rate","unit-rate"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["40","41","38","43"],"correctIndex":0}'::jsonb,
  '{"summary":"Divide distance by time to find the unit rate.","strategy":"Take miles divided by hours. Simplify the quotient. The result is miles per hour."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'ratios-rates-proportional-relationships-and-units'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A recipe uses a ratio of 2:3 cups of flour to cups of sugar. If the sugar amount is 10 cups, how many cups of flour are needed?","body":"A recipe uses a ratio of 2:3 cups of flour to cups of sugar. If the sugar amount is 10 cups, how many cups of flour are needed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: ratio-scale","promptText":"A recipe uses a ratio of 2:3 cups of flour to cups of sugar. If the sugar amount is 10 cups, how many cups of flour are needed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: ratio-scale","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-02","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","ratio-scale","ratio","proportion"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["10","8.666666666666668","4.666666666666667","6.666666666666667"],"correctIndex":3}'::jsonb,
  '{"summary":"Set up a proportion that preserves the ratio.","strategy":"Match flour to sugar in the same order. Use cross multiplication or proportional reasoning. Find the missing amount."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'ratios-rates-proportional-relationships-and-units'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"How many miles is 8 kilometers? Use 1 kilometer = 1.6 miles.","body":"How many miles is 8 kilometers? Use 1 kilometer = 1.6 miles.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: unit-conversion","promptText":"How many miles is 8 kilometers? Use 1 kilometer = 1.6 miles.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: unit-conversion","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-03","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","unit-conversion","units","conversion"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["13.8","11.8","12.8","5"],"correctIndex":2}'::jsonb,
  '{"summary":"Multiply by the conversion factor with matching units.","strategy":"Use the given conversion factor. Multiply the number of kilometers by 1.6. Write the distance in miles."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'ratios-rates-proportional-relationships-and-units'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"If 3 bicycles have 6 wheels, how many wheels do 3 bicycles have?","body":"If 3 bicycles have 6 wheels, how many wheels do 3 bicycles have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: proportional-relationship","promptText":"If 3 bicycles have 6 wheels, how many wheels do 3 bicycles have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: proportional-relationship","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-04","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","proportional-relationship","proportional","ratio"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["9","6","8","4"],"correctIndex":1}'::jsonb,
  '{"summary":"Keep the ratio wheels to bicycles constant.","strategy":"Find the number of wheels per bicycle. Multiply by the number of bicycles. The relationship stays proportional."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'ratios-rates-proportional-relationships-and-units'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A runner travels at 30 miles per hour for 2 hours. How far does the runner go?","body":"A runner travels at 30 miles per hour for 2 hours. How far does the runner go?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: compound-rate","promptText":"A runner travels at 30 miles per hour for 2 hours. How far does the runner go?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: compound-rate","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-05","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","compound-rate","rate","distance"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["60","90","30","30"],"correctIndex":0}'::jsonb,
  '{"summary":"Distance equals rate times time.","strategy":"Multiply the speed by the number of hours. Keep the units consistent. The result is distance."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'ratios-rates-proportional-relationships-and-units'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A car travels 140 miles in 4 hours. What is its unit rate in miles per hour?","body":"A car travels 140 miles in 4 hours. What is its unit rate in miles per hour?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: unit-rate","promptText":"A car travels 140 miles in 4 hours. What is its unit rate in miles per hour?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: unit-rate","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-06","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","unit-rate","rate","unit-rate"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["37","32","39","35"],"correctIndex":3}'::jsonb,
  '{"summary":"Divide distance by time to find the unit rate.","strategy":"Take miles divided by hours. Simplify the quotient. The result is miles per hour."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'ratios-rates-proportional-relationships-and-units'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A recipe uses a ratio of 3:4 cups of flour to cups of sugar. If the sugar amount is 12 cups, how many cups of flour are needed?","body":"A recipe uses a ratio of 3:4 cups of flour to cups of sugar. If the sugar amount is 12 cups, how many cups of flour are needed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: ratio-scale","promptText":"A recipe uses a ratio of 3:4 cups of flour to cups of sugar. If the sugar amount is 12 cups, how many cups of flour are needed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: ratio-scale","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-07","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","ratio-scale","ratio","proportion"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12","6","9","12"],"correctIndex":2}'::jsonb,
  '{"summary":"Set up a proportion that preserves the ratio.","strategy":"Match flour to sugar in the same order. Use cross multiplication or proportional reasoning. Find the missing amount."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'ratios-rates-proportional-relationships-and-units'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"How many miles is 9 kilometers? Use 1 kilometer = 1.6 miles.","body":"How many miles is 9 kilometers? Use 1 kilometer = 1.6 miles.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: unit-conversion","promptText":"How many miles is 9 kilometers? Use 1 kilometer = 1.6 miles.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: unit-conversion","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-08","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","unit-conversion","units","conversion"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["13.4","14.4","5.63","15.4"],"correctIndex":1}'::jsonb,
  '{"summary":"Multiply by the conversion factor with matching units.","strategy":"Use the given conversion factor. Multiply the number of kilometers by 1.6. Write the distance in miles."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'ratios-rates-proportional-relationships-and-units'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"If 3 bicycles have 6 wheels, how many wheels do 4 bicycles have?","body":"If 3 bicycles have 6 wheels, how many wheels do 4 bicycles have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: proportional-relationship","promptText":"If 3 bicycles have 6 wheels, how many wheels do 4 bicycles have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: proportional-relationship","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-09","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","proportional-relationship","proportional","ratio"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["8","10","6","10"],"correctIndex":0}'::jsonb,
  '{"summary":"Keep the ratio wheels to bicycles constant.","strategy":"Find the number of wheels per bicycle. Multiply by the number of bicycles. The relationship stays proportional."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'ratios-rates-proportional-relationships-and-units'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A runner travels at 35 miles per hour for 3 hours. How far does the runner go?","body":"A runner travels at 35 miles per hour for 3 hours. How far does the runner go?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compound-rate","promptText":"A runner travels at 35 miles per hour for 3 hours. How far does the runner go?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compound-rate","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-10","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","compound-rate","rate","distance"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["140","70","35","105"],"correctIndex":3}'::jsonb,
  '{"summary":"Distance equals rate times time.","strategy":"Multiply the speed by the number of hours. Keep the units consistent. The result is distance."}'::jsonb,
  true,
  false,
  'published', now()
from taxonomy;

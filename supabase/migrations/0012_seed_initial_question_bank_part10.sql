-- Continuation of initial question bank seed (part 10 of 20).
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
  '{"stem":"A linear function is shown in the table. What is the rate of change?","body":"A linear function is shown in the table. What is the rate of change?\n\nheaders: x\n\nheaders: f(x)\n\nrows: 0\n\nrows: 10\n\nrows: 1\n\nrows: 15\n\nrows: 2\n\nrows: 20\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: table-rate","promptText":"A linear function is shown in the table. What is the rate of change?\n\nheaders: x\n\nheaders: f(x)\n\nrows: 0\n\nrows: 10\n\nrows: 1\n\nrows: 15\n\nrows: 2\n\nrows: 20\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: table-rate","metadata":{"questionKey":"math-linear-functions-11","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","table-rate","table","rate"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1","10","5","8"],"correctIndex":2}'::jsonb,
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
  '{"stem":"If f(x) = y = 4x + 7, what is f(5)?","body":"If f(x) = y = 4x + 7, what is f(5)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: evaluate-function","promptText":"If f(x) = y = 4x + 7, what is f(5)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: evaluate-function","metadata":{"questionKey":"math-linear-functions-12","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","evaluate-function","function","evaluation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["32","27","30","23"],"correctIndex":1}'::jsonb,
  '{"summary":"Substitute the input into the function and simplify.","strategy":"Replace x with 5. Multiply by the slope and add the intercept. The output is 27."}'::jsonb,
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
  '{"stem":"A savings plan starts with $6 and increases by $8 each week. What is the starting value of the function?","body":"A savings plan starts with $6 and increases by $8 each week. What is the starting value of the function?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: starting-value","promptText":"A savings plan starts with $6 and increases by $8 each week. What is the starting value of the function?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: starting-value","metadata":{"questionKey":"math-linear-functions-13","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","starting-value","intercept","starting-value"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$6","$14","$8","$5"],"correctIndex":0}'::jsonb,
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
  '{"stem":"Two lines are described by y = y = 5x + 4 and y = y = 6x + 2. Which line has the greater rate of change?","body":"Two lines are described by y = y = 5x + 4 and y = y = 6x + 2. Which line has the greater rate of change?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-rates","promptText":"Two lines are described by y = y = 5x + 4 and y = y = 6x + 2. Which line has the greater rate of change?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-rates","metadata":{"questionKey":"math-linear-functions-14","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","compare-rates","slope","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The line with slope 5","The line with the larger intercept","They have the same rate of change","The line with slope 6"],"correctIndex":3}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"A linear function passes through (0, 9) and (6, 33). What is its slope?","body":"A linear function passes through (0, 9) and (6, 33). What is its slope?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: two-points","promptText":"A linear function passes through (0, 9) and (6, 33). What is its slope?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: two-points","metadata":{"questionKey":"math-linear-functions-15","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","two-points","points","slope"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["0","9","4","7"],"correctIndex":2}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"A linear function is shown in the table. What is the rate of change?","body":"A linear function is shown in the table. What is the rate of change?\n\nheaders: x\n\nheaders: f(x)\n\nrows: 0\n\nrows: 12\n\nrows: 1\n\nrows: 18\n\nrows: 2\n\nrows: 24\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: table-rate","promptText":"A linear function is shown in the table. What is the rate of change?\n\nheaders: x\n\nheaders: f(x)\n\nrows: 0\n\nrows: 12\n\nrows: 1\n\nrows: 18\n\nrows: 2\n\nrows: 24\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: table-rate","metadata":{"questionKey":"math-linear-functions-16","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","table-rate","table","rate"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12","6","10","1"],"correctIndex":1}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"If f(x) = y = 5x + 8, what is f(6)?","body":"If f(x) = y = 5x + 8, what is f(6)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: evaluate-function","promptText":"If f(x) = y = 5x + 8, what is f(6)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: evaluate-function","metadata":{"questionKey":"math-linear-functions-17","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","evaluate-function","function","evaluation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["38","42","33","44"],"correctIndex":0}'::jsonb,
  '{"summary":"Substitute the input into the function and simplify.","strategy":"Replace x with 6. Multiply by the slope and add the intercept. The output is 38."}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"A savings plan starts with $7 and increases by $9 each week. What is the starting value of the function?","body":"A savings plan starts with $7 and increases by $9 each week. What is the starting value of the function?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: starting-value","promptText":"A savings plan starts with $7 and increases by $9 each week. What is the starting value of the function?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: starting-value","metadata":{"questionKey":"math-linear-functions-18","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","starting-value","intercept","starting-value"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$16","$9","$6","$7"],"correctIndex":3}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"Two lines are described by y = y = 6x + 5 and y = y = 7x + 3. Which line has the greater rate of change?","body":"Two lines are described by y = y = 6x + 5 and y = y = 7x + 3. Which line has the greater rate of change?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compare-rates","promptText":"Two lines are described by y = y = 6x + 5 and y = y = 7x + 3. Which line has the greater rate of change?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compare-rates","metadata":{"questionKey":"math-linear-functions-19","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","compare-rates","slope","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The line with the larger intercept","They have the same rate of change","The line with slope 7","The line with slope 6"],"correctIndex":2}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"A linear function passes through (0, 10) and (7, 45). What is its slope?","body":"A linear function passes through (0, 10) and (7, 45). What is its slope?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: two-points","promptText":"A linear function passes through (0, 10) and (7, 45). What is its slope?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: two-points","metadata":{"questionKey":"math-linear-functions-20","generationSource":"generated_from_research","tags":["math","algebra","linear-functions","two-points","points","slope"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["11","5","9","0"],"correctIndex":1}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Solve the system:\n2x + 1y = 9\n3x + 2y = 16","body":"Solve the system:\n2x + 1y = 9\n3x + 2y = 16\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: solve-system","promptText":"Solve the system:\n2x + 1y = 9\n3x + 2y = 16\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: solve-system","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-01","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","solve-system","systems","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(2, 5)","(3, 5)","(2, 7)","(1, 4)"],"correctIndex":0}'::jsonb,
  '{"summary":"Use elimination or substitution to find the ordered pair that satisfies both equations.","strategy":"Eliminate one variable or solve one equation for a variable. Substitute into the other equation. The solution is (2, 5)."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"How many solutions does the system y = y = 3x + 4 and y = y = 3x + 6 have?","body":"How many solutions does the system y = y = 3x + 4 and y = y = 3x + 6 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: number-of-solutions","promptText":"How many solutions does the system y = y = 3x + 4 and y = y = 3x + 6 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: number-of-solutions","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-02","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","number-of-solutions","systems","parallel-lines"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1","2","Infinitely many","0"],"correctIndex":3}'::jsonb,
  '{"summary":"Parallel lines with different intercepts never intersect.","strategy":"Both equations have the same slope. The y-intercepts are different. So the lines are parallel and have no solution."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A museum charges $6 for admission plus $4 per guide. If the total cost is $14 for 2 guides, which equation matches the situation?","body":"A museum charges $6 for admission plus $4 per guide. If the total cost is $14 for 2 guides, which equation matches the situation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: context-system","promptText":"A museum charges $6 for admission plus $4 per guide. If the total cost is $14 for 2 guides, which equation matches the situation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: context-system","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-03","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","context-system","systems","context"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["C = 4 + 6g","C = 10g","C = 6 + 4g","C = 6g + 4"],"correctIndex":2}'::jsonb,
  '{"summary":"Translate the context into an equation with a fixed fee and a per-guide rate.","strategy":"Let g represent the number of guides. Use the fixed fee as the constant term. Multiply the per-guide charge by g."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which ordered pair is a solution to the system x + y = 8 and 2x - y = -5?","body":"Which ordered pair is a solution to the system x + y = 8 and 2x - y = -5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: solution-check","promptText":"Which ordered pair is a solution to the system x + y = 8 and 2x - y = -5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: solution-check","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-04","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","solution-check","systems","check"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(0, 6)","(1, 7)","(2, 7)","(1, 9)"],"correctIndex":1}'::jsonb,
  '{"summary":"Substitute the ordered pair into both equations.","strategy":"Check the first equation. Check the second equation. Only one pair satisfies both equations."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Two lines intersect at the point (4, 3). What does that point represent?","body":"Two lines intersect at the point (4, 3). What does that point represent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: intersection-interpretation","promptText":"Two lines intersect at the point (4, 3). What does that point represent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: intersection-interpretation","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-05","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","intersection-interpretation","systems","intersection"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The solution to the system","The y-intercepts of both lines","The slope of each line","The point where the lines are parallel"],"correctIndex":0}'::jsonb,
  '{"summary":"The intersection of two lines is the one ordered pair that satisfies both equations.","strategy":"At the intersection, both equations have the same x- and y-values. That means the ordered pair solves the system. The point is not a slope or intercept."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Solve the system:\n3x + 2y = 21\n4x + 3y = 30","body":"Solve the system:\n3x + 2y = 21\n4x + 3y = 30\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: solve-system","promptText":"Solve the system:\n3x + 2y = 21\n4x + 3y = 30\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: solve-system","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-06","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","solve-system","systems","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(5, 6)","(3, 9)","(1, 4)","(3, 6)"],"correctIndex":3}'::jsonb,
  '{"summary":"Use elimination or substitution to find the ordered pair that satisfies both equations.","strategy":"Eliminate one variable or solve one equation for a variable. Substitute into the other equation. The solution is (3, 6)."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"How many solutions does the system y = y = 4x + 5 and y = y = 4x + 7 have?","body":"How many solutions does the system y = y = 4x + 5 and y = y = 4x + 7 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: number-of-solutions","promptText":"How many solutions does the system y = y = 4x + 5 and y = y = 4x + 7 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: number-of-solutions","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-07","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","number-of-solutions","systems","parallel-lines"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["2","Infinitely many","0","1"],"correctIndex":2}'::jsonb,
  '{"summary":"Parallel lines with different intercepts never intersect.","strategy":"Both equations have the same slope. The y-intercepts are different. So the lines are parallel and have no solution."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A museum charges $7 for admission plus $5 per guide. If the total cost is $22 for 3 guides, which equation matches the situation?","body":"A museum charges $7 for admission plus $5 per guide. If the total cost is $22 for 3 guides, which equation matches the situation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-system","promptText":"A museum charges $7 for admission plus $5 per guide. If the total cost is $22 for 3 guides, which equation matches the situation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-system","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-08","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","context-system","systems","context"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["C = 12g","C = 7 + 5g","C = 7g + 5","C = 5 + 7g"],"correctIndex":1}'::jsonb,
  '{"summary":"Translate the context into an equation with a fixed fee and a per-guide rate.","strategy":"Let g represent the number of guides. Use the fixed fee as the constant term. Multiply the per-guide charge by g."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which ordered pair is a solution to the system x + y = 11 and 2x - y = -5?","body":"Which ordered pair is a solution to the system x + y = 11 and 2x - y = -5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: solution-check","promptText":"Which ordered pair is a solution to the system x + y = 11 and 2x - y = -5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: solution-check","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-09","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","solution-check","systems","check"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(2, 9)","(4, 9)","(2, 12)","(0, 7)"],"correctIndex":0}'::jsonb,
  '{"summary":"Substitute the ordered pair into both equations.","strategy":"Check the first equation. Check the second equation. Only one pair satisfies both equations."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Two lines intersect at the point (5, 4). What does that point represent?","body":"Two lines intersect at the point (5, 4). What does that point represent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: intersection-interpretation","promptText":"Two lines intersect at the point (5, 4). What does that point represent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: intersection-interpretation","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-10","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","intersection-interpretation","systems","intersection"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The y-intercepts of both lines","The slope of each line","The point where the lines are parallel","The solution to the system"],"correctIndex":3}'::jsonb,
  '{"summary":"The intersection of two lines is the one ordered pair that satisfies both equations.","strategy":"At the intersection, both equations have the same x- and y-values. That means the ordered pair solves the system. The point is not a slope or intercept."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Solve the system:\n4x + 3y = 37\n5x + 4y = 48","body":"Solve the system:\n4x + 3y = 37\n5x + 4y = 48\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: solve-system","promptText":"Solve the system:\n4x + 3y = 37\n5x + 4y = 48\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: solve-system","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-11","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","solve-system","systems","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(4, 11)","(1, 4)","(4, 7)","(7, 7)"],"correctIndex":2}'::jsonb,
  '{"summary":"Use elimination or substitution to find the ordered pair that satisfies both equations.","strategy":"Eliminate one variable or solve one equation for a variable. Substitute into the other equation. The solution is (4, 7)."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"How many solutions does the system y = y = 5x + 6 and y = y = 5x + 8 have?","body":"How many solutions does the system y = y = 5x + 6 and y = y = 5x + 8 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: number-of-solutions","promptText":"How many solutions does the system y = y = 5x + 6 and y = y = 5x + 8 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: number-of-solutions","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-12","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","number-of-solutions","systems","parallel-lines"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Infinitely many","0","1","2"],"correctIndex":1}'::jsonb,
  '{"summary":"Parallel lines with different intercepts never intersect.","strategy":"Both equations have the same slope. The y-intercepts are different. So the lines are parallel and have no solution."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A museum charges $8 for admission plus $6 per guide. If the total cost is $32 for 4 guides, which equation matches the situation?","body":"A museum charges $8 for admission plus $6 per guide. If the total cost is $32 for 4 guides, which equation matches the situation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-system","promptText":"A museum charges $8 for admission plus $6 per guide. If the total cost is $32 for 4 guides, which equation matches the situation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-system","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-13","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","context-system","systems","context"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["C = 8 + 6g","C = 8g + 6","C = 6 + 8g","C = 14g"],"correctIndex":0}'::jsonb,
  '{"summary":"Translate the context into an equation with a fixed fee and a per-guide rate.","strategy":"Let g represent the number of guides. Use the fixed fee as the constant term. Multiply the per-guide charge by g."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which ordered pair is a solution to the system x + y = 14 and 2x - y = -5?","body":"Which ordered pair is a solution to the system x + y = 14 and 2x - y = -5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: solution-check","promptText":"Which ordered pair is a solution to the system x + y = 14 and 2x - y = -5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: solution-check","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-14","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","solution-check","systems","check"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(6, 11)","(3, 15)","(0, 8)","(3, 11)"],"correctIndex":3}'::jsonb,
  '{"summary":"Substitute the ordered pair into both equations.","strategy":"Check the first equation. Check the second equation. Only one pair satisfies both equations."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Two lines intersect at the point (6, 5). What does that point represent?","body":"Two lines intersect at the point (6, 5). What does that point represent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: intersection-interpretation","promptText":"Two lines intersect at the point (6, 5). What does that point represent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: intersection-interpretation","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-15","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","intersection-interpretation","systems","intersection"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The slope of each line","The point where the lines are parallel","The solution to the system","The y-intercepts of both lines"],"correctIndex":2}'::jsonb,
  '{"summary":"The intersection of two lines is the one ordered pair that satisfies both equations.","strategy":"At the intersection, both equations have the same x- and y-values. That means the ordered pair solves the system. The point is not a slope or intercept."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Solve the system:\n5x + 4y = 57\n6x + 5y = 70","body":"Solve the system:\n5x + 4y = 57\n6x + 5y = 70\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: solve-system","promptText":"Solve the system:\n5x + 4y = 57\n6x + 5y = 70\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: solve-system","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-16","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","solve-system","systems","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(1, 4)","(5, 8)","(9, 8)","(5, 13)"],"correctIndex":1}'::jsonb,
  '{"summary":"Use elimination or substitution to find the ordered pair that satisfies both equations.","strategy":"Eliminate one variable or solve one equation for a variable. Substitute into the other equation. The solution is (5, 8)."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"How many solutions does the system y = y = 6x + 7 and y = y = 6x + 9 have?","body":"How many solutions does the system y = y = 6x + 7 and y = y = 6x + 9 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: number-of-solutions","promptText":"How many solutions does the system y = y = 6x + 7 and y = y = 6x + 9 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: number-of-solutions","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-17","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","number-of-solutions","systems","parallel-lines"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["0","1","2","Infinitely many"],"correctIndex":0}'::jsonb,
  '{"summary":"Parallel lines with different intercepts never intersect.","strategy":"Both equations have the same slope. The y-intercepts are different. So the lines are parallel and have no solution."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A museum charges $9 for admission plus $7 per guide. If the total cost is $44 for 5 guides, which equation matches the situation?","body":"A museum charges $9 for admission plus $7 per guide. If the total cost is $44 for 5 guides, which equation matches the situation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: context-system","promptText":"A museum charges $9 for admission plus $7 per guide. If the total cost is $44 for 5 guides, which equation matches the situation?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: context-system","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-18","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","context-system","systems","context"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["C = 9g + 7","C = 7 + 9g","C = 16g","C = 9 + 7g"],"correctIndex":3}'::jsonb,
  '{"summary":"Translate the context into an equation with a fixed fee and a per-guide rate.","strategy":"Let g represent the number of guides. Use the fixed fee as the constant term. Multiply the per-guide charge by g."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Which ordered pair is a solution to the system x + y = 17 and 2x - y = -5?","body":"Which ordered pair is a solution to the system x + y = 17 and 2x - y = -5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: solution-check","promptText":"Which ordered pair is a solution to the system x + y = 17 and 2x - y = -5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: solution-check","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-19","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","solution-check","systems","check"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(4, 18)","(0, 9)","(4, 13)","(8, 13)"],"correctIndex":2}'::jsonb,
  '{"summary":"Substitute the ordered pair into both equations.","strategy":"Check the first equation. Check the second equation. Only one pair satisfies both equations."}'::jsonb,
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
    and c.slug = 'systems-of-two-linear-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Two lines intersect at the point (7, 6). What does that point represent?","body":"Two lines intersect at the point (7, 6). What does that point represent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: intersection-interpretation","promptText":"Two lines intersect at the point (7, 6). What does that point represent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: intersection-interpretation","metadata":{"questionKey":"math-systems-of-two-linear-equations-in-two-variables-20","generationSource":"generated_from_research","tags":["math","algebra","systems-of-two-linear-equations-in-two-variables","intersection-interpretation","systems","intersection"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The point where the lines are parallel","The solution to the system","The y-intercepts of both lines","The slope of each line"],"correctIndex":1}'::jsonb,
  '{"summary":"The intersection of two lines is the one ordered pair that satisfies both equations.","strategy":"At the intersection, both equations have the same x- and y-values. That means the ordered pair solves the system. The point is not a slope or intercept."}'::jsonb,
  true,
  true,
  'published', now()
from taxonomy;

-- Continuation of initial question bank seed (part 11 of 20).
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Solve the inequality: 3x - 5 > 1.","body":"Solve the inequality: 3x - 5 > 1.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: single-inequality","promptText":"Solve the inequality: 3x - 5 > 1.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: single-inequality","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-01","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","single-inequality","inequalities","single"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["x > 2","x < 2","x >= 2","x = 2"],"correctIndex":0}'::jsonb,
  '{"summary":"Isolate x and keep the inequality direction unchanged because you divide by a positive number.","strategy":"Add the constant to both sides. Divide by the positive coefficient of x. The solution is x > 2."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which interval represents the solution to 2 < x + 1 <= 8?","body":"Which interval represents the solution to 2 < x + 1 <= 8?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: compound-inequality","promptText":"Which interval represents the solution to 2 < x + 1 <= 8?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: compound-inequality","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-02","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","compound-inequality","inequalities","compound"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["[1, 7]","(0, 7]","(1, 8]","(1, 7]"],"correctIndex":3}'::jsonb,
  '{"summary":"Subtract 1 from all three parts of the compound inequality.","strategy":"Subtract 1 from the left, middle, and right expressions. Keep the inequality directions the same. Write the interval notation carefully."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A club has $60 to spend on tickets that cost $8 each. What is the greatest whole number of tickets it can buy?","body":"A club has $60 to spend on tickets that cost $8 each. What is the greatest whole number of tickets it can buy?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: context-range","promptText":"A club has $60 to spend on tickets that cost $8 each. What is the greatest whole number of tickets it can buy?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: context-range","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-03","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","context-range","inequalities","word-problem"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6","52","7","8"],"correctIndex":2}'::jsonb,
  '{"summary":"Divide the budget by the ticket price and round down to the nearest whole ticket.","strategy":"Divide the budget by the ticket price. Keep only the whole-number count that does not exceed the budget. That is the greatest number of tickets."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which inequality matches the interval [-2, 5)?","body":"Which inequality matches the interval [-2, 5)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: graph-interval","promptText":"Which inequality matches the interval [-2, 5)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: graph-interval","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-04","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","graph-interval","inequalities","intervals"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["-2 < x < 5","-2 <= x < 5","-2 < x <= 5","-2 <= x <= 5"],"correctIndex":1}'::jsonb,
  '{"summary":"Match included endpoints with <= or >= and excluded endpoints with < or >.","strategy":"A square bracket means the endpoint is included. A parenthesis means the endpoint is excluded. Translate the interval into inequality notation."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Does the point (3, 2) satisfy the inequality y >= x - 1?","body":"Does the point (3, 2) satisfy the inequality y >= x - 1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: test-point","promptText":"Does the point (3, 2) satisfy the inequality y >= x - 1?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: test-point","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-05","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","test-point","inequalities","test-point"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Yes","No","Only if x is negative","Only if y is greater than x"],"correctIndex":0}'::jsonb,
  '{"summary":"Substitute the point and compare the two sides.","strategy":"Replace x with 3 and y with 2. Check whether the left side is at least as large as the right side. The point does or does not satisfy the inequality."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Solve the inequality: 4x - 7 > 5.","body":"Solve the inequality: 4x - 7 > 5.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: single-inequality","promptText":"Solve the inequality: 4x - 7 > 5.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: single-inequality","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-06","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","single-inequality","inequalities","single"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["x < 3","x >= 3","x = 3","x > 3"],"correctIndex":3}'::jsonb,
  '{"summary":"Isolate x and keep the inequality direction unchanged because you divide by a positive number.","strategy":"Add the constant to both sides. Divide by the positive coefficient of x. The solution is x > 3."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which interval represents the solution to 3 < x + 1 <= 10?","body":"Which interval represents the solution to 3 < x + 1 <= 10?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compound-inequality","promptText":"Which interval represents the solution to 3 < x + 1 <= 10?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compound-inequality","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-07","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","compound-inequality","inequalities","compound"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(1, 9]","(2, 10]","(2, 9]","[2, 9]"],"correctIndex":2}'::jsonb,
  '{"summary":"Subtract 1 from all three parts of the compound inequality.","strategy":"Subtract 1 from the left, middle, and right expressions. Keep the inequality directions the same. Write the interval notation carefully."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A club has $70 to spend on tickets that cost $9 each. What is the greatest whole number of tickets it can buy?","body":"A club has $70 to spend on tickets that cost $9 each. What is the greatest whole number of tickets it can buy?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-range","promptText":"A club has $70 to spend on tickets that cost $9 each. What is the greatest whole number of tickets it can buy?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-range","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-08","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","context-range","inequalities","word-problem"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["61","7","8","6"],"correctIndex":1}'::jsonb,
  '{"summary":"Divide the budget by the ticket price and round down to the nearest whole ticket.","strategy":"Divide the budget by the ticket price. Keep only the whole-number count that does not exceed the budget. That is the greatest number of tickets."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which inequality matches the interval [-3, 6)?","body":"Which inequality matches the interval [-3, 6)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: graph-interval","promptText":"Which inequality matches the interval [-3, 6)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: graph-interval","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-09","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","graph-interval","inequalities","intervals"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["-3 <= x < 6","-3 < x <= 6","-3 <= x <= 6","-3 < x < 6"],"correctIndex":0}'::jsonb,
  '{"summary":"Match included endpoints with <= or >= and excluded endpoints with < or >.","strategy":"A square bracket means the endpoint is included. A parenthesis means the endpoint is excluded. Translate the interval into inequality notation."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Does the point (4, 3) satisfy the inequality y >= x - 2?","body":"Does the point (4, 3) satisfy the inequality y >= x - 2?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: test-point","promptText":"Does the point (4, 3) satisfy the inequality y >= x - 2?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: test-point","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-10","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","test-point","inequalities","test-point"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["No","Only if x is negative","Only if y is greater than x","Yes"],"correctIndex":3}'::jsonb,
  '{"summary":"Substitute the point and compare the two sides.","strategy":"Replace x with 4 and y with 3. Check whether the left side is at least as large as the right side. The point does or does not satisfy the inequality."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Solve the inequality: 5x - 9 > 11.","body":"Solve the inequality: 5x - 9 > 11.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: single-inequality","promptText":"Solve the inequality: 5x - 9 > 11.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: single-inequality","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-11","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","single-inequality","inequalities","single"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["x >= 4","x = 4","x > 4","x < 4"],"correctIndex":2}'::jsonb,
  '{"summary":"Isolate x and keep the inequality direction unchanged because you divide by a positive number.","strategy":"Add the constant to both sides. Divide by the positive coefficient of x. The solution is x > 4."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which interval represents the solution to 4 < x + 1 <= 12?","body":"Which interval represents the solution to 4 < x + 1 <= 12?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compound-inequality","promptText":"Which interval represents the solution to 4 < x + 1 <= 12?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compound-inequality","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-12","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","compound-inequality","inequalities","compound"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(3, 12]","(3, 11]","[3, 11]","(2, 11]"],"correctIndex":1}'::jsonb,
  '{"summary":"Subtract 1 from all three parts of the compound inequality.","strategy":"Subtract 1 from the left, middle, and right expressions. Keep the inequality directions the same. Write the interval notation carefully."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A club has $80 to spend on tickets that cost $10 each. What is the greatest whole number of tickets it can buy?","body":"A club has $80 to spend on tickets that cost $10 each. What is the greatest whole number of tickets it can buy?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-range","promptText":"A club has $80 to spend on tickets that cost $10 each. What is the greatest whole number of tickets it can buy?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: context-range","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-13","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","context-range","inequalities","word-problem"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["8","8","7","70"],"correctIndex":0}'::jsonb,
  '{"summary":"Divide the budget by the ticket price and round down to the nearest whole ticket.","strategy":"Divide the budget by the ticket price. Keep only the whole-number count that does not exceed the budget. That is the greatest number of tickets."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which inequality matches the interval [-4, 7)?","body":"Which inequality matches the interval [-4, 7)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: graph-interval","promptText":"Which inequality matches the interval [-4, 7)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: graph-interval","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-14","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","graph-interval","inequalities","intervals"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["-4 < x <= 7","-4 <= x <= 7","-4 < x < 7","-4 <= x < 7"],"correctIndex":3}'::jsonb,
  '{"summary":"Match included endpoints with <= or >= and excluded endpoints with < or >.","strategy":"A square bracket means the endpoint is included. A parenthesis means the endpoint is excluded. Translate the interval into inequality notation."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Does the point (5, 4) satisfy the inequality y >= x - 3?","body":"Does the point (5, 4) satisfy the inequality y >= x - 3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: test-point","promptText":"Does the point (5, 4) satisfy the inequality y >= x - 3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: test-point","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-15","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","test-point","inequalities","test-point"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Only if x is negative","Only if y is greater than x","Yes","No"],"correctIndex":2}'::jsonb,
  '{"summary":"Substitute the point and compare the two sides.","strategy":"Replace x with 5 and y with 4. Check whether the left side is at least as large as the right side. The point does or does not satisfy the inequality."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Solve the inequality: 6x - 11 > 19.","body":"Solve the inequality: 6x - 11 > 19.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: single-inequality","promptText":"Solve the inequality: 6x - 11 > 19.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: single-inequality","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-16","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","single-inequality","inequalities","single"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["x = 5","x > 5","x < 5","x >= 5"],"correctIndex":1}'::jsonb,
  '{"summary":"Isolate x and keep the inequality direction unchanged because you divide by a positive number.","strategy":"Add the constant to both sides. Divide by the positive coefficient of x. The solution is x > 5."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Which interval represents the solution to 5 < x + 1 <= 14?","body":"Which interval represents the solution to 5 < x + 1 <= 14?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compound-inequality","promptText":"Which interval represents the solution to 5 < x + 1 <= 14?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compound-inequality","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-17","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","compound-inequality","inequalities","compound"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(4, 13]","[4, 13]","(3, 13]","(4, 14]"],"correctIndex":0}'::jsonb,
  '{"summary":"Subtract 1 from all three parts of the compound inequality.","strategy":"Subtract 1 from the left, middle, and right expressions. Keep the inequality directions the same. Write the interval notation carefully."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A club has $90 to spend on tickets that cost $11 each. What is the greatest whole number of tickets it can buy?","body":"A club has $90 to spend on tickets that cost $11 each. What is the greatest whole number of tickets it can buy?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: context-range","promptText":"A club has $90 to spend on tickets that cost $11 each. What is the greatest whole number of tickets it can buy?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: context-range","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-18","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","context-range","inequalities","word-problem"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["9","7","79","8"],"correctIndex":3}'::jsonb,
  '{"summary":"Divide the budget by the ticket price and round down to the nearest whole ticket.","strategy":"Divide the budget by the ticket price. Keep only the whole-number count that does not exceed the budget. That is the greatest number of tickets."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Which inequality matches the interval [-5, 8)?","body":"Which inequality matches the interval [-5, 8)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: graph-interval","promptText":"Which inequality matches the interval [-5, 8)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: graph-interval","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-19","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","graph-interval","inequalities","intervals"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["-5 <= x <= 8","-5 < x < 8","-5 <= x < 8","-5 < x <= 8"],"correctIndex":2}'::jsonb,
  '{"summary":"Match included endpoints with <= or >= and excluded endpoints with < or >.","strategy":"A square bracket means the endpoint is included. A parenthesis means the endpoint is excluded. Translate the interval into inequality notation."}'::jsonb,
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
    and c.slug = 'linear-inequalities-in-one-or-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Does the point (6, 5) satisfy the inequality y >= x - 4?","body":"Does the point (6, 5) satisfy the inequality y >= x - 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: test-point","promptText":"Does the point (6, 5) satisfy the inequality y >= x - 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: test-point","metadata":{"questionKey":"math-linear-inequalities-in-one-or-two-variables-20","generationSource":"generated_from_research","tags":["math","algebra","linear-inequalities-in-one-or-two-variables","test-point","inequalities","test-point"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Only if y is greater than x","Yes","No","Only if x is negative"],"correctIndex":1}'::jsonb,
  '{"summary":"Substitute the point and compare the two sides.","strategy":"Replace x with 6 and y with 5. Check whether the left side is at least as large as the right side. The point does or does not satisfy the inequality."}'::jsonb,
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
    and c.slug = 'equivalent-expressions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 3(2x + 5)?","body":"Which expression is equivalent to 3(2x + 5)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: expand","promptText":"Which expression is equivalent to 3(2x + 5)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: expand","metadata":{"questionKey":"math-equivalent-expressions-01","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","expand","expand","distributive-property"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6x + 15","5x + 15","6x + 5","11x"],"correctIndex":0}'::jsonb,
  '{"summary":"Distribute the factor across both terms inside the parentheses.","strategy":"Multiply the outside factor by each term inside the parentheses. Combine like terms if needed. Write the expanded expression."}'::jsonb,
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
    and c.slug = 'equivalent-expressions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 6x + 9?","body":"Which expression is equivalent to 6x + 9?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: factor","promptText":"Which expression is equivalent to 6x + 9?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: factor","metadata":{"questionKey":"math-equivalent-expressions-02","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","factor","factor","gcf"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6(x + 3)","15x","3(2x + 4)","3(2x + 3)"],"correctIndex":3}'::jsonb,
  '{"summary":"Factor out the greatest common factor.","strategy":"Identify the greatest common factor of the terms. Write the expression as a product. Check by distributing back."}'::jsonb,
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
    and c.slug = 'equivalent-expressions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 12x / 3x?","body":"Which expression is equivalent to 12x / 3x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: rational-simplify","promptText":"Which expression is equivalent to 12x / 3x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: rational-simplify","metadata":{"questionKey":"math-equivalent-expressions-03","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","rational-simplify","rational-expressions","simplify"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["0.25","3x","4","5"],"correctIndex":2}'::jsonb,
  '{"summary":"Cancel the common factor of x and reduce the coefficient fraction.","strategy":"Cancel x from numerator and denominator. Reduce the numerical fraction. Write the simplified value."}'::jsonb,
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
    and c.slug = 'equivalent-expressions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which expression is equivalent to (2)^3?","body":"Which expression is equivalent to (2)^3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: exponent-rules","promptText":"Which expression is equivalent to (2)^3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: exponent-rules","metadata":{"questionKey":"math-equivalent-expressions-04","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","exponent-rules","exponents","powers"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5","8","6","4"],"correctIndex":1}'::jsonb,
  '{"summary":"A power means repeated multiplication, not multiplication by the exponent.","strategy":"Compute 2 times 2 times 2. Do not confuse powers with multiplication by the exponent. Write the final value."}'::jsonb,
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
    and c.slug = 'equivalent-expressions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 3 + 3 + 4?","body":"Which expression is equivalent to 3 + 3 + 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: combine-like-terms","promptText":"Which expression is equivalent to 3 + 3 + 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: combine-like-terms","metadata":{"questionKey":"math-equivalent-expressions-05","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","combine-like-terms","like-terms","simplify"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["10","7","13","6"],"correctIndex":0}'::jsonb,
  '{"summary":"Combine like terms before simplifying the constants.","strategy":"Add the two x terms together. Keep the constant 4. Write the simplified expression."}'::jsonb,
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
    and c.slug = 'equivalent-expressions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 4(3x + 6)?","body":"Which expression is equivalent to 4(3x + 6)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: expand","promptText":"Which expression is equivalent to 4(3x + 6)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: expand","metadata":{"questionKey":"math-equivalent-expressions-06","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","expand","expand","distributive-property"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7x + 24","12x + 6","18x","12x + 24"],"correctIndex":3}'::jsonb,
  '{"summary":"Distribute the factor across both terms inside the parentheses.","strategy":"Multiply the outside factor by each term inside the parentheses. Combine like terms if needed. Write the expanded expression."}'::jsonb,
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
    and c.slug = 'equivalent-expressions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 8x + 12?","body":"Which expression is equivalent to 8x + 12?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: factor","promptText":"Which expression is equivalent to 8x + 12?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: factor","metadata":{"questionKey":"math-equivalent-expressions-07","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","factor","factor","gcf"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["20x","4(2x + 4)","4(2x + 3)","8(x + 3)"],"correctIndex":2}'::jsonb,
  '{"summary":"Factor out the greatest common factor.","strategy":"Identify the greatest common factor of the terms. Write the expression as a product. Check by distributing back."}'::jsonb,
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
    and c.slug = 'equivalent-expressions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 20x / 4x?","body":"Which expression is equivalent to 20x / 4x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: rational-simplify","promptText":"Which expression is equivalent to 20x / 4x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: rational-simplify","metadata":{"questionKey":"math-equivalent-expressions-08","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","rational-simplify","rational-expressions","simplify"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["4x","5","6","0.2"],"correctIndex":1}'::jsonb,
  '{"summary":"Cancel the common factor of x and reduce the coefficient fraction.","strategy":"Cancel x from numerator and denominator. Reduce the numerical fraction. Write the simplified value."}'::jsonb,
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
    and c.slug = 'equivalent-expressions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which expression is equivalent to (3)^3?","body":"Which expression is equivalent to (3)^3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: exponent-rules","promptText":"Which expression is equivalent to (3)^3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: exponent-rules","metadata":{"questionKey":"math-equivalent-expressions-09","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","exponent-rules","exponents","powers"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["27","9","9","6"],"correctIndex":0}'::jsonb,
  '{"summary":"A power means repeated multiplication, not multiplication by the exponent.","strategy":"Compute 3 times 3 times 3. Do not confuse powers with multiplication by the exponent. Write the final value."}'::jsonb,
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
    and c.slug = 'equivalent-expressions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 4 + 4 + 4?","body":"Which expression is equivalent to 4 + 4 + 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: combine-like-terms","promptText":"Which expression is equivalent to 4 + 4 + 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: combine-like-terms","metadata":{"questionKey":"math-equivalent-expressions-10","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","combine-like-terms","like-terms","simplify"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["8","16","8","12"],"correctIndex":3}'::jsonb,
  '{"summary":"Combine like terms before simplifying the constants.","strategy":"Add the two x terms together. Keep the constant 4. Write the simplified expression."}'::jsonb,
  true,
  false,
  'published', now()
from taxonomy;

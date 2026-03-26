-- Continuation of initial question bank seed (part 12 of 20).
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
  '{"stem":"Which expression is equivalent to 5(4x + 7)?","body":"Which expression is equivalent to 5(4x + 7)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: expand","promptText":"Which expression is equivalent to 5(4x + 7)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: expand","metadata":{"questionKey":"math-equivalent-expressions-11","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","expand","expand","distributive-property"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["20x + 7","27x","20x + 35","9x + 35"],"correctIndex":2}'::jsonb,
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
  '{"stem":"Which expression is equivalent to 10x + 15?","body":"Which expression is equivalent to 10x + 15?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: factor","promptText":"Which expression is equivalent to 10x + 15?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: factor","metadata":{"questionKey":"math-equivalent-expressions-12","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","factor","factor","gcf"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5(2x + 4)","5(2x + 3)","10(x + 3)","25x"],"correctIndex":1}'::jsonb,
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
  '{"stem":"Which expression is equivalent to 30x / 5x?","body":"Which expression is equivalent to 30x / 5x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: rational-simplify","promptText":"Which expression is equivalent to 30x / 5x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: rational-simplify","metadata":{"questionKey":"math-equivalent-expressions-13","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","rational-simplify","rational-expressions","simplify"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6","7","0.16666666666666666","5x"],"correctIndex":0}'::jsonb,
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
  '{"stem":"Which expression is equivalent to (4)^3?","body":"Which expression is equivalent to (4)^3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: exponent-rules","promptText":"Which expression is equivalent to (4)^3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: exponent-rules","metadata":{"questionKey":"math-equivalent-expressions-14","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","exponent-rules","exponents","powers"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12","16","7","64"],"correctIndex":3}'::jsonb,
  '{"summary":"A power means repeated multiplication, not multiplication by the exponent.","strategy":"Compute 4 times 4 times 4. Do not confuse powers with multiplication by the exponent. Write the final value."}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 5 + 5 + 4?","body":"Which expression is equivalent to 5 + 5 + 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: combine-like-terms","promptText":"Which expression is equivalent to 5 + 5 + 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: combine-like-terms","metadata":{"questionKey":"math-equivalent-expressions-15","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","combine-like-terms","like-terms","simplify"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["19","10","14","9"],"correctIndex":2}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 6(5x + 8)?","body":"Which expression is equivalent to 6(5x + 8)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: expand","promptText":"Which expression is equivalent to 6(5x + 8)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: expand","metadata":{"questionKey":"math-equivalent-expressions-16","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","expand","expand","distributive-property"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["38x","30x + 48","11x + 48","30x + 8"],"correctIndex":1}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 12x + 18?","body":"Which expression is equivalent to 12x + 18?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: factor","promptText":"Which expression is equivalent to 12x + 18?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: factor","metadata":{"questionKey":"math-equivalent-expressions-17","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","factor","factor","gcf"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6(2x + 3)","12(x + 3)","30x","6(2x + 4)"],"correctIndex":0}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 42x / 6x?","body":"Which expression is equivalent to 42x / 6x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: rational-simplify","promptText":"Which expression is equivalent to 42x / 6x?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: rational-simplify","metadata":{"questionKey":"math-equivalent-expressions-18","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","rational-simplify","rational-expressions","simplify"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["8","0.14285714285714285","6x","7"],"correctIndex":3}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"Which expression is equivalent to (5)^3?","body":"Which expression is equivalent to (5)^3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: exponent-rules","promptText":"Which expression is equivalent to (5)^3?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: exponent-rules","metadata":{"questionKey":"math-equivalent-expressions-19","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","exponent-rules","exponents","powers"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["25","8","125","15"],"correctIndex":2}'::jsonb,
  '{"summary":"A power means repeated multiplication, not multiplication by the exponent.","strategy":"Compute 5 times 5 times 5. Do not confuse powers with multiplication by the exponent. Write the final value."}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"Which expression is equivalent to 6 + 6 + 4?","body":"Which expression is equivalent to 6 + 6 + 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: combine-like-terms","promptText":"Which expression is equivalent to 6 + 6 + 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: combine-like-terms","metadata":{"questionKey":"math-equivalent-expressions-20","generationSource":"generated_from_research","tags":["math","advanced-math","equivalent-expressions","combine-like-terms","like-terms","simplify"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12","16","10","22"],"correctIndex":1}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Which value is a solution to x^2 + 1x - 6 = 0?","body":"Which value is a solution to x^2 + 1x - 6 = 0?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: quadratic-roots","promptText":"Which value is a solution to x^2 + 1x - 6 = 0?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: quadratic-roots","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-01","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","quadratic-roots","quadratic","roots"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["2","-3","3","3"],"correctIndex":0}'::jsonb,
  '{"summary":"Factor the quadratic or test the roots.","strategy":"Look for factors of the constant term. Check which value makes the equation true. Use the root that satisfies the equation."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Solve for x: sqrt(x + 1) = 3.","body":"Solve for x: sqrt(x + 1) = 3.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: radical-equation","promptText":"Solve for x: sqrt(x + 1) = 3.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: radical-equation","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-02","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","radical-equation","radical","extraneous"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["16","5","17","15"],"correctIndex":3}'::jsonb,
  '{"summary":"Square both sides and then check for extraneous solutions.","strategy":"Square both sides to remove the radical. Solve the resulting equation. Check whether the solution works in the original equation."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"How many solutions does |x - 3| = 2 have?","body":"How many solutions does |x - 3| = 2 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: absolute-value","promptText":"How many solutions does |x - 3| = 2 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: absolute-value","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-03","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","absolute-value","absolute-value","solutions"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1","Infinitely many","2","0"],"correctIndex":2}'::jsonb,
  '{"summary":"An absolute value equation with a positive right side usually has two solutions.","strategy":"Set the inside equal to the positive and negative values. Solve each equation. Count the valid solutions."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"The system y = x^2 and y = x + 1 has how many solutions?","body":"The system y = x^2 and y = x + 1 has how many solutions?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: linear-quadratic-system","promptText":"The system y = x^2 and y = x + 1 has how many solutions?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: linear-quadratic-system","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-04","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","linear-quadratic-system","system","quadratic"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["3","2","0","2"],"correctIndex":1}'::jsonb,
  '{"summary":"A line that crosses a parabola in two places gives two solutions.","strategy":"Set the equations equal to each other. Solve the resulting quadratic. Count the real intersection points."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A parabola has a minimum point at y = -2. A horizontal line with equation y = -4 is graphed on the same plane. How many intersection points are there?","body":"A parabola has a minimum point at y = -2. A horizontal line with equation y = -4 is graphed on the same plane. How many intersection points are there?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: intersection-count","promptText":"A parabola has a minimum point at y = -2. A horizontal line with equation y = -4 is graphed on the same plane. How many intersection points are there?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: intersection-count","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-05","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","intersection-count","intersection-count","graphs"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["0","1","2","Infinitely many"],"correctIndex":0}'::jsonb,
  '{"summary":"If the line stays below the parabola''s lowest point, the graphs do not intersect.","strategy":"Look at the parabola''s minimum point. Compare the line''s height to that minimum. No intersection points means zero solutions."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which value is a solution to x^2 + 2x - 12 = 0?","body":"Which value is a solution to x^2 + 2x - 12 = 0?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: quadratic-roots","promptText":"Which value is a solution to x^2 + 2x - 12 = 0?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: quadratic-roots","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-06","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","quadratic-roots","quadratic","roots"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["-4","4","4","3"],"correctIndex":3}'::jsonb,
  '{"summary":"Factor the quadratic or test the roots.","strategy":"Look for factors of the constant term. Check which value makes the equation true. Use the root that satisfies the equation."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Solve for x: sqrt(x + 2) = 4.","body":"Solve for x: sqrt(x + 2) = 4.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: radical-equation","promptText":"Solve for x: sqrt(x + 2) = 4.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: radical-equation","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-07","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","radical-equation","radical","extraneous"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6","26","23","25"],"correctIndex":2}'::jsonb,
  '{"summary":"Square both sides and then check for extraneous solutions.","strategy":"Square both sides to remove the radical. Solve the resulting equation. Check whether the solution works in the original equation."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"How many solutions does |x - 4| = 3 have?","body":"How many solutions does |x - 4| = 3 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: absolute-value","promptText":"How many solutions does |x - 4| = 3 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: absolute-value","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-08","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","absolute-value","absolute-value","solutions"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Infinitely many","2","0","1"],"correctIndex":1}'::jsonb,
  '{"summary":"An absolute value equation with a positive right side usually has two solutions.","strategy":"Set the inside equal to the positive and negative values. Solve each equation. Count the valid solutions."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"The system y = x^2 and y = x + 2 has how many solutions?","body":"The system y = x^2 and y = x + 2 has how many solutions?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: linear-quadratic-system","promptText":"The system y = x^2 and y = x + 2 has how many solutions?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: linear-quadratic-system","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-09","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","linear-quadratic-system","system","quadratic"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["2","0","2","3"],"correctIndex":0}'::jsonb,
  '{"summary":"A line that crosses a parabola in two places gives two solutions.","strategy":"Set the equations equal to each other. Solve the resulting quadratic. Count the real intersection points."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A parabola has a minimum point at y = -3. A horizontal line with equation y = -6 is graphed on the same plane. How many intersection points are there?","body":"A parabola has a minimum point at y = -3. A horizontal line with equation y = -6 is graphed on the same plane. How many intersection points are there?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: intersection-count","promptText":"A parabola has a minimum point at y = -3. A horizontal line with equation y = -6 is graphed on the same plane. How many intersection points are there?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: intersection-count","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-10","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","intersection-count","intersection-count","graphs"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1","2","Infinitely many","0"],"correctIndex":3}'::jsonb,
  '{"summary":"If the line stays below the parabola''s lowest point, the graphs do not intersect.","strategy":"Look at the parabola''s minimum point. Compare the line''s height to that minimum. No intersection points means zero solutions."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which value is a solution to x^2 + 3x - 20 = 0?","body":"Which value is a solution to x^2 + 3x - 20 = 0?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: quadratic-roots","promptText":"Which value is a solution to x^2 + 3x - 20 = 0?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: quadratic-roots","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-11","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","quadratic-roots","quadratic","roots"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5","5","4","-5"],"correctIndex":2}'::jsonb,
  '{"summary":"Factor the quadratic or test the roots.","strategy":"Look for factors of the constant term. Check which value makes the equation true. Use the root that satisfies the equation."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Solve for x: sqrt(x + 3) = 5.","body":"Solve for x: sqrt(x + 3) = 5.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: radical-equation","promptText":"Solve for x: sqrt(x + 3) = 5.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: radical-equation","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-12","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","radical-equation","radical","extraneous"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["37","33","36","7"],"correctIndex":1}'::jsonb,
  '{"summary":"Square both sides and then check for extraneous solutions.","strategy":"Square both sides to remove the radical. Solve the resulting equation. Check whether the solution works in the original equation."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"How many solutions does |x - 5| = 4 have?","body":"How many solutions does |x - 5| = 4 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: absolute-value","promptText":"How many solutions does |x - 5| = 4 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: absolute-value","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-13","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","absolute-value","absolute-value","solutions"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["2","0","1","Infinitely many"],"correctIndex":0}'::jsonb,
  '{"summary":"An absolute value equation with a positive right side usually has two solutions.","strategy":"Set the inside equal to the positive and negative values. Solve each equation. Count the valid solutions."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"The system y = x^2 and y = x + 3 has how many solutions?","body":"The system y = x^2 and y = x + 3 has how many solutions?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: linear-quadratic-system","promptText":"The system y = x^2 and y = x + 3 has how many solutions?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: linear-quadratic-system","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-14","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","linear-quadratic-system","system","quadratic"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["0","2","3","2"],"correctIndex":1}'::jsonb,
  '{"summary":"A line that crosses a parabola in two places gives two solutions.","strategy":"Set the equations equal to each other. Solve the resulting quadratic. Count the real intersection points."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A parabola has a minimum point at y = -4. A horizontal line with equation y = -8 is graphed on the same plane. How many intersection points are there?","body":"A parabola has a minimum point at y = -4. A horizontal line with equation y = -8 is graphed on the same plane. How many intersection points are there?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: intersection-count","promptText":"A parabola has a minimum point at y = -4. A horizontal line with equation y = -8 is graphed on the same plane. How many intersection points are there?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: intersection-count","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-15","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","intersection-count","intersection-count","graphs"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["2","Infinitely many","0","1"],"correctIndex":2}'::jsonb,
  '{"summary":"If the line stays below the parabola''s lowest point, the graphs do not intersect.","strategy":"Look at the parabola''s minimum point. Compare the line''s height to that minimum. No intersection points means zero solutions."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Which value is a solution to x^2 + 4x - 30 = 0?","body":"Which value is a solution to x^2 + 4x - 30 = 0?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: quadratic-roots","promptText":"Which value is a solution to x^2 + 4x - 30 = 0?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: quadratic-roots","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-16","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","quadratic-roots","quadratic","roots"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6","5","-6","6"],"correctIndex":1}'::jsonb,
  '{"summary":"Factor the quadratic or test the roots.","strategy":"Look for factors of the constant term. Check which value makes the equation true. Use the root that satisfies the equation."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Solve for x: sqrt(x + 4) = 6.","body":"Solve for x: sqrt(x + 4) = 6.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: radical-equation","promptText":"Solve for x: sqrt(x + 4) = 6.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: radical-equation","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-17","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","radical-equation","radical","extraneous"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["45","49","8","50"],"correctIndex":0}'::jsonb,
  '{"summary":"Square both sides and then check for extraneous solutions.","strategy":"Square both sides to remove the radical. Solve the resulting equation. Check whether the solution works in the original equation."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"How many solutions does |x - 6| = 5 have?","body":"How many solutions does |x - 6| = 5 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: absolute-value","promptText":"How many solutions does |x - 6| = 5 have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: absolute-value","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-18","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","absolute-value","absolute-value","solutions"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["0","1","Infinitely many","2"],"correctIndex":3}'::jsonb,
  '{"summary":"An absolute value equation with a positive right side usually has two solutions.","strategy":"Set the inside equal to the positive and negative values. Solve each equation. Count the valid solutions."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"The system y = x^2 and y = x + 4 has how many solutions?","body":"The system y = x^2 and y = x + 4 has how many solutions?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: linear-quadratic-system","promptText":"The system y = x^2 and y = x + 4 has how many solutions?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: linear-quadratic-system","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-19","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","linear-quadratic-system","system","quadratic"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["2","3","2","0"],"correctIndex":0}'::jsonb,
  '{"summary":"A line that crosses a parabola in two places gives two solutions.","strategy":"Set the equations equal to each other. Solve the resulting quadratic. Count the real intersection points."}'::jsonb,
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
    and c.slug = 'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A parabola has a minimum point at y = -5. A horizontal line with equation y = -10 is graphed on the same plane. How many intersection points are there?","body":"A parabola has a minimum point at y = -5. A horizontal line with equation y = -10 is graphed on the same plane. How many intersection points are there?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: intersection-count","promptText":"A parabola has a minimum point at y = -5. A horizontal line with equation y = -10 is graphed on the same plane. How many intersection points are there?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: intersection-count","metadata":{"questionKey":"math-nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables-20","generationSource":"generated_from_research","tags":["math","advanced-math","nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables","intersection-count","intersection-count","graphs"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Infinitely many","0","1","2"],"correctIndex":1}'::jsonb,
  '{"summary":"If the line stays below the parabola''s lowest point, the graphs do not intersect.","strategy":"Look at the parabola''s minimum point. Compare the line''s height to that minimum. No intersection points means zero solutions."}'::jsonb,
  true,
  true,
  'published', now()
from taxonomy;

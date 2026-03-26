-- Continuation of initial question bank seed (part 14 of 20).
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
  '{"stem":"A car travels 160 miles in 5 hours. What is its unit rate in miles per hour?","body":"A car travels 160 miles in 5 hours. What is its unit rate in miles per hour?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: unit-rate","promptText":"A car travels 160 miles in 5 hours. What is its unit rate in miles per hour?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: unit-rate","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-11","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","unit-rate","rate","unit-rate"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["28","37","32","35"],"correctIndex":2}'::jsonb,
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
  '{"stem":"A recipe uses a ratio of 4:5 cups of flour to cups of sugar. If the sugar amount is 14 cups, how many cups of flour are needed?","body":"A recipe uses a ratio of 4:5 cups of flour to cups of sugar. If the sugar amount is 14 cups, how many cups of flour are needed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: ratio-scale","promptText":"A recipe uses a ratio of 4:5 cups of flour to cups of sugar. If the sugar amount is 14 cups, how many cups of flour are needed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: ratio-scale","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-12","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","ratio-scale","ratio","proportion"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7.199999999999999","11.2","14","15.2"],"correctIndex":1}'::jsonb,
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
  '{"stem":"How many miles is 10 kilometers? Use 1 kilometer = 1.6 miles.","body":"How many miles is 10 kilometers? Use 1 kilometer = 1.6 miles.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: unit-conversion","promptText":"How many miles is 10 kilometers? Use 1 kilometer = 1.6 miles.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: unit-conversion","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-13","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","unit-conversion","units","conversion"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["16","6.25","17","15"],"correctIndex":0}'::jsonb,
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
  '{"stem":"If 3 bicycles have 6 wheels, how many wheels do 5 bicycles have?","body":"If 3 bicycles have 6 wheels, how many wheels do 5 bicycles have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: proportional-relationship","promptText":"If 3 bicycles have 6 wheels, how many wheels do 5 bicycles have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: proportional-relationship","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-14","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","proportional-relationship","proportional","ratio"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12","8","11","10"],"correctIndex":3}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"A runner travels at 40 miles per hour for 4 hours. How far does the runner go?","body":"A runner travels at 40 miles per hour for 4 hours. How far does the runner go?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compound-rate","promptText":"A runner travels at 40 miles per hour for 4 hours. How far does the runner go?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compound-rate","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-15","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","compound-rate","rate","distance"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["120","40","160","200"],"correctIndex":2}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"A car travels 180 miles in 6 hours. What is its unit rate in miles per hour?","body":"A car travels 180 miles in 6 hours. What is its unit rate in miles per hour?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: unit-rate","promptText":"A car travels 180 miles in 6 hours. What is its unit rate in miles per hour?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: unit-rate","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-16","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","unit-rate","rate","unit-rate"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["36","30","34","25"],"correctIndex":1}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"A recipe uses a ratio of 5:6 cups of flour to cups of sugar. If the sugar amount is 16 cups, how many cups of flour are needed?","body":"A recipe uses a ratio of 5:6 cups of flour to cups of sugar. If the sugar amount is 16 cups, how many cups of flour are needed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: ratio-scale","promptText":"A recipe uses a ratio of 5:6 cups of flour to cups of sugar. If the sugar amount is 16 cups, how many cups of flour are needed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: ratio-scale","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-17","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","ratio-scale","ratio","proportion"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["13.333333333333334","16","18.333333333333336","8.333333333333334"],"correctIndex":0}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"How many miles is 11 kilometers? Use 1 kilometer = 1.6 miles.","body":"How many miles is 11 kilometers? Use 1 kilometer = 1.6 miles.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: unit-conversion","promptText":"How many miles is 11 kilometers? Use 1 kilometer = 1.6 miles.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: unit-conversion","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-18","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","unit-conversion","units","conversion"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6.88","18.6","16.6","17.6"],"correctIndex":3}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"If 3 bicycles have 6 wheels, how many wheels do 6 bicycles have?","body":"If 3 bicycles have 6 wheels, how many wheels do 6 bicycles have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: proportional-relationship","promptText":"If 3 bicycles have 6 wheels, how many wheels do 6 bicycles have?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: proportional-relationship","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-19","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","proportional-relationship","proportional","ratio"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["10","12","12","14"],"correctIndex":1}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"A runner travels at 45 miles per hour for 5 hours. How far does the runner go?","body":"A runner travels at 45 miles per hour for 5 hours. How far does the runner go?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compound-rate","promptText":"A runner travels at 45 miles per hour for 5 hours. How far does the runner go?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compound-rate","metadata":{"questionKey":"math-ratios-rates-proportional-relationships-and-units-20","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","ratios-rates-proportional-relationships-and-units","compound-rate","rate","distance"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["45","225","270","180"],"correctIndex":1}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A price increases from $80 by 10%. What is the new price?","body":"A price increases from $80 by 10%. What is the new price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: percent-change","promptText":"A price increases from $80 by 10%. What is the new price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: percent-change","metadata":{"questionKey":"math-percentages-01","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","percent-change","percent","change"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$88","$90","$70","$8"],"correctIndex":0}'::jsonb,
  '{"summary":"Increase the original price by the percent of the original, not the percent of the new price.","strategy":"Find the increase amount. Add it to the original price. Write the new price."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A jacket costs $50 and is discounted by 20%. What is the sale price?","body":"A jacket costs $50 and is discounted by 20%. What is the sale price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: discount","promptText":"A jacket costs $50 and is discounted by 20%. What is the sale price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: discount","metadata":{"questionKey":"math-percentages-02","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","discount","percent","discount"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$30","$70","$10","$40"],"correctIndex":3}'::jsonb,
  '{"summary":"Subtract the discount amount from the original price.","strategy":"Find the discount as a percent of the original price. Subtract the discount from the original. The remainder is the sale price."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A number is 80% of an original value and equals $72. What was the original value?","body":"A number is 80% of an original value and equals $72. What was the original value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: reverse-percent","promptText":"A number is 80% of an original value and equals $72. What was the original value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: reverse-percent","metadata":{"questionKey":"math-percentages-03","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","reverse-percent","percent","reverse"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$80","$100","$90","$57.6"],"correctIndex":2}'::jsonb,
  '{"summary":"Divide the part by the percent written as a decimal.","strategy":"Convert the percent to a decimal. Divide the part by that decimal. The quotient is the original value."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A value of $100 increases by 10% two times in a row. What is the final value?","body":"A value of $100 increases by 10% two times in a row. What is the final value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: repeated-change","promptText":"A value of $100 increases by 10% two times in a row. What is the final value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: repeated-change","metadata":{"questionKey":"math-percentages-04","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","repeated-change","percent","repeated-change"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$90","$121","$120","$120"],"correctIndex":1}'::jsonb,
  '{"summary":"Apply the percent change twice, using the new value after each step.","strategy":"Multiply by 1 + the percent as a decimal. Use the new value for the second increase. Write the final amount."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"What is 15% of $200?","body":"What is 15% of $200?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: percent-of-amount","promptText":"What is 15% of $200?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: percent-of-amount","metadata":{"questionKey":"math-percentages-05","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","percent-of-amount","percent","of"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$30","$170","$35","$25"],"correctIndex":0}'::jsonb,
  '{"summary":"Multiply the amount by the percent written as a decimal.","strategy":"Convert the percent to a decimal. Multiply by the base amount. Write the part."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A price increases from $90 by 15%. What is the new price?","body":"A price increases from $90 by 15%. What is the new price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: percent-change","promptText":"A price increases from $90 by 15%. What is the new price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: percent-change","metadata":{"questionKey":"math-percentages-06","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","percent-change","percent","change"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$105","$75","$13.5","$103.5"],"correctIndex":3}'::jsonb,
  '{"summary":"Increase the original price by the percent of the original, not the percent of the new price.","strategy":"Find the increase amount. Add it to the original price. Write the new price."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A jacket costs $60 and is discounted by 25%. What is the sale price?","body":"A jacket costs $60 and is discounted by 25%. What is the sale price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: discount","promptText":"A jacket costs $60 and is discounted by 25%. What is the sale price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: discount","metadata":{"questionKey":"math-percentages-07","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","discount","percent","discount"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$85","$15","$45","$35"],"correctIndex":2}'::jsonb,
  '{"summary":"Subtract the discount amount from the original price.","strategy":"Find the discount as a percent of the original price. Subtract the discount from the original. The remainder is the sale price."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A number is 75% of an original value and equals $80. What was the original value?","body":"A number is 75% of an original value and equals $80. What was the original value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: reverse-percent","promptText":"A number is 75% of an original value and equals $80. What was the original value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: reverse-percent","metadata":{"questionKey":"math-percentages-08","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","reverse-percent","percent","reverse"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$116.67","$106.67","$60","$96.67"],"correctIndex":1}'::jsonb,
  '{"summary":"Divide the part by the percent written as a decimal.","strategy":"Convert the percent to a decimal. Divide the part by that decimal. The quotient is the original value."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A value of $100 increases by 12% two times in a row. What is the final value?","body":"A value of $100 increases by 12% two times in a row. What is the final value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: repeated-change","promptText":"A value of $100 increases by 12% two times in a row. What is the final value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: repeated-change","metadata":{"questionKey":"math-percentages-09","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","repeated-change","percent","repeated-change"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$125.44","$124","$124","$88"],"correctIndex":0}'::jsonb,
  '{"summary":"Apply the percent change twice, using the new value after each step.","strategy":"Multiply by 1 + the percent as a decimal. Use the new value for the second increase. Write the final amount."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"What is 20% of $250?","body":"What is 20% of $250?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: percent-of-amount","promptText":"What is 20% of $250?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: percent-of-amount","metadata":{"questionKey":"math-percentages-10","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","percent-of-amount","percent","of"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$200","$55","$45","$50"],"correctIndex":3}'::jsonb,
  '{"summary":"Multiply the amount by the percent written as a decimal.","strategy":"Convert the percent to a decimal. Multiply by the base amount. Write the part."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A price increases from $100 by 20%. What is the new price?","body":"A price increases from $100 by 20%. What is the new price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: percent-change","promptText":"A price increases from $100 by 20%. What is the new price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: percent-change","metadata":{"questionKey":"math-percentages-11","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","percent-change","percent","change"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$80","$20","$120","$120"],"correctIndex":2}'::jsonb,
  '{"summary":"Increase the original price by the percent of the original, not the percent of the new price.","strategy":"Find the increase amount. Add it to the original price. Write the new price."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A jacket costs $70 and is discounted by 30%. What is the sale price?","body":"A jacket costs $70 and is discounted by 30%. What is the sale price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: discount","promptText":"A jacket costs $70 and is discounted by 30%. What is the sale price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: discount","metadata":{"questionKey":"math-percentages-12","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","discount","percent","discount"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$21","$49","$40","$100"],"correctIndex":1}'::jsonb,
  '{"summary":"Subtract the discount amount from the original price.","strategy":"Find the discount as a percent of the original price. Subtract the discount from the original. The remainder is the sale price."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A number is 70% of an original value and equals $88. What was the original value?","body":"A number is 70% of an original value and equals $88. What was the original value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: reverse-percent","promptText":"A number is 70% of an original value and equals $88. What was the original value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: reverse-percent","metadata":{"questionKey":"math-percentages-13","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","reverse-percent","percent","reverse"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$125.71","$61.6","$115.71","$135.71"],"correctIndex":0}'::jsonb,
  '{"summary":"Divide the part by the percent written as a decimal.","strategy":"Convert the percent to a decimal. Divide the part by that decimal. The quotient is the original value."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A value of $100 increases by 14% two times in a row. What is the final value?","body":"A value of $100 increases by 14% two times in a row. What is the final value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: repeated-change","promptText":"A value of $100 increases by 14% two times in a row. What is the final value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: repeated-change","metadata":{"questionKey":"math-percentages-14","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","repeated-change","percent","repeated-change"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$128","$128","$86","$129.96"],"correctIndex":3}'::jsonb,
  '{"summary":"Apply the percent change twice, using the new value after each step.","strategy":"Multiply by 1 + the percent as a decimal. Use the new value for the second increase. Write the final amount."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"What is 25% of $300?","body":"What is 25% of $300?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: percent-of-amount","promptText":"What is 25% of $300?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: percent-of-amount","metadata":{"questionKey":"math-percentages-15","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","percent-of-amount","percent","of"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$80","$70","$75","$225"],"correctIndex":2}'::jsonb,
  '{"summary":"Multiply the amount by the percent written as a decimal.","strategy":"Convert the percent to a decimal. Multiply by the base amount. Write the part."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A price increases from $110 by 25%. What is the new price?","body":"A price increases from $110 by 25%. What is the new price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: percent-change","promptText":"A price increases from $110 by 25%. What is the new price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: percent-change","metadata":{"questionKey":"math-percentages-16","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","percent-change","percent","change"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$27.5","$137.5","$135","$85"],"correctIndex":1}'::jsonb,
  '{"summary":"Increase the original price by the percent of the original, not the percent of the new price.","strategy":"Find the increase amount. Add it to the original price. Write the new price."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A jacket costs $80 and is discounted by 35%. What is the sale price?","body":"A jacket costs $80 and is discounted by 35%. What is the sale price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: discount","promptText":"A jacket costs $80 and is discounted by 35%. What is the sale price?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: discount","metadata":{"questionKey":"math-percentages-17","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","discount","percent","discount"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$52","$45","$115","$28"],"correctIndex":0}'::jsonb,
  '{"summary":"Subtract the discount amount from the original price.","strategy":"Find the discount as a percent of the original price. Subtract the discount from the original. The remainder is the sale price."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A number is 65% of an original value and equals $96. What was the original value?","body":"A number is 65% of an original value and equals $96. What was the original value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: reverse-percent","promptText":"A number is 65% of an original value and equals $96. What was the original value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: reverse-percent","metadata":{"questionKey":"math-percentages-18","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","reverse-percent","percent","reverse"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$62.4","$137.69","$157.69","$147.69"],"correctIndex":3}'::jsonb,
  '{"summary":"Divide the part by the percent written as a decimal.","strategy":"Convert the percent to a decimal. Divide the part by that decimal. The quotient is the original value."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A value of $100 increases by 16% two times in a row. What is the final value?","body":"A value of $100 increases by 16% two times in a row. What is the final value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: repeated-change","promptText":"A value of $100 increases by 16% two times in a row. What is the final value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: repeated-change","metadata":{"questionKey":"math-percentages-19","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","repeated-change","percent","repeated-change"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$132","$84","$134.56","$132"],"correctIndex":2}'::jsonb,
  '{"summary":"Apply the percent change twice, using the new value after each step.","strategy":"Multiply by 1 + the percent as a decimal. Use the new value for the second increase. Write the final amount."}'::jsonb,
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
    and c.slug = 'percentages'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"What is 30% of $350?","body":"What is 30% of $350?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: percent-of-amount","promptText":"What is 30% of $350?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: percent-of-amount","metadata":{"questionKey":"math-percentages-20","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","percentages","percent-of-amount","percent","of"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["$100","$105","$245","$110"],"correctIndex":1}'::jsonb,
  '{"summary":"Multiply the amount by the percent written as a decimal.","strategy":"Convert the percent to a decimal. Multiply by the base amount. Write the part."}'::jsonb,
  true,
  false,
  'published', now()
from taxonomy;

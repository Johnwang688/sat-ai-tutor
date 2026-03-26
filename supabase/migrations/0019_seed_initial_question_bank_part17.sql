-- Continuation of initial question bank seed (part 17 of 20).
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A survey estimates that between 40% and 50% of students prefer online study guides. Which statement is supported by the interval?","body":"A survey estimates that between 40% and 50% of students prefer online study guides. Which statement is supported by the interval?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: confidence-interval","promptText":"A survey estimates that between 40% and 50% of students prefer online study guides. Which statement is supported by the interval?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: confidence-interval","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-01","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","confidence-interval","inference","interval"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The true percentage is likely within that range.","The true percentage must be exactly the midpoint","The true percentage is outside the range","The sample guarantees the result"],"correctIndex":0}'::jsonb,
  '{"summary":"A confidence interval gives a plausible range for the population value, not an exact certainty.","strategy":"Read the lower and upper bounds. Remember that intervals estimate a population value. Use likely, not certain, language."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Sample A has a mean of 72 with margin of error 2. Sample B has a mean of 78 with margin of error 1. What can be concluded?","body":"Sample A has a mean of 72 with margin of error 2. Sample B has a mean of 78 with margin of error 1. What can be concluded?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: compare-means","promptText":"Sample A has a mean of 72 with margin of error 2. Sample B has a mean of 78 with margin of error 1. What can be concluded?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: compare-means","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-02","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","compare-means","margin-of-error","means"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Sample B is definitely lower","Sample A is definitely higher","The samples are identical","The samples may overlap, so the difference may not be significant"],"correctIndex":3}'::jsonb,
  '{"summary":"If intervals overlap, the data do not clearly prove one population mean is greater.","strategy":"Build the plausible interval for each sample. Compare the intervals. Check whether the intervals clearly separate."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Survey A uses 40 responses and Survey B uses 120 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?","body":"Survey A uses 40 responses and Survey B uses 120 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: sample-size","promptText":"Survey A uses 40 responses and Survey B uses 120 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: sample-size","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-03","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","sample-size","margin-of-error","sample-size"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["They must have the same margin of error","Margin of error does not depend on sample size","The survey with the smaller sample size","The survey with the larger sample size"],"correctIndex":2}'::jsonb,
  '{"summary":"Smaller samples usually produce less precise estimates and larger margins of error.","strategy":"Recall that more data usually means more precision. A smaller sample is less stable. So its margin of error is larger."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A poll estimates 60% support with a margin of error of 3 percentage points. Which claim is supported?","body":"A poll estimates 60% support with a margin of error of 3 percentage points. Which claim is supported?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: support-claim","promptText":"A poll estimates 60% support with a margin of error of 3 percentage points. Which claim is supported?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: support-claim","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-04","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","support-claim","inference","poll"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Support must be over 63%","Support is likely between 57% and 63%","Support is exactly 60%","Support must be under 57%"],"correctIndex":1}'::jsonb,
  '{"summary":"A margin of error creates a range around the estimate.","strategy":"Subtract and add the margin of error. Write the interval around the estimate. Use cautious language."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A sample statistic is used to estimate the town''s recycling rate. What is the best interpretation of that estimate?","body":"A sample statistic is used to estimate the town''s recycling rate. What is the best interpretation of that estimate?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: interpretation","promptText":"A sample statistic is used to estimate the town''s recycling rate. What is the best interpretation of that estimate?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: interpretation","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-05","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","interpretation","inference","interpretation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["It is a reasonable estimate, not an exact certainty","It is always exact","It proves the population value","It cannot be used for inference"],"correctIndex":0}'::jsonb,
  '{"summary":"Sample statistics are used to estimate population values with some uncertainty.","strategy":"Recognize that a sample only provides an estimate. Look for language about likely or reasonable values. Do not treat the sample as perfect certainty."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A survey estimates that between 41% and 52% of students prefer online study guides. Which statement is supported by the interval?","body":"A survey estimates that between 41% and 52% of students prefer online study guides. Which statement is supported by the interval?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: confidence-interval","promptText":"A survey estimates that between 41% and 52% of students prefer online study guides. Which statement is supported by the interval?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: confidence-interval","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-06","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","confidence-interval","inference","interval"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The true percentage must be exactly the midpoint","The true percentage is outside the range","The sample guarantees the result","The true percentage is likely within that range."],"correctIndex":3}'::jsonb,
  '{"summary":"A confidence interval gives a plausible range for the population value, not an exact certainty.","strategy":"Read the lower and upper bounds. Remember that intervals estimate a population value. Use likely, not certain, language."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Sample A has a mean of 73 with margin of error 2. Sample B has a mean of 79 with margin of error 1. What can be concluded?","body":"Sample A has a mean of 73 with margin of error 2. Sample B has a mean of 79 with margin of error 1. What can be concluded?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-means","promptText":"Sample A has a mean of 73 with margin of error 2. Sample B has a mean of 79 with margin of error 1. What can be concluded?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-means","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-07","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","compare-means","margin-of-error","means"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Sample A is definitely higher","The samples are identical","The samples may overlap, so the difference may not be significant","Sample B is definitely lower"],"correctIndex":2}'::jsonb,
  '{"summary":"If intervals overlap, the data do not clearly prove one population mean is greater.","strategy":"Build the plausible interval for each sample. Compare the intervals. Check whether the intervals clearly separate."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Survey A uses 45 responses and Survey B uses 125 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?","body":"Survey A uses 45 responses and Survey B uses 125 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: sample-size","promptText":"Survey A uses 45 responses and Survey B uses 125 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: sample-size","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-08","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","sample-size","margin-of-error","sample-size"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Margin of error does not depend on sample size","The survey with the smaller sample size","The survey with the larger sample size","They must have the same margin of error"],"correctIndex":1}'::jsonb,
  '{"summary":"Smaller samples usually produce less precise estimates and larger margins of error.","strategy":"Recall that more data usually means more precision. A smaller sample is less stable. So its margin of error is larger."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A poll estimates 65% support with a margin of error of 3 percentage points. Which claim is supported?","body":"A poll estimates 65% support with a margin of error of 3 percentage points. Which claim is supported?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: support-claim","promptText":"A poll estimates 65% support with a margin of error of 3 percentage points. Which claim is supported?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: support-claim","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-09","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","support-claim","inference","poll"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Support is likely between 62% and 68%","Support is exactly 65%","Support must be under 62%","Support must be over 68%"],"correctIndex":0}'::jsonb,
  '{"summary":"A margin of error creates a range around the estimate.","strategy":"Subtract and add the margin of error. Write the interval around the estimate. Use cautious language."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A sample statistic is used to estimate the percentage of students who prefer later start times. What is the best interpretation of that estimate?","body":"A sample statistic is used to estimate the percentage of students who prefer later start times. What is the best interpretation of that estimate?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: interpretation","promptText":"A sample statistic is used to estimate the percentage of students who prefer later start times. What is the best interpretation of that estimate?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: interpretation","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-10","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","interpretation","inference","interpretation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["It is always exact","It proves the population value","It cannot be used for inference","It is a reasonable estimate, not an exact certainty"],"correctIndex":3}'::jsonb,
  '{"summary":"Sample statistics are used to estimate population values with some uncertainty.","strategy":"Recognize that a sample only provides an estimate. Look for language about likely or reasonable values. Do not treat the sample as perfect certainty."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A survey estimates that between 42% and 54% of students prefer online study guides. Which statement is supported by the interval?","body":"A survey estimates that between 42% and 54% of students prefer online study guides. Which statement is supported by the interval?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: confidence-interval","promptText":"A survey estimates that between 42% and 54% of students prefer online study guides. Which statement is supported by the interval?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: confidence-interval","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-11","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","confidence-interval","inference","interval"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The true percentage is outside the range","The sample guarantees the result","The true percentage is likely within that range.","The true percentage must be exactly the midpoint"],"correctIndex":2}'::jsonb,
  '{"summary":"A confidence interval gives a plausible range for the population value, not an exact certainty.","strategy":"Read the lower and upper bounds. Remember that intervals estimate a population value. Use likely, not certain, language."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Sample A has a mean of 74 with margin of error 2. Sample B has a mean of 80 with margin of error 1. What can be concluded?","body":"Sample A has a mean of 74 with margin of error 2. Sample B has a mean of 80 with margin of error 1. What can be concluded?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-means","promptText":"Sample A has a mean of 74 with margin of error 2. Sample B has a mean of 80 with margin of error 1. What can be concluded?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-means","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-12","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","compare-means","margin-of-error","means"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The samples are identical","The samples may overlap, so the difference may not be significant","Sample B is definitely lower","Sample A is definitely higher"],"correctIndex":1}'::jsonb,
  '{"summary":"If intervals overlap, the data do not clearly prove one population mean is greater.","strategy":"Build the plausible interval for each sample. Compare the intervals. Check whether the intervals clearly separate."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Survey A uses 50 responses and Survey B uses 130 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?","body":"Survey A uses 50 responses and Survey B uses 130 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: sample-size","promptText":"Survey A uses 50 responses and Survey B uses 130 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: sample-size","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-13","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","sample-size","margin-of-error","sample-size"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The survey with the smaller sample size","The survey with the larger sample size","They must have the same margin of error","Margin of error does not depend on sample size"],"correctIndex":0}'::jsonb,
  '{"summary":"Smaller samples usually produce less precise estimates and larger margins of error.","strategy":"Recall that more data usually means more precision. A smaller sample is less stable. So its margin of error is larger."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A poll estimates 70% support with a margin of error of 3 percentage points. Which claim is supported?","body":"A poll estimates 70% support with a margin of error of 3 percentage points. Which claim is supported?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: support-claim","promptText":"A poll estimates 70% support with a margin of error of 3 percentage points. Which claim is supported?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: support-claim","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-14","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","support-claim","inference","poll"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Support is exactly 70%","Support must be under 67%","Support must be over 73%","Support is likely between 67% and 73%"],"correctIndex":3}'::jsonb,
  '{"summary":"A margin of error creates a range around the estimate.","strategy":"Subtract and add the margin of error. Write the interval around the estimate. Use cautious language."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A sample statistic is used to estimate the town''s recycling rate. What is the best interpretation of that estimate?","body":"A sample statistic is used to estimate the town''s recycling rate. What is the best interpretation of that estimate?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: interpretation","promptText":"A sample statistic is used to estimate the town''s recycling rate. What is the best interpretation of that estimate?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: interpretation","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-15","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","interpretation","inference","interpretation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["It proves the population value","It cannot be used for inference","It is a reasonable estimate, not an exact certainty","It is always exact"],"correctIndex":2}'::jsonb,
  '{"summary":"Sample statistics are used to estimate population values with some uncertainty.","strategy":"Recognize that a sample only provides an estimate. Look for language about likely or reasonable values. Do not treat the sample as perfect certainty."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A survey estimates that between 43% and 56% of students prefer online study guides. Which statement is supported by the interval?","body":"A survey estimates that between 43% and 56% of students prefer online study guides. Which statement is supported by the interval?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: confidence-interval","promptText":"A survey estimates that between 43% and 56% of students prefer online study guides. Which statement is supported by the interval?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: confidence-interval","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-16","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","confidence-interval","inference","interval"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The sample guarantees the result","The true percentage is likely within that range.","The true percentage must be exactly the midpoint","The true percentage is outside the range"],"correctIndex":1}'::jsonb,
  '{"summary":"A confidence interval gives a plausible range for the population value, not an exact certainty.","strategy":"Read the lower and upper bounds. Remember that intervals estimate a population value. Use likely, not certain, language."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Sample A has a mean of 75 with margin of error 2. Sample B has a mean of 81 with margin of error 1. What can be concluded?","body":"Sample A has a mean of 75 with margin of error 2. Sample B has a mean of 81 with margin of error 1. What can be concluded?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compare-means","promptText":"Sample A has a mean of 75 with margin of error 2. Sample B has a mean of 81 with margin of error 1. What can be concluded?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compare-means","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-17","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","compare-means","margin-of-error","means"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The samples may overlap, so the difference may not be significant","Sample B is definitely lower","Sample A is definitely higher","The samples are identical"],"correctIndex":0}'::jsonb,
  '{"summary":"If intervals overlap, the data do not clearly prove one population mean is greater.","strategy":"Build the plausible interval for each sample. Compare the intervals. Check whether the intervals clearly separate."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Survey A uses 55 responses and Survey B uses 135 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?","body":"Survey A uses 55 responses and Survey B uses 135 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: sample-size","promptText":"Survey A uses 55 responses and Survey B uses 135 responses. If the surveys have the same sample mean, which survey is likely to have the larger margin of error?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: sample-size","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-18","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","sample-size","margin-of-error","sample-size"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The survey with the larger sample size","They must have the same margin of error","Margin of error does not depend on sample size","The survey with the smaller sample size"],"correctIndex":3}'::jsonb,
  '{"summary":"Smaller samples usually produce less precise estimates and larger margins of error.","strategy":"Recall that more data usually means more precision. A smaller sample is less stable. So its margin of error is larger."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A poll estimates 75% support with a margin of error of 3 percentage points. Which claim is supported?","body":"A poll estimates 75% support with a margin of error of 3 percentage points. Which claim is supported?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: support-claim","promptText":"A poll estimates 75% support with a margin of error of 3 percentage points. Which claim is supported?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: support-claim","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-19","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","support-claim","inference","poll"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Support must be under 72%","Support must be over 78%","Support is likely between 72% and 78%","Support is exactly 75%"],"correctIndex":2}'::jsonb,
  '{"summary":"A margin of error creates a range around the estimate.","strategy":"Subtract and add the margin of error. Write the interval around the estimate. Use cautious language."}'::jsonb,
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
    and c.slug = 'inference-from-sample-statistics-and-margin-of-error'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A sample statistic is used to estimate the percentage of students who prefer later start times. What is the best interpretation of that estimate?","body":"A sample statistic is used to estimate the percentage of students who prefer later start times. What is the best interpretation of that estimate?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: interpretation","promptText":"A sample statistic is used to estimate the percentage of students who prefer later start times. What is the best interpretation of that estimate?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: interpretation","metadata":{"questionKey":"math-inference-from-sample-statistics-and-margin-of-error-20","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","inference-from-sample-statistics-and-margin-of-error","interpretation","inference","interpretation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["It cannot be used for inference","It is a reasonable estimate, not an exact certainty","It is always exact","It proves the population value"],"correctIndex":1}'::jsonb,
  '{"summary":"Sample statistics are used to estimate population values with some uncertainty.","strategy":"Recognize that a sample only provides an estimate. Look for language about likely or reasonable values. Do not treat the sample as perfect certainty."}'::jsonb,
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
    and c.slug = 'evaluating-statistical-claims-observational-studies-and-experiments'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A study finds that students who have more water tend to score higher. What can be concluded from an observational study?","body":"A study finds that students who have more water tend to score higher. What can be concluded from an observational study?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: causation-vs-association","promptText":"A study finds that students who have more water tend to score higher. What can be concluded from an observational study?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: causation-vs-association","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-01","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","causation-vs-association","observational","causation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The variables are associated, but causation is not proven","Water definitely causes higher scores","Scores cause students to drink water","There is no relationship"],"correctIndex":0}'::jsonb,
  '{"summary":"Observational studies can show association, not causation.","strategy":"Check whether the study was observational. Look for the word associated. Do not claim a cause without an experiment."}'::jsonb,
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
    and c.slug = 'evaluating-statistical-claims-observational-studies-and-experiments'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which condition is needed to generalize survey results to all students in a district?","body":"Which condition is needed to generalize survey results to all students in a district?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: random-sample-vs-assignment","promptText":"Which condition is needed to generalize survey results to all students in a district?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: random-sample-vs-assignment","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-02","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","random-sample-vs-assignment","sampling","generalization"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Random assignment","A larger margin of error","A control group","A random sample"],"correctIndex":3}'::jsonb,
  '{"summary":"Random samples help a study represent the population.","strategy":"Random sample means people are chosen fairly from the population. Random assignment is for experiments. Choose the condition that supports generalization."}'::jsonb,
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
    and c.slug = 'evaluating-statistical-claims-observational-studies-and-experiments'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Why is random assignment important in an experiment testing a tutoring app?","body":"Why is random assignment important in an experiment testing a tutoring app?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: experiment-design","promptText":"Why is random assignment important in an experiment testing a tutoring app?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: experiment-design","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-03","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","experiment-design","experiment","random-assignment"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["It makes the sample random","It proves the claim without data","It helps reduce confounding so differences can be linked to the treatment","It guarantees causation with no variability"],"correctIndex":2}'::jsonb,
  '{"summary":"Random assignment helps isolate the effect of the treatment.","strategy":"Think about how experiments differ from surveys. Random assignment helps compare groups fairly. It reduces the impact of confounding variables."}'::jsonb,
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
    and c.slug = 'evaluating-statistical-claims-observational-studies-and-experiments'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A study of exercise and sleep does not account for stress. Why is stress a concern?","body":"A study of exercise and sleep does not account for stress. Why is stress a concern?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: confounding","promptText":"A study of exercise and sleep does not account for stress. Why is stress a concern?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: confounding","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-04","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","confounding","confounding","observational"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Stress changes the sample size","Stress could be a confounding variable","Stress proves causation","Stress eliminates the need for a control group"],"correctIndex":1}'::jsonb,
  '{"summary":"A confounding variable can influence both variables and blur the relationship.","strategy":"Identify another factor related to both variables. Ask whether it could affect the result. That factor is a confounder."}'::jsonb,
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
    and c.slug = 'evaluating-statistical-claims-observational-studies-and-experiments'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"When can results from a sample be generalized to all customers at a store?","body":"When can results from a sample be generalized to all customers at a store?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: generalization","promptText":"When can results from a sample be generalized to all customers at a store?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: generalization","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-05","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","generalization","generalization","sample"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["When the sample is random and representative","When the sample is convenient","When the experiment is blind","When the margin of error is zero"],"correctIndex":0}'::jsonb,
  '{"summary":"A random representative sample supports generalization.","strategy":"Look for representativeness. Convenience samples are weaker. Randomness helps the sample reflect the population."}'::jsonb,
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
    and c.slug = 'evaluating-statistical-claims-observational-studies-and-experiments'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A study finds that students who have more breakfast tend to score higher. What can be concluded from an observational study?","body":"A study finds that students who have more breakfast tend to score higher. What can be concluded from an observational study?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: causation-vs-association","promptText":"A study finds that students who have more breakfast tend to score higher. What can be concluded from an observational study?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: causation-vs-association","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-06","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","causation-vs-association","observational","causation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Water definitely causes higher scores","Scores cause students to drink water","There is no relationship","The variables are associated, but causation is not proven"],"correctIndex":3}'::jsonb,
  '{"summary":"Observational studies can show association, not causation.","strategy":"Check whether the study was observational. Look for the word associated. Do not claim a cause without an experiment."}'::jsonb,
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
    and c.slug = 'evaluating-statistical-claims-observational-studies-and-experiments'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which condition is needed to generalize survey results to all city voters?","body":"Which condition is needed to generalize survey results to all city voters?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: random-sample-vs-assignment","promptText":"Which condition is needed to generalize survey results to all city voters?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: random-sample-vs-assignment","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-07","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","random-sample-vs-assignment","sampling","generalization"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["A larger margin of error","A control group","A random sample","Random assignment"],"correctIndex":2}'::jsonb,
  '{"summary":"Random samples help a study represent the population.","strategy":"Random sample means people are chosen fairly from the population. Random assignment is for experiments. Choose the condition that supports generalization."}'::jsonb,
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
    and c.slug = 'evaluating-statistical-claims-observational-studies-and-experiments'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Why is random assignment important in an experiment testing a new study schedule?","body":"Why is random assignment important in an experiment testing a new study schedule?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: experiment-design","promptText":"Why is random assignment important in an experiment testing a new study schedule?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: experiment-design","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-08","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","experiment-design","experiment","random-assignment"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["It proves the claim without data","It helps reduce confounding so differences can be linked to the treatment","It guarantees causation with no variability","It makes the sample random"],"correctIndex":1}'::jsonb,
  '{"summary":"Random assignment helps isolate the effect of the treatment.","strategy":"Think about how experiments differ from surveys. Random assignment helps compare groups fairly. It reduces the impact of confounding variables."}'::jsonb,
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
    and c.slug = 'evaluating-statistical-claims-observational-studies-and-experiments'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A study of exercise and sleep does not account for outside temperature. Why is outside temperature a concern?","body":"A study of exercise and sleep does not account for outside temperature. Why is outside temperature a concern?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: confounding","promptText":"A study of exercise and sleep does not account for outside temperature. Why is outside temperature a concern?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: confounding","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-09","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","confounding","confounding","observational"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Outside temperature could be a confounding variable","Outside temperature proves causation","Outside temperature eliminates the need for a control group","Outside temperature changes the sample size"],"correctIndex":0}'::jsonb,
  '{"summary":"A confounding variable can influence both variables and blur the relationship.","strategy":"Identify another factor related to both variables. Ask whether it could affect the result. That factor is a confounder."}'::jsonb,
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
    and c.slug = 'evaluating-statistical-claims-observational-studies-and-experiments'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"When can results from a sample be generalized to all households in a town?","body":"When can results from a sample be generalized to all households in a town?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: generalization","promptText":"When can results from a sample be generalized to all households in a town?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: generalization","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-10","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","generalization","generalization","sample"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["When the sample is convenient","When the experiment is blind","When the margin of error is zero","When the sample is random and representative"],"correctIndex":3}'::jsonb,
  '{"summary":"A random representative sample supports generalization.","strategy":"Look for representativeness. Convenience samples are weaker. Randomness helps the sample reflect the population."}'::jsonb,
  true,
  false,
  'published', now()
from taxonomy;

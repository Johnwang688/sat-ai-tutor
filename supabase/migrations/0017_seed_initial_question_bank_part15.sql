-- Continuation of initial question bank seed (part 15 of 20).
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"What is the mean of the data set 5, 7, 8, 10?","body":"What is the mean of the data set 5, 7, 8, 10?\n\nvalues: 5\n\nvalues: 7\n\nvalues: 8\n\nvalues: 10\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: mean","promptText":"What is the mean of the data set 5, 7, 8, 10?\n\nvalues: 5\n\nvalues: 7\n\nvalues: 8\n\nvalues: 10\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: mean","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-01","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","mean","mean","center"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7.5","8.5","5.5","10.5"],"correctIndex":0}'::jsonb,
  '{"summary":"Add the values and divide by the number of data points.","strategy":"Add all four numbers. Divide by 4. The quotient is the mean."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A data set contains 3, 4, 4, 5, 30. Which statement is true if the value 30 is removed?","body":"A data set contains 3, 4, 4, 5, 30. Which statement is true if the value 30 is removed?\n\nvalues: 3\n\nvalues: 4\n\nvalues: 5\n\nvalues: 30\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: outlier-effect","promptText":"A data set contains 3, 4, 4, 5, 30. Which statement is true if the value 30 is removed?\n\nvalues: 3\n\nvalues: 4\n\nvalues: 5\n\nvalues: 30\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: outlier-effect","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-02","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","outlier-effect","outlier","mean"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The mean increases","The median changes a lot more than the mean","Both center measures stay exactly the same","The mean decreases more than the median changes"],"correctIndex":3}'::jsonb,
  '{"summary":"Removing a high outlier pulls the mean down more than it changes the median.","strategy":"Identify the outlier. Think about how the mean responds to extreme values. The median is usually less affected."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"What is the range of the data set 2, 4, 6, 8?","body":"What is the range of the data set 2, 4, 6, 8?\n\nvalues: 2\n\nvalues: 4\n\nvalues: 6\n\nvalues: 8\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: range","promptText":"What is the range of the data set 2, 4, 6, 8?\n\nvalues: 2\n\nvalues: 4\n\nvalues: 6\n\nvalues: 8\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: range","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-03","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","range","range","spread"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["4","9","6","7"],"correctIndex":2}'::jsonb,
  '{"summary":"Range is the greatest value minus the least value.","strategy":"Find the largest value. Find the smallest value. Subtract the smallest from the largest."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which data set has the greater median: 4, 5, 6, 7 or 2, 2, 9, 9?","body":"Which data set has the greater median: 4, 5, 6, 7 or 2, 2, 9, 9?\n\nsetA: 4\n\nsetA: 5\n\nsetA: 6\n\nsetA: 7\n\nsetB: 2\n\nsetB: 9\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: compare-distributions","promptText":"Which data set has the greater median: 4, 5, 6, 7 or 2, 2, 9, 9?\n\nsetA: 4\n\nsetA: 5\n\nsetA: 6\n\nsetA: 7\n\nsetB: 2\n\nsetB: 9\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: compare-distributions","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-04","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","compare-distributions","median","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Neither","They have the same median","Set A","Set B"],"correctIndex":1}'::jsonb,
  '{"summary":"Sort each set and compare the middle values.","strategy":"Order each data set. Find the middle value or average of the two middle values. Compare the medians."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A data set contains the values 4, 5, 5, 6, and 18. Which statistic is least affected by that unusually large value?","body":"A data set contains the values 4, 5, 5, 6, and 18. Which statistic is least affected by that unusually large value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: statistic-choice","promptText":"A data set contains the values 4, 5, 5, 6, and 18. Which statistic is least affected by that unusually large value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: statistic-choice","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-05","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","statistic-choice","median","outlier"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Median","Mean","Range","Maximum"],"correctIndex":0}'::jsonb,
  '{"summary":"The median depends on position, so it resists outliers better than the mean.","strategy":"Think about which statistic uses the middle position. Outliers change the total more than the middle. The median is the best choice."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"What is the mean of the data set 6, 8, 9, 11?","body":"What is the mean of the data set 6, 8, 9, 11?\n\nvalues: 6\n\nvalues: 8\n\nvalues: 9\n\nvalues: 11\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: mean","promptText":"What is the mean of the data set 6, 8, 9, 11?\n\nvalues: 6\n\nvalues: 8\n\nvalues: 9\n\nvalues: 11\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: mean","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-06","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","mean","mean","center"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["10.5","5.5","12.5","8.5"],"correctIndex":3}'::jsonb,
  '{"summary":"Add the values and divide by the number of data points.","strategy":"Add all four numbers. Divide by 4. The quotient is the mean."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A data set contains 4, 5, 5, 6, 31. Which statement is true if the value 31 is removed?","body":"A data set contains 4, 5, 5, 6, 31. Which statement is true if the value 31 is removed?\n\nvalues: 4\n\nvalues: 5\n\nvalues: 6\n\nvalues: 31\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: outlier-effect","promptText":"A data set contains 4, 5, 5, 6, 31. Which statement is true if the value 31 is removed?\n\nvalues: 4\n\nvalues: 5\n\nvalues: 6\n\nvalues: 31\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: outlier-effect","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-07","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","outlier-effect","outlier","mean"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The median changes a lot more than the mean","Both center measures stay exactly the same","The mean decreases more than the median changes","The mean increases"],"correctIndex":2}'::jsonb,
  '{"summary":"Removing a high outlier pulls the mean down more than it changes the median.","strategy":"Identify the outlier. Think about how the mean responds to extreme values. The median is usually less affected."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"What is the range of the data set 3, 5, 7, 9?","body":"What is the range of the data set 3, 5, 7, 9?\n\nvalues: 3\n\nvalues: 5\n\nvalues: 7\n\nvalues: 9\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: range","promptText":"What is the range of the data set 3, 5, 7, 9?\n\nvalues: 3\n\nvalues: 5\n\nvalues: 7\n\nvalues: 9\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: range","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-08","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","range","range","spread"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["10","6","8","3"],"correctIndex":1}'::jsonb,
  '{"summary":"Range is the greatest value minus the least value.","strategy":"Find the largest value. Find the smallest value. Subtract the smallest from the largest."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which data set has the greater median: 5, 6, 7, 8 or 3, 3, 10, 10?","body":"Which data set has the greater median: 5, 6, 7, 8 or 3, 3, 10, 10?\n\nsetA: 5\n\nsetA: 6\n\nsetA: 7\n\nsetA: 8\n\nsetB: 3\n\nsetB: 10\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-distributions","promptText":"Which data set has the greater median: 5, 6, 7, 8 or 3, 3, 10, 10?\n\nsetA: 5\n\nsetA: 6\n\nsetA: 7\n\nsetA: 8\n\nsetB: 3\n\nsetB: 10\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-distributions","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-09","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","compare-distributions","median","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["They have the same median","Set A","Set B","Neither"],"correctIndex":0}'::jsonb,
  '{"summary":"Sort each set and compare the middle values.","strategy":"Order each data set. Find the middle value or average of the two middle values. Compare the medians."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A data set contains the values 4, 5, 5, 6, and 22. Which statistic is least affected by that unusually large value?","body":"A data set contains the values 4, 5, 5, 6, and 22. Which statistic is least affected by that unusually large value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: statistic-choice","promptText":"A data set contains the values 4, 5, 5, 6, and 22. Which statistic is least affected by that unusually large value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: statistic-choice","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-10","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","statistic-choice","median","outlier"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Mean","Range","Maximum","Median"],"correctIndex":3}'::jsonb,
  '{"summary":"The median depends on position, so it resists outliers better than the mean.","strategy":"Think about which statistic uses the middle position. Outliers change the total more than the middle. The median is the best choice."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"What is the mean of the data set 7, 9, 10, 12?","body":"What is the mean of the data set 7, 9, 10, 12?\n\nvalues: 7\n\nvalues: 9\n\nvalues: 10\n\nvalues: 12\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: mean","promptText":"What is the mean of the data set 7, 9, 10, 12?\n\nvalues: 7\n\nvalues: 9\n\nvalues: 10\n\nvalues: 12\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: mean","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-11","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","mean","mean","center"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5.5","14.5","9.5","12.5"],"correctIndex":2}'::jsonb,
  '{"summary":"Add the values and divide by the number of data points.","strategy":"Add all four numbers. Divide by 4. The quotient is the mean."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A data set contains 5, 6, 6, 7, 32. Which statement is true if the value 32 is removed?","body":"A data set contains 5, 6, 6, 7, 32. Which statement is true if the value 32 is removed?\n\nvalues: 5\n\nvalues: 6\n\nvalues: 7\n\nvalues: 32\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: outlier-effect","promptText":"A data set contains 5, 6, 6, 7, 32. Which statement is true if the value 32 is removed?\n\nvalues: 5\n\nvalues: 6\n\nvalues: 7\n\nvalues: 32\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: outlier-effect","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-12","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","outlier-effect","outlier","mean"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Both center measures stay exactly the same","The mean decreases more than the median changes","The mean increases","The median changes a lot more than the mean"],"correctIndex":1}'::jsonb,
  '{"summary":"Removing a high outlier pulls the mean down more than it changes the median.","strategy":"Identify the outlier. Think about how the mean responds to extreme values. The median is usually less affected."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"What is the range of the data set 4, 6, 8, 10?","body":"What is the range of the data set 4, 6, 8, 10?\n\nvalues: 4\n\nvalues: 6\n\nvalues: 8\n\nvalues: 10\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: range","promptText":"What is the range of the data set 4, 6, 8, 10?\n\nvalues: 4\n\nvalues: 6\n\nvalues: 8\n\nvalues: 10\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: range","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-13","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","range","range","spread"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6","9","2","11"],"correctIndex":0}'::jsonb,
  '{"summary":"Range is the greatest value minus the least value.","strategy":"Find the largest value. Find the smallest value. Subtract the smallest from the largest."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which data set has the greater median: 6, 7, 8, 9 or 4, 4, 11, 11?","body":"Which data set has the greater median: 6, 7, 8, 9 or 4, 4, 11, 11?\n\nsetA: 6\n\nsetA: 7\n\nsetA: 8\n\nsetA: 9\n\nsetB: 4\n\nsetB: 11\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-distributions","promptText":"Which data set has the greater median: 6, 7, 8, 9 or 4, 4, 11, 11?\n\nsetA: 6\n\nsetA: 7\n\nsetA: 8\n\nsetA: 9\n\nsetB: 4\n\nsetB: 11\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: compare-distributions","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-14","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","compare-distributions","median","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Set A","Set B","Neither","They have the same median"],"correctIndex":3}'::jsonb,
  '{"summary":"Sort each set and compare the middle values.","strategy":"Order each data set. Find the middle value or average of the two middle values. Compare the medians."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A data set contains the values 4, 5, 5, 6, and 26. Which statistic is least affected by that unusually large value?","body":"A data set contains the values 4, 5, 5, 6, and 26. Which statistic is least affected by that unusually large value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: statistic-choice","promptText":"A data set contains the values 4, 5, 5, 6, and 26. Which statistic is least affected by that unusually large value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: statistic-choice","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-15","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","statistic-choice","median","outlier"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Range","Maximum","Median","Mean"],"correctIndex":2}'::jsonb,
  '{"summary":"The median depends on position, so it resists outliers better than the mean.","strategy":"Think about which statistic uses the middle position. Outliers change the total more than the middle. The median is the best choice."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"What is the mean of the data set 8, 10, 11, 13?","body":"What is the mean of the data set 8, 10, 11, 13?\n\nvalues: 8\n\nvalues: 10\n\nvalues: 11\n\nvalues: 13\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: mean","promptText":"What is the mean of the data set 8, 10, 11, 13?\n\nvalues: 8\n\nvalues: 10\n\nvalues: 11\n\nvalues: 13\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: mean","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-16","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","mean","mean","center"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["16.5","10.5","14.5","5.5"],"correctIndex":1}'::jsonb,
  '{"summary":"Add the values and divide by the number of data points.","strategy":"Add all four numbers. Divide by 4. The quotient is the mean."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A data set contains 6, 7, 7, 8, 33. Which statement is true if the value 33 is removed?","body":"A data set contains 6, 7, 7, 8, 33. Which statement is true if the value 33 is removed?\n\nvalues: 6\n\nvalues: 7\n\nvalues: 8\n\nvalues: 33\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: outlier-effect","promptText":"A data set contains 6, 7, 7, 8, 33. Which statement is true if the value 33 is removed?\n\nvalues: 6\n\nvalues: 7\n\nvalues: 8\n\nvalues: 33\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: outlier-effect","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-17","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","outlier-effect","outlier","mean"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The mean decreases more than the median changes","The mean increases","The median changes a lot more than the mean","Both center measures stay exactly the same"],"correctIndex":0}'::jsonb,
  '{"summary":"Removing a high outlier pulls the mean down more than it changes the median.","strategy":"Identify the outlier. Think about how the mean responds to extreme values. The median is usually less affected."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"What is the range of the data set 5, 7, 9, 11?","body":"What is the range of the data set 5, 7, 9, 11?\n\nvalues: 5\n\nvalues: 7\n\nvalues: 9\n\nvalues: 11\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: range","promptText":"What is the range of the data set 5, 7, 9, 11?\n\nvalues: 5\n\nvalues: 7\n\nvalues: 9\n\nvalues: 11\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: range","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-18","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","range","range","spread"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["10","1","12","6"],"correctIndex":3}'::jsonb,
  '{"summary":"Range is the greatest value minus the least value.","strategy":"Find the largest value. Find the smallest value. Subtract the smallest from the largest."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Which data set has the greater median: 7, 8, 9, 10 or 5, 5, 12, 12?","body":"Which data set has the greater median: 7, 8, 9, 10 or 5, 5, 12, 12?\n\nsetA: 7\n\nsetA: 8\n\nsetA: 9\n\nsetA: 10\n\nsetB: 5\n\nsetB: 12\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compare-distributions","promptText":"Which data set has the greater median: 7, 8, 9, 10 or 5, 5, 12, 12?\n\nsetA: 7\n\nsetA: 8\n\nsetA: 9\n\nsetA: 10\n\nsetB: 5\n\nsetB: 12\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: compare-distributions","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-19","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","compare-distributions","median","comparison"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Set B","Neither","They have the same median","Set A"],"correctIndex":2}'::jsonb,
  '{"summary":"Sort each set and compare the middle values.","strategy":"Order each data set. Find the middle value or average of the two middle values. Compare the medians."}'::jsonb,
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
    and c.slug = 'one-variable-data-distributions-and-measures-of-center-and-spread'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A data set contains the values 4, 5, 5, 6, and 30. Which statistic is least affected by that unusually large value?","body":"A data set contains the values 4, 5, 5, 6, and 30. Which statistic is least affected by that unusually large value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: statistic-choice","promptText":"A data set contains the values 4, 5, 5, 6, and 30. Which statistic is least affected by that unusually large value?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: statistic-choice","metadata":{"questionKey":"math-one-variable-data-distributions-and-measures-of-center-and-spread-20","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","one-variable-data-distributions-and-measures-of-center-and-spread","statistic-choice","median","outlier"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Maximum","Median","Mean","Range"],"correctIndex":1}'::jsonb,
  '{"summary":"The median depends on position, so it resists outliers better than the mean.","strategy":"Think about which statistic uses the middle position. Outliers change the total more than the middle. The median is the best choice."}'::jsonb,
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
    and c.slug = 'two-variable-data-models-and-scatterplots'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?","body":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?\n\nheaders: x\n\nheaders: y\n\nrows: 0\n\nrows: 4\n\nrows: 3\n\nrows: 10\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: best-fit-slope","promptText":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?\n\nheaders: x\n\nheaders: y\n\nrows: 0\n\nrows: 4\n\nrows: 3\n\nrows: 10\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: best-fit-slope","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-01","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","best-fit-slope","scatterplot","slope"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["2","3","0","5"],"correctIndex":0}'::jsonb,
  '{"summary":"Use rise over run with the two points on the line of best fit.","strategy":"Subtract the y-values. Subtract the x-values. Divide the change in y by the change in x."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'two-variable-data-models-and-scatterplots'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 5?","body":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: prediction","promptText":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: prediction","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-02","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","prediction","prediction","model"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["14","11","16","13"],"correctIndex":3}'::jsonb,
  '{"summary":"Substitute the x-value into the model to make a prediction.","strategy":"Replace x with 5. Compute 2x + 3. The predicted value is 13."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'two-variable-data-models-and-scatterplots'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A scatterplot shows points that generally rise from left to right and stay close to a straight line. What best describes the association?","body":"A scatterplot shows points that generally rise from left to right and stay close to a straight line. What best describes the association?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: association","promptText":"A scatterplot shows points that generally rise from left to right and stay close to a straight line. What best describes the association?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: association","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-03","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","association","association","scatterplot"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Weak positive linear association","No association","Strong positive linear association","Strong negative linear association"],"correctIndex":2}'::jsonb,
  '{"summary":"Rising from left to right indicates a positive association, and close to a line indicates it is strong and linear.","strategy":"Look at the direction of the points. Judge how tightly they cluster around a line. Describe the association using both pieces of information."}'::jsonb,
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
    and c.slug = 'two-variable-data-models-and-scatterplots'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which model is most appropriate for data when sales rise quickly at first and then level off?","body":"Which model is most appropriate for data when sales rise quickly at first and then level off?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: model-choice","promptText":"Which model is most appropriate for data when sales rise quickly at first and then level off?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: model-choice","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-04","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","model-choice","modeling","scatterplot"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Random","Exponential decay or growth with a plateau-like trend is not ideal; a nonlinear model is needed","Perfectly linear","Constant"],"correctIndex":1}'::jsonb,
  '{"summary":"A pattern that changes rate is not linear, so a linear model is not the best fit.","strategy":"Notice the rate is not constant. A curved pattern needs a nonlinear model. Choose the model that matches the shape."}'::jsonb,
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
    and c.slug = 'two-variable-data-models-and-scatterplots'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A model predicts a value of 15, but the actual value is 18. What is the residual?","body":"A model predicts a value of 15, but the actual value is 18. What is the residual?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: residual","promptText":"A model predicts a value of 15, but the actual value is 18. What is the residual?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: residual","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-05","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","residual","residual","prediction"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["3","4","1","6"],"correctIndex":0}'::jsonb,
  '{"summary":"Residual equals actual minus predicted.","strategy":"Subtract the predicted value from the actual value. Keep the sign if needed. Write the residual."}'::jsonb,
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
    and c.slug = 'two-variable-data-models-and-scatterplots'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?","body":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?\n\nheaders: x\n\nheaders: y\n\nrows: 0\n\nrows: 5\n\nrows: 4\n\nrows: 17\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: best-fit-slope","promptText":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?\n\nheaders: x\n\nheaders: y\n\nrows: 0\n\nrows: 5\n\nrows: 4\n\nrows: 17\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: best-fit-slope","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-06","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","best-fit-slope","scatterplot","slope"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5","0","7","3"],"correctIndex":3}'::jsonb,
  '{"summary":"Use rise over run with the two points on the line of best fit.","strategy":"Subtract the y-values. Subtract the x-values. Divide the change in y by the change in x."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'two-variable-data-models-and-scatterplots'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 6?","body":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 6?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: prediction","promptText":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 6?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: prediction","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-07","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","prediction","prediction","model"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12","19","15","17"],"correctIndex":2}'::jsonb,
  '{"summary":"Substitute the x-value into the model to make a prediction.","strategy":"Replace x with 6. Compute 2x + 3. The predicted value is 15."}'::jsonb,
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
    and d.slug = 'problem-solving-and-data-analysis'
    and c.slug = 'two-variable-data-models-and-scatterplots'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A scatterplot shows points that generally increase from left to right and stay close to a straight line. What best describes the association?","body":"A scatterplot shows points that generally increase from left to right and stay close to a straight line. What best describes the association?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: association","promptText":"A scatterplot shows points that generally increase from left to right and stay close to a straight line. What best describes the association?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: association","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-08","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","association","association","scatterplot"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["No association","Strong positive linear association","Strong negative linear association","Weak positive linear association"],"correctIndex":1}'::jsonb,
  '{"summary":"Rising from left to right indicates a positive association, and close to a line indicates it is strong and linear.","strategy":"Look at the direction of the points. Judge how tightly they cluster around a line. Describe the association using both pieces of information."}'::jsonb,
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
    and c.slug = 'two-variable-data-models-and-scatterplots'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which model is most appropriate for data when a plant''s height rises quickly at first and then level off?","body":"Which model is most appropriate for data when a plant''s height rises quickly at first and then level off?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: model-choice","promptText":"Which model is most appropriate for data when a plant''s height rises quickly at first and then level off?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: model-choice","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-09","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","model-choice","modeling","scatterplot"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Exponential decay or growth with a plateau-like trend is not ideal; a nonlinear model is needed","Perfectly linear","Constant","Random"],"correctIndex":0}'::jsonb,
  '{"summary":"A pattern that changes rate is not linear, so a linear model is not the best fit.","strategy":"Notice the rate is not constant. A curved pattern needs a nonlinear model. Choose the model that matches the shape."}'::jsonb,
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
    and c.slug = 'two-variable-data-models-and-scatterplots'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A model predicts a value of 17, but the actual value is 20. What is the residual?","body":"A model predicts a value of 17, but the actual value is 20. What is the residual?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: residual","promptText":"A model predicts a value of 17, but the actual value is 20. What is the residual?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: residual","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-10","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","residual","residual","prediction"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5","0","7","3"],"correctIndex":3}'::jsonb,
  '{"summary":"Residual equals actual minus predicted.","strategy":"Subtract the predicted value from the actual value. Keep the sign if needed. Write the residual."}'::jsonb,
  true,
  false,
  'published', now()
from taxonomy;

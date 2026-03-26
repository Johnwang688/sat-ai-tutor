-- Continuation of initial question bank seed (part 18 of 20).
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
  '{"stem":"A study finds that students who have more water tend to score higher. What can be concluded from an observational study?","body":"A study finds that students who have more water tend to score higher. What can be concluded from an observational study?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: causation-vs-association","promptText":"A study finds that students who have more water tend to score higher. What can be concluded from an observational study?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: causation-vs-association","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-11","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","causation-vs-association","observational","causation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Scores cause students to drink water","There is no relationship","The variables are associated, but causation is not proven","Water definitely causes higher scores"],"correctIndex":2}'::jsonb,
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
  '{"stem":"Which condition is needed to generalize survey results to all students in a district?","body":"Which condition is needed to generalize survey results to all students in a district?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: random-sample-vs-assignment","promptText":"Which condition is needed to generalize survey results to all students in a district?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: random-sample-vs-assignment","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-12","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","random-sample-vs-assignment","sampling","generalization"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["A control group","A random sample","Random assignment","A larger margin of error"],"correctIndex":1}'::jsonb,
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
  '{"stem":"Why is random assignment important in an experiment testing a tutoring app?","body":"Why is random assignment important in an experiment testing a tutoring app?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: experiment-design","promptText":"Why is random assignment important in an experiment testing a tutoring app?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: experiment-design","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-13","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","experiment-design","experiment","random-assignment"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["It helps reduce confounding so differences can be linked to the treatment","It guarantees causation with no variability","It makes the sample random","It proves the claim without data"],"correctIndex":0}'::jsonb,
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
  '{"stem":"A study of exercise and sleep does not account for stress. Why is stress a concern?","body":"A study of exercise and sleep does not account for stress. Why is stress a concern?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: confounding","promptText":"A study of exercise and sleep does not account for stress. Why is stress a concern?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: confounding","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-14","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","confounding","confounding","observational"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Stress proves causation","Stress eliminates the need for a control group","Stress changes the sample size","Stress could be a confounding variable"],"correctIndex":3}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"When can results from a sample be generalized to all customers at a store?","body":"When can results from a sample be generalized to all customers at a store?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: generalization","promptText":"When can results from a sample be generalized to all customers at a store?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: generalization","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-15","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","generalization","generalization","sample"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["When the experiment is blind","When the margin of error is zero","When the sample is random and representative","When the sample is convenient"],"correctIndex":2}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"A study finds that students who have more breakfast tend to score higher. What can be concluded from an observational study?","body":"A study finds that students who have more breakfast tend to score higher. What can be concluded from an observational study?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: causation-vs-association","promptText":"A study finds that students who have more breakfast tend to score higher. What can be concluded from an observational study?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: causation-vs-association","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-16","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","causation-vs-association","observational","causation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["There is no relationship","The variables are associated, but causation is not proven","Water definitely causes higher scores","Scores cause students to drink water"],"correctIndex":1}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"Which condition is needed to generalize survey results to all city voters?","body":"Which condition is needed to generalize survey results to all city voters?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: random-sample-vs-assignment","promptText":"Which condition is needed to generalize survey results to all city voters?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: random-sample-vs-assignment","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-17","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","random-sample-vs-assignment","sampling","generalization"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["A random sample","Random assignment","A larger margin of error","A control group"],"correctIndex":0}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"Why is random assignment important in an experiment testing a new study schedule?","body":"Why is random assignment important in an experiment testing a new study schedule?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: experiment-design","promptText":"Why is random assignment important in an experiment testing a new study schedule?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: experiment-design","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-18","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","experiment-design","experiment","random-assignment"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["It guarantees causation with no variability","It makes the sample random","It proves the claim without data","It helps reduce confounding so differences can be linked to the treatment"],"correctIndex":3}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"A study of exercise and sleep does not account for outside temperature. Why is outside temperature a concern?","body":"A study of exercise and sleep does not account for outside temperature. Why is outside temperature a concern?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: confounding","promptText":"A study of exercise and sleep does not account for outside temperature. Why is outside temperature a concern?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: confounding","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-19","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","confounding","confounding","observational"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Outside temperature eliminates the need for a control group","Outside temperature changes the sample size","Outside temperature could be a confounding variable","Outside temperature proves causation"],"correctIndex":2}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"When can results from a sample be generalized to all households in a town?","body":"When can results from a sample be generalized to all households in a town?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: generalization","promptText":"When can results from a sample be generalized to all households in a town?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: generalization","metadata":{"questionKey":"math-evaluating-statistical-claims-observational-studies-and-experiments-20","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","evaluating-statistical-claims-observational-studies-and-experiments","generalization","generalization","sample"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["When the margin of error is zero","When the sample is random and representative","When the sample is convenient","When the experiment is blind"],"correctIndex":1}'::jsonb,
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
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"What is the area of a rectangle with length 8 and width 5?","body":"What is the area of a rectangle with length 8 and width 5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: rectangle-area","promptText":"What is the area of a rectangle with length 8 and width 5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: rectangle-area","metadata":{"questionKey":"math-area-and-volume-01","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","rectangle-area","area","rectangle"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["40","41","38","43"],"correctIndex":0}'::jsonb,
  '{"summary":"Area of a rectangle is length times width.","strategy":"Multiply length by width. Use the same units squared. The area is 40."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A shape consists of a rectangle 6 by 4 with a right triangle attached that has base 6 and height 3. What is the total area?","body":"A shape consists of a rectangle 6 by 4 with a right triangle attached that has base 6 and height 3. What is the total area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: composite-area","promptText":"A shape consists of a rectangle 6 by 4 with a right triangle attached that has base 6 and height 3. What is the total area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: composite-area","metadata":{"questionKey":"math-area-and-volume-02","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","composite-area","area","composite"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["39","27","72","33"],"correctIndex":3}'::jsonb,
  '{"summary":"Find each part''s area and add the results.","strategy":"Find the rectangle area. Find the triangle area. Add the two areas together."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"What is the volume of a rectangular prism with dimensions 4, 3, and 5?","body":"What is the volume of a rectangular prism with dimensions 4, 3, and 5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: rectangular-prism-volume","promptText":"What is the volume of a rectangular prism with dimensions 4, 3, and 5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: rectangular-prism-volume","metadata":{"questionKey":"math-area-and-volume-03","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","rectangular-prism-volume","volume","prism"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12","55","60","17"],"correctIndex":2}'::jsonb,
  '{"summary":"Volume of a rectangular prism is length times width times height.","strategy":"Multiply the three dimensions. Use cubic units. The volume is 60."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A figure is enlarged by a scale factor of 2. If its original area is 12, what is the new area?","body":"A figure is enlarged by a scale factor of 2. If its original area is 12, what is the new area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: scale-factor-area","promptText":"A figure is enlarged by a scale factor of 2. If its original area is 12, what is the new area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: scale-factor-area","metadata":{"questionKey":"math-area-and-volume-04","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","scale-factor-area","scale-factor","area"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["10","48","24","14"],"correctIndex":1}'::jsonb,
  '{"summary":"Area scales by the square of the scale factor.","strategy":"Square the scale factor. Multiply the original area by that square. Write the new area."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"What is the area of a circle with radius 3? Use pi.","body":"What is the area of a circle with radius 3? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: circle-area","promptText":"What is the area of a circle with radius 3? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: circle-area","metadata":{"questionKey":"math-area-and-volume-05","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","circle-area","circle","area"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["9pi","6pi","3pi","18pi"],"correctIndex":0}'::jsonb,
  '{"summary":"Area of a circle is pi times the radius squared.","strategy":"Square the radius. Multiply by pi. Write the area in square units."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"What is the area of a rectangle with length 9 and width 6?","body":"What is the area of a rectangle with length 9 and width 6?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: rectangle-area","promptText":"What is the area of a rectangle with length 9 and width 6?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: rectangle-area","metadata":{"questionKey":"math-area-and-volume-06","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","rectangle-area","area","rectangle"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["56","51","58","54"],"correctIndex":3}'::jsonb,
  '{"summary":"Area of a rectangle is length times width.","strategy":"Multiply length by width. Use the same units squared. The area is 54."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A shape consists of a rectangle 7 by 5 with a right triangle attached that has base 7 and height 4. What is the total area?","body":"A shape consists of a rectangle 7 by 5 with a right triangle attached that has base 7 and height 4. What is the total area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: composite-area","promptText":"A shape consists of a rectangle 7 by 5 with a right triangle attached that has base 7 and height 4. What is the total area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: composite-area","metadata":{"questionKey":"math-area-and-volume-07","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","composite-area","area","composite"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["42","140","49","56"],"correctIndex":2}'::jsonb,
  '{"summary":"Find each part''s area and add the results.","strategy":"Find the rectangle area. Find the triangle area. Add the two areas together."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"What is the volume of a rectangular prism with dimensions 5, 4, and 6?","body":"What is the volume of a rectangular prism with dimensions 5, 4, and 6?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: rectangular-prism-volume","promptText":"What is the volume of a rectangular prism with dimensions 5, 4, and 6?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: rectangular-prism-volume","metadata":{"questionKey":"math-area-and-volume-08","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","rectangular-prism-volume","volume","prism"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["114","120","26","15"],"correctIndex":1}'::jsonb,
  '{"summary":"Volume of a rectangular prism is length times width times height.","strategy":"Multiply the three dimensions. Use cubic units. The volume is 120."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A figure is enlarged by a scale factor of 3. If its original area is 15, what is the new area?","body":"A figure is enlarged by a scale factor of 3. If its original area is 15, what is the new area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: scale-factor-area","promptText":"A figure is enlarged by a scale factor of 3. If its original area is 15, what is the new area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: scale-factor-area","metadata":{"questionKey":"math-area-and-volume-09","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","scale-factor-area","scale-factor","area"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["135","45","18","12"],"correctIndex":0}'::jsonb,
  '{"summary":"Area scales by the square of the scale factor.","strategy":"Square the scale factor. Multiply the original area by that square. Write the new area."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"What is the area of a circle with radius 4? Use pi.","body":"What is the area of a circle with radius 4? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: circle-area","promptText":"What is the area of a circle with radius 4? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: circle-area","metadata":{"questionKey":"math-area-and-volume-10","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","circle-area","circle","area"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["8pi","4pi","32pi","16pi"],"correctIndex":3}'::jsonb,
  '{"summary":"Area of a circle is pi times the radius squared.","strategy":"Square the radius. Multiply by pi. Write the area in square units."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"What is the area of a rectangle with length 10 and width 7?","body":"What is the area of a rectangle with length 10 and width 7?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: rectangle-area","promptText":"What is the area of a rectangle with length 10 and width 7?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: rectangle-area","metadata":{"questionKey":"math-area-and-volume-11","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","rectangle-area","area","rectangle"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["66","75","70","73"],"correctIndex":2}'::jsonb,
  '{"summary":"Area of a rectangle is length times width.","strategy":"Multiply length by width. Use the same units squared. The area is 70."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A shape consists of a rectangle 8 by 6 with a right triangle attached that has base 8 and height 5. What is the total area?","body":"A shape consists of a rectangle 8 by 6 with a right triangle attached that has base 8 and height 5. What is the total area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: composite-area","promptText":"A shape consists of a rectangle 8 by 6 with a right triangle attached that has base 8 and height 5. What is the total area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: composite-area","metadata":{"questionKey":"math-area-and-volume-12","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","composite-area","area","composite"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["240","68","76","60"],"correctIndex":1}'::jsonb,
  '{"summary":"Find each part''s area and add the results.","strategy":"Find the rectangle area. Find the triangle area. Add the two areas together."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"What is the volume of a rectangular prism with dimensions 6, 5, and 7?","body":"What is the volume of a rectangular prism with dimensions 6, 5, and 7?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: rectangular-prism-volume","promptText":"What is the volume of a rectangular prism with dimensions 6, 5, and 7?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: rectangular-prism-volume","metadata":{"questionKey":"math-area-and-volume-13","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","rectangular-prism-volume","volume","prism"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["210","37","18","203"],"correctIndex":0}'::jsonb,
  '{"summary":"Volume of a rectangular prism is length times width times height.","strategy":"Multiply the three dimensions. Use cubic units. The volume is 210."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A figure is enlarged by a scale factor of 4. If its original area is 18, what is the new area?","body":"A figure is enlarged by a scale factor of 4. If its original area is 18, what is the new area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: scale-factor-area","promptText":"A figure is enlarged by a scale factor of 4. If its original area is 18, what is the new area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: scale-factor-area","metadata":{"questionKey":"math-area-and-volume-14","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","scale-factor-area","scale-factor","area"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["72","22","14","288"],"correctIndex":3}'::jsonb,
  '{"summary":"Area scales by the square of the scale factor.","strategy":"Square the scale factor. Multiply the original area by that square. Write the new area."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"What is the area of a circle with radius 5? Use pi.","body":"What is the area of a circle with radius 5? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: circle-area","promptText":"What is the area of a circle with radius 5? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: circle-area","metadata":{"questionKey":"math-area-and-volume-15","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","circle-area","circle","area"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5pi","50pi","25pi","10pi"],"correctIndex":2}'::jsonb,
  '{"summary":"Area of a circle is pi times the radius squared.","strategy":"Square the radius. Multiply by pi. Write the area in square units."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"What is the area of a rectangle with length 11 and width 8?","body":"What is the area of a rectangle with length 11 and width 8?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: rectangle-area","promptText":"What is the area of a rectangle with length 11 and width 8?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: rectangle-area","metadata":{"questionKey":"math-area-and-volume-16","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","rectangle-area","area","rectangle"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["94","88","92","83"],"correctIndex":1}'::jsonb,
  '{"summary":"Area of a rectangle is length times width.","strategy":"Multiply length by width. Use the same units squared. The area is 88."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A shape consists of a rectangle 9 by 7 with a right triangle attached that has base 9 and height 6. What is the total area?","body":"A shape consists of a rectangle 9 by 7 with a right triangle attached that has base 9 and height 6. What is the total area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: composite-area","promptText":"A shape consists of a rectangle 9 by 7 with a right triangle attached that has base 9 and height 6. What is the total area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: composite-area","metadata":{"questionKey":"math-area-and-volume-17","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","composite-area","area","composite"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["90","99","81","378"],"correctIndex":0}'::jsonb,
  '{"summary":"Find each part''s area and add the results.","strategy":"Find the rectangle area. Find the triangle area. Add the two areas together."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"What is the volume of a rectangular prism with dimensions 7, 6, and 8?","body":"What is the volume of a rectangular prism with dimensions 7, 6, and 8?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: rectangular-prism-volume","promptText":"What is the volume of a rectangular prism with dimensions 7, 6, and 8?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: rectangular-prism-volume","metadata":{"questionKey":"math-area-and-volume-18","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","rectangular-prism-volume","volume","prism"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["50","21","328","336"],"correctIndex":3}'::jsonb,
  '{"summary":"Volume of a rectangular prism is length times width times height.","strategy":"Multiply the three dimensions. Use cubic units. The volume is 336."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A figure is enlarged by a scale factor of 5. If its original area is 21, what is the new area?","body":"A figure is enlarged by a scale factor of 5. If its original area is 21, what is the new area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: scale-factor-area","promptText":"A figure is enlarged by a scale factor of 5. If its original area is 21, what is the new area?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: scale-factor-area","metadata":{"questionKey":"math-area-and-volume-19","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","scale-factor-area","scale-factor","area"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["26","16","525","105"],"correctIndex":2}'::jsonb,
  '{"summary":"Area scales by the square of the scale factor.","strategy":"Square the scale factor. Multiply the original area by that square. Write the new area."}'::jsonb,
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
    and c.slug = 'area-and-volume'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"What is the area of a circle with radius 6? Use pi.","body":"What is the area of a circle with radius 6? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: circle-area","promptText":"What is the area of a circle with radius 6? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: circle-area","metadata":{"questionKey":"math-area-and-volume-20","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","area-and-volume","circle-area","circle","area"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["72pi","36pi","12pi","6pi"],"correctIndex":1}'::jsonb,
  '{"summary":"Area of a circle is pi times the radius squared.","strategy":"Square the radius. Multiply by pi. Write the area in square units."}'::jsonb,
  true,
  false,
  'published', now()
from taxonomy;

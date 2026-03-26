-- Continuation of initial question bank seed (part 16 of 20).
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
  '{"stem":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?","body":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?\n\nheaders: x\n\nheaders: y\n\nrows: 0\n\nrows: 6\n\nrows: 5\n\nrows: 26\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: best-fit-slope","promptText":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?\n\nheaders: x\n\nheaders: y\n\nrows: 0\n\nrows: 6\n\nrows: 5\n\nrows: 26\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: best-fit-slope","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-11","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","best-fit-slope","scatterplot","slope"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["0","9","4","7"],"correctIndex":2}'::jsonb,
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
  '{"stem":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 7?","body":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 7?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: prediction","promptText":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 7?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: prediction","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-12","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","prediction","prediction","model"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["22","17","20","13"],"correctIndex":1}'::jsonb,
  '{"summary":"Substitute the x-value into the model to make a prediction.","strategy":"Replace x with 7. Compute 2x + 3. The predicted value is 17."}'::jsonb,
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
  '{"stem":"A scatterplot shows points that generally rise from left to right and stay close to a straight line. What best describes the association?","body":"A scatterplot shows points that generally rise from left to right and stay close to a straight line. What best describes the association?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: association","promptText":"A scatterplot shows points that generally rise from left to right and stay close to a straight line. What best describes the association?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: association","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-13","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","association","association","scatterplot"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Strong positive linear association","Strong negative linear association","Weak positive linear association","No association"],"correctIndex":0}'::jsonb,
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
  '{"stem":"Which model is most appropriate for data when sales rise quickly at first and then level off?","body":"Which model is most appropriate for data when sales rise quickly at first and then level off?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: model-choice","promptText":"Which model is most appropriate for data when sales rise quickly at first and then level off?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: model-choice","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-14","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","model-choice","modeling","scatterplot"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Perfectly linear","Constant","Random","Exponential decay or growth with a plateau-like trend is not ideal; a nonlinear model is needed"],"correctIndex":3}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"A model predicts a value of 19, but the actual value is 22. What is the residual?","body":"A model predicts a value of 19, but the actual value is 22. What is the residual?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: residual","promptText":"A model predicts a value of 19, but the actual value is 22. What is the residual?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: residual","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-15","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","residual","residual","prediction"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["-1","8","3","6"],"correctIndex":2}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?","body":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?\n\nheaders: x\n\nheaders: y\n\nrows: 0\n\nrows: 7\n\nrows: 6\n\nrows: 37\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: best-fit-slope","promptText":"A scatterplot has a line of best fit. What is the slope if the line passes through the two points in the table?\n\nheaders: x\n\nheaders: y\n\nrows: 0\n\nrows: 7\n\nrows: 6\n\nrows: 37\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: best-fit-slope","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-16","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","best-fit-slope","scatterplot","slope"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["11","5","9","0"],"correctIndex":1}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 8?","body":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 8?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: prediction","promptText":"A line of best fit is modeled by y = 2x + 3. What is the predicted y-value when x = 8?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: prediction","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-17","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","prediction","prediction","model"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["19","23","14","25"],"correctIndex":0}'::jsonb,
  '{"summary":"Substitute the x-value into the model to make a prediction.","strategy":"Replace x with 8. Compute 2x + 3. The predicted value is 19."}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"A scatterplot shows points that generally increase from left to right and stay close to a straight line. What best describes the association?","body":"A scatterplot shows points that generally increase from left to right and stay close to a straight line. What best describes the association?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: association","promptText":"A scatterplot shows points that generally increase from left to right and stay close to a straight line. What best describes the association?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: association","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-18","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","association","association","scatterplot"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Strong negative linear association","Weak positive linear association","No association","Strong positive linear association"],"correctIndex":3}'::jsonb,
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
  4, 'multiple_choice',
  '{"stem":"Which model is most appropriate for data when a plant''s height rises quickly at first and then level off?","body":"Which model is most appropriate for data when a plant''s height rises quickly at first and then level off?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: model-choice","promptText":"Which model is most appropriate for data when a plant''s height rises quickly at first and then level off?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: model-choice","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-19","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","model-choice","modeling","scatterplot"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Constant","Random","Exponential decay or growth with a plateau-like trend is not ideal; a nonlinear model is needed","Perfectly linear"],"correctIndex":2}'::jsonb,
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
  5, 'multiple_choice',
  '{"stem":"A model predicts a value of 21, but the actual value is 24. What is the residual?","body":"A model predicts a value of 21, but the actual value is 24. What is the residual?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: residual","promptText":"A model predicts a value of 21, but the actual value is 24. What is the residual?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: residual","metadata":{"questionKey":"math-two-variable-data-models-and-scatterplots-20","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","two-variable-data-models-and-scatterplots","residual","residual","prediction"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["9","3","7","-2"],"correctIndex":1}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A bag contains 3 red marbles and 5 blue marbles. What is the probability of selecting a red marble?","body":"A bag contains 3 red marbles and 5 blue marbles. What is the probability of selecting a red marble?\n\nred: 3\n\nblue: 5\n\ntotal: 8\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: simple-probability","promptText":"A bag contains 3 red marbles and 5 blue marbles. What is the probability of selecting a red marble?\n\nred: 3\n\nblue: 5\n\ntotal: 8\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: simple-probability","metadata":{"questionKey":"math-probability-and-conditional-probability-01","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","simple-probability","probability","simple"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["3/8","5/8","3/5","1/8"],"correctIndex":0}'::jsonb,
  '{"summary":"Probability is favorable outcomes over total outcomes.","strategy":"Count the red marbles. Count the total marbles. Write favorable over total."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"If the probability of event A is 1/2 and the probability of event B is 1/3, what is P(A and B) if the events are independent?","body":"If the probability of event A is 1/2 and the probability of event B is 1/3, what is P(A and B) if the events are independent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: independent-events","promptText":"If the probability of event A is 1/2 and the probability of event B is 1/3, what is P(A and B) if the events are independent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: independent-events","metadata":{"questionKey":"math-probability-and-conditional-probability-02","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","independent-events","probability","independent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1/5","1/2","1/3","1/6"],"correctIndex":3}'::jsonb,
  '{"summary":"Multiply the probabilities of independent events.","strategy":"Identify that the events are independent. Multiply the probabilities. Write the product as a fraction."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A table shows 8 students who play an instrument, and 3 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?","body":"A table shows 8 students who play an instrument, and 3 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?\n\ninstrument: 8\n\nchoir: 3\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: conditional-probability","promptText":"A table shows 8 students who play an instrument, and 3 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?\n\ninstrument: 8\n\nchoir: 3\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: conditional-probability","metadata":{"questionKey":"math-probability-and-conditional-probability-03","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","conditional-probability","probability","conditional"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["8/11","1/8","3/8","3/11"],"correctIndex":2}'::jsonb,
  '{"summary":"Conditional probability uses the restricted group as the denominator.","strategy":"Use only the students who play an instrument as the total. Count the students in choir among that group. Write favorable over the restricted total."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"If the probability of rain is 2/5, what is the probability of no rain?","body":"If the probability of rain is 2/5, what is the probability of no rain?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: complement","promptText":"If the probability of rain is 2/5, what is the probability of no rain?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: complement","metadata":{"questionKey":"math-probability-and-conditional-probability-04","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","complement","probability","complement"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1/10","3/5","2/5","5/2"],"correctIndex":1}'::jsonb,
  '{"summary":"Use 1 minus the probability of rain.","strategy":"Treat the complement as the opposite event. Subtract the probability from 1. Write the result as a fraction."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A class has 12 students, of whom 3 are left-handed. What is the probability that a randomly chosen student is left-handed?","body":"A class has 12 students, of whom 3 are left-handed. What is the probability that a randomly chosen student is left-handed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: two-step-counting","promptText":"A class has 12 students, of whom 3 are left-handed. What is the probability that a randomly chosen student is left-handed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: two-step-counting","metadata":{"questionKey":"math-probability-and-conditional-probability-05","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","two-step-counting","probability","counting"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1/4","3/4","3/4","1/12"],"correctIndex":0}'::jsonb,
  '{"summary":"Use the count of left-handed students over the total number of students.","strategy":"Count favorable outcomes. Count the total outcomes. Write the probability as a fraction."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A bag contains 4 red marbles and 6 blue marbles. What is the probability of selecting a red marble?","body":"A bag contains 4 red marbles and 6 blue marbles. What is the probability of selecting a red marble?\n\nred: 4\n\nblue: 6\n\ntotal: 10\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: simple-probability","promptText":"A bag contains 4 red marbles and 6 blue marbles. What is the probability of selecting a red marble?\n\nred: 4\n\nblue: 6\n\ntotal: 10\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: simple-probability","metadata":{"questionKey":"math-probability-and-conditional-probability-06","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","simple-probability","probability","simple"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["3/5","2/3","1/10","2/5"],"correctIndex":3}'::jsonb,
  '{"summary":"Probability is favorable outcomes over total outcomes.","strategy":"Count the red marbles. Count the total marbles. Write favorable over total."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"If the probability of event A is 1/3 and the probability of event B is 1/4, what is P(A and B) if the events are independent?","body":"If the probability of event A is 1/3 and the probability of event B is 1/4, what is P(A and B) if the events are independent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: independent-events","promptText":"If the probability of event A is 1/3 and the probability of event B is 1/4, what is P(A and B) if the events are independent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: independent-events","metadata":{"questionKey":"math-probability-and-conditional-probability-07","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","independent-events","probability","independent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1/3","1/4","1/12","1/7"],"correctIndex":2}'::jsonb,
  '{"summary":"Multiply the probabilities of independent events.","strategy":"Identify that the events are independent. Multiply the probabilities. Write the product as a fraction."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A table shows 9 students who play an instrument, and 4 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?","body":"A table shows 9 students who play an instrument, and 4 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?\n\ninstrument: 9\n\nchoir: 4\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: conditional-probability","promptText":"A table shows 9 students who play an instrument, and 4 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?\n\ninstrument: 9\n\nchoir: 4\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: conditional-probability","metadata":{"questionKey":"math-probability-and-conditional-probability-08","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","conditional-probability","probability","conditional"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1/9","4/9","4/13","9/13"],"correctIndex":1}'::jsonb,
  '{"summary":"Conditional probability uses the restricted group as the denominator.","strategy":"Use only the students who play an instrument as the total. Count the students in choir among that group. Write favorable over the restricted total."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"If the probability of rain is 5/12, what is the probability of no rain?","body":"If the probability of rain is 5/12, what is the probability of no rain?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: complement","promptText":"If the probability of rain is 5/12, what is the probability of no rain?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: complement","metadata":{"questionKey":"math-probability-and-conditional-probability-09","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","complement","probability","complement"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7/12","5/12","12/5","1/12"],"correctIndex":0}'::jsonb,
  '{"summary":"Use 1 minus the probability of rain.","strategy":"Treat the complement as the opposite event. Subtract the probability from 1. Write the result as a fraction."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A class has 14 students, of whom 4 are left-handed. What is the probability that a randomly chosen student is left-handed?","body":"A class has 14 students, of whom 4 are left-handed. What is the probability that a randomly chosen student is left-handed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: two-step-counting","promptText":"A class has 14 students, of whom 4 are left-handed. What is the probability that a randomly chosen student is left-handed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: two-step-counting","metadata":{"questionKey":"math-probability-and-conditional-probability-10","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","two-step-counting","probability","counting"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5/7","4/5","1/14","2/7"],"correctIndex":3}'::jsonb,
  '{"summary":"Use the count of left-handed students over the total number of students.","strategy":"Count favorable outcomes. Count the total outcomes. Write the probability as a fraction."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A bag contains 5 red marbles and 7 blue marbles. What is the probability of selecting a red marble?","body":"A bag contains 5 red marbles and 7 blue marbles. What is the probability of selecting a red marble?\n\nred: 5\n\nblue: 7\n\ntotal: 12\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: simple-probability","promptText":"A bag contains 5 red marbles and 7 blue marbles. What is the probability of selecting a red marble?\n\nred: 5\n\nblue: 7\n\ntotal: 12\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: simple-probability","metadata":{"questionKey":"math-probability-and-conditional-probability-11","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","simple-probability","probability","simple"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5/7","1/12","5/12","7/12"],"correctIndex":2}'::jsonb,
  '{"summary":"Probability is favorable outcomes over total outcomes.","strategy":"Count the red marbles. Count the total marbles. Write favorable over total."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"If the probability of event A is 1/4 and the probability of event B is 1/5, what is P(A and B) if the events are independent?","body":"If the probability of event A is 1/4 and the probability of event B is 1/5, what is P(A and B) if the events are independent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: independent-events","promptText":"If the probability of event A is 1/4 and the probability of event B is 1/5, what is P(A and B) if the events are independent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: independent-events","metadata":{"questionKey":"math-probability-and-conditional-probability-12","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","independent-events","probability","independent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1/5","1/20","1/9","1/4"],"correctIndex":1}'::jsonb,
  '{"summary":"Multiply the probabilities of independent events.","strategy":"Identify that the events are independent. Multiply the probabilities. Write the product as a fraction."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A table shows 10 students who play an instrument, and 5 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?","body":"A table shows 10 students who play an instrument, and 5 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?\n\ninstrument: 10\n\nchoir: 5\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: conditional-probability","promptText":"A table shows 10 students who play an instrument, and 5 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?\n\ninstrument: 10\n\nchoir: 5\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: conditional-probability","metadata":{"questionKey":"math-probability-and-conditional-probability-13","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","conditional-probability","probability","conditional"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1/2","1/3","2/3","1/10"],"correctIndex":0}'::jsonb,
  '{"summary":"Conditional probability uses the restricted group as the denominator.","strategy":"Use only the students who play an instrument as the total. Count the students in choir among that group. Write favorable over the restricted total."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"If the probability of rain is 3/7, what is the probability of no rain?","body":"If the probability of rain is 3/7, what is the probability of no rain?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: complement","promptText":"If the probability of rain is 3/7, what is the probability of no rain?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: complement","metadata":{"questionKey":"math-probability-and-conditional-probability-14","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","complement","probability","complement"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["3/7","7/3","1/14","4/7"],"correctIndex":3}'::jsonb,
  '{"summary":"Use 1 minus the probability of rain.","strategy":"Treat the complement as the opposite event. Subtract the probability from 1. Write the result as a fraction."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A class has 16 students, of whom 5 are left-handed. What is the probability that a randomly chosen student is left-handed?","body":"A class has 16 students, of whom 5 are left-handed. What is the probability that a randomly chosen student is left-handed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: two-step-counting","promptText":"A class has 16 students, of whom 5 are left-handed. What is the probability that a randomly chosen student is left-handed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: two-step-counting","metadata":{"questionKey":"math-probability-and-conditional-probability-15","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","two-step-counting","probability","counting"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5/6","1/16","5/16","11/16"],"correctIndex":2}'::jsonb,
  '{"summary":"Use the count of left-handed students over the total number of students.","strategy":"Count favorable outcomes. Count the total outcomes. Write the probability as a fraction."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A bag contains 6 red marbles and 8 blue marbles. What is the probability of selecting a red marble?","body":"A bag contains 6 red marbles and 8 blue marbles. What is the probability of selecting a red marble?\n\nred: 6\n\nblue: 8\n\ntotal: 14\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: simple-probability","promptText":"A bag contains 6 red marbles and 8 blue marbles. What is the probability of selecting a red marble?\n\nred: 6\n\nblue: 8\n\ntotal: 14\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: simple-probability","metadata":{"questionKey":"math-probability-and-conditional-probability-16","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","simple-probability","probability","simple"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1/14","3/7","4/7","3/4"],"correctIndex":1}'::jsonb,
  '{"summary":"Probability is favorable outcomes over total outcomes.","strategy":"Count the red marbles. Count the total marbles. Write favorable over total."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"If the probability of event A is 1/5 and the probability of event B is 1/6, what is P(A and B) if the events are independent?","body":"If the probability of event A is 1/5 and the probability of event B is 1/6, what is P(A and B) if the events are independent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: independent-events","promptText":"If the probability of event A is 1/5 and the probability of event B is 1/6, what is P(A and B) if the events are independent?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: independent-events","metadata":{"questionKey":"math-probability-and-conditional-probability-17","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","independent-events","probability","independent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1/30","1/11","1/5","1/6"],"correctIndex":0}'::jsonb,
  '{"summary":"Multiply the probabilities of independent events.","strategy":"Identify that the events are independent. Multiply the probabilities. Write the product as a fraction."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A table shows 11 students who play an instrument, and 6 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?","body":"A table shows 11 students who play an instrument, and 6 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?\n\ninstrument: 11\n\nchoir: 6\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: conditional-probability","promptText":"A table shows 11 students who play an instrument, and 6 of those students are also in choir. If a student is selected at random from the instrument players, what is the probability that the student is in choir?\n\ninstrument: 11\n\nchoir: 6\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: conditional-probability","metadata":{"questionKey":"math-probability-and-conditional-probability-18","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","conditional-probability","probability","conditional"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6/17","11/17","1/11","6/11"],"correctIndex":3}'::jsonb,
  '{"summary":"Conditional probability uses the restricted group as the denominator.","strategy":"Use only the students who play an instrument as the total. Count the students in choir among that group. Write favorable over the restricted total."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"If the probability of rain is 7/16, what is the probability of no rain?","body":"If the probability of rain is 7/16, what is the probability of no rain?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: complement","promptText":"If the probability of rain is 7/16, what is the probability of no rain?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: complement","metadata":{"questionKey":"math-probability-and-conditional-probability-19","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","complement","probability","complement"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["16/7","1/16","9/16","7/16"],"correctIndex":2}'::jsonb,
  '{"summary":"Use 1 minus the probability of rain.","strategy":"Treat the complement as the opposite event. Subtract the probability from 1. Write the result as a fraction."}'::jsonb,
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
    and c.slug = 'probability-and-conditional-probability'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A class has 18 students, of whom 6 are left-handed. What is the probability that a randomly chosen student is left-handed?","body":"A class has 18 students, of whom 6 are left-handed. What is the probability that a randomly chosen student is left-handed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: two-step-counting","promptText":"A class has 18 students, of whom 6 are left-handed. What is the probability that a randomly chosen student is left-handed?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: two-step-counting","metadata":{"questionKey":"math-probability-and-conditional-probability-20","generationSource":"generated_from_research","tags":["math","problem-solving-and-data-analysis","probability-and-conditional-probability","two-step-counting","probability","counting"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1/18","1/3","2/3","6/7"],"correctIndex":1}'::jsonb,
  '{"summary":"Use the count of left-handed students over the total number of students.","strategy":"Count favorable outcomes. Count the total outcomes. Write the probability as a fraction."}'::jsonb,
  true,
  false,
  'published', now()
from taxonomy;

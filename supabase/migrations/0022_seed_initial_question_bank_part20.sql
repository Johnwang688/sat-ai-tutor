-- Continuation of initial question bank seed (part 20 of 20).
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
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A right triangle has legs 5 and 6. What is the length of the hypotenuse?","body":"A right triangle has legs 5 and 6. What is the length of the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: pythagorean-theorem","promptText":"A right triangle has legs 5 and 6. What is the length of the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: pythagorean-theorem","metadata":{"questionKey":"math-right-triangles-and-trigonometry-11","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","pythagorean-theorem","right-triangle","pythagorean"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["1","30","7.810249675906654","11"],"correctIndex":2}'::jsonb,
  '{"summary":"Use the Pythagorean theorem a^2 + b^2 = c^2.","strategy":"Square both legs. Add the squares. Take the square root."}'::jsonb,
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
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"In a 45-45-90 triangle, one leg is 7. What is the hypotenuse?","body":"In a 45-45-90 triangle, one leg is 7. What is the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: special-right-triangle","promptText":"In a 45-45-90 triangle, one leg is 7. What is the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: special-right-triangle","metadata":{"questionKey":"math-right-triangles-and-trigonometry-12","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","special-right-triangle","special-triangle","hypotenuse"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7sqrt3","7sqrt2","14","7/2"],"correctIndex":1}'::jsonb,
  '{"summary":"In a 45-45-90 triangle, the hypotenuse equals a leg times sqrt2.","strategy":"Recall the side ratio 1:1:sqrt2. Multiply the leg by sqrt2. Write the hypotenuse."}'::jsonb,
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
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"In a right triangle, the side opposite the angle is 5 and the adjacent side is 6. What is tan of the angle?","body":"In a right triangle, the side opposite the angle is 5 and the adjacent side is 6. What is tan of the angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: trig-ratio","promptText":"In a right triangle, the side opposite the angle is 5 and the adjacent side is 6. What is tan of the angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: trig-ratio","metadata":{"questionKey":"math-right-triangles-and-trigonometry-13","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","trig-ratio","trigonometry","tangent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5/6","6/5","5/11","1/6"],"correctIndex":0}'::jsonb,
  '{"summary":"Tangent equals opposite over adjacent.","strategy":"Identify the opposite side. Identify the adjacent side. Write opposite over adjacent."}'::jsonb,
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
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A tree casts a shadow of length 10. The angle of elevation to the top is 40 degrees. Which trig ratio would relate the tree''s height and the shadow?","body":"A tree casts a shadow of length 10. The angle of elevation to the top is 40 degrees. Which trig ratio would relate the tree''s height and the shadow?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: angle-of-elevation","promptText":"A tree casts a shadow of length 10. The angle of elevation to the top is 40 degrees. Which trig ratio would relate the tree''s height and the shadow?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: angle-of-elevation","metadata":{"questionKey":"math-right-triangles-and-trigonometry-14","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","angle-of-elevation","trigonometry","elevation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["sin","cos","sec","tan"],"correctIndex":3}'::jsonb,
  '{"summary":"Use tangent to relate opposite and adjacent sides in an angle-of-elevation problem.","strategy":"Identify the opposite side as the height. Identify the adjacent side as the shadow. Use tangent."}'::jsonb,
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
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"For angle A in a right triangle, which ratio equals sin(angle A)?","body":"For angle A in a right triangle, which ratio equals sin(angle A)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: ratio-selection","promptText":"For angle A in a right triangle, which ratio equals sin(angle A)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: ratio-selection","metadata":{"questionKey":"math-right-triangles-and-trigonometry-15","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","ratio-selection","trigonometry","sine"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["opposite / adjacent","hypotenuse / opposite","opposite / hypotenuse","adjacent / hypotenuse"],"correctIndex":2}'::jsonb,
  '{"summary":"Sine is opposite over hypotenuse.","strategy":"Recall SOH-CAH-TOA. Match sine with opposite over hypotenuse. Choose the matching ratio."}'::jsonb,
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
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A right triangle has legs 6 and 7. What is the length of the hypotenuse?","body":"A right triangle has legs 6 and 7. What is the length of the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: pythagorean-theorem","promptText":"A right triangle has legs 6 and 7. What is the length of the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: pythagorean-theorem","metadata":{"questionKey":"math-right-triangles-and-trigonometry-16","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","pythagorean-theorem","right-triangle","pythagorean"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["42","9.219544457292887","13","1"],"correctIndex":1}'::jsonb,
  '{"summary":"Use the Pythagorean theorem a^2 + b^2 = c^2.","strategy":"Square both legs. Add the squares. Take the square root."}'::jsonb,
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
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"In a 45-45-90 triangle, one leg is 8. What is the hypotenuse?","body":"In a 45-45-90 triangle, one leg is 8. What is the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: special-right-triangle","promptText":"In a 45-45-90 triangle, one leg is 8. What is the hypotenuse?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: special-right-triangle","metadata":{"questionKey":"math-right-triangles-and-trigonometry-17","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","special-right-triangle","special-triangle","hypotenuse"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["8sqrt2","16","8/2","8sqrt3"],"correctIndex":0}'::jsonb,
  '{"summary":"In a 45-45-90 triangle, the hypotenuse equals a leg times sqrt2.","strategy":"Recall the side ratio 1:1:sqrt2. Multiply the leg by sqrt2. Write the hypotenuse."}'::jsonb,
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
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"In a right triangle, the side opposite the angle is 6 and the adjacent side is 7. What is tan of the angle?","body":"In a right triangle, the side opposite the angle is 6 and the adjacent side is 7. What is tan of the angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: trig-ratio","promptText":"In a right triangle, the side opposite the angle is 6 and the adjacent side is 7. What is tan of the angle?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: trig-ratio","metadata":{"questionKey":"math-right-triangles-and-trigonometry-18","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","trig-ratio","trigonometry","tangent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7/6","6/13","1/7","6/7"],"correctIndex":3}'::jsonb,
  '{"summary":"Tangent equals opposite over adjacent.","strategy":"Identify the opposite side. Identify the adjacent side. Write opposite over adjacent."}'::jsonb,
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
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A tree casts a shadow of length 11. The angle of elevation to the top is 45 degrees. Which trig ratio would relate the tree''s height and the shadow?","body":"A tree casts a shadow of length 11. The angle of elevation to the top is 45 degrees. Which trig ratio would relate the tree''s height and the shadow?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: angle-of-elevation","promptText":"A tree casts a shadow of length 11. The angle of elevation to the top is 45 degrees. Which trig ratio would relate the tree''s height and the shadow?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: angle-of-elevation","metadata":{"questionKey":"math-right-triangles-and-trigonometry-19","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","angle-of-elevation","trigonometry","elevation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["cos","sec","tan","sin"],"correctIndex":2}'::jsonb,
  '{"summary":"Use tangent to relate opposite and adjacent sides in an angle-of-elevation problem.","strategy":"Identify the opposite side as the height. Identify the adjacent side as the shadow. Use tangent."}'::jsonb,
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
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'right-triangles-and-trigonometry'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"For angle B in a right triangle, which ratio equals sin(angle B)?","body":"For angle B in a right triangle, which ratio equals sin(angle B)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: ratio-selection","promptText":"For angle B in a right triangle, which ratio equals sin(angle B)?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: ratio-selection","metadata":{"questionKey":"math-right-triangles-and-trigonometry-20","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","right-triangles-and-trigonometry","ratio-selection","trigonometry","sine"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["hypotenuse / opposite","opposite / hypotenuse","adjacent / hypotenuse","opposite / adjacent"],"correctIndex":1}'::jsonb,
  '{"summary":"Sine is opposite over hypotenuse.","strategy":"Recall SOH-CAH-TOA. Match sine with opposite over hypotenuse. Choose the matching ratio."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"What is the circumference of a circle with radius 3? Use pi.","body":"What is the circumference of a circle with radius 3? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: circumference","promptText":"What is the circumference of a circle with radius 3? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: circumference","metadata":{"questionKey":"math-circles-01","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","circumference","circle","circumference"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6pi","3pi","9pi","12pi"],"correctIndex":0}'::jsonb,
  '{"summary":"Circumference is 2pi times the radius.","strategy":"Use the circumference formula. Substitute the radius. Write the result in terms of pi."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"A circle has radius 4. What is the arc length of a 60 degree arc? Use pi.","body":"A circle has radius 4. What is the arc length of a 60 degree arc? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: arc-length","promptText":"A circle has radius 4. What is the arc length of a 60 degree arc? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: arc-length","metadata":{"questionKey":"math-circles-02","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","arc-length","circle","arc-length"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["0.16666666666666666pi","16pi","8pi","1.3333333333333333pi"],"correctIndex":3}'::jsonb,
  '{"summary":"Arc length is the same fraction of the circumference as the central angle is of 360 degrees.","strategy":"Find the fraction of the full circle. Multiply that fraction by the circumference. Write the arc length."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"What is the area of a 90 degree sector in a circle with radius 5? Use pi.","body":"What is the area of a 90 degree sector in a circle with radius 5? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: sector-area","promptText":"What is the area of a 90 degree sector in a circle with radius 5? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: sector-area","metadata":{"questionKey":"math-circles-03","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","sector-area","circle","sector"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["0.25pi","10pi","6.25pi","25pi"],"correctIndex":2}'::jsonb,
  '{"summary":"Sector area is the same fraction of the circle''s area as the angle is of 360 degrees.","strategy":"Find the fraction of the whole circle. Multiply that fraction by pi r^2. Write the sector area."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Which equation represents a circle with center (2, -3) and radius 4?","body":"Which equation represents a circle with center (2, -3) and radius 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: circle-equation","promptText":"Which equation represents a circle with center (2, -3) and radius 4?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: circle-equation","metadata":{"questionKey":"math-circles-04","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","circle-equation","circle","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(x - 4)^2 + (y - 4)^2 = 13","(x - 2)^2 + (y + 3)^2 = 16","(x + 2)^2 + (y + 3)^2 = 4","(x - 2)^2 + (y - 3)^2 = 4"],"correctIndex":1}'::jsonb,
  '{"summary":"A circle equation uses (x - h)^2 + (y - k)^2 = r^2.","strategy":"Identify the center. Substitute the center coordinates into the equation. Square the radius."}'::jsonb,
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
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A circle has radius 6. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?","body":"A circle has radius 6. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: tangent-radius","promptText":"A circle has radius 6. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: tangent-radius","metadata":{"questionKey":"math-circles-05","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","tangent-radius","circle","tangent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["They are perpendicular","They are parallel","They are congruent","They form a 60 degree angle"],"correctIndex":0}'::jsonb,
  '{"summary":"A radius drawn to the point of tangency is perpendicular to the tangent line.","strategy":"Identify the point of tangency. Recall the tangent-radius theorem. The lines meet at a right angle."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"What is the circumference of a circle with radius 4? Use pi.","body":"What is the circumference of a circle with radius 4? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: circumference","promptText":"What is the circumference of a circle with radius 4? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: circumference","metadata":{"questionKey":"math-circles-06","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","circumference","circle","circumference"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["4pi","16pi","16pi","8pi"],"correctIndex":3}'::jsonb,
  '{"summary":"Circumference is 2pi times the radius.","strategy":"Use the circumference formula. Substitute the radius. Write the result in terms of pi."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A circle has radius 5. What is the arc length of a 70 degree arc? Use pi.","body":"A circle has radius 5. What is the arc length of a 70 degree arc? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: arc-length","promptText":"A circle has radius 5. What is the arc length of a 70 degree arc? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: arc-length","metadata":{"questionKey":"math-circles-07","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","arc-length","circle","arc-length"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["25pi","10pi","1.9444444444444444pi","0.19444444444444445pi"],"correctIndex":2}'::jsonb,
  '{"summary":"Arc length is the same fraction of the circumference as the central angle is of 360 degrees.","strategy":"Find the fraction of the full circle. Multiply that fraction by the circumference. Write the arc length."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"What is the area of a 100 degree sector in a circle with radius 6? Use pi.","body":"What is the area of a 100 degree sector in a circle with radius 6? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: sector-area","promptText":"What is the area of a 100 degree sector in a circle with radius 6? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: sector-area","metadata":{"questionKey":"math-circles-08","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","sector-area","circle","sector"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12pi","10pi","36pi","0.2777777777777778pi"],"correctIndex":1}'::jsonb,
  '{"summary":"Sector area is the same fraction of the circle''s area as the angle is of 360 degrees.","strategy":"Find the fraction of the whole circle. Multiply that fraction by pi r^2. Write the sector area."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which equation represents a circle with center (3, -4) and radius 5?","body":"Which equation represents a circle with center (3, -4) and radius 5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: circle-equation","promptText":"Which equation represents a circle with center (3, -4) and radius 5?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: circle-equation","metadata":{"questionKey":"math-circles-09","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","circle-equation","circle","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(x - 3)^2 + (y + 4)^2 = 25","(x + 3)^2 + (y + 4)^2 = 5","(x - 3)^2 + (y - 4)^2 = 5","(x - 5)^2 + (y - 5)^2 = 25"],"correctIndex":0}'::jsonb,
  '{"summary":"A circle equation uses (x - h)^2 + (y - k)^2 = r^2.","strategy":"Identify the center. Substitute the center coordinates into the equation. Square the radius."}'::jsonb,
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
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A circle has radius 7. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?","body":"A circle has radius 7. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: tangent-radius","promptText":"A circle has radius 7. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: tangent-radius","metadata":{"questionKey":"math-circles-10","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","tangent-radius","circle","tangent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["They are parallel","They are congruent","They form a 60 degree angle","They are perpendicular"],"correctIndex":3}'::jsonb,
  '{"summary":"A radius drawn to the point of tangency is perpendicular to the tangent line.","strategy":"Identify the point of tangency. Recall the tangent-radius theorem. The lines meet at a right angle."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"What is the circumference of a circle with radius 5? Use pi.","body":"What is the circumference of a circle with radius 5? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: circumference","promptText":"What is the circumference of a circle with radius 5? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: circumference","metadata":{"questionKey":"math-circles-11","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","circumference","circle","circumference"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["25pi","20pi","10pi","5pi"],"correctIndex":2}'::jsonb,
  '{"summary":"Circumference is 2pi times the radius.","strategy":"Use the circumference formula. Substitute the radius. Write the result in terms of pi."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A circle has radius 6. What is the arc length of a 80 degree arc? Use pi.","body":"A circle has radius 6. What is the arc length of a 80 degree arc? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: arc-length","promptText":"A circle has radius 6. What is the arc length of a 80 degree arc? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: arc-length","metadata":{"questionKey":"math-circles-12","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","arc-length","circle","arc-length"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["12pi","2.6666666666666665pi","0.2222222222222222pi","36pi"],"correctIndex":1}'::jsonb,
  '{"summary":"Arc length is the same fraction of the circumference as the central angle is of 360 degrees.","strategy":"Find the fraction of the full circle. Multiply that fraction by the circumference. Write the arc length."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"What is the area of a 110 degree sector in a circle with radius 7? Use pi.","body":"What is the area of a 110 degree sector in a circle with radius 7? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: sector-area","promptText":"What is the area of a 110 degree sector in a circle with radius 7? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: sector-area","metadata":{"questionKey":"math-circles-13","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","sector-area","circle","sector"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["14.972222222222221pi","49pi","0.3055555555555556pi","14pi"],"correctIndex":0}'::jsonb,
  '{"summary":"Sector area is the same fraction of the circle''s area as the angle is of 360 degrees.","strategy":"Find the fraction of the whole circle. Multiply that fraction by pi r^2. Write the sector area."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Which equation represents a circle with center (4, -5) and radius 6?","body":"Which equation represents a circle with center (4, -5) and radius 6?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: circle-equation","promptText":"Which equation represents a circle with center (4, -5) and radius 6?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: circle-equation","metadata":{"questionKey":"math-circles-14","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","circle-equation","circle","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(x + 4)^2 + (y + 5)^2 = 6","(x - 4)^2 + (y - 5)^2 = 6","(x - 6)^2 + (y - 6)^2 = 41","(x - 4)^2 + (y + 5)^2 = 36"],"correctIndex":3}'::jsonb,
  '{"summary":"A circle equation uses (x - h)^2 + (y - k)^2 = r^2.","strategy":"Identify the center. Substitute the center coordinates into the equation. Square the radius."}'::jsonb,
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
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A circle has radius 8. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?","body":"A circle has radius 8. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: tangent-radius","promptText":"A circle has radius 8. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: tangent-radius","metadata":{"questionKey":"math-circles-15","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","tangent-radius","circle","tangent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["They are congruent","They form a 60 degree angle","They are perpendicular","They are parallel"],"correctIndex":2}'::jsonb,
  '{"summary":"A radius drawn to the point of tangency is perpendicular to the tangent line.","strategy":"Identify the point of tangency. Recall the tangent-radius theorem. The lines meet at a right angle."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"What is the circumference of a circle with radius 6? Use pi.","body":"What is the circumference of a circle with radius 6? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: circumference","promptText":"What is the circumference of a circle with radius 6? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: circumference","metadata":{"questionKey":"math-circles-16","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","circumference","circle","circumference"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["24pi","12pi","6pi","36pi"],"correctIndex":1}'::jsonb,
  '{"summary":"Circumference is 2pi times the radius.","strategy":"Use the circumference formula. Substitute the radius. Write the result in terms of pi."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A circle has radius 7. What is the arc length of a 90 degree arc? Use pi.","body":"A circle has radius 7. What is the arc length of a 90 degree arc? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: arc-length","promptText":"A circle has radius 7. What is the arc length of a 90 degree arc? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: arc-length","metadata":{"questionKey":"math-circles-17","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","arc-length","circle","arc-length"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["3.5pi","0.25pi","49pi","14pi"],"correctIndex":0}'::jsonb,
  '{"summary":"Arc length is the same fraction of the circumference as the central angle is of 360 degrees.","strategy":"Find the fraction of the full circle. Multiply that fraction by the circumference. Write the arc length."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"What is the area of a 120 degree sector in a circle with radius 8? Use pi.","body":"What is the area of a 120 degree sector in a circle with radius 8? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: sector-area","promptText":"What is the area of a 120 degree sector in a circle with radius 8? Use pi.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: sector-area","metadata":{"questionKey":"math-circles-18","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","sector-area","circle","sector"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["64pi","0.3333333333333333pi","16pi","21.333333333333332pi"],"correctIndex":3}'::jsonb,
  '{"summary":"Sector area is the same fraction of the circle''s area as the angle is of 360 degrees.","strategy":"Find the fraction of the whole circle. Multiply that fraction by pi r^2. Write the sector area."}'::jsonb,
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
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Which equation represents a circle with center (5, -6) and radius 7?","body":"Which equation represents a circle with center (5, -6) and radius 7?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: circle-equation","promptText":"Which equation represents a circle with center (5, -6) and radius 7?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: circle-equation","metadata":{"questionKey":"math-circles-19","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","circle-equation","circle","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["(x - 5)^2 + (y - 6)^2 = 7","(x - 7)^2 + (y - 7)^2 = 61","(x - 5)^2 + (y + 6)^2 = 49","(x + 5)^2 + (y + 6)^2 = 7"],"correctIndex":2}'::jsonb,
  '{"summary":"A circle equation uses (x - h)^2 + (y - k)^2 = r^2.","strategy":"Identify the center. Substitute the center coordinates into the equation. Square the radius."}'::jsonb,
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
    and d.slug = 'geometry-and-trigonometry'
    and c.slug = 'circles'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A circle has radius 9. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?","body":"A circle has radius 9. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: tangent-radius","promptText":"A circle has radius 9. A tangent line touches the circle at point P. What is the relationship between the tangent line and the radius drawn to P?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: tangent-radius","metadata":{"questionKey":"math-circles-20","generationSource":"generated_from_research","tags":["math","geometry-and-trigonometry","circles","tangent-radius","circle","tangent"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["They form a 60 degree angle","They are perpendicular","They are parallel","They are congruent"],"correctIndex":1}'::jsonb,
  '{"summary":"A radius drawn to the point of tangency is perpendicular to the tangent line.","strategy":"Identify the point of tangency. Recall the tangent-radius theorem. The lines meet at a right angle."}'::jsonb,
  true,
  false,
  'published', now()
from taxonomy;


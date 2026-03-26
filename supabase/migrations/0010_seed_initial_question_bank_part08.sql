-- Continuation of initial question bank seed (part 8 of 20).
-- Requires migrations 0001, 0002, and prior question-bank parts.

with taxonomy as (
  select
    s.id as section_id,
    d.id as domain_id,
    c.id as concept_id
  from public.sections s
  join public.domains d on d.section_id = s.id
  join public.concepts c on c.domain_id = d.id
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-form-structure-and-sense-grammar',
  '{"stem":"Walking down the hall, ____ the posters on the wall.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: modifiers\n\nlabel: modifiers\n\nWalking down the hall, ____ the posters on the wall.\n\nfocus: modifier","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: modifiers\n\nlabel: modifiers\n\nWalking down the hall, ____ the posters on the wall.\n\nfocus: modifier","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-11","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:modifiers"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["the posters caught her eye","she noticed the posters","the posters were noticed by her","the wall had posters"],"correctIndex":1}'::jsonb,
  '{"summary":"The modifier should clearly describe she.","whyCorrect":"The modifier should clearly describe she."}'::jsonb,
  false,
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
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-form-structure-and-sense-grammar',
  '{"stem":"After studying for hours, ____ the exam felt manageable.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: modifiers\n\nlabel: modifiers\n\nAfter studying for hours, ____ the exam felt manageable.\n\nfocus: modifier","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: modifiers\n\nlabel: modifiers\n\nAfter studying for hours, ____ the exam felt manageable.\n\nfocus: modifier","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-12","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:modifiers"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["the exam","she found","the notes","the clock"],"correctIndex":1}'::jsonb,
  '{"summary":"The subject of the modifier should be she.","whyCorrect":"The subject of the modifier should be she."}'::jsonb,
  false,
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
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-form-structure-and-sense-grammar',
  '{"stem":"The book on the table ____ belongs to my sister.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: modifiers\n\nlabel: modifiers\n\nThe book on the table ____ belongs to my sister.\n\nfocus: modifier","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: modifiers\n\nlabel: modifiers\n\nThe book on the table ____ belongs to my sister.\n\nfocus: modifier","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-13","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:modifiers"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["that","which","who","whom"],"correctIndex":0}'::jsonb,
  '{"summary":"That correctly introduces the clause modifying book.","whyCorrect":"That correctly introduces the clause modifying book."}'::jsonb,
  false,
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
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-form-structure-and-sense-grammar',
  '{"stem":"To make the instructions easier to follow, ____ the first two steps.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: modifiers\n\nlabel: modifiers\n\nTo make the instructions easier to follow, ____ the first two steps.\n\nfocus: modifier","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: modifiers\n\nlabel: modifiers\n\nTo make the instructions easier to follow, ____ the first two steps.\n\nfocus: modifier","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-14","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:modifiers"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["the teacher rewrote","rewriting","the first two steps were","the teacher was rewritten"],"correctIndex":0}'::jsonb,
  '{"summary":"The sentence needs a clear subject before the verb.","whyCorrect":"The sentence needs a clear subject before the verb."}'::jsonb,
  false,
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
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-form-structure-and-sense-grammar',
  '{"stem":"Pressed by the wind, ____ the tent flap closed.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: modifiers\n\nlabel: modifiers\n\nPressed by the wind, ____ the tent flap closed.\n\nfocus: modifier","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: modifiers\n\nlabel: modifiers\n\nPressed by the wind, ____ the tent flap closed.\n\nfocus: modifier","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-15","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:modifiers"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["the campers","the tent","the flap","the wind"],"correctIndex":0}'::jsonb,
  '{"summary":"The campers are the ones pressed by the wind and can act.","whyCorrect":"The campers are the ones pressed by the wind and can act."}'::jsonb,
  false,
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
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-form-structure-and-sense-grammar',
  '{"stem":"By the time the guests arrived, the volunteers ____ the tables.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: tense-and-pronouns\n\nlabel: tense and pronouns\n\nBy the time the guests arrived, the volunteers ____ the tables.\n\nfocus: tense","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: tense-and-pronouns\n\nlabel: tense and pronouns\n\nBy the time the guests arrived, the volunteers ____ the tables.\n\nfocus: tense","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-16","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:tense-and-pronouns"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["set","had set","have set","will set"],"correctIndex":1}'::jsonb,
  '{"summary":"Past perfect shows the earlier action completed before arrival.","whyCorrect":"Past perfect shows the earlier action completed before arrival."}'::jsonb,
  false,
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
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-form-structure-and-sense-grammar',
  '{"stem":"The committee said that each member should bring ____ own notes.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: tense-and-pronouns\n\nlabel: tense and pronouns\n\nThe committee said that each member should bring ____ own notes.\n\nfocus: pronoun","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: tense-and-pronouns\n\nlabel: tense and pronouns\n\nThe committee said that each member should bring ____ own notes.\n\nfocus: pronoun","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-17","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:tense-and-pronouns"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["their","its","his or her","theirs"],"correctIndex":2}'::jsonb,
  '{"summary":"His or her is the clearest singular pronoun here.","whyCorrect":"His or her is the clearest singular pronoun here."}'::jsonb,
  false,
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
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-form-structure-and-sense-grammar',
  '{"stem":"When the class ____ the lab, it will receive safety instructions.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: tense-and-pronouns\n\nlabel: tense and pronouns\n\nWhen the class ____ the lab, it will receive safety instructions.\n\nfocus: tense","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: tense-and-pronouns\n\nlabel: tense and pronouns\n\nWhen the class ____ the lab, it will receive safety instructions.\n\nfocus: tense","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-18","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:tense-and-pronouns"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["enter","enters","entered","has entered"],"correctIndex":1}'::jsonb,
  '{"summary":"The present tense enters matches the conditional sentence.","whyCorrect":"The present tense enters matches the conditional sentence."}'::jsonb,
  false,
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
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-form-structure-and-sense-grammar',
  '{"stem":"The hikers brought backpacks that contained ____ maps and snacks.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: tense-and-pronouns\n\nlabel: tense and pronouns\n\nThe hikers brought backpacks that contained ____ maps and snacks.\n\nfocus: pronoun","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: tense-and-pronouns\n\nlabel: tense and pronouns\n\nThe hikers brought backpacks that contained ____ maps and snacks.\n\nfocus: pronoun","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-19","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:tense-and-pronouns"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["its","their","it''s","theirs"],"correctIndex":1}'::jsonb,
  '{"summary":"The plural hikers need the plural possessive their.","whyCorrect":"The plural hikers need the plural possessive their."}'::jsonb,
  false,
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
  where s.slug = 'reading-writing'
    and d.slug = 'standard-english-conventions'
    and c.slug = 'form-structure-and-sense-grammar'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-form-structure-and-sense-grammar',
  '{"stem":"Before the lights dimmed, the orchestra ____ the final chord.","body":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: tense-and-pronouns\n\nlabel: tense and pronouns\n\nBefore the lights dimmed, the orchestra ____ the final chord.\n\nfocus: tense","promptText":"kind: rw-form-structure-and-sense-grammar\n\nthemeId: tense-and-pronouns\n\nlabel: tense and pronouns\n\nBefore the lights dimmed, the orchestra ____ the final chord.\n\nfocus: tense","metadata":{"questionKey":"rw-form-structure-and-sense-grammar-20","generationSource":"generated_from_research","tags":["reading-writing","form-structure-and-sense-grammar","theme:tense-and-pronouns"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["plays","has played","played","will play"],"correctIndex":2}'::jsonb,
  '{"summary":"The completed past action needs the simple past tense.","whyCorrect":"The completed past action needs the simple past tense."}'::jsonb,
  false,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Solve for x: x + 4 = 11.","body":"Solve for x: x + 4 = 11.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: one-step-equation","promptText":"Solve for x: x + 4 = 11.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: one-step-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-01","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","one-step-equation","one-step","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7","8","5","10"],"correctIndex":0}'::jsonb,
  '{"summary":"Subtract the constant from both sides to isolate x.","strategy":"Subtract 4 from both sides. x = 7."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Solve for x: 3x - 4 = 12.","body":"Solve for x: 3x - 4 = 12.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: multiplication-equation","promptText":"Solve for x: 3x - 4 = 12.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: multiplication-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-02","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","multiplication-equation","one-variable","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["6.333333333333333","3.333333333333333","8.333333333333332","5.333333333333333"],"correctIndex":3}'::jsonb,
  '{"summary":"Add the constant term and divide by the coefficient of x.","strategy":"Add 4 to both sides. 3x = 16. Divide by 3."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"Solve for x: 2(x - 3) + 1 = 14.","body":"Solve for x: 2(x - 3) + 1 = 14.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: distribution-equation","promptText":"Solve for x: 2(x - 3) + 1 = 14.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: distribution-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-03","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","distribution-equation","distribution","linear-equations"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7.5","12.5","9.5","10.5"],"correctIndex":2}'::jsonb,
  '{"summary":"Distribute first, then combine like terms and isolate x.","strategy":"Distribute 2. Combine constants and move them to the other side. Divide by the coefficient of x."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Solve for x: 5x + 8 = 2x + 20.","body":"Solve for x: 5x + 8 = 2x + 20.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: variable-both-sides","promptText":"Solve for x: 5x + 8 = 2x + 20.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: variable-both-sides","metadata":{"questionKey":"math-linear-equations-in-one-variable-04","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","variable-both-sides","both-sides","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7","4","5","2"],"correctIndex":1}'::jsonb,
  '{"summary":"Move the variable terms to one side and the constants to the other side.","strategy":"Subtract 2x from both sides. Subtract 8 from both sides. Divide by the remaining coefficient."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  1, 'multiple_choice',
  '{"stem":"A studio charges a one-time fee of $12 plus $2 per class. If the total cost is $18, how many classes were taken?","body":"A studio charges a one-time fee of $12 plus $2 per class. If the total cost is $18, how many classes were taken?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: word-problem","promptText":"A studio charges a one-time fee of $12 plus $2 per class. If the total cost is $18, how many classes were taken?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: word-problem","metadata":{"questionKey":"math-linear-equations-in-one-variable-05","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","word-problem","word-problem","linear-equations"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["3","4","5","2"],"correctIndex":0}'::jsonb,
  '{"summary":"Set up a linear equation from the fixed fee and the per-class cost.","strategy":"Subtract the fixed fee. Divide by the cost per class. The result is 3."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'multiple_choice',
  '{"stem":"Solve for x: x + 5 = 14.","body":"Solve for x: x + 5 = 14.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: one-step-equation","promptText":"Solve for x: x + 5 = 14.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: easy\n\ntemplateKey: one-step-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-06","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","one-step-equation","one-step","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["11","6","13","9"],"correctIndex":3}'::jsonb,
  '{"summary":"Subtract the constant from both sides to isolate x.","strategy":"Subtract 5 from both sides. x = 9."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Solve for x: 4x - 5 = 16.","body":"Solve for x: 4x - 5 = 16.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: multiplication-equation","promptText":"Solve for x: 4x - 5 = 16.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: multiplication-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-07","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","multiplication-equation","one-variable","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["2.25","9.25","5.25","7.25"],"correctIndex":2}'::jsonb,
  '{"summary":"Add the constant term and divide by the coefficient of x.","strategy":"Add 5 to both sides. 4x = 21. Divide by 4."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Solve for x: 3(x - 4) + 2 = 17.","body":"Solve for x: 3(x - 4) + 2 = 17.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: distribution-equation","promptText":"Solve for x: 3(x - 4) + 2 = 17.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: distribution-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-08","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","distribution-equation","distribution","linear-equations"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["13","9","11","6"],"correctIndex":1}'::jsonb,
  '{"summary":"Distribute first, then combine like terms and isolate x.","strategy":"Distribute 3. Combine constants and move them to the other side. Divide by the coefficient of x."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Solve for x: 6x + 9 = 3x + 22.","body":"Solve for x: 6x + 9 = 3x + 22.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: variable-both-sides","promptText":"Solve for x: 6x + 9 = 3x + 22.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: variable-both-sides","metadata":{"questionKey":"math-linear-equations-in-one-variable-09","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","variable-both-sides","both-sides","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["4.333333333333333","6.333333333333333","1.333333333333333","8.333333333333332"],"correctIndex":0}'::jsonb,
  '{"summary":"Move the variable terms to one side and the constants to the other side.","strategy":"Subtract 3x from both sides. Subtract 9 from both sides. Divide by the remaining coefficient."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"A studio charges a one-time fee of $14 plus $3 per class. If the total cost is $26, how many classes were taken?","body":"A studio charges a one-time fee of $14 plus $3 per class. If the total cost is $26, how many classes were taken?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: word-problem","promptText":"A studio charges a one-time fee of $14 plus $3 per class. If the total cost is $26, how many classes were taken?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: word-problem","metadata":{"questionKey":"math-linear-equations-in-one-variable-10","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","word-problem","word-problem","linear-equations"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5","6","3","4"],"correctIndex":3}'::jsonb,
  '{"summary":"Set up a linear equation from the fixed fee and the per-class cost.","strategy":"Subtract the fixed fee. Divide by the cost per class. The result is 4."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Solve for x: x + 6 = 17.","body":"Solve for x: x + 6 = 17.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: one-step-equation","promptText":"Solve for x: x + 6 = 17.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: one-step-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-11","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","one-step-equation","one-step","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7","16","11","14"],"correctIndex":2}'::jsonb,
  '{"summary":"Subtract the constant from both sides to isolate x.","strategy":"Subtract 6 from both sides. x = 11."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Solve for x: 5x - 6 = 20.","body":"Solve for x: 5x - 6 = 20.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: multiplication-equation","promptText":"Solve for x: 5x - 6 = 20.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: multiplication-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-12","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","multiplication-equation","one-variable","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["10.2","5.2","8.2","1.2000000000000002"],"correctIndex":1}'::jsonb,
  '{"summary":"Add the constant term and divide by the coefficient of x.","strategy":"Add 6 to both sides. 5x = 26. Divide by 5."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Solve for x: 4(x - 5) + 3 = 20.","body":"Solve for x: 4(x - 5) + 3 = 20.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: distribution-equation","promptText":"Solve for x: 4(x - 5) + 3 = 20.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: distribution-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-13","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","distribution-equation","distribution","linear-equations"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["9.25","12.25","5.25","14.25"],"correctIndex":0}'::jsonb,
  '{"summary":"Distribute first, then combine like terms and isolate x.","strategy":"Distribute 4. Combine constants and move them to the other side. Divide by the coefficient of x."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'multiple_choice',
  '{"stem":"Solve for x: 7x + 10 = 4x + 24.","body":"Solve for x: 7x + 10 = 4x + 24.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: variable-both-sides","promptText":"Solve for x: 7x + 10 = 4x + 24.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: medium\n\ntemplateKey: variable-both-sides","metadata":{"questionKey":"math-linear-equations-in-one-variable-14","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","variable-both-sides","both-sides","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7.666666666666667","0.666666666666667","9.666666666666668","4.666666666666667"],"correctIndex":3}'::jsonb,
  '{"summary":"Move the variable terms to one side and the constants to the other side.","strategy":"Subtract 4x from both sides. Subtract 10 from both sides. Divide by the remaining coefficient."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"A studio charges a one-time fee of $16 plus $4 per class. If the total cost is $36, how many classes were taken?","body":"A studio charges a one-time fee of $16 plus $4 per class. If the total cost is $36, how many classes were taken?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: word-problem","promptText":"A studio charges a one-time fee of $16 plus $4 per class. If the total cost is $36, how many classes were taken?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: word-problem","metadata":{"questionKey":"math-linear-equations-in-one-variable-15","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","word-problem","word-problem","linear-equations"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["7","4","5","6"],"correctIndex":2}'::jsonb,
  '{"summary":"Set up a linear equation from the fixed fee and the per-class cost.","strategy":"Subtract the fixed fee. Divide by the cost per class. The result is 5."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Solve for x: x + 7 = 20.","body":"Solve for x: x + 7 = 20.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: one-step-equation","promptText":"Solve for x: x + 7 = 20.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: one-step-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-16","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","one-step-equation","one-step","equation"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["19","13","17","8"],"correctIndex":1}'::jsonb,
  '{"summary":"Subtract the constant from both sides to isolate x.","strategy":"Subtract 7 from both sides. x = 13."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Solve for x: 6x - 7 = 24.","body":"Solve for x: 6x - 7 = 24.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: multiplication-equation","promptText":"Solve for x: 6x - 7 = 24.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: multiplication-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-17","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","multiplication-equation","one-variable","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5.166666666666667","9.166666666666668","0.16666666666666696","11.166666666666668"],"correctIndex":0}'::jsonb,
  '{"summary":"Add the constant term and divide by the coefficient of x.","strategy":"Add 7 to both sides. 6x = 31. Divide by 6."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"Solve for x: 5(x - 6) + 4 = 23.","body":"Solve for x: 5(x - 6) + 4 = 23.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: distribution-equation","promptText":"Solve for x: 5(x - 6) + 4 = 23.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: distribution-equation","metadata":{"questionKey":"math-linear-equations-in-one-variable-18","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","distribution-equation","distribution","linear-equations"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["13.8","4.800000000000001","15.8","9.8"],"correctIndex":3}'::jsonb,
  '{"summary":"Distribute first, then combine like terms and isolate x.","strategy":"Distribute 5. Combine constants and move them to the other side. Divide by the coefficient of x."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'multiple_choice',
  '{"stem":"Solve for x: 8x + 11 = 5x + 26.","body":"Solve for x: 8x + 11 = 5x + 26.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: variable-both-sides","promptText":"Solve for x: 8x + 11 = 5x + 26.\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: variable-both-sides","metadata":{"questionKey":"math-linear-equations-in-one-variable-19","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","variable-both-sides","both-sides","solve"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["0","11","5","9"],"correctIndex":2}'::jsonb,
  '{"summary":"Move the variable terms to one side and the constants to the other side.","strategy":"Subtract 5x from both sides. Subtract 11 from both sides. Divide by the remaining coefficient."}'::jsonb,
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
    and c.slug = 'linear-equations-in-one-variable'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  5, 'multiple_choice',
  '{"stem":"A studio charges a one-time fee of $18 plus $5 per class. If the total cost is $48, how many classes were taken?","body":"A studio charges a one-time fee of $18 plus $5 per class. If the total cost is $48, how many classes were taken?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: word-problem","promptText":"A studio charges a one-time fee of $18 plus $5 per class. If the total cost is $48, how many classes were taken?\n\ngenerationSource: generated_from_research\n\ndifficultyBand: hard\n\ntemplateKey: word-problem","metadata":{"questionKey":"math-linear-equations-in-one-variable-20","generationSource":"generated_from_research","tags":["math","algebra","linear-equations-in-one-variable","word-problem","word-problem","linear-equations"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["5","6","7","8"],"correctIndex":1}'::jsonb,
  '{"summary":"Set up a linear equation from the fixed fee and the per-class cost.","strategy":"Subtract the fixed fee. Divide by the cost per class. The result is 6."}'::jsonb,
  true,
  false,
  'published', now()
from taxonomy;

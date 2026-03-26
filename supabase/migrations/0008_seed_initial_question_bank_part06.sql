-- Continuation of initial question bank seed (part 6 of 20).
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-transitions',
  '{"stem":"The museum added a new gallery. ____ it expanded the audio guide to include local history.","body":"kind: rw-transitions\n\nthemeId: addition\n\nlabel: addition\n\nThe museum added a new gallery. ____ it expanded the audio guide to include local history.\n\nfocus: addition","promptText":"kind: rw-transitions\n\nthemeId: addition\n\nlabel: addition\n\nThe museum added a new gallery. ____ it expanded the audio guide to include local history.\n\nfocus: addition","metadata":{"questionKey":"rw-transitions-11","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:addition"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["In addition","Instead","However","As a result"],"correctIndex":0}'::jsonb,
  '{"summary":"In addition introduces an extra related point.","whyCorrect":"In addition introduces an extra related point."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-transitions',
  '{"stem":"The club hosted a reading night. ____ it offered free bookmarks to visitors.","body":"kind: rw-transitions\n\nthemeId: addition\n\nlabel: addition\n\nThe club hosted a reading night. ____ it offered free bookmarks to visitors.\n\nfocus: addition","promptText":"kind: rw-transitions\n\nthemeId: addition\n\nlabel: addition\n\nThe club hosted a reading night. ____ it offered free bookmarks to visitors.\n\nfocus: addition","metadata":{"questionKey":"rw-transitions-12","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:addition"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Moreover","Meanwhile","Nevertheless","Otherwise"],"correctIndex":0}'::jsonb,
  '{"summary":"Moreover adds another supporting detail.","whyCorrect":"Moreover adds another supporting detail."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-transitions',
  '{"stem":"The report included photos. ____ it included a map of the route.","body":"kind: rw-transitions\n\nthemeId: addition\n\nlabel: addition\n\nThe report included photos. ____ it included a map of the route.\n\nfocus: addition","promptText":"kind: rw-transitions\n\nthemeId: addition\n\nlabel: addition\n\nThe report included photos. ____ it included a map of the route.\n\nfocus: addition","metadata":{"questionKey":"rw-transitions-13","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:addition"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Also","Yet","Thus","Although"],"correctIndex":0}'::jsonb,
  '{"summary":"Also introduces another item in the list of details.","whyCorrect":"Also introduces another item in the list of details."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-transitions',
  '{"stem":"The teacher explained the rule. ____ she gave two examples.","body":"kind: rw-transitions\n\nthemeId: addition\n\nlabel: addition\n\nThe teacher explained the rule. ____ she gave two examples.\n\nfocus: addition","promptText":"kind: rw-transitions\n\nthemeId: addition\n\nlabel: addition\n\nThe teacher explained the rule. ____ she gave two examples.\n\nfocus: addition","metadata":{"questionKey":"rw-transitions-14","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:addition"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Furthermore","By contrast","Even so","Therefore"],"correctIndex":0}'::jsonb,
  '{"summary":"Furthermore adds an additional point.","whyCorrect":"Furthermore adds an additional point."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-transitions',
  '{"stem":"The program served younger students. ____ it was open to adults in the evening.","body":"kind: rw-transitions\n\nthemeId: addition\n\nlabel: addition\n\nThe program served younger students. ____ it was open to adults in the evening.\n\nfocus: addition","promptText":"kind: rw-transitions\n\nthemeId: addition\n\nlabel: addition\n\nThe program served younger students. ____ it was open to adults in the evening.\n\nfocus: addition","metadata":{"questionKey":"rw-transitions-15","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:addition"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Likewise","Instead","Otherwise","For instance"],"correctIndex":0}'::jsonb,
  '{"summary":"Likewise can add a parallel related idea.","whyCorrect":"Likewise can add a parallel related idea."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-transitions',
  '{"stem":"The volunteers sorted the books. ____ they labeled the shelves.","body":"kind: rw-transitions\n\nthemeId: sequence\n\nlabel: sequence\n\nThe volunteers sorted the books. ____ they labeled the shelves.\n\nfocus: sequence","promptText":"kind: rw-transitions\n\nthemeId: sequence\n\nlabel: sequence\n\nThe volunteers sorted the books. ____ they labeled the shelves.\n\nfocus: sequence","metadata":{"questionKey":"rw-transitions-16","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:sequence"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Afterward","Nevertheless","For example","Despite that"],"correctIndex":0}'::jsonb,
  '{"summary":"Afterward signals that one action happened after another.","whyCorrect":"Afterward signals that one action happened after another."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-transitions',
  '{"stem":"The class gathered its supplies. ____ it began the experiment.","body":"kind: rw-transitions\n\nthemeId: sequence\n\nlabel: sequence\n\nThe class gathered its supplies. ____ it began the experiment.\n\nfocus: sequence","promptText":"kind: rw-transitions\n\nthemeId: sequence\n\nlabel: sequence\n\nThe class gathered its supplies. ____ it began the experiment.\n\nfocus: sequence","metadata":{"questionKey":"rw-transitions-17","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:sequence"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Then","Although","Instead","Likewise"],"correctIndex":0}'::jsonb,
  '{"summary":"Then indicates the next step in a sequence.","whyCorrect":"Then indicates the next step in a sequence."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-transitions',
  '{"stem":"The chef chopped the herbs. ____ she added them to the soup.","body":"kind: rw-transitions\n\nthemeId: sequence\n\nlabel: sequence\n\nThe chef chopped the herbs. ____ she added them to the soup.\n\nfocus: sequence","promptText":"kind: rw-transitions\n\nthemeId: sequence\n\nlabel: sequence\n\nThe chef chopped the herbs. ____ she added them to the soup.\n\nfocus: sequence","metadata":{"questionKey":"rw-transitions-18","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:sequence"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Next","Otherwise","Yet","By contrast"],"correctIndex":0}'::jsonb,
  '{"summary":"Next marks the following step.","whyCorrect":"Next marks the following step."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-transitions',
  '{"stem":"The team drafted the poster. ____ it printed copies for the event.","body":"kind: rw-transitions\n\nthemeId: sequence\n\nlabel: sequence\n\nThe team drafted the poster. ____ it printed copies for the event.\n\nfocus: sequence","promptText":"kind: rw-transitions\n\nthemeId: sequence\n\nlabel: sequence\n\nThe team drafted the poster. ____ it printed copies for the event.\n\nfocus: sequence","metadata":{"questionKey":"rw-transitions-19","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:sequence"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Subsequently","For example","Conversely","Still"],"correctIndex":0}'::jsonb,
  '{"summary":"Subsequently means after that.","whyCorrect":"Subsequently means after that."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'transitions'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-transitions',
  '{"stem":"The group reviewed the map. ____ it chose the safest route.","body":"kind: rw-transitions\n\nthemeId: sequence\n\nlabel: sequence\n\nThe group reviewed the map. ____ it chose the safest route.\n\nfocus: sequence","promptText":"kind: rw-transitions\n\nthemeId: sequence\n\nlabel: sequence\n\nThe group reviewed the map. ____ it chose the safest route.\n\nfocus: sequence","metadata":{"questionKey":"rw-transitions-20","generationSource":"generated_from_research","tags":["reading-writing","transitions","theme:sequence"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Finally","However","Meanwhile","Moreover"],"correctIndex":0}'::jsonb,
  '{"summary":"Finally works because the sentence describes the last step.","whyCorrect":"Finally works because the sentence describes the last step."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: emphasize how the club increased student confidence.\nNotes: 14 students joined, mentors demonstrated basic repairs, students practiced troubleshooting, attendance rose after the first month.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: after-school-robotics\n\nlabel: robotics notes\n\nGoal: emphasize how the club increased student confidence.\nNotes: 14 students joined, mentors demonstrated basic repairs, students practiced troubleshooting, attendance rose after the first month.\n\nfocus: confidence","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: after-school-robotics\n\nlabel: robotics notes\n\nGoal: emphasize how the club increased student confidence.\nNotes: 14 students joined, mentors demonstrated basic repairs, students practiced troubleshooting, attendance rose after the first month.\n\nfocus: confidence","metadata":{"questionKey":"rw-rhetorical-synthesis-01","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:after-school-robotics"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The club increased confidence by giving students repeated chances to solve problems and see their skills improve.","The club mainly focused on competing against nearby schools.","The club replaced all science classes with robotics work.","The club was open only to students who already had experience."],"correctIndex":0}'::jsonb,
  '{"summary":"The best synthesis highlights repeated practice and growing confidence.","whyCorrect":"The best synthesis highlights repeated practice and growing confidence."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: emphasize the club''s community benefit.\nNotes: mentors volunteered, students repaired donated parts, finished devices were shared with the library, families attended the showcase.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: after-school-robotics\n\nlabel: robotics notes\n\nGoal: emphasize the club''s community benefit.\nNotes: mentors volunteered, students repaired donated parts, finished devices were shared with the library, families attended the showcase.\n\nfocus: community benefit","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: after-school-robotics\n\nlabel: robotics notes\n\nGoal: emphasize the club''s community benefit.\nNotes: mentors volunteered, students repaired donated parts, finished devices were shared with the library, families attended the showcase.\n\nfocus: community benefit","metadata":{"questionKey":"rw-rhetorical-synthesis-02","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:after-school-robotics"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The club benefited the community by repairing devices and sharing results publicly.","The club operated privately and avoided public events.","The club focused only on individual awards.","The club replaced the library with a workshop space."],"correctIndex":0}'::jsonb,
  '{"summary":"The answer connects the repairs, sharing, and showcase to a community benefit.","whyCorrect":"The answer connects the repairs, sharing, and showcase to a community benefit."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: explain why the club stayed popular.\nNotes: sessions were short, tools were easy to use, students could choose projects, mentors encouraged teamwork.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: after-school-robotics\n\nlabel: robotics notes\n\nGoal: explain why the club stayed popular.\nNotes: sessions were short, tools were easy to use, students could choose projects, mentors encouraged teamwork.\n\nfocus: popularity","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: after-school-robotics\n\nlabel: robotics notes\n\nGoal: explain why the club stayed popular.\nNotes: sessions were short, tools were easy to use, students could choose projects, mentors encouraged teamwork.\n\nfocus: popularity","metadata":{"questionKey":"rw-rhetorical-synthesis-03","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:after-school-robotics"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The club stayed popular because it was flexible, welcoming, and easy for beginners to join.","The club stayed popular because it required advanced engineering classes.","The club stayed popular because it met during lunch only.","The club stayed popular because it focused on a single competition."],"correctIndex":0}'::jsonb,
  '{"summary":"The answer best combines the notes into a clear explanation of popularity.","whyCorrect":"The answer best combines the notes into a clear explanation of popularity."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: summarize the club''s approach.\nNotes: students tested ideas, mentors gave feedback, mistakes were treated as part of learning, projects improved over time.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: after-school-robotics\n\nlabel: robotics notes\n\nGoal: summarize the club''s approach.\nNotes: students tested ideas, mentors gave feedback, mistakes were treated as part of learning, projects improved over time.\n\nfocus: approach","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: after-school-robotics\n\nlabel: robotics notes\n\nGoal: summarize the club''s approach.\nNotes: students tested ideas, mentors gave feedback, mistakes were treated as part of learning, projects improved over time.\n\nfocus: approach","metadata":{"questionKey":"rw-rhetorical-synthesis-04","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:after-school-robotics"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The club treated mistakes as part of the learning process and used feedback to improve projects.","The club discouraged feedback to keep projects unchanged.","The club focused mainly on theory rather than making things.","The club completed projects without revising them."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes show revision and feedback, not a one-and-done process.","whyCorrect":"The notes show revision and feedback, not a one-and-done process."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: explain how the club affected student participation.\nNotes: many members returned each week, new students joined after demonstrations, peers invited friends, the room filled more quickly over time.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: after-school-robotics\n\nlabel: robotics notes\n\nGoal: explain how the club affected student participation.\nNotes: many members returned each week, new students joined after demonstrations, peers invited friends, the room filled more quickly over time.\n\nfocus: participation","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: after-school-robotics\n\nlabel: robotics notes\n\nGoal: explain how the club affected student participation.\nNotes: many members returned each week, new students joined after demonstrations, peers invited friends, the room filled more quickly over time.\n\nfocus: participation","metadata":{"questionKey":"rw-rhetorical-synthesis-05","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:after-school-robotics"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The club encouraged participation by attracting returning members and new students alike.","The club reduced participation by making the work too difficult.","The club focused only on the same handful of students.","The club met once and then stopped."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes point to increasing participation, not declining participation.","whyCorrect":"The notes point to increasing participation, not declining participation."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  2, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: highlight the garden''s educational value.\nNotes: students measured soil moisture, logged plant height, compared sunlight on different beds, discussed results in science class.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: garden-notes\n\nlabel: garden notes\n\nGoal: highlight the garden''s educational value.\nNotes: students measured soil moisture, logged plant height, compared sunlight on different beds, discussed results in science class.\n\nfocus: educational value","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: garden-notes\n\nlabel: garden notes\n\nGoal: highlight the garden''s educational value.\nNotes: students measured soil moisture, logged plant height, compared sunlight on different beds, discussed results in science class.\n\nfocus: educational value","metadata":{"questionKey":"rw-rhetorical-synthesis-06","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:garden-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The garden supported learning because students used it to collect and discuss real data.","The garden existed mainly for formal landscaping.","The garden replaced all classroom instruction.","The garden was closed to students during science class."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes emphasize measurement and discussion as learning tools.","whyCorrect":"The notes emphasize measurement and discussion as learning tools."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: emphasize the garden''s shared ownership.\nNotes: neighbors watered on a schedule, residents chose which crops to plant, produce was divided among families, meetings were held monthly.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: garden-notes\n\nlabel: garden notes\n\nGoal: emphasize the garden''s shared ownership.\nNotes: neighbors watered on a schedule, residents chose which crops to plant, produce was divided among families, meetings were held monthly.\n\nfocus: shared ownership","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: garden-notes\n\nlabel: garden notes\n\nGoal: emphasize the garden''s shared ownership.\nNotes: neighbors watered on a schedule, residents chose which crops to plant, produce was divided among families, meetings were held monthly.\n\nfocus: shared ownership","metadata":{"questionKey":"rw-rhetorical-synthesis-07","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:garden-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The garden functioned as a shared project shaped by residents'' decisions and labor.","The garden was managed entirely by one person.","The garden sold all produce to outside buyers.","The garden was meant only for decoration."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes show collective decisions and shared work.","whyCorrect":"The notes show collective decisions and shared work."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: explain the garden''s environmental benefit.\nNotes: compost reduced waste, rain barrels saved water, native plants attracted pollinators, shade lowered afternoon heat.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: garden-notes\n\nlabel: garden notes\n\nGoal: explain the garden''s environmental benefit.\nNotes: compost reduced waste, rain barrels saved water, native plants attracted pollinators, shade lowered afternoon heat.\n\nfocus: environmental benefit","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: garden-notes\n\nlabel: garden notes\n\nGoal: explain the garden''s environmental benefit.\nNotes: compost reduced waste, rain barrels saved water, native plants attracted pollinators, shade lowered afternoon heat.\n\nfocus: environmental benefit","metadata":{"questionKey":"rw-rhetorical-synthesis-08","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:garden-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The garden supported the environment by conserving resources and attracting wildlife.","The garden relied on heavy chemical use.","The garden increased waste and water use.","The garden had no effect beyond appearance."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes point to conservation and habitat support.","whyCorrect":"The notes point to conservation and habitat support."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: summarize the garden''s social effect.\nNotes: neighbors shared tools, children helped harvest herbs, older residents taught planting tips, visitors stayed to talk after work sessions.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: garden-notes\n\nlabel: garden notes\n\nGoal: summarize the garden''s social effect.\nNotes: neighbors shared tools, children helped harvest herbs, older residents taught planting tips, visitors stayed to talk after work sessions.\n\nfocus: social effect","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: garden-notes\n\nlabel: garden notes\n\nGoal: summarize the garden''s social effect.\nNotes: neighbors shared tools, children helped harvest herbs, older residents taught planting tips, visitors stayed to talk after work sessions.\n\nfocus: social effect","metadata":{"questionKey":"rw-rhetorical-synthesis-09","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:garden-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The garden helped build neighborhood connections through shared work and conversation.","The garden isolated residents from one another.","The garden replaced neighborhood meetings.","The garden was used only by children."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes link the garden to repeated social interaction.","whyCorrect":"The notes link the garden to repeated social interaction."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: stress the practical outcome.\nNotes: herbs were used in the cafeteria, seedlings were transplanted to classroom windows, extra vegetables were donated, parents volunteered on Saturdays.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: garden-notes\n\nlabel: garden notes\n\nGoal: stress the practical outcome.\nNotes: herbs were used in the cafeteria, seedlings were transplanted to classroom windows, extra vegetables were donated, parents volunteered on Saturdays.\n\nfocus: practical outcome","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: garden-notes\n\nlabel: garden notes\n\nGoal: stress the practical outcome.\nNotes: herbs were used in the cafeteria, seedlings were transplanted to classroom windows, extra vegetables were donated, parents volunteered on Saturdays.\n\nfocus: practical outcome","metadata":{"questionKey":"rw-rhetorical-synthesis-10","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:garden-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The garden produced practical benefits in addition to educational ones.","The garden existed only for posters and displays.","The garden had no use outside the soil beds.","The garden was unrelated to the school."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes show direct uses for the produce and seedlings.","whyCorrect":"The notes show direct uses for the produce and seedlings."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: explain why the archive matters.\nNotes: recordings preserve accents, old photos reveal neighborhood landmarks, captions identify people, students can compare past and present.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: archive-notes\n\nlabel: archive notes\n\nGoal: explain why the archive matters.\nNotes: recordings preserve accents, old photos reveal neighborhood landmarks, captions identify people, students can compare past and present.\n\nfocus: archive value","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: archive-notes\n\nlabel: archive notes\n\nGoal: explain why the archive matters.\nNotes: recordings preserve accents, old photos reveal neighborhood landmarks, captions identify people, students can compare past and present.\n\nfocus: archive value","metadata":{"questionKey":"rw-rhetorical-synthesis-11","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:archive-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The archive helps preserve and compare neighborhood history across generations.","The archive exists only to store new textbooks.","The archive prevents students from studying the past.","The archive replaces the need for any written records."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes emphasize preservation and comparison over time.","whyCorrect":"The notes emphasize preservation and comparison over time."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: stress the student role.\nNotes: students interviewed residents, edited captions, checked dates, and selected photos for display.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: archive-notes\n\nlabel: archive notes\n\nGoal: stress the student role.\nNotes: students interviewed residents, edited captions, checked dates, and selected photos for display.\n\nfocus: student role","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: archive-notes\n\nlabel: archive notes\n\nGoal: stress the student role.\nNotes: students interviewed residents, edited captions, checked dates, and selected photos for display.\n\nfocus: student role","metadata":{"questionKey":"rw-rhetorical-synthesis-12","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:archive-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["Students shaped the archive by gathering, checking, and organizing the materials.","Students only watched others work on the archive.","Students had no part in the display.","Students were asked to ignore the interviews."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes show students doing active archival work.","whyCorrect":"The notes show students doing active archival work."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: highlight the audience.\nNotes: families visited on weekends, teachers used the display in class, residents added stories, the exhibit sparked conversation.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: archive-notes\n\nlabel: archive notes\n\nGoal: highlight the audience.\nNotes: families visited on weekends, teachers used the display in class, residents added stories, the exhibit sparked conversation.\n\nfocus: audience","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: archive-notes\n\nlabel: archive notes\n\nGoal: highlight the audience.\nNotes: families visited on weekends, teachers used the display in class, residents added stories, the exhibit sparked conversation.\n\nfocus: audience","metadata":{"questionKey":"rw-rhetorical-synthesis-13","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:archive-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The archive reached a broad audience and prompted discussion.","The archive was hidden from the public.","The archive was used only by one class.","The archive discouraged conversation."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes show the archive being used by several groups.","whyCorrect":"The notes show the archive being used by several groups."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  3, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: show what the archive reveals.\nNotes: repeated names appear in several sources, a single store changed hands many times, oral stories fill gaps in the records.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: archive-notes\n\nlabel: archive notes\n\nGoal: show what the archive reveals.\nNotes: repeated names appear in several sources, a single store changed hands many times, oral stories fill gaps in the records.\n\nfocus: what the archive reveals","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: archive-notes\n\nlabel: archive notes\n\nGoal: show what the archive reveals.\nNotes: repeated names appear in several sources, a single store changed hands many times, oral stories fill gaps in the records.\n\nfocus: what the archive reveals","metadata":{"questionKey":"rw-rhetorical-synthesis-14","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:archive-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The archive reveals how multiple sources can combine to create a fuller history.","The archive shows that one source is always enough.","The archive removes uncertainty from every historical question.","The archive proves that oral stories are never useful."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes point to a fuller picture built from several sources.","whyCorrect":"The notes point to a fuller picture built from several sources."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: stress the learning outcome.\nNotes: students wrote reflections, compared sources, spotted contradictions, and revised captions after feedback.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: archive-notes\n\nlabel: archive notes\n\nGoal: stress the learning outcome.\nNotes: students wrote reflections, compared sources, spotted contradictions, and revised captions after feedback.\n\nfocus: learning outcome","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: archive-notes\n\nlabel: archive notes\n\nGoal: stress the learning outcome.\nNotes: students wrote reflections, compared sources, spotted contradictions, and revised captions after feedback.\n\nfocus: learning outcome","metadata":{"questionKey":"rw-rhetorical-synthesis-15","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:archive-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The project taught students how to question and refine historical information.","The project discouraged analysis and revision.","The project focused only on memory games.","The project was complete before any sources were checked."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes show analysis, contradictions, and revision.","whyCorrect":"The notes show analysis, contradictions, and revision."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: explain the system''s usefulness.\nNotes: alerts arrive in seconds, messages use plain language, residents can opt into language preferences, crews posted updates during storms.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: alert-notes\n\nlabel: alert system notes\n\nGoal: explain the system''s usefulness.\nNotes: alerts arrive in seconds, messages use plain language, residents can opt into language preferences, crews posted updates during storms.\n\nfocus: usefulness","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: alert-notes\n\nlabel: alert system notes\n\nGoal: explain the system''s usefulness.\nNotes: alerts arrive in seconds, messages use plain language, residents can opt into language preferences, crews posted updates during storms.\n\nfocus: usefulness","metadata":{"questionKey":"rw-rhetorical-synthesis-16","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:alert-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The system is useful because it delivers fast, clear, and customizable warnings.","The system is useful because it sends long technical reports.","The system is useful because it ignores user preferences.","The system is useful because it slows down emergency response."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes emphasize speed, clarity, and personalization.","whyCorrect":"The notes emphasize speed, clarity, and personalization."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: stress community coordination.\nNotes: volunteers checked blocked streets, drivers confirmed road closures, the app updated maps, residents shared the warnings with neighbors.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: alert-notes\n\nlabel: alert system notes\n\nGoal: stress community coordination.\nNotes: volunteers checked blocked streets, drivers confirmed road closures, the app updated maps, residents shared the warnings with neighbors.\n\nfocus: coordination","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: alert-notes\n\nlabel: alert system notes\n\nGoal: stress community coordination.\nNotes: volunteers checked blocked streets, drivers confirmed road closures, the app updated maps, residents shared the warnings with neighbors.\n\nfocus: coordination","metadata":{"questionKey":"rw-rhetorical-synthesis-17","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:alert-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The system worked best when volunteers, drivers, and residents shared information.","The system worked best when no one communicated.","The system replaced road maps with printed flyers only.","The system depended on one person doing everything."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes show coordination across several groups.","whyCorrect":"The notes show coordination across several groups."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: explain the timing.\nNotes: alerts were sent before floodwaters rose, crews had time to reroute traffic, families moved cars, schools delayed buses.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: alert-notes\n\nlabel: alert system notes\n\nGoal: explain the timing.\nNotes: alerts were sent before floodwaters rose, crews had time to reroute traffic, families moved cars, schools delayed buses.\n\nfocus: timing","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: alert-notes\n\nlabel: alert system notes\n\nGoal: explain the timing.\nNotes: alerts were sent before floodwaters rose, crews had time to reroute traffic, families moved cars, schools delayed buses.\n\nfocus: timing","metadata":{"questionKey":"rw-rhetorical-synthesis-18","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:alert-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The system helped people act before conditions became worse.","The system waited until after the storm ended.","The system was designed only for entertainment.","The system ignored the first hours of the storm."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes show the alerts arriving early enough to matter.","whyCorrect":"The notes show the alerts arriving early enough to matter."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: summarize the result.\nNotes: confusion dropped, fewer people called for basic directions, crews reached problem areas faster, the first hour became more orderly.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: alert-notes\n\nlabel: alert system notes\n\nGoal: summarize the result.\nNotes: confusion dropped, fewer people called for basic directions, crews reached problem areas faster, the first hour became more orderly.\n\nfocus: result","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: alert-notes\n\nlabel: alert system notes\n\nGoal: summarize the result.\nNotes: confusion dropped, fewer people called for basic directions, crews reached problem areas faster, the first hour became more orderly.\n\nfocus: result","metadata":{"questionKey":"rw-rhetorical-synthesis-19","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:alert-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The system made the first hour after storms more organized and efficient.","The system made the first hour after storms more confusing.","The system prevented any need for crews.","The system reduced the amount of information available."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes show less confusion and faster response.","whyCorrect":"The notes show less confusion and faster response."}'::jsonb,
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
    and d.slug = 'expression-of-ideas'
    and c.slug = 'rhetorical-synthesis'
)
insert into public.question_bank (
  source_type, section_id, domain_id, concept_id, difficulty, question_type,
  prompt_json, answer_schema_json, explanation_json, calculator_allowed,
  desmos_relevant, status, published_at
)
select
  'generated_dynamic', taxonomy.section_id, taxonomy.domain_id, taxonomy.concept_id,
  4, 'rw-rhetorical-synthesis',
  '{"stem":"Goal: emphasize multilingual access.\nNotes: translations were reviewed by native speakers, text alerts were sent in three languages, families said the messages felt more trustworthy.","body":"kind: rw-rhetorical-synthesis\n\nthemeId: alert-notes\n\nlabel: alert system notes\n\nGoal: emphasize multilingual access.\nNotes: translations were reviewed by native speakers, text alerts were sent in three languages, families said the messages felt more trustworthy.\n\nfocus: multilingual access","promptText":"kind: rw-rhetorical-synthesis\n\nthemeId: alert-notes\n\nlabel: alert system notes\n\nGoal: emphasize multilingual access.\nNotes: translations were reviewed by native speakers, text alerts were sent in three languages, families said the messages felt more trustworthy.\n\nfocus: multilingual access","metadata":{"questionKey":"rw-rhetorical-synthesis-20","generationSource":"generated_from_research","tags":["reading-writing","rhetorical-synthesis","theme:alert-notes"]}}'::jsonb,
  '{"type":"multiple_choice","choices":["The system improved access by providing messages in more than one language.","The system avoided translation entirely.","The system was only for one neighborhood.","The system made messages less trustworthy."],"correctIndex":0}'::jsonb,
  '{"summary":"The notes show that translations widened access and trust.","whyCorrect":"The notes show that translations widened access and trust."}'::jsonb,
  false,
  false,
  'published', now()
from taxonomy;

-- Seed the canonical SAT taxonomy used across the tutor app.
-- This migration is idempotent: it upserts sections, domains, and concepts by slug.

insert into public.sections (slug, name, display_order)
values
  ('reading-writing', 'Reading and Writing', 1),
  ('math', 'Math', 2)
on conflict (slug) do update
set
  name = excluded.name,
  display_order = excluded.display_order;

insert into public.domains (section_id, slug, name, display_order)
select section.id, seeded.slug, seeded.name, seeded.display_order
from (
  values
    ('reading-writing', 'information-and-ideas', 'Information and Ideas', 1),
    ('reading-writing', 'craft-and-structure', 'Craft and Structure', 2),
    ('reading-writing', 'expression-of-ideas', 'Expression of Ideas', 3),
    ('reading-writing', 'standard-english-conventions', 'Standard English Conventions', 4),
    ('math', 'algebra', 'Algebra', 1),
    ('math', 'advanced-math', 'Advanced Math', 2),
    ('math', 'problem-solving-and-data-analysis', 'Problem-Solving and Data Analysis', 3),
    ('math', 'geometry-and-trigonometry', 'Geometry and Trigonometry', 4)
) as seeded(section_slug, slug, name, display_order)
join public.sections as section
  on section.slug = seeded.section_slug
on conflict (section_id, slug) do update
set
  name = excluded.name,
  display_order = excluded.display_order;

insert into public.concepts (domain_id, slug, name, description, display_order)
select domain.id, seeded.slug, seeded.name, seeded.description, seeded.display_order
from (
  values
    ('reading-writing', 'information-and-ideas', 'central-ideas-and-details', 'Central Ideas and Details', '', 1),
    ('reading-writing', 'information-and-ideas', 'command-of-evidence-textual', 'Command of Evidence (Textual)', '', 2),
    ('reading-writing', 'information-and-ideas', 'command-of-evidence-quantitative', 'Command of Evidence (Quantitative)', '', 3),
    ('reading-writing', 'information-and-ideas', 'inferences', 'Inferences', '', 4),

    ('reading-writing', 'craft-and-structure', 'words-in-context', 'Words in Context', '', 1),
    ('reading-writing', 'craft-and-structure', 'text-structure-and-purpose', 'Text Structure and Purpose', '', 2),
    ('reading-writing', 'craft-and-structure', 'cross-text-connections', 'Cross-Text Connections', '', 3),

    ('reading-writing', 'expression-of-ideas', 'transitions', 'Transitions', '', 1),
    ('reading-writing', 'expression-of-ideas', 'rhetorical-synthesis', 'Rhetorical Synthesis', '', 2),

    ('reading-writing', 'standard-english-conventions', 'boundaries-punctuation', 'Boundaries (Punctuation)', '', 1),
    ('reading-writing', 'standard-english-conventions', 'form-structure-and-sense-grammar', 'Form, Structure, and Sense (Grammar)', '', 2),

    ('math', 'algebra', 'linear-equations-in-one-variable', 'Linear equations in one variable', '', 1),
    ('math', 'algebra', 'linear-equations-in-two-variables', 'Linear equations in two variables', '', 2),
    ('math', 'algebra', 'linear-functions', 'Linear functions', '', 3),
    ('math', 'algebra', 'systems-of-two-linear-equations-in-two-variables', 'Systems of two linear equations in two variables', '', 4),
    ('math', 'algebra', 'linear-inequalities-in-one-or-two-variables', 'Linear inequalities in one or two variables', '', 5),

    ('math', 'advanced-math', 'equivalent-expressions', 'Equivalent expressions', '', 1),
    (
      'math',
      'advanced-math',
      'nonlinear-equations-in-one-variable-and-systems-of-equations-in-two-variables',
      'Nonlinear equations in one variable and systems of equations in two variables',
      '',
      2
    ),
    ('math', 'advanced-math', 'nonlinear-functions', 'Nonlinear functions', '', 3),

    (
      'math',
      'problem-solving-and-data-analysis',
      'ratios-rates-proportional-relationships-and-units',
      'Ratios, rates, proportional relationships, and units',
      '',
      1
    ),
    ('math', 'problem-solving-and-data-analysis', 'percentages', 'Percentages', '', 2),
    (
      'math',
      'problem-solving-and-data-analysis',
      'one-variable-data-distributions-and-measures-of-center-and-spread',
      'One-variable data: distributions and measures of center and spread',
      '',
      3
    ),
    (
      'math',
      'problem-solving-and-data-analysis',
      'two-variable-data-models-and-scatterplots',
      'Two-variable data: models and scatterplots',
      '',
      4
    ),
    (
      'math',
      'problem-solving-and-data-analysis',
      'probability-and-conditional-probability',
      'Probability and conditional probability',
      '',
      5
    ),
    (
      'math',
      'problem-solving-and-data-analysis',
      'inference-from-sample-statistics-and-margin-of-error',
      'Inference from sample statistics and margin of error',
      '',
      6
    ),
    (
      'math',
      'problem-solving-and-data-analysis',
      'evaluating-statistical-claims-observational-studies-and-experiments',
      'Evaluating statistical claims: observational studies and experiments',
      '',
      7
    ),

    ('math', 'geometry-and-trigonometry', 'area-and-volume', 'Area and volume', '', 1),
    ('math', 'geometry-and-trigonometry', 'lines-angles-and-triangles', 'Lines, angles, and triangles', '', 2),
    ('math', 'geometry-and-trigonometry', 'right-triangles-and-trigonometry', 'Right triangles and trigonometry', '', 3),
    ('math', 'geometry-and-trigonometry', 'circles', 'Circles', '', 4)
) as seeded(section_slug, domain_slug, slug, name, description, display_order)
join public.sections as section
  on section.slug = seeded.section_slug
join public.domains as domain
  on domain.section_id = section.id
 and domain.slug = seeded.domain_slug
on conflict (domain_id, slug) do update
set
  name = excluded.name,
  description = excluded.description,
  display_order = excluded.display_order;

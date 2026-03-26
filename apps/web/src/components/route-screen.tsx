type RouteScreenProps = {
  title: string;
  summary: string;
  nextFiles?: readonly string[];
};

export function RouteScreen({
  title,
  summary,
  nextFiles = [],
}: RouteScreenProps) {
  return (
    <main>
      <h1>{title}</h1>
      <p>{summary}</p>
      {nextFiles.length > 0 ? (
        <section>
          <h2>Next files</h2>
          <ul>
            {nextFiles.map((filePath) => (
              <li key={filePath}>{filePath}</li>
            ))}
          </ul>
        </section>
      ) : null}
    </main>
  );
}

/*
TODO(shared-layout-shell):
Replace this placeholder with the real shared layout primitives.

Scope:
- Keep this file focused on lightweight route scaffolding only.
- Split marketing, student, and admin chrome into separate layouts when real UI
  work starts.
- Move reusable empty/loading/error states into `apps/web/src/components`.

Naming:
- Shared screen-level components should use PascalCase exports.
- Keep generic shell file names descriptive and kebab-case.
*/

import type { CSSProperties } from "react";
import { AdminShell } from "../../../features/admin/components/admin-shell";
import { questionDrafts } from "../../../features/admin/mock-data";

// TODO(admin-feature): Full vetted question editor — load/save drafts via `/api/admin/questions`, validate taxonomy + answer schema, publish through `/api/admin/questions/[id]/publish` with audit logging (see api README).

export default function AdminQuestionsPage() {
  return (
    <AdminShell
      title="Vetted Question Editor"
      summary="Create and update vetted SAT question records, including taxonomy mapping, answer schema, explanations, and calculator flags."
    >
      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>New Question Draft</h2>
        <form style={styles.formGrid} aria-label="Question editor scaffold">
          <label style={styles.field}>
            <span style={styles.label}>Question title</span>
            <input
              style={styles.input}
              name="title"
              placeholder="Ex: Solve an equation with variables on both sides"
              readOnly
              value=""
            />
          </label>
          <label style={styles.field}>
            <span style={styles.label}>Section</span>
            <select style={styles.input} name="section" defaultValue="math">
              <option value="reading-writing">Reading and Writing</option>
              <option value="math">Math</option>
            </select>
          </label>
          <label style={styles.field}>
            <span style={styles.label}>Domain</span>
            <input style={styles.input} name="domain" placeholder="Algebra" readOnly value="" />
          </label>
          <label style={styles.field}>
            <span style={styles.label}>Concept</span>
            <input
              style={styles.input}
              name="concept"
              placeholder="Linear equations in one variable"
              readOnly
              value=""
            />
          </label>
          <label style={styles.field}>
            <span style={styles.label}>Difficulty (1-5)</span>
            <input style={styles.input} name="difficulty" type="number" min={1} max={5} readOnly value="" />
          </label>
          <label style={styles.checkboxField}>
            <input type="checkbox" checked readOnly />
            <span>Calculator allowed</span>
          </label>
          <label style={styles.checkboxField}>
            <input type="checkbox" readOnly />
            <span>Desmos relevant</span>
          </label>
          <label style={styles.fieldFull}>
            <span style={styles.label}>Answer schema JSON</span>
            <textarea
              style={styles.textArea}
              name="answer-schema"
              readOnly
              value='{"type":"multiple_choice","choices":["A","B","C","D"],"correctIndex":1}'
            />
          </label>
          <label style={styles.fieldFull}>
            <span style={styles.label}>Explanation JSON</span>
            <textarea
              style={styles.textArea}
              name="explanation"
              readOnly
              value='{"summary":"Isolate x by combining like terms and dividing by coefficient."}'
            />
          </label>
        </form>
        <p style={styles.note}>
          This scaffold is intentionally read-only until server APIs and role checks are wired.
        </p>
      </section>

      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Recent Vetted Question Drafts</h2>
        <table style={styles.table}>
          <thead>
            <tr>
              <th style={styles.headerCell}>Question ID</th>
              <th style={styles.headerCell}>Status</th>
              <th style={styles.headerCell}>Section</th>
              <th style={styles.headerCell}>Domain</th>
              <th style={styles.headerCell}>Concept</th>
              <th style={styles.headerCell}>Difficulty</th>
              <th style={styles.headerCell}>Updated</th>
            </tr>
          </thead>
          <tbody>
            {questionDrafts.map((question) => (
              <tr key={question.id}>
                <td style={styles.bodyCell}>
                  <code>{question.id}</code>
                </td>
                <td style={styles.bodyCell}>{question.status}</td>
                <td style={styles.bodyCell}>{question.section}</td>
                <td style={styles.bodyCell}>{question.domain}</td>
                <td style={styles.bodyCell}>{question.concept}</td>
                <td style={styles.bodyCell}>{question.difficulty}</td>
                <td style={styles.bodyCell}>{question.updatedAt}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </section>
    </AdminShell>
  );
}

const styles: Record<string, CSSProperties> = {
  panel: {
    border: "1px solid #dbe7ef",
    borderRadius: "12px",
    padding: "1rem",
    marginBottom: "1rem",
    background: "#ffffff",
    overflowX: "auto",
  },
  sectionTitle: {
    marginTop: 0,
    marginBottom: "0.75rem",
    fontSize: "1rem",
  },
  formGrid: {
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit, minmax(220px, 1fr))",
    gap: "0.8rem",
  },
  field: {
    display: "grid",
    gap: "0.35rem",
  },
  fieldFull: {
    display: "grid",
    gap: "0.35rem",
    gridColumn: "1 / -1",
  },
  label: {
    color: "#334155",
    fontSize: "0.87rem",
    fontWeight: 600,
  },
  input: {
    border: "1px solid #cbd5e1",
    borderRadius: "8px",
    padding: "0.55rem 0.65rem",
    background: "#f8fafc",
    color: "#0f172a",
  },
  checkboxField: {
    display: "flex",
    alignItems: "center",
    gap: "0.5rem",
    color: "#334155",
    fontSize: "0.9rem",
  },
  textArea: {
    minHeight: "84px",
    border: "1px solid #cbd5e1",
    borderRadius: "8px",
    padding: "0.55rem 0.65rem",
    background: "#f8fafc",
    color: "#0f172a",
    resize: "vertical",
  },
  note: {
    marginTop: "0.8rem",
    marginBottom: 0,
    color: "#64748b",
    fontSize: "0.9rem",
  },
  table: {
    width: "100%",
    borderCollapse: "collapse",
    fontSize: "0.94rem",
  },
  headerCell: {
    textAlign: "left",
    borderBottom: "1px solid #cbd5e1",
    padding: "0.5rem 0.4rem",
    color: "#334155",
  },
  bodyCell: {
    borderBottom: "1px solid #e2e8f0",
    padding: "0.5rem 0.4rem",
    color: "#1e293b",
    verticalAlign: "top",
  },
};

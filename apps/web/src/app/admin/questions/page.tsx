import { revalidatePath } from "next/cache";
import type { CSSProperties } from "react";
import { theme } from "@/theme/app-theme";
import { AdminShell } from "../../../features/admin/components/admin-shell";
import { assertAdminFromServerContext } from "@/features/admin/server/auth";
import { getPracticeConceptOptions } from "@/features/practice/server";
import {
  createQuestionDraft,
  listVettedQuestions,
  publishQuestion,
  updateQuestionDraft,
} from "@/features/admin/server/store";

async function createDraftAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const difficulty = Number(formData.get("difficulty"));
  if (!Number.isInteger(difficulty) || difficulty < 1 || difficulty > 5) {
    return;
  }

  createQuestionDraft(
    {
      title: String(formData.get("title") ?? "").trim(),
      conceptSlug: String(formData.get("conceptSlug") ?? "").trim(),
      difficulty: difficulty as 1 | 2 | 3 | 4 | 5,
      calculatorAllowed: formData.get("calculatorAllowed") === "on",
      desmosRelevant: formData.get("desmosRelevant") === "on",
      answerSchema: String(formData.get("answerSchema") ?? "{}"),
      explanationJson: String(formData.get("explanationJson") ?? "{}"),
    },
    actor,
  );

  revalidatePath("/admin");
  revalidatePath("/admin/questions");
}

async function updateDraftAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const questionId = String(formData.get("questionId") ?? "");
  const difficulty = Number(formData.get("difficulty"));
  if (!questionId || !Number.isInteger(difficulty) || difficulty < 1 || difficulty > 5) {
    return;
  }

  updateQuestionDraft(
    questionId,
    {
      title: String(formData.get("title") ?? ""),
      difficulty: difficulty as 1 | 2 | 3 | 4 | 5,
    },
    actor,
  );

  revalidatePath("/admin/questions");
}

async function publishDraftAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const questionId = String(formData.get("questionId") ?? "");
  if (!questionId) {
    return;
  }

  publishQuestion(questionId, actor);
  revalidatePath("/admin");
  revalidatePath("/admin/questions");
}

export default function AdminQuestionsPage() {
  const questions = listVettedQuestions();
  const conceptOptions = getPracticeConceptOptions();

  return (
    <AdminShell
      title="Vetted Question Editor"
      summary="Create and update vetted SAT question records, including taxonomy mapping, answer schema, and publish transitions with audit events."
    >
      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Create New Draft</h2>
        <form style={styles.formGrid} action={createDraftAction}>
          <label style={styles.field}>
            <span style={styles.label}>Question title</span>
            <input style={styles.input} name="title" required />
          </label>
          <label style={styles.field}>
            <span style={styles.label}>Concept</span>
            <select style={styles.input} name="conceptSlug" defaultValue={conceptOptions[0]?.slug} required>
              {conceptOptions.map((concept) => (
                <option key={concept.slug} value={concept.slug}>
                  {concept.label}
                </option>
              ))}
            </select>
          </label>
          <label style={styles.field}>
            <span style={styles.label}>Difficulty (1-5)</span>
            <input
              style={styles.input}
              name="difficulty"
              type="number"
              min={1}
              max={5}
              defaultValue={2}
              required
            />
          </label>
          <label style={styles.checkboxField}>
            <input type="checkbox" name="calculatorAllowed" defaultChecked />
            <span>Calculator allowed</span>
          </label>
          <label style={styles.checkboxField}>
            <input type="checkbox" name="desmosRelevant" />
            <span>Desmos relevant</span>
          </label>
          <label style={styles.fieldFull}>
            <span style={styles.label}>Answer schema JSON</span>
            <textarea
              style={styles.textArea}
              name="answerSchema"
              defaultValue='{"type":"multiple_choice","choices":["A","B","C","D"],"correctIndex":0}'
            />
          </label>
          <label style={styles.fieldFull}>
            <span style={styles.label}>Explanation JSON</span>
            <textarea
              style={styles.textArea}
              name="explanationJson"
              defaultValue='{"summary":"Explain the solving strategy and why distractors fail."}'
            />
          </label>
          <button type="submit" style={styles.primaryButton}>
            Save Draft
          </button>
        </form>
      </section>

      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Vetted Questions</h2>
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
              <th style={styles.headerCell}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {questions.map((question) => (
              <tr key={question.id}>
                <td style={styles.bodyCell}>
                  <code>{question.id}</code>
                </td>
                <td style={styles.bodyCell}>{question.status}</td>
                <td style={styles.bodyCell}>{question.section}</td>
                <td style={styles.bodyCell}>{question.domainName}</td>
                <td style={styles.bodyCell}>{question.conceptName}</td>
                <td style={styles.bodyCell}>{question.difficulty}</td>
                <td style={styles.bodyCell}>{question.updatedAt}</td>
                <td style={styles.bodyCell}>
                  {question.status === "draft" ? (
                    <div style={styles.actionStack}>
                      <form action={updateDraftAction} style={styles.inlineForm}>
                        <input type="hidden" name="questionId" value={question.id} />
                        <input style={styles.smallInput} name="title" defaultValue={question.title} />
                        <input
                          style={styles.tinyInput}
                          type="number"
                          min={1}
                          max={5}
                          name="difficulty"
                          defaultValue={question.difficulty}
                        />
                        <button type="submit" style={styles.secondaryButton}>
                          Update
                        </button>
                      </form>
                      <form action={publishDraftAction}>
                        <input type="hidden" name="questionId" value={question.id} />
                        <button type="submit" style={styles.primaryButton}>
                          Publish
                        </button>
                      </form>
                    </div>
                  ) : (
                    <span style={styles.publishedBadge}>Published</span>
                  )}
                </td>
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
    background: theme.surfaceMuted,
    color: theme.text,
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
    background: theme.surfaceMuted,
    color: theme.text,
    resize: "vertical",
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
  actionStack: {
    display: "grid",
    gap: "0.35rem",
  },
  inlineForm: {
    display: "flex",
    gap: "0.25rem",
    alignItems: "center",
  },
  smallInput: {
    minWidth: "180px",
    border: "1px solid #cbd5e1",
    borderRadius: "6px",
    padding: "0.3rem 0.4rem",
  },
  tinyInput: {
    width: "56px",
    border: "1px solid #cbd5e1",
    borderRadius: "6px",
    padding: "0.3rem 0.4rem",
  },
  primaryButton: {
    border: `1px solid ${theme.accent}`,
    borderRadius: "8px",
    background: theme.accent,
    color: theme.accentForeground,
    fontWeight: 600,
    padding: "0.4rem 0.75rem",
    cursor: "pointer",
  },
  secondaryButton: {
    border: `1px solid ${theme.borderStrong}`,
    borderRadius: "8px",
    background: theme.surfaceMuted,
    color: theme.text,
    fontWeight: 600,
    padding: "0.4rem 0.75rem",
    cursor: "pointer",
  },
  publishedBadge: {
    display: "inline-block",
    borderRadius: "999px",
    padding: "0.2rem 0.55rem",
    border: "1px solid #86efac",
    background: "#f0fdf4",
    color: "#166534",
    fontWeight: 700,
    fontSize: "0.8rem",
  },
};

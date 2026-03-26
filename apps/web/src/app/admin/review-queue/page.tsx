import { revalidatePath } from "next/cache";
import type { CSSProperties } from "react";
import { AdminShell } from "../../../features/admin/components/admin-shell";
import { assertAdminFromServerContext } from "@/features/admin/server/auth";
import {
  approveVariant,
  generateVariants,
  listGeneratedVariants,
  rejectVariant,
} from "@/features/admin/server/store";

async function generateVariantsAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const parentQuestionId = String(formData.get("parentQuestionId") ?? "").trim();
  const concept = String(formData.get("concept") ?? "").trim();
  const count = Number(formData.get("count"));
  if (!parentQuestionId || !Number.isInteger(count) || count < 1 || count > 5) {
    return;
  }
  generateVariants({ parentQuestionId, concept, count }, actor);
  revalidatePath("/admin");
  revalidatePath("/admin/review-queue");
}

async function approveVariantAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const variantId = String(formData.get("variantId") ?? "").trim();
  if (!variantId) {
    return;
  }
  approveVariant(variantId, actor);
  revalidatePath("/admin");
  revalidatePath("/admin/review-queue");
}

async function rejectVariantAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const variantId = String(formData.get("variantId") ?? "").trim();
  const reason = String(formData.get("reason") ?? "").trim();
  if (!variantId || !reason) {
    return;
  }
  rejectVariant(variantId, reason, actor);
  revalidatePath("/admin");
  revalidatePath("/admin/review-queue");
}

export default function AdminReviewQueuePage() {
  const pendingVariants = listGeneratedVariants("pending");
  const reviewedVariants = listGeneratedVariants().filter(
    (variant) => variant.status !== "pending",
  );

  return (
    <AdminShell
      title="Generated Variant Review Queue"
      summary="Review generated variants with validation context and explicit approve/reject decisions before publication workflows."
    >
      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Generate New Variants</h2>
        <form action={generateVariantsAction} style={styles.generateForm}>
          <input
            style={styles.input}
            name="parentQuestionId"
            placeholder="Parent vetted question id (e.g. q_1023)"
            required
          />
          <input style={styles.input} name="concept" placeholder="Concept override (optional)" />
          <input
            style={styles.smallInput}
            name="count"
            type="number"
            min={1}
            max={5}
            defaultValue={2}
            required
          />
          <button type="submit" style={styles.primaryButton}>
            Generate
          </button>
        </form>
      </section>

      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Pending Variants</h2>
        <table style={styles.table}>
          <thead>
            <tr>
              <th style={styles.headerCell}>Variant ID</th>
              <th style={styles.headerCell}>Parent Question</th>
              <th style={styles.headerCell}>Concept</th>
              <th style={styles.headerCell}>Validation Score</th>
              <th style={styles.headerCell}>Ambiguity Risk</th>
              <th style={styles.headerCell}>Generated</th>
              <th style={styles.headerCell}>Review Actions</th>
            </tr>
          </thead>
          <tbody>
            {pendingVariants.map((item) => (
              <tr key={item.id}>
                <td style={styles.bodyCell}>
                  <code>{item.id}</code>
                </td>
                <td style={styles.bodyCell}>
                  <code>{item.parentQuestionId}</code>
                </td>
                <td style={styles.bodyCell}>{item.concept}</td>
                <td style={styles.bodyCell}>{item.validationScore}</td>
                <td style={styles.bodyCell}>
                  <span style={getRiskStyle(item.ambiguityRisk)}>{item.ambiguityRisk}</span>
                </td>
                <td style={styles.bodyCell}>{item.generatedAt}</td>
                <td style={styles.bodyCell}>
                  <div style={styles.actionRow}>
                    <form action={approveVariantAction}>
                      <input type="hidden" name="variantId" value={item.id} />
                      <button type="submit" style={styles.approveButton}>
                        Approve
                      </button>
                    </form>
                    <form action={rejectVariantAction} style={styles.rejectForm}>
                      <input type="hidden" name="variantId" value={item.id} />
                      <input
                        name="reason"
                        style={styles.rejectInput}
                        placeholder="Reject reason"
                        required
                      />
                      <button type="submit" style={styles.rejectButton}>
                        Reject
                      </button>
                    </form>
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </section>

      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Reviewed Variants</h2>
        {reviewedVariants.length === 0 ? (
          <p style={styles.note}>No reviewed variants yet.</p>
        ) : (
          <ul style={styles.list}>
            {reviewedVariants.map((variant) => (
              <li key={variant.id}>
                <code>{variant.id}</code> {variant.status}
                {variant.rejectionReason ? `: ${variant.rejectionReason}` : ""} ({variant.reviewedAt})
              </li>
            ))}
          </ul>
        )}
      </section>
    </AdminShell>
  );
}

function getRiskStyle(risk: "low" | "medium" | "high"): CSSProperties {
  if (risk === "low") {
    return styles.riskLow;
  }
  if (risk === "medium") {
    return styles.riskMedium;
  }
  return styles.riskHigh;
}

const styles: Record<string, CSSProperties> = {
  panel: {
    border: "1px solid #dbe7ef",
    borderRadius: "12px",
    padding: "1rem",
    marginBottom: "1rem",
    overflowX: "auto",
    background: "#ffffff",
  },
  sectionTitle: {
    marginTop: 0,
    marginBottom: "0.7rem",
    fontSize: "1rem",
  },
  generateForm: {
    display: "flex",
    gap: "0.5rem",
    flexWrap: "wrap",
    alignItems: "center",
  },
  input: {
    minWidth: "240px",
    border: "1px solid #cbd5e1",
    borderRadius: "8px",
    padding: "0.45rem 0.55rem",
  },
  smallInput: {
    width: "72px",
    border: "1px solid #cbd5e1",
    borderRadius: "8px",
    padding: "0.45rem 0.55rem",
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
  actionRow: {
    display: "grid",
    gap: "0.45rem",
  },
  rejectForm: {
    display: "flex",
    gap: "0.35rem",
    alignItems: "center",
  },
  rejectInput: {
    border: "1px solid #fca5a5",
    borderRadius: "8px",
    padding: "0.3rem 0.5rem",
    minWidth: "180px",
  },
  primaryButton: {
    border: "1px solid #0f172a",
    color: "#ffffff",
    background: "#0f172a",
    borderRadius: "8px",
    padding: "0.4rem 0.75rem",
    fontWeight: 600,
  },
  approveButton: {
    border: "1px solid #059669",
    color: "#065f46",
    background: "#ecfdf5",
    borderRadius: "999px",
    padding: "0.25rem 0.7rem",
    fontSize: "0.85rem",
    fontWeight: 600,
  },
  rejectButton: {
    border: "1px solid #dc2626",
    color: "#991b1b",
    background: "#fef2f2",
    borderRadius: "999px",
    padding: "0.25rem 0.7rem",
    fontSize: "0.85rem",
    fontWeight: 600,
  },
  riskLow: {
    color: "#065f46",
    background: "#ecfdf5",
    border: "1px solid #a7f3d0",
    borderRadius: "999px",
    padding: "0.15rem 0.5rem",
    textTransform: "uppercase",
    fontSize: "0.75rem",
    fontWeight: 700,
  },
  riskMedium: {
    color: "#92400e",
    background: "#fffbeb",
    border: "1px solid #fde68a",
    borderRadius: "999px",
    padding: "0.15rem 0.5rem",
    textTransform: "uppercase",
    fontSize: "0.75rem",
    fontWeight: 700,
  },
  riskHigh: {
    color: "#991b1b",
    background: "#fef2f2",
    border: "1px solid #fecaca",
    borderRadius: "999px",
    padding: "0.15rem 0.5rem",
    textTransform: "uppercase",
    fontSize: "0.75rem",
    fontWeight: 700,
  },
  list: {
    margin: 0,
    paddingLeft: "1rem",
    color: "#334155",
    display: "grid",
    gap: "0.35rem",
  },
  note: {
    margin: 0,
    color: "#64748b",
    fontSize: "0.9rem",
  },
};

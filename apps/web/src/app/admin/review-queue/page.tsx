import type { CSSProperties } from "react";
import { AdminShell } from "../../../features/admin/components/admin-shell";
import { variantReviewItems } from "../../../features/admin/mock-data";

// TODO(admin-feature): Drive queue from `/api/admin/generate-variants` output + DB state; wire Approve/Reject to `/api/admin/review/[variantId]/approve` and `.../reject` with audit events. Keep this flow separate from vetted `Question*` editor routes.

export default function AdminReviewQueuePage() {
  return (
    <AdminShell
      title="Generated Variant Review Queue"
      summary="Review generated variants with validation context and explicit approve/reject decisions before publication workflows."
    >
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
            {variantReviewItems.map((item) => (
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
                    <button type="button" style={styles.approveButton}>
                      Approve
                    </button>
                    <button type="button" style={styles.rejectButton}>
                      Reject
                    </button>
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </section>

      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Selected Variant Notes</h2>
        <ul style={styles.list}>
          {variantReviewItems.map((item) => (
            <li key={`${item.id}-note`}>
              <strong>{item.id}:</strong> {item.notes}
            </li>
          ))}
        </ul>
        <p style={styles.note}>
          Approve/reject buttons are UI scaffolding only until admin APIs and audit event writes are wired.
        </p>
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
    display: "flex",
    flexWrap: "wrap",
    gap: "0.45rem",
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
    marginTop: "0.8rem",
    marginBottom: 0,
    color: "#64748b",
    fontSize: "0.9rem",
  },
};

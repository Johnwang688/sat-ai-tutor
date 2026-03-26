import type { CSSProperties } from "react";
import {
  AdminActionLink,
  AdminMetricCard,
  AdminShell,
} from "../../features/admin/components/admin-shell";
import { adminSummaryMetrics } from "../../features/admin/mock-data";

export default function AdminPage() {
  return (
    <AdminShell
      title="Admin Home"
      summary="Manage vetted SAT content, review generated variants, and keep the section/domain/concept/subskill taxonomy clean."
    >
      <section style={styles.metricGrid} aria-label="Admin overview metrics">
        {adminSummaryMetrics.map((metric) => (
          <AdminMetricCard
            key={metric.label}
            label={metric.label}
            value={metric.count}
            detail={metric.detail}
          />
        ))}
      </section>

      <section style={styles.linksGrid} aria-label="Admin route links">
        <AdminActionLink
          href="/admin/questions"
          title="Vetted Question Editor"
          summary="Create and update draft question_bank content with explicit taxonomy links and answer schemas."
        />
        <AdminActionLink
          href="/admin/review-queue"
          title="Generated Variant Review Queue"
          summary="Approve or reject generated variants with validation context before they reach production workflows."
        />
        <AdminActionLink
          href="/admin/concepts"
          title="Taxonomy Management"
          summary="Maintain section, domain, concept, and subskill naming consistency and display order."
        />
      </section>

      <section style={styles.auditNotice}>
        <h2 style={styles.sectionTitle}>Access and Audit Notes</h2>
        <ul style={styles.list}>
          <li>Use server-side admin role checks before rendering privileged data.</li>
          <li>Write audit events for publish, approve, and reject actions.</li>
          <li>Keep generated variants separate from vetted question records.</li>
        </ul>
      </section>
    </AdminShell>
  );
}

const styles: Record<string, CSSProperties> = {
  metricGrid: {
    display: "grid",
    gap: "0.9rem",
    gridTemplateColumns: "repeat(auto-fit, minmax(200px, 1fr))",
    marginBottom: "1.1rem",
  },
  linksGrid: {
    display: "grid",
    gap: "0.9rem",
    gridTemplateColumns: "repeat(auto-fit, minmax(260px, 1fr))",
    marginBottom: "1.1rem",
  },
  auditNotice: {
    border: "1px solid #dbe7ef",
    borderRadius: "12px",
    padding: "1rem",
    background: "#f8fafc",
  },
  sectionTitle: {
    marginTop: 0,
    marginBottom: "0.6rem",
    fontSize: "1rem",
  },
  list: {
    margin: 0,
    paddingLeft: "1rem",
    color: "#334155",
    display: "grid",
    gap: "0.4rem",
  },
};

import type { CSSProperties } from "react";
import {
  AdminMetricCard,
  AdminShell,
  AdminActionLink,
  QuestionWorkflowLink,
  VariantWorkflowLink,
} from "../../features/admin/components/admin-shell";
import { getAdminDashboardSummary } from "@/features/admin/server/store";

export default function AdminPage() {
  const { metrics, auditEvents } = getAdminDashboardSummary();

  return (
    <AdminShell
      title="Admin Home"
      summary="Manage vetted SAT content, review generated variants, and keep the section/domain/concept/subskill taxonomy clean."
    >
      <section style={styles.metricGrid} aria-label="Admin overview metrics">
        {metrics.map((metric) => (
          <AdminMetricCard
            key={metric.label}
            label={metric.label}
            value={metric.count}
            detail={metric.detail}
          />
        ))}
      </section>

      <section style={styles.linksGrid} aria-label="Admin route links">
        <QuestionWorkflowLink
          href="/admin/questions"
          title="Vetted Question Editor"
          summary="Create and update draft question_bank content with explicit taxonomy links and answer schemas."
        />
        <VariantWorkflowLink
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

      <section style={styles.auditPanel}>
        <h2 style={styles.sectionTitle}>Recent Admin Audit Events</h2>
        {auditEvents.length === 0 ? (
          <p style={styles.emptyText}>No publish/review/taxonomy events yet.</p>
        ) : (
          <ul style={styles.list}>
            {auditEvents.map((event) => (
              <li key={event.id}>
                <code>{event.action}</code> on <code>{event.entityId}</code> by{" "}
                <code>{event.actorId}</code> at {event.createdAt}
              </li>
            ))}
          </ul>
        )}
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
  auditPanel: {
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
  emptyText: {
    margin: 0,
    color: "#64748b",
  },
  list: {
    margin: 0,
    paddingLeft: "1rem",
    color: "#334155",
    display: "grid",
    gap: "0.4rem",
  },
};

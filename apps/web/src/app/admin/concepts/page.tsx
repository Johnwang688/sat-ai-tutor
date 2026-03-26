import type { CSSProperties } from "react";
import { AdminShell } from "../../../features/admin/components/admin-shell";
import {
  conceptRecords,
  domainRecords,
  sectionRecords,
} from "../../../features/admin/mock-data";

// TODO(admin-feature): CRUD for section/domain/concept/subskill taxonomy (display order, slugs, relationships) via server actions or admin APIs; replace read-only mock tables.

export default function AdminConceptsPage() {
  return (
    <AdminShell
      title="Taxonomy Management"
      summary="Manage stable section, domain, concept, and subskill taxonomy records used by practice, scoring, and review workflows."
    >
      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Sections</h2>
        <table style={styles.table}>
          <thead>
            <tr>
              <th style={styles.headerCell}>Name</th>
              <th style={styles.headerCell}>Slug</th>
              <th style={styles.headerCell}>Display Order</th>
              <th style={styles.headerCell}>Domains</th>
            </tr>
          </thead>
          <tbody>
            {sectionRecords.map((section) => (
              <tr key={section.id}>
                <td style={styles.bodyCell}>{section.name}</td>
                <td style={styles.bodyCell}>
                  <code>{section.slug}</code>
                </td>
                <td style={styles.bodyCell}>{section.displayOrder}</td>
                <td style={styles.bodyCell}>{section.domainCount}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </section>

      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Domains</h2>
        <table style={styles.table}>
          <thead>
            <tr>
              <th style={styles.headerCell}>Name</th>
              <th style={styles.headerCell}>Section</th>
              <th style={styles.headerCell}>Slug</th>
              <th style={styles.headerCell}>Concepts</th>
              <th style={styles.headerCell}>Display Order</th>
            </tr>
          </thead>
          <tbody>
            {domainRecords.map((domain) => (
              <tr key={domain.id}>
                <td style={styles.bodyCell}>{domain.name}</td>
                <td style={styles.bodyCell}>
                  <code>{domain.sectionSlug}</code>
                </td>
                <td style={styles.bodyCell}>
                  <code>{domain.slug}</code>
                </td>
                <td style={styles.bodyCell}>{domain.conceptCount}</td>
                <td style={styles.bodyCell}>{domain.displayOrder}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </section>

      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Concepts</h2>
        <table style={styles.table}>
          <thead>
            <tr>
              <th style={styles.headerCell}>Name</th>
              <th style={styles.headerCell}>Domain</th>
              <th style={styles.headerCell}>Slug</th>
              <th style={styles.headerCell}>Subskills</th>
              <th style={styles.headerCell}>Display Order</th>
            </tr>
          </thead>
          <tbody>
            {conceptRecords.map((concept) => (
              <tr key={concept.id}>
                <td style={styles.bodyCell}>{concept.name}</td>
                <td style={styles.bodyCell}>
                  <code>{concept.domainSlug}</code>
                </td>
                <td style={styles.bodyCell}>
                  <code>{concept.slug}</code>
                </td>
                <td style={styles.bodyCell}>{concept.subskillCount}</td>
                <td style={styles.bodyCell}>{concept.displayOrder}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </section>

      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Change Checklist</h2>
        <ul style={styles.list}>
          <li>Use immutable slugs for section/domain/concept/subskill records after publish.</li>
          <li>Require explicit display order values before saving.</li>
          <li>Write audit events for create, rename, and reorder actions.</li>
        </ul>
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
    overflowX: "auto",
    background: "#ffffff",
  },
  sectionTitle: {
    marginTop: 0,
    marginBottom: "0.6rem",
    fontSize: "1rem",
  },
  table: {
    width: "100%",
    borderCollapse: "collapse",
    fontSize: "0.95rem",
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
  list: {
    margin: 0,
    paddingLeft: "1rem",
    color: "#334155",
    display: "grid",
    gap: "0.4rem",
  },
};

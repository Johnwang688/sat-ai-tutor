import { revalidatePath } from "next/cache";
import type { CSSProperties } from "react";
import { theme } from "@/theme/app-theme";
import { AdminShell } from "../../../features/admin/components/admin-shell";
import { assertAdminFromServerContext } from "@/features/admin/server/auth";
import {
  createConcept,
  createDomain,
  createSection,
  deleteTaxonomyEntity,
  getTaxonomySnapshot,
  updateTaxonomyConcept,
  updateTaxonomyDomain,
  updateTaxonomySection,
} from "@/features/admin/server/store";

async function createSectionAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const name = String(formData.get("name") ?? "").trim();
  const slug = String(formData.get("slug") ?? "").trim();
  const displayOrder = Number(formData.get("displayOrder"));
  if (!name || !slug || !Number.isInteger(displayOrder)) {
    return;
  }
  createSection({ name, slug, displayOrder }, actor);
  revalidatePath("/admin");
  revalidatePath("/admin/concepts");
}

async function createDomainAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const sectionSlug = String(formData.get("sectionSlug") ?? "").trim();
  const name = String(formData.get("name") ?? "").trim();
  const slug = String(formData.get("slug") ?? "").trim();
  const displayOrder = Number(formData.get("displayOrder"));
  if (!sectionSlug || !name || !slug || !Number.isInteger(displayOrder)) {
    return;
  }
  createDomain({ sectionSlug, name, slug, displayOrder }, actor);
  revalidatePath("/admin");
  revalidatePath("/admin/concepts");
}

async function createConceptAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const domainSlug = String(formData.get("domainSlug") ?? "").trim();
  const name = String(formData.get("name") ?? "").trim();
  const slug = String(formData.get("slug") ?? "").trim();
  const displayOrder = Number(formData.get("displayOrder"));
  if (!domainSlug || !name || !slug || !Number.isInteger(displayOrder)) {
    return;
  }
  createConcept({ domainSlug, name, slug, displayOrder }, actor);
  revalidatePath("/admin");
  revalidatePath("/admin/concepts");
}

async function updateSectionAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const id = String(formData.get("id") ?? "");
  const name = String(formData.get("name") ?? "");
  const slug = String(formData.get("slug") ?? "");
  const displayOrder = Number(formData.get("displayOrder"));
  if (!id || !Number.isInteger(displayOrder)) {
    return;
  }
  updateTaxonomySection(id, { name, slug, displayOrder }, actor);
  revalidatePath("/admin/concepts");
}

async function updateDomainAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const id = String(formData.get("id") ?? "");
  const sectionSlug = String(formData.get("sectionSlug") ?? "");
  const name = String(formData.get("name") ?? "");
  const slug = String(formData.get("slug") ?? "");
  const displayOrder = Number(formData.get("displayOrder"));
  if (!id || !Number.isInteger(displayOrder)) {
    return;
  }
  updateTaxonomyDomain(id, { sectionSlug, name, slug, displayOrder }, actor);
  revalidatePath("/admin/concepts");
}

async function updateConceptAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const id = String(formData.get("id") ?? "");
  const domainSlug = String(formData.get("domainSlug") ?? "");
  const name = String(formData.get("name") ?? "");
  const slug = String(formData.get("slug") ?? "");
  const displayOrder = Number(formData.get("displayOrder"));
  if (!id || !Number.isInteger(displayOrder)) {
    return;
  }
  updateTaxonomyConcept(id, { domainSlug, name, slug, displayOrder }, actor);
  revalidatePath("/admin/concepts");
}

async function deleteEntityAction(formData: FormData) {
  "use server";
  const actor = await assertAdminFromServerContext();
  const kind = String(formData.get("kind") ?? "");
  const id = String(formData.get("id") ?? "");
  if (!id || (kind !== "section" && kind !== "domain" && kind !== "concept")) {
    return;
  }
  deleteTaxonomyEntity(kind, id, actor);
  revalidatePath("/admin");
  revalidatePath("/admin/concepts");
}

export default function AdminConceptsPage() {
  const { sections, domains, concepts } = getTaxonomySnapshot();

  return (
    <AdminShell
      title="Taxonomy Management"
      summary="Manage stable section, domain, and concept taxonomy records used by practice, scoring, and review workflows."
    >
      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Create Taxonomy Entities</h2>
        <div style={styles.createGrid}>
          <form style={styles.createForm} action={createSectionAction}>
            <h3 style={styles.subheading}>New Section</h3>
            <input style={styles.input} name="name" placeholder="Name" required />
            <input style={styles.input} name="slug" placeholder="Slug" required />
            <input
              style={styles.smallInput}
              name="displayOrder"
              type="number"
              defaultValue={1}
              required
            />
            <button type="submit" style={styles.primaryButton}>
              Add Section
            </button>
          </form>

          <form style={styles.createForm} action={createDomainAction}>
            <h3 style={styles.subheading}>New Domain</h3>
            <input style={styles.input} name="sectionSlug" placeholder="Parent section slug" required />
            <input style={styles.input} name="name" placeholder="Name" required />
            <input style={styles.input} name="slug" placeholder="Slug" required />
            <input
              style={styles.smallInput}
              name="displayOrder"
              type="number"
              defaultValue={1}
              required
            />
            <button type="submit" style={styles.primaryButton}>
              Add Domain
            </button>
          </form>

          <form style={styles.createForm} action={createConceptAction}>
            <h3 style={styles.subheading}>New Concept</h3>
            <input style={styles.input} name="domainSlug" placeholder="Parent domain slug" required />
            <input style={styles.input} name="name" placeholder="Name" required />
            <input style={styles.input} name="slug" placeholder="Slug" required />
            <input
              style={styles.smallInput}
              name="displayOrder"
              type="number"
              defaultValue={1}
              required
            />
            <button type="submit" style={styles.primaryButton}>
              Add Concept
            </button>
          </form>
        </div>
      </section>

      <section style={styles.panel}>
        <h2 style={styles.sectionTitle}>Sections</h2>
        <table style={styles.table}>
          <thead>
            <tr>
              <th style={styles.headerCell}>Name</th>
              <th style={styles.headerCell}>Slug</th>
              <th style={styles.headerCell}>Display Order</th>
              <th style={styles.headerCell}>Domains</th>
              <th style={styles.headerCell}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {sections.map((section) => (
              <tr key={section.id}>
                <td style={styles.bodyCell}>
                  <input style={styles.input} form={`section-${section.id}`} name="name" defaultValue={section.name} />
                </td>
                <td style={styles.bodyCell}>
                  <input style={styles.input} form={`section-${section.id}`} name="slug" defaultValue={section.slug} />
                </td>
                <td style={styles.bodyCell}>
                  <input
                    style={styles.smallInput}
                    form={`section-${section.id}`}
                    name="displayOrder"
                    type="number"
                    defaultValue={section.displayOrder}
                  />
                </td>
                <td style={styles.bodyCell}>{section.domainCount}</td>
                <td style={styles.bodyCell}>
                  <form id={`section-${section.id}`} action={updateSectionAction} style={styles.actionRow}>
                    <input type="hidden" name="id" value={section.id} />
                    <button type="submit" style={styles.secondaryButton}>Update</button>
                  </form>
                  <form action={deleteEntityAction}>
                    <input type="hidden" name="kind" value="section" />
                    <input type="hidden" name="id" value={section.id} />
                    <button type="submit" style={styles.deleteButton}>Delete</button>
                  </form>
                </td>
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
              <th style={styles.headerCell}>Section</th>
              <th style={styles.headerCell}>Name</th>
              <th style={styles.headerCell}>Slug</th>
              <th style={styles.headerCell}>Concepts</th>
              <th style={styles.headerCell}>Display Order</th>
              <th style={styles.headerCell}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {domains.map((domain) => (
              <tr key={domain.id}>
                <td style={styles.bodyCell}>
                  <input
                    style={styles.input}
                    form={`domain-${domain.id}`}
                    name="sectionSlug"
                    defaultValue={domain.sectionSlug}
                  />
                </td>
                <td style={styles.bodyCell}>
                  <input style={styles.input} form={`domain-${domain.id}`} name="name" defaultValue={domain.name} />
                </td>
                <td style={styles.bodyCell}>
                  <input style={styles.input} form={`domain-${domain.id}`} name="slug" defaultValue={domain.slug} />
                </td>
                <td style={styles.bodyCell}>{domain.conceptCount}</td>
                <td style={styles.bodyCell}>
                  <input
                    style={styles.smallInput}
                    form={`domain-${domain.id}`}
                    name="displayOrder"
                    type="number"
                    defaultValue={domain.displayOrder}
                  />
                </td>
                <td style={styles.bodyCell}>
                  <form id={`domain-${domain.id}`} action={updateDomainAction}>
                    <input type="hidden" name="id" value={domain.id} />
                    <button type="submit" style={styles.secondaryButton}>Update</button>
                  </form>
                  <form action={deleteEntityAction}>
                    <input type="hidden" name="kind" value="domain" />
                    <input type="hidden" name="id" value={domain.id} />
                    <button type="submit" style={styles.deleteButton}>Delete</button>
                  </form>
                </td>
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
              <th style={styles.headerCell}>Domain</th>
              <th style={styles.headerCell}>Name</th>
              <th style={styles.headerCell}>Slug</th>
              <th style={styles.headerCell}>Display Order</th>
              <th style={styles.headerCell}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {concepts.map((concept) => (
              <tr key={concept.id}>
                <td style={styles.bodyCell}>
                  <input
                    style={styles.input}
                    form={`concept-${concept.id}`}
                    name="domainSlug"
                    defaultValue={concept.domainSlug}
                  />
                </td>
                <td style={styles.bodyCell}>
                  <input
                    style={styles.input}
                    form={`concept-${concept.id}`}
                    name="name"
                    defaultValue={concept.name}
                  />
                </td>
                <td style={styles.bodyCell}>
                  <input
                    style={styles.input}
                    form={`concept-${concept.id}`}
                    name="slug"
                    defaultValue={concept.slug}
                  />
                </td>
                <td style={styles.bodyCell}>
                  <input
                    style={styles.smallInput}
                    form={`concept-${concept.id}`}
                    name="displayOrder"
                    type="number"
                    defaultValue={concept.displayOrder}
                  />
                </td>
                <td style={styles.bodyCell}>
                  <form id={`concept-${concept.id}`} action={updateConceptAction}>
                    <input type="hidden" name="id" value={concept.id} />
                    <button type="submit" style={styles.secondaryButton}>Update</button>
                  </form>
                  <form action={deleteEntityAction}>
                    <input type="hidden" name="kind" value="concept" />
                    <input type="hidden" name="id" value={concept.id} />
                    <button type="submit" style={styles.deleteButton}>Delete</button>
                  </form>
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
    overflowX: "auto",
    background: "#ffffff",
  },
  sectionTitle: {
    marginTop: 0,
    marginBottom: "0.6rem",
    fontSize: "1rem",
  },
  createGrid: {
    display: "grid",
    gap: "0.8rem",
    gridTemplateColumns: "repeat(auto-fit, minmax(240px, 1fr))",
  },
  createForm: {
    border: "1px solid #e2e8f0",
    borderRadius: "10px",
    padding: "0.7rem",
    display: "grid",
    gap: "0.45rem",
  },
  subheading: {
    margin: 0,
    fontSize: "0.95rem",
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
  input: {
    border: "1px solid #cbd5e1",
    borderRadius: "8px",
    padding: "0.4rem 0.55rem",
    minWidth: "140px",
    width: "100%",
  },
  smallInput: {
    border: "1px solid #cbd5e1",
    borderRadius: "8px",
    padding: "0.4rem 0.55rem",
    width: "85px",
  },
  actionRow: {
    marginBottom: "0.35rem",
  },
  primaryButton: {
    border: `1px solid ${theme.accent}`,
    color: theme.accentForeground,
    background: theme.accent,
    borderRadius: "8px",
    padding: "0.35rem 0.65rem",
    fontWeight: 600,
  },
  secondaryButton: {
    border: `1px solid ${theme.borderStrong}`,
    color: theme.text,
    background: theme.surfaceMuted,
    borderRadius: "8px",
    padding: "0.35rem 0.65rem",
    fontWeight: 600,
    marginBottom: "0.25rem",
  },
  deleteButton: {
    border: "1px solid #dc2626",
    color: "#991b1b",
    background: "#fef2f2",
    borderRadius: "8px",
    padding: "0.35rem 0.65rem",
    fontWeight: 600,
  },
};

import { sectionProgress } from "../../features/progress/mock-progress";
import { theme } from "../../theme/app-theme";

export default function SettingsPage() {
  return (
    <main style={{ margin: "0 auto", maxWidth: 920, padding: "2rem 1.5rem 3rem" }}>
      <header style={{ marginBottom: "1.25rem" }}>
        <h1 style={{ marginBottom: "0.4rem" }}>Settings</h1>
        <p style={{ margin: 0 }}>Manage profile and learning preferences for your own account only.</p>
      </header>

      <section style={panelStyle}>
        <h2 style={{ marginTop: 0 }}>Profile</h2>
        <form style={{ display: "grid", gap: "0.7rem" }}>
          <label style={labelStyle}>
            Display name
            <input defaultValue="Avery Johnson" style={inputStyle} />
          </label>
          <label style={labelStyle}>
            School year
            <input defaultValue="11th Grade" style={inputStyle} />
          </label>
          <label style={labelStyle}>
            Target SAT score
            <input defaultValue="1450" style={inputStyle} />
          </label>
          <button type="submit" style={primaryButtonStyle}>
            Save profile changes
          </button>
        </form>
      </section>

      <section style={{ ...panelStyle, marginTop: "1rem" }}>
        <h2 style={{ marginTop: 0 }}>Practice preferences</h2>
        <label style={checkStyle}>
          <input type="checkbox" defaultChecked /> Show deterministic recommendation card on dashboard
        </label>
        <label style={checkStyle}>
          <input type="checkbox" defaultChecked /> Show tutor hint reminder in active sessions
        </label>
        <label style={checkStyle}>
          <input type="checkbox" /> Enable reminder email digest (placeholder)
        </label>
      </section>

      <section style={{ ...panelStyle, marginTop: "1rem" }}>
        <h2 style={{ marginTop: 0 }}>Current section mastery snapshot</h2>
        <ul style={listStyle}>
          {sectionProgress.map((section) => (
            <li key={section.slug}>
              {section.label}: {section.weightedMastery}% weighted mastery, {section.accuracyPercent}% accuracy
            </li>
          ))}
        </ul>
      </section>
    </main>
  );
}

const panelStyle = {
  border: `1px solid ${theme.border}`,
  borderRadius: 12,
  padding: "1rem",
  backgroundColor: theme.surface,
} as const;

const labelStyle = {
  display: "grid",
  gap: "0.35rem",
  fontWeight: 600,
} as const;

const inputStyle = {
  width: "100%",
  border: "1px solid #cbd5e1",
  borderRadius: 8,
  padding: "0.55rem 0.65rem",
} as const;

const primaryButtonStyle = {
  border: "none",
  borderRadius: 8,
  backgroundColor: theme.accent,
  color: theme.accentForeground,
  padding: "0.6rem 0.75rem",
  fontWeight: 600,
  width: "fit-content",
} as const;

const checkStyle = {
  display: "flex",
  gap: "0.45rem",
  marginBottom: "0.5rem",
  alignItems: "center",
} as const;

const listStyle = {
  margin: "0 0 0 1.1rem",
  padding: 0,
  lineHeight: 1.45,
} as const;

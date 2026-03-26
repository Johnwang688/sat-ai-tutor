import type { CSSProperties, ReactNode } from "react";

type RouteScreenProps = {
  eyebrow?: string;
  title: string;
  summary: string;
  children?: ReactNode;
  nextFiles?: readonly string[];
};

export function RouteScreen({
  eyebrow = "SAT AI Tutor",
  title,
  summary,
  children,
  nextFiles = [],
}: RouteScreenProps) {
  const hasSecondaryContent = Boolean(children) || nextFiles.length > 0;

  return (
    <main style={mainStyle}>
      <section style={heroStyle}>
        <p style={eyebrowStyle}>{eyebrow}</p>
        <h1 style={titleStyle}>{title}</h1>
        <p style={summaryStyle}>{summary}</p>
      </section>

      {hasSecondaryContent ? (
        <section style={detailsStyle}>
          {children}
          {nextFiles.length > 0 ? (
            <div>
              <h2 style={headingStyle}>Next files</h2>
              <ul style={fileListStyle}>
                {nextFiles.map((filePath) => (
                  <li key={filePath} style={fileItemStyle}>
                    <code>{filePath}</code>
                  </li>
                ))}
              </ul>
            </div>
          ) : null}
        </section>
      ) : null}
    </main>
  );
}

const mainStyle: CSSProperties = {
  margin: "0 auto",
  maxWidth: "960px",
  padding: "40px 24px 64px",
  display: "grid",
  gap: "24px",
};

const heroStyle: CSSProperties = {
  display: "grid",
  gap: "12px",
  padding: "24px",
  borderRadius: "16px",
  border: "1px solid #d7dde7",
  background:
    "linear-gradient(145deg, rgba(255,255,255,0.95) 0%, rgba(245,248,252,1) 100%)",
};

const eyebrowStyle: CSSProperties = {
  margin: "0",
  fontSize: "12px",
  letterSpacing: "0.08em",
  textTransform: "uppercase",
  fontWeight: "600",
  color: "#3d4b66",
};

const titleStyle: CSSProperties = {
  margin: "0",
  fontSize: "clamp(1.8rem, 2.5vw, 2.4rem)",
  lineHeight: "1.1",
  color: "#0f172a",
};

const summaryStyle: CSSProperties = {
  margin: "0",
  maxWidth: "65ch",
  fontSize: "1rem",
  lineHeight: "1.6",
  color: "#2a3345",
};

const detailsStyle: CSSProperties = {
  display: "grid",
  gap: "20px",
  padding: "24px",
  borderRadius: "16px",
  border: "1px solid #d7dde7",
  backgroundColor: "#ffffff",
};

const headingStyle: CSSProperties = {
  margin: "0 0 10px",
  fontSize: "1rem",
  color: "#0f172a",
};

const fileListStyle: CSSProperties = {
  margin: "0",
  padding: "0 0 0 18px",
  display: "grid",
  gap: "8px",
};

const fileItemStyle: CSSProperties = {
  color: "#1f2937",
};

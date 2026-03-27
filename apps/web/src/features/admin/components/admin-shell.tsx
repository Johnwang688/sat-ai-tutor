import Link from "next/link";
import type { CSSProperties, ReactNode } from "react";
import { theme } from "@/theme/app-theme";

type AdminShellProps = {
  title: string;
  summary: string;
  children: ReactNode;
};

type AdminMetricCardProps = {
  label: string;
  value: string | number;
  detail: string;
};

type WorkflowLinkProps = {
  href: string;
  title: string;
  summary: string;
};

export function AdminShell({ title, summary, children }: AdminShellProps) {
  return (
    <main style={styles.main}>
      <header style={styles.header}>
        <p style={styles.eyebrow}>SAT Admin Workspace</p>
        <h1 style={styles.title}>{title}</h1>
        <p style={styles.summary}>{summary}</p>
      </header>
      {children}
    </main>
  );
}

export function AdminMetricCard({ label, value, detail }: AdminMetricCardProps) {
  return (
    <article style={styles.metricCard}>
      <p style={styles.metricLabel}>{label}</p>
      <p style={styles.metricValue}>{value}</p>
      <p style={styles.metricDetail}>{detail}</p>
    </article>
  );
}

function WorkflowLink({ href, title, summary }: WorkflowLinkProps) {
  return (
    <Link href={href} style={styles.actionLink}>
      <h2 style={styles.actionTitle}>{title}</h2>
      <p style={styles.actionSummary}>{summary}</p>
    </Link>
  );
}

export function QuestionWorkflowLink(props: WorkflowLinkProps) {
  return <WorkflowLink {...props} />;
}

export function VariantWorkflowLink(props: WorkflowLinkProps) {
  return <WorkflowLink {...props} />;
}

export function AdminActionLink(props: WorkflowLinkProps) {
  return <WorkflowLink {...props} />;
}

const styles: Record<string, CSSProperties> = {
  main: {
    margin: "0 auto",
    maxWidth: "1100px",
    padding: "2rem 1.25rem 3rem",
    color: "#1f2937",
    fontFamily: '"Segoe UI", "Helvetica Neue", Helvetica, sans-serif',
  },
  header: {
    marginBottom: "1.5rem",
  },
  eyebrow: {
    color: theme.accent,
    fontWeight: 700,
    letterSpacing: "0.04em",
    marginBottom: "0.5rem",
    textTransform: "uppercase",
    fontSize: "0.75rem",
  },
  title: {
    margin: 0,
    fontSize: "1.9rem",
    lineHeight: 1.2,
  },
  summary: {
    marginTop: "0.5rem",
    maxWidth: "66ch",
    color: "#475569",
  },
  metricCard: {
    background: theme.surface,
    border: `1px solid ${theme.border}`,
    borderRadius: "12px",
    padding: "1rem",
  },
  metricLabel: {
    margin: 0,
    color: "#475569",
    fontWeight: 600,
    fontSize: "0.9rem",
  },
  metricValue: {
    margin: "0.35rem 0",
    fontSize: "1.7rem",
    fontWeight: 800,
    color: theme.text,
  },
  metricDetail: {
    margin: 0,
    color: "#64748b",
    fontSize: "0.9rem",
  },
  actionLink: {
    display: "block",
    border: `1px solid ${theme.border}`,
    borderRadius: "12px",
    padding: "1rem",
    textDecoration: "none",
    color: "inherit",
    background: theme.surface,
  },
  actionTitle: {
    margin: 0,
    fontSize: "1.1rem",
  },
  actionSummary: {
    marginTop: "0.35rem",
    color: "#475569",
  },
};

import type { CSSProperties, ReactNode } from "react";

type RootLayoutProps = {
  children: ReactNode;
};

export const metadata = {
  title: "SAT AI Tutor",
  description:
    "Structured SAT practice with concept-level mastery tracking and a policy-aware AI tutor.",
};

export default function RootLayout({ children }: RootLayoutProps) {
  return (
    <html lang="en">
      <body style={bodyStyle}>
        <div style={backgroundGlowStyle} aria-hidden />
        <div style={appFrameStyle}>{children}</div>
      </body>
    </html>
  );
}

const bodyStyle: CSSProperties = {
  margin: "0",
  minHeight: "100vh",
  position: "relative",
  background:
    "radial-gradient(circle at 15% 10%, rgba(30, 64, 175, 0.12), transparent 40%), radial-gradient(circle at 90% 0%, rgba(14, 116, 144, 0.12), transparent 35%), #f3f6fb",
  color: "#0f172a",
  fontFamily:
    "ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, sans-serif",
};

const appFrameStyle: CSSProperties = {
  position: "relative",
  minHeight: "100vh",
};

const backgroundGlowStyle: CSSProperties = {
  position: "absolute",
  inset: "0",
  pointerEvents: "none",
  background:
    "linear-gradient(180deg, rgba(255,255,255,0.55) 0%, rgba(255,255,255,0.25) 100%)",
};

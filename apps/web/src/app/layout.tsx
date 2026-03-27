import type { CSSProperties, ReactNode } from "react";
import "./globals.css";
import { theme } from "../theme/app-theme";

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
  background: theme.bgBody,
  color: theme.text,
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
  background: theme.bgVeil,
};

/**
 * Light, Bluebook-like shell with purple accents (primary actions, selection, links).
 * Import values as needed for inline styles.
 */
export const theme = {
  /** Page canvas — near-white */
  bgPage: "#fafafa",
  /** Subtle purple ambient gradients over white */
  bgBody:
    "radial-gradient(circle at 12% 8%, rgba(124, 58, 237, 0.07), transparent 42%), radial-gradient(circle at 88% 0%, rgba(167, 139, 250, 0.08), transparent 38%), #ffffff",
  /** Top veil for depth */
  bgVeil: "linear-gradient(180deg, rgba(255,255,255,0.85) 0%, rgba(255,255,255,0.35) 100%)",

  /** Primary text — near-black for readability */
  text: "#0f172a",
  /** Slightly softer body copy */
  textSecondary: "#334155",
  textMuted: "#64748b",

  /** Brand / CTAs */
  accent: "#6d28d9",
  accentHover: "#5b21b6",
  accentForeground: "#ffffff",

  /** Soft fills (prompt areas, selected chips) */
  accentSoft: "#f5f3ff",
  accentSoft2: "#ede9fe",
  accentBorder: "#c4b5fd",
  accentBorderStrong: "#7c3aed",

  /** Cards and panels */
  surface: "#ffffff",
  surfaceMuted: "#f8fafc",
  border: "#e2e8f0",
  borderStrong: "#cbd5e1",

  /** Shadows — neutral with a hint of warmth */
  shadowModal: "0 24px 80px rgba(15, 23, 42, 0.14)",
  shadowFloating: "0 18px 40px rgba(91, 33, 182, 0.18)",
} as const;

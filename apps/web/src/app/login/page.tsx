import { cookies } from "next/headers";
import Link from "next/link";
import { redirect } from "next/navigation";
import { authFlowNotes, authHighlights } from "../../features/auth/mock-auth";
import {
  AUTH_SESSION_COOKIE_NAME,
  encodeAuthSessionCookie,
  getAuthSessionCookieOptions,
  resolvePostAuthPath,
  signInWithPassword,
} from "../../features/auth/server";

type LoginPageProps = {
  searchParams?: Promise<{
    error?: string;
    next?: string;
  }>;
};

async function loginAction(formData: FormData) {
  "use server";

  const email = String(formData.get("email") ?? "");
  const password = String(formData.get("password") ?? "");
  const nextPath = String(formData.get("next") ?? "");
  const result = await signInWithPassword({ email, password });

  if (!result.ok) {
    redirect(`/login?error=${encodeURIComponent(result.error)}`);
  }

  const cookieStore = await cookies();
  cookieStore.set(
    AUTH_SESSION_COOKIE_NAME,
    encodeAuthSessionCookie(result.session),
    getAuthSessionCookieOptions(),
  );
  cookieStore.set("sat_user_id", result.session.userId, getAuthSessionCookieOptions());
  cookieStore.set("sat_role", result.session.role, getAuthSessionCookieOptions());

  const safeNextPath = nextPath.startsWith("/") ? nextPath : "";
  redirect(safeNextPath || resolvePostAuthPath(result.session.role));
}

export default async function LoginPage({ searchParams }: LoginPageProps) {
  const resolvedSearchParams = (await searchParams) ?? {};
  const inlineError = resolvedSearchParams.error?.trim();
  const nextPath = resolvedSearchParams.next?.startsWith("/")
    ? resolvedSearchParams.next
    : "";

  return (
    <main style={{ margin: "0 auto", maxWidth: 840, padding: "2.5rem 1.5rem 3rem" }}>
      <header style={{ marginBottom: "1.5rem" }}>
        <h1 style={{ marginBottom: "0.5rem" }}>Login</h1>
        <p style={{ margin: 0 }}>
          Email/password is the default V1 path. After authentication, server logic routes students to `/dashboard` and admins to `/admin`.
        </p>
      </header>

      <section
        style={{
          display: "grid",
          gap: "1.25rem",
          gridTemplateColumns: "repeat(auto-fit, minmax(260px, 1fr))",
        }}
      >
        <form action={loginAction} style={panelStyle}>
          {inlineError ? <p style={errorStyle}>{inlineError}</p> : null}
          <input type="hidden" name="next" value={nextPath} />

          <label htmlFor="email" style={labelStyle}>
            Email
          </label>
          <input
            id="email"
            type="email"
            name="email"
            placeholder="student@example.com"
            autoComplete="email"
            required
            style={inputStyle}
          />

          <label htmlFor="password" style={labelStyle}>
            Password
          </label>
          <input
            id="password"
            type="password"
            name="password"
            placeholder="Enter your password"
            autoComplete="current-password"
            required
            style={inputStyle}
          />

          <button type="submit" style={primaryButtonStyle}>
            Continue to account
          </button>

          <button type="button" disabled style={secondaryButtonStyle}>
            Email me a magic link (coming soon)
          </button>
        </form>

        <aside style={panelStyle}>
          <h2 style={{ marginTop: 0 }}>Auth flow notes</h2>
          <ul style={listStyle}>
            {authFlowNotes.map((note) => (
              <li key={note}>{note}</li>
            ))}
          </ul>
          <h3 style={{ marginBottom: "0.5rem" }}>What V1 includes</h3>
          <ul style={listStyle}>
            {authHighlights.map((highlight) => (
              <li key={highlight}>{highlight}</li>
            ))}
          </ul>
          <p style={{ marginBottom: 0 }}>
            New here? <Link href="/signup">Create your account</Link>
          </p>
        </aside>
      </section>
    </main>
  );
}

const panelStyle = {
  border: "1px solid #d7dce5",
  borderRadius: 12,
  padding: "1rem",
  backgroundColor: "#ffffff",
} as const;

const labelStyle = {
  display: "block",
  fontWeight: 600,
  marginBottom: "0.35rem",
  marginTop: "0.75rem",
} as const;

const inputStyle = {
  width: "100%",
  padding: "0.6rem 0.65rem",
  borderRadius: 8,
  border: "1px solid #cbd5e1",
} as const;

const primaryButtonStyle = {
  marginTop: "1rem",
  width: "100%",
  borderRadius: 8,
  border: "none",
  backgroundColor: "#0f172a",
  color: "#ffffff",
  padding: "0.65rem 0.75rem",
  fontWeight: 600,
} as const;

const secondaryButtonStyle = {
  marginTop: "0.65rem",
  width: "100%",
  borderRadius: 8,
  border: "1px solid #94a3b8",
  backgroundColor: "#f8fafc",
  color: "#0f172a",
  padding: "0.65rem 0.75rem",
  fontWeight: 600,
  opacity: 0.7,
} as const;

const listStyle = {
  margin: "0 0 1rem 1.1rem",
  padding: 0,
  lineHeight: 1.45,
} as const;

const errorStyle = {
  margin: 0,
  border: "1px solid #fecaca",
  borderRadius: 8,
  backgroundColor: "#fef2f2",
  color: "#991b1b",
  padding: "0.55rem 0.6rem",
  fontWeight: 600,
} as const;

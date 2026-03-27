import { cookies } from "next/headers";
import Link from "next/link";
import { redirect } from "next/navigation";
import { signupProfileFields } from "../../features/auth/mock-auth";
import {
  AUTH_SESSION_COOKIE_NAME,
  encodeAuthSessionCookie,
  getAuthSessionCookieOptions,
  resolvePostAuthPath,
  signUpAndBootstrapProfile,
} from "../../features/auth/server";
import { theme } from "../../theme/app-theme";

type SignupPageProps = {
  searchParams?: Promise<{
    error?: string;
  }>;
};

function parseOptionalNumber(value: FormDataEntryValue | null): number | undefined {
  if (typeof value !== "string") {
    return undefined;
  }

  const trimmed = value.trim();
  if (!trimmed) {
    return undefined;
  }

  const parsed = Number(trimmed);
  if (!Number.isFinite(parsed)) {
    return undefined;
  }

  return parsed;
}

async function signupAction(formData: FormData) {
  "use server";

  const displayName = String(formData.get("displayName") ?? "");
  const email = String(formData.get("email") ?? "");
  const password = String(formData.get("password") ?? "");
  const targetScore = parseOptionalNumber(formData.get("targetScore"));
  const gradYear = parseOptionalNumber(formData.get("gradYear"));

  const result = await signUpAndBootstrapProfile({
    displayName,
    email,
    password,
    targetScore,
    gradYear,
  });

  if (!result.ok) {
    redirect(`/signup?error=${encodeURIComponent(result.error)}`);
  }

  const cookieStore = await cookies();
  cookieStore.set(
    AUTH_SESSION_COOKIE_NAME,
    encodeAuthSessionCookie(result.session),
    getAuthSessionCookieOptions(),
  );
  cookieStore.set("sat_user_id", result.session.userId, getAuthSessionCookieOptions());
  cookieStore.set("sat_role", result.session.role, getAuthSessionCookieOptions());

  redirect(resolvePostAuthPath(result.session.role));
}

export default async function SignupPage({ searchParams }: SignupPageProps) {
  const resolvedSearchParams = (await searchParams) ?? {};
  const inlineError = resolvedSearchParams.error?.trim();

  return (
    <main style={{ margin: "0 auto", maxWidth: 840, padding: "2.5rem 1.5rem 3rem" }}>
      <header style={{ marginBottom: "1.25rem" }}>
        <h1 style={{ marginBottom: "0.5rem" }}>Create your SAT prep account</h1>
        <p style={{ margin: 0 }}>
          V1 signup creates your auth account first, then boots a matching `profiles` row before sending you to `/dashboard`.
        </p>
      </header>

      <section
        style={{
          display: "grid",
          gap: "1.25rem",
          gridTemplateColumns: "repeat(auto-fit, minmax(260px, 1fr))",
        }}
      >
        <form action={signupAction} style={panelStyle}>
          {inlineError ? <p style={errorStyle}>{inlineError}</p> : null}

          {signupProfileFields.map((field) => (
            <div key={field.id}>
              <label htmlFor={field.id} style={labelStyle}>
                {field.label}
              </label>
              <input
                id={field.id}
                name={field.id}
                required={field.required}
                placeholder={field.placeholder}
                style={inputStyle}
              />
            </div>
          ))}

          <div>
            <label htmlFor="email" style={labelStyle}>
              Email
            </label>
            <input
              id="email"
              name="email"
              type="email"
              required
              placeholder="student@example.com"
              autoComplete="email"
              style={inputStyle}
            />
          </div>

          <div>
            <label htmlFor="password" style={labelStyle}>
              Password
            </label>
            <input
              id="password"
              name="password"
              type="password"
              required
              placeholder="Use 8+ characters"
              autoComplete="new-password"
              style={inputStyle}
            />
          </div>

          <button type="submit" style={buttonStyle}>
            Create account and continue
          </button>
        </form>

        <aside style={panelStyle}>
          <h2 style={{ marginTop: 0 }}>What happens next</h2>
          <ol style={listStyle}>
            <li>We create your auth account in Supabase Auth.</li>
            <li>We insert your public profile record in `profiles`.</li>
            <li>We route you to your student dashboard.</li>
          </ol>
          <p style={{ marginBottom: 0 }}>
            Already have an account? <Link href="/login">Login here</Link>.
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

const buttonStyle = {
  marginTop: "1rem",
  width: "100%",
  borderRadius: 8,
  border: "none",
  backgroundColor: theme.accent,
  color: theme.accentForeground,
  padding: "0.65rem 0.75rem",
  fontWeight: 600,
} as const;

const listStyle = {
  margin: "0 0 1rem 1.1rem",
  padding: 0,
  lineHeight: 1.45,
} as const;

const errorStyle = {
  margin: "0 0 0.75rem",
  border: "1px solid #fecaca",
  borderRadius: 8,
  backgroundColor: "#fef2f2",
  color: "#991b1b",
  padding: "0.55rem 0.6rem",
  fontWeight: 600,
} as const;

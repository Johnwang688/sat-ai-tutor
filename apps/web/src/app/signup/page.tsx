import Link from "next/link";
import { signupProfileFields } from "../../features/auth/mock-auth";

// TODO(auth-feature): After auth user creation, bootstrap `profiles` (and any related rows) with submitted display name / target score / grad year, then redirect to `/dashboard`. Reuse server helpers from `features/auth/server`.

export default function SignupPage() {
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
        <form style={panelStyle}>
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
            <input id="email" name="email" type="email" required placeholder="student@example.com" style={inputStyle} />
          </div>

          <div>
            <label htmlFor="password" style={labelStyle}>
              Password
            </label>
            <input id="password" name="password" type="password" required placeholder="Use 8+ characters" style={inputStyle} />
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
  backgroundColor: "#0f172a",
  color: "#ffffff",
  padding: "0.65rem 0.75rem",
  fontWeight: 600,
} as const;

const listStyle = {
  margin: "0 0 1rem 1.1rem",
  padding: 0,
  lineHeight: 1.45,
} as const;

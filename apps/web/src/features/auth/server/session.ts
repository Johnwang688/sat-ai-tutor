export type AuthRole = "student" | "admin";

export type AuthSession = {
  userId: string;
  email: string;
  role: AuthRole;
  issuedAt: string;
};

type CookieStoreLike = {
  get(name: string): { value: string } | undefined;
};

type AuthSessionCookiePayload = {
  userId: string;
  email: string;
  role: AuthRole;
  issuedAt: string;
};

export const AUTH_SESSION_COOKIE_NAME = "satprep_auth_session";

const SESSION_TTL_SECONDS = 60 * 60 * 24 * 14;

export function resolveRoleForEmail(email: string): AuthRole {
  const normalized = email.trim().toLowerCase();

  if (
    normalized.endsWith("@admin.satprep.local") ||
    normalized.startsWith("admin@") ||
    normalized.includes("+admin@")
  ) {
    return "admin";
  }

  return "student";
}

export function encodeAuthSessionCookie(session: AuthSession): string {
  const text = JSON.stringify(session);
  const bytes = new TextEncoder().encode(text);
  let binary = "";

  for (const byte of bytes) {
    binary += String.fromCharCode(byte);
  }

  return btoa(binary).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/g, "");
}

export function parseAuthSessionCookie(value: string | undefined): AuthSession | null {
  if (!value) {
    return null;
  }

  try {
    const padded = value.replace(/-/g, "+").replace(/_/g, "/");
    const paddingLength = (4 - (padded.length % 4)) % 4;
    const base64 = padded + "=".repeat(paddingLength);
    const binary = atob(base64);
    const bytes = new Uint8Array(binary.length);

    for (let index = 0; index < binary.length; index += 1) {
      bytes[index] = binary.charCodeAt(index);
    }

    const decodedText = new TextDecoder().decode(bytes);
    const payload = JSON.parse(decodedText) as Partial<AuthSessionCookiePayload>;

    if (
      typeof payload.userId !== "string" ||
      typeof payload.email !== "string" ||
      typeof payload.issuedAt !== "string" ||
      (payload.role !== "student" && payload.role !== "admin")
    ) {
      return null;
    }

    return {
      userId: payload.userId,
      email: payload.email,
      role: payload.role,
      issuedAt: payload.issuedAt,
    };
  } catch {
    return null;
  }
}

export function parseAuthSessionFromCookies(cookies: CookieStoreLike): AuthSession | null {
  const rawCookie = cookies.get(AUTH_SESSION_COOKIE_NAME)?.value;
  return parseAuthSessionCookie(rawCookie);
}

export function createAuthSession(email: string): AuthSession {
  return {
    userId: crypto.randomUUID(),
    email,
    role: resolveRoleForEmail(email),
    issuedAt: new Date().toISOString(),
  };
}

export function getAuthSessionCookieOptions() {
  return {
    httpOnly: true,
    sameSite: "lax" as const,
    secure: process.env.NODE_ENV === "production",
    path: "/",
    maxAge: SESSION_TTL_SECONDS,
  };
}

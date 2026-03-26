import { createAuthSession, type AuthSession } from "./session";

export type AuthFailure = {
  ok: false;
  error: string;
};

export type AuthSuccess = {
  ok: true;
  session: AuthSession;
};

export type AuthResult = AuthFailure | AuthSuccess;

export type ProfileBootstrapInput = {
  userId: string;
  email: string;
  displayName: string;
  targetScore?: number;
  gradYear?: number;
};

export type ProfileRow = {
  userId: string;
  email: string;
  displayName: string;
  targetScore: number | null;
  gradYear: number | null;
  createdAt: string;
};

type SignInInput = {
  email: string;
  password: string;
};

type SignUpInput = {
  email: string;
  password: string;
};

type SignUpAndBootstrapInput = SignUpInput & {
  displayName: string;
  targetScore?: number;
  gradYear?: number;
};

type SignUpResult =
  | {
      ok: true;
      userId: string;
      email: string;
    }
  | AuthFailure;

function normalizeEmail(email: string): string {
  return email.trim().toLowerCase();
}

function validateEmail(email: string): string | null {
  if (!email) {
    return "Email is required.";
  }

  if (!email.includes("@") || email.startsWith("@") || email.endsWith("@")) {
    return "Enter a valid email address.";
  }

  return null;
}

function validatePassword(password: string): string | null {
  if (!password) {
    return "Password is required.";
  }

  if (password.length < 8) {
    return "Password must be at least 8 characters.";
  }

  return null;
}

export function resolvePostAuthPath(role: AuthSession["role"]): string {
  return role === "admin" ? "/admin" : "/dashboard";
}

export async function signInWithPassword(input: SignInInput): Promise<AuthResult> {
  const email = normalizeEmail(input.email);
  const emailError = validateEmail(email);
  if (emailError) {
    return { ok: false, error: emailError };
  }

  const passwordError = validatePassword(input.password);
  if (passwordError) {
    return { ok: false, error: passwordError };
  }

  return { ok: true, session: createAuthSession(email) };
}

export async function signUpWithPassword(input: SignUpInput): Promise<SignUpResult> {
  const email = normalizeEmail(input.email);
  const emailError = validateEmail(email);
  if (emailError) {
    return { ok: false, error: emailError };
  }

  const passwordError = validatePassword(input.password);
  if (passwordError) {
    return { ok: false, error: passwordError };
  }

  return {
    ok: true,
    userId: crypto.randomUUID(),
    email,
  };
}

export async function createProfileRow(input: ProfileBootstrapInput): Promise<ProfileRow> {
  const displayName = input.displayName.trim();
  if (!displayName) {
    throw new Error("Display name is required.");
  }

  return {
    userId: input.userId,
    email: normalizeEmail(input.email),
    displayName,
    targetScore: input.targetScore ?? null,
    gradYear: input.gradYear ?? null,
    createdAt: new Date().toISOString(),
  };
}

export async function signUpAndBootstrapProfile(
  input: SignUpAndBootstrapInput,
): Promise<AuthResult> {
  const signupResult = await signUpWithPassword({
    email: input.email,
    password: input.password,
  });

  if (!signupResult.ok) {
    return signupResult;
  }

  try {
    await createProfileRow({
      userId: signupResult.userId,
      email: signupResult.email,
      displayName: input.displayName,
      targetScore: input.targetScore,
      gradYear: input.gradYear,
    });
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Unable to create your profile row.";
    return { ok: false, error: message };
  }

  return {
    ok: true,
    session: createAuthSession(signupResult.email),
  };
}


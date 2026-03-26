import { cookies, headers } from "next/headers";
import type { AdminActor } from "./types";

export class AdminAccessError extends Error {
  readonly status = 403;

  constructor(message = "Admin role required.") {
    super(message);
    this.name = "AdminAccessError";
  }
}

function parseCookieValue(cookieHeader: string | null, name: string): string | undefined {
  if (!cookieHeader) {
    return undefined;
  }

  const pairs = cookieHeader.split(";").map((value) => value.trim());
  for (const pair of pairs) {
    const [rawName, ...rest] = pair.split("=");
    if (rawName !== name) {
      continue;
    }
    return rest.join("=");
  }

  return undefined;
}

function normalizeRole(role: string | null | undefined): string | undefined {
  const value = role?.trim().toLowerCase();
  return value ? value : undefined;
}

function createActorFromRole(role: string | undefined, actorId: string | undefined): AdminActor {
  if (role === "admin") {
    return {
      id: actorId?.trim() || "admin-unknown",
      role: "admin",
    };
  }

  if (process.env.NODE_ENV !== "production") {
    return {
      id: actorId?.trim() || "admin-dev",
      role: "admin",
    };
  }

  throw new AdminAccessError();
}

export function assertAdminFromRequest(request: Request): AdminActor {
  const roleHeader = request.headers.get("x-user-role");
  const actorHeader = request.headers.get("x-user-id");
  const cookieHeader = request.headers.get("cookie");

  const roleCookie = parseCookieValue(cookieHeader, "sat_role");
  const actorCookie = parseCookieValue(cookieHeader, "sat_user_id");

  const role = normalizeRole(roleHeader) ?? normalizeRole(roleCookie);
  const actorId = actorHeader ?? actorCookie;

  return createActorFromRole(role, actorId ?? undefined);
}

export async function assertAdminFromServerContext(): Promise<AdminActor> {
  const requestHeaders = await Promise.resolve(headers());
  const requestCookies = await Promise.resolve(cookies());

  const role =
    normalizeRole(requestHeaders.get("x-user-role")) ??
    normalizeRole(requestCookies.get("sat_role")?.value);
  const actorId = requestHeaders.get("x-user-id") ?? requestCookies.get("sat_user_id")?.value;

  return createActorFromRole(role, actorId ?? undefined);
}

import type { NextRequest } from "next/server";
import { NextResponse } from "next/server";
import { parseAuthSessionFromCookies } from "./features/auth/server";

function createLoginRedirect(request: NextRequest): NextResponse {
  const loginUrl = new URL("/login", request.url);
  const nextPath = `${request.nextUrl.pathname}${request.nextUrl.search}`;
  loginUrl.searchParams.set("next", nextPath);
  return NextResponse.redirect(loginUrl);
}

export function middleware(request: NextRequest) {
  const pathname = request.nextUrl.pathname;
  const session = parseAuthSessionFromCookies(request.cookies);

  if (!session) {
    return createLoginRedirect(request);
  }

  if (pathname.startsWith("/admin") && session.role !== "admin") {
    return NextResponse.redirect(new URL("/dashboard", request.url));
  }

  return NextResponse.next();
}

export const config = {
  matcher: [
    "/dashboard/:path*",
    "/practice/:path*",
    "/review/:path*",
    "/settings/:path*",
    "/concepts/:path*",
    "/admin/:path*",
  ],
};


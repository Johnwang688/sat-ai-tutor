import type { NextRequest } from "next/server";
import { NextResponse } from "next/server";

// TODO(auth-feature): Route protection — require a valid Supabase (or chosen auth) session for `/dashboard`, `/practice`, `/practice/session/*`, `/review/*`, `/settings`, and `/concepts/*`; require an admin role claim for `/admin/*`. Redirect unauthenticated users to `/login`; send non-admins away from `/admin` (e.g. `/dashboard` or 403).

export function middleware(_request: NextRequest) {
  return NextResponse.next();
}

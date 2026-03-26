import { NextResponse } from "next/server";
import { AdminAccessError } from "./auth";

export function jsonError(message: string, status = 400) {
  return NextResponse.json({ error: message }, { status });
}

export function withAdminRouteErrors(handler: () => Promise<NextResponse>): Promise<NextResponse> {
  return handler().catch((error: unknown) => {
    if (error instanceof AdminAccessError) {
      return jsonError(error.message, error.status);
    }

    const message = error instanceof Error ? error.message : "Unknown error";
    return jsonError(message, 500);
  });
}

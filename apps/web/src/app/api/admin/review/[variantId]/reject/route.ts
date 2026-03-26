import { NextResponse } from "next/server";
import { assertAdminFromRequest } from "@/features/admin/server/auth";
import { jsonError, withAdminRouteErrors } from "@/features/admin/server/http";
import { rejectVariant } from "@/features/admin/server/store";

export async function POST(
  request: Request,
  context: { params: Promise<{ variantId: string }> },
) {
  return withAdminRouteErrors(async () => {
    const actor = assertAdminFromRequest(request);
    const { variantId } = await context.params;
    const body = (await request.json()) as Record<string, unknown>;
    const reason = typeof body.reason === "string" ? body.reason.trim() : "";

    if (!reason) {
      return jsonError("reason is required.", 400);
    }

    const variant = rejectVariant(variantId, reason, actor);
    if (!variant) {
      return jsonError("Variant not found or not pending.", 404);
    }

    return NextResponse.json({ variant });
  });
}

import { NextResponse } from "next/server";
import { assertAdminFromRequest } from "@/features/admin/server/auth";
import { jsonError, withAdminRouteErrors } from "@/features/admin/server/http";
import { approveVariant } from "@/features/admin/server/store";

export async function POST(
  request: Request,
  context: { params: Promise<{ variantId: string }> },
) {
  return withAdminRouteErrors(async () => {
    const actor = assertAdminFromRequest(request);
    const { variantId } = await context.params;
    const variant = approveVariant(variantId, actor);

    if (!variant) {
      return jsonError("Variant not found or not pending.", 404);
    }

    return NextResponse.json({ variant });
  });
}

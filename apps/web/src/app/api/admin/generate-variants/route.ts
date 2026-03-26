import { NextResponse } from "next/server";
import { assertAdminFromRequest } from "@/features/admin/server/auth";
import { jsonError, withAdminRouteErrors } from "@/features/admin/server/http";
import { generateVariants } from "@/features/admin/server/store";

export async function POST(request: Request) {
  return withAdminRouteErrors(async () => {
    const actor = assertAdminFromRequest(request);
    const body = (await request.json()) as Record<string, unknown>;

    const parentQuestionId =
      typeof body.parentQuestionId === "string" ? body.parentQuestionId.trim() : "";
    if (!parentQuestionId) {
      return jsonError("parentQuestionId is required.", 400);
    }

    const parsedCount =
      body.count === undefined || body.count === null ? undefined : Number(body.count);
    if (
      parsedCount !== undefined &&
      (!Number.isInteger(parsedCount) || parsedCount < 1 || parsedCount > 5)
    ) {
      return jsonError("count must be an integer between 1 and 5.", 400);
    }

    const variants = generateVariants(
      {
        parentQuestionId,
        conceptSlug:
          typeof body.conceptSlug === "string" ? body.conceptSlug : undefined,
        count: parsedCount ?? undefined,
      },
      actor,
    );

    return NextResponse.json({ variants }, { status: 201 });
  });
}

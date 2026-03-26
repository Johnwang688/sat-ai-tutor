import { z } from "zod";

import { UserRoleSchema, UuidSchema } from "./domain";

export const EmailSchema = z.string().trim().email();
export const PasswordSchema = z.string().min(8).max(128);

export const LoginInputSchema = z.object({
  email: EmailSchema,
  password: PasswordSchema,
});

export const SignupInputSchema = z.object({
  email: EmailSchema,
  password: PasswordSchema,
  displayName: z.string().trim().min(1).max(80).optional(),
});

export const ProfileBootstrapInputSchema = z.object({
  userId: UuidSchema,
  displayName: z.string().trim().min(1).max(80),
});

export const AuthUserSchema = z.object({
  id: UuidSchema,
  email: EmailSchema,
  role: UserRoleSchema,
  displayName: z.string().trim().min(1).max(80).nullable().optional(),
});

export const AuthTokensSchema = z.object({
  accessToken: z.string().min(1),
  refreshToken: z.string().min(1).optional(),
  expiresAt: z.string().datetime({ offset: true }).optional(),
});

export const AuthSuccessResponseSchema = z.object({
  user: AuthUserSchema,
  tokens: AuthTokensSchema.optional(),
  redirectTo: z.string().startsWith("/"),
});

export type LoginInput = z.infer<typeof LoginInputSchema>;
export type SignupInput = z.infer<typeof SignupInputSchema>;
export type AuthUser = z.infer<typeof AuthUserSchema>;
export type AuthSuccessResponse = z.infer<typeof AuthSuccessResponseSchema>;

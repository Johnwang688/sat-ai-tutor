export const authHighlights = [
  "Email/password sign in for students and admins",
  "Server-side role-based redirect after successful authentication",
  "Profile bootstrap right after signup to create the matching profiles row",
] as const;

export const signupProfileFields = [
  {
    id: "displayName",
    label: "Display name",
    placeholder: "Avery Johnson",
    required: true,
  },
  {
    id: "targetScore",
    label: "Target SAT score",
    placeholder: "1450",
    required: false,
  },
  {
    id: "gradYear",
    label: "Graduation year",
    placeholder: "2028",
    required: false,
  },
] as const;

export const authFlowNotes = [
  "Students route to /dashboard after login.",
  "Admins route to /admin after login.",
  "Magic link can be added as a secondary path without blocking V1.",
] as const;

import type { ReactNode } from "react";

type RootLayoutProps = {
  children: ReactNode;
};

export default function RootLayout({ children }: RootLayoutProps) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}

/*
TODO(root-layout-foundation):
Turn this into the minimal app root once auth and data fetching are wired.

Scope:
- Add global providers only when a real feature requires them.
- Keep auth bootstrapping server-side and do not leak privileged keys to the
  client.
- Add route-group layouts later for marketing, student, and admin experiences
  instead of growing this root layout too much.

Naming:
- Route-group layouts should live beside their route folders and use the
  reserved `layout.tsx` file name.
*/

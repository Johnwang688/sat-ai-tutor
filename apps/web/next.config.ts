import type { NextConfig } from "next";

const nextConfig: NextConfig = {
	env: {
		// Prefer DESMOS_API_KEY (e.g. Vercel / CI secret); NEXT_PUBLIC_* is optional override.
		NEXT_PUBLIC_DESMOS_API_KEY:
			process.env.DESMOS_API_KEY ?? process.env.NEXT_PUBLIC_DESMOS_API_KEY,
	},
};

export default nextConfig;

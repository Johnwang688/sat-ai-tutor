import type { NextConfig } from "next";

const nextConfig: NextConfig = {
	env: {
		NEXT_PUBLIC_DESMOS_API_KEY:
			process.env.NEXT_PUBLIC_DESMOS_API_KEY ?? process.env.DESMOS_API_KEY,
	},
};

export default nextConfig;

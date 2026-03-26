import { env } from "../env";

export type DbClientProvider = "supabase";

type DbRecord = Record<string, unknown>;
type SelectOptions = {
  schema?: string;
  select?: string;
  limit?: number;
  orderBy?: string;
  ascending?: boolean;
};

export type DbClient = {
  provider: DbClientProvider;
  request<T>(path: string, init?: RequestInit): Promise<T>;
  select<T extends DbRecord = DbRecord>(
    table: string,
    options?: SelectOptions,
  ): Promise<T[]>;
  insert<T extends DbRecord = DbRecord>(
    table: string,
    payload: DbRecord | DbRecord[],
  ): Promise<T[]>;
  rpc<T = unknown>(fn: string, args?: DbRecord): Promise<T>;
};

function assertServerOnly(): void {
  if (typeof window !== "undefined") {
    throw new Error("Database client can only be used on the server.");
  }
}

function createRequestUrl(path: string): URL {
  return new URL(path, env.NEXT_PUBLIC_SUPABASE_URL);
}

function createHeaders(initHeaders?: HeadersInit): Headers {
  const headers = new Headers(initHeaders);
  headers.set("apikey", env.SUPABASE_SERVICE_ROLE_KEY);
  headers.set("Authorization", `Bearer ${env.SUPABASE_SERVICE_ROLE_KEY}`);
  return headers;
}

function withQuery(url: URL, options?: SelectOptions): URL {
  if (!options) {
    return url;
  }

  if (options.select) {
    url.searchParams.set("select", options.select);
  }

  if (typeof options.limit === "number") {
    url.searchParams.set("limit", String(options.limit));
  }

  if (options.orderBy) {
    url.searchParams.set(
      "order",
      `${options.orderBy}.${options.ascending === false ? "desc" : "asc"}`,
    );
  }

  return url;
}

export function getDbClient(): DbClient {
  assertServerOnly();

  async function request<T>(path: string, init: RequestInit = {}): Promise<T> {
    const url = createRequestUrl(path);
    const headers = createHeaders(init.headers);
    const response = await fetch(url, { ...init, headers, cache: "no-store" });

    if (!response.ok) {
      const message = await response.text();
      throw new Error(
        `Database request failed: ${response.status} ${response.statusText}${message ? `\n${message}` : ""}`,
      );
    }

    if (response.status === 204) {
      return undefined as T;
    }

    return (await response.json()) as T;
  }

  return {
    provider: "supabase",
    request,
    async select<T extends DbRecord = DbRecord>(
      table: string,
      options?: SelectOptions,
    ): Promise<T[]> {
      const schema = options?.schema ?? "public";
      const url = withQuery(createRequestUrl(`/rest/v1/${table}`), options);
      const headers = createHeaders();
      headers.set("Accept-Profile", schema);
      return request<T[]>(`${url.pathname}${url.search}`, {
        method: "GET",
        headers,
      });
    },
    async insert<T extends DbRecord = DbRecord>(
      table: string,
      payload: DbRecord | DbRecord[],
    ): Promise<T[]> {
      return request<T[]>(`/rest/v1/${table}`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Prefer: "return=representation",
        },
        body: JSON.stringify(payload),
      });
    },
    async rpc<T = unknown>(fn: string, args: DbRecord = {}): Promise<T> {
      return request<T>(`/rest/v1/rpc/${fn}`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(args),
      });
    },
  };
}

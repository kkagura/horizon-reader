FROM node:22-slim AS build

WORKDIR /app

ENV PNPM_HOME=/pnpm
ENV PATH="${PNPM_HOME}:${PATH}"

RUN corepack enable

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile --config.offline=false

COPY . .
RUN pnpm build

FROM node:22-slim AS runtime

WORKDIR /app

ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=3000
ENV NUXT_REPORTS_DIR=/app/reports

COPY --from=build /app/.output ./.output

RUN mkdir -p /app/reports

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"]

FROM oven/bun:alpine AS build
WORKDIR /app

COPY package*.json /
RUN bun install
COPY . .

RUN bun run build

RUN apk update
RUN apk add --upgrade brotli
RUN cd /app/dist && find . -type f -exec brotli {} \;

FROM oven/bun:alpine AS production
WORKDIR /

COPY --from=build /app/db /db
COPY --from=build /app/dist /db/pb_public

CMD ["/db/pocketbase", "serve", "--http=0.0.0.0:8080"]
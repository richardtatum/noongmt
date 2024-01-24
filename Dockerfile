FROM oven/bun:alpine as build
WORKDIR /app

COPY package*.json /
RUN bun install
COPY . .

RUN bun run build

RUN apk update
RUN apk add --upgrade brotli
RUN cd /app/dist && find . -type f -exec brotli {} \;

FROM caddy:alpine as production

COPY --from=build /app/db /db
COPY --from=build /app/dist /usr/share/caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY entrypoint.sh /

RUN ["chmod", "+x", "/entrypoint.sh"]

CMD ["/entrypoint.sh"]
FROM oven/bun:alpine as build
WORKDIR /app

COPY package*.json /
RUN bun install
COPY . .

RUN bun run build

FROM caddy:alpine as production

# Copy the database
COPY --from=build /app/db /db
# Copy the static website files
COPY --from=build /app/dist /usr/share/caddy
# Copy the caddy config file
COPY Caddyfile /etc/caddy/Caddyfile
# Copy the entry point and make it executable
COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]

CMD ["/entrypoint.sh"]
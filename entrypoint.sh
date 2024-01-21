#!/bin/sh

exec /db/pocketbase serve & caddy run --config /etc/caddy/Caddyfile
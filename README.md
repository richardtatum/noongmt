# NOONGMT

This is the source code for https://noongmt.com

## Run this locally

Build and run `noongmt` with Docker:
```sh
docker build -t noongmt .
docker run -p 80:8080 -e API_KEY="your-preferred-key" -e POCKETBASE_URL="localhost:8090" noongmt:latest
```

The provided `API_KEY` is used to protect endpoints from anything other than `GET` requests. Caddy intercepts all other methods and if the provided API key isn't found in the `Authorization` header, the request is rejected.

## References

- [Pocketbase](https://pocketbase.io/)
- [Pocketbase Web APIs](https://pocketbase.io/docs/api-records/)

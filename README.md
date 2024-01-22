# NOONGMT

This is the source code for https://noongmt.com

## Run this locally

To run this locally first update the `Caddyfile`:
```diff
    # reverse proxy GET requests to the posts collection
    handle /api/collections/posts/records* {
        respond @unauthorizedMethods  "Forbidden" 403
-       reverse_proxy noongmt.internal:8090
+       reverse_proxy localhost:8090
    }

    # Any other requests require the API key
    handle /api/* {
        respond @missingHeader  "Forbidden" 403
-       reverse_proxy noongmt.internal:8090
+       reverse_proxy localhost:8090
    }
```

Then build and run the dockerfile, passing an environment variable for the API key with `-e API_KEY="your-api-key-here`

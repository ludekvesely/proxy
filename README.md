# Simple NGINX proxy

Container works like proxy with exposed port 80 which uses `proxy_pass` to `UPSTREAM_ADDRESS:UPSTREAM_PORT`.

## Config via ENV variables:

* `UPSTREAM_ADDRESS`
* `UPSTREAM_PORT`

## Sample execution

```bash
# Expose port 80, proxy-pass to 10.0.0.1:8080
docker run -e UPSTREAM_ADDRESS=10.0.0.1 -e UPSTREAM_PORT=8080 ludekvesely/proxy
```

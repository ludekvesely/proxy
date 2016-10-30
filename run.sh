#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

# make sure it doesn't daemonize
grep -v "daemon off" /etc/nginx/nginx.conf > /tmp/nginx.tmp && mv /tmp/nginx.tmp /etc/nginx/nginx.conf
echo "daemon off;" >> /etc/nginx/nginx.conf

# replace variables at runtime
sed -i "s/UPSTREAM_PORT/${UPSTREAM_PORT}/g" /etc/nginx/conf.d/proxy.conf
sed -i "s/UPSTREAM_ADDRESS/${UPSTREAM_ADDRESS}/g" /etc/nginx/conf.d/proxy.conf

cat /etc/nginx/conf.d/proxy.conf

# start the thing
/usr/sbin/nginx

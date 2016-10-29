#!/bin/sh -e

host_hostname=$(cat /etc/host_hostname)

echo "host{host=\"$host_hostname\"} 1" > /etc/node-exporter/host_hostname.prom

set -- $NODE_EXPORTER_BIN "$@"

exec "$@"

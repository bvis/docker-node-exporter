#!/bin/sh -e

if [ -z ${HOST_HOSTNAME+x} ]; then
  echo "Environment variable 'HOST_HOSTNAME' not set, we won't add the hostname metric."
else
  host_hostname=$(cat ${HOST_HOSTNAME})
  echo "host{host=\"$host_hostname\"} 1" > /etc/node-exporter/host_hostname.prom
fi

set -- $NODE_EXPORTER_BIN "$@"

exec "$@"

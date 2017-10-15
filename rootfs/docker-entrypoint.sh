#!/bin/sh -e

if [ -z ${HOST_HOSTNAME+x} ]; then
  echo "Environment variable 'HOST_HOSTNAME' not set, we won't add the hostname metric."
else
  host_hostname=$(cat ${HOST_HOSTNAME})
  echo "host{host=\"$host_hostname\", node=\"$(hostname)\"} 1" > /etc/node-exporter/host_hostname.prom
fi

# if command starts with an option, prepend node-exporter binary
if [ "${1:0:1}" = '-' ]; then
  set -- $NODE_EXPORTER_BIN "$@"
fi

exec "$@"

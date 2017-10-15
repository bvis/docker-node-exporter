# basi/node-exporter

It is a simple node-exporter image that adds the capability of obtain the host hostname and expose it as a value in the container.

## How to run it

To launch it as a global service in a swarm cluster:

    docker \
      service create --mode global \
      --name node-exporter \
      --mount type=bind,source=/proc,target=/host/proc \
      --mount type=bind,source=/sys,target=/host/sys \
      --mount type=bind,source=/,target=/rootfs \
      --mount type=bind,source=/etc/hostname,target=/etc/host_hostname \
      -e HOST_HOSTNAME=/etc/host_hostname \
      basi/node-exporter:latest \
      --path.procfs /host/proc \
      --path.sysfs /host/sys \
      --collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)" \
      --collector.textfile.directory /etc/node-exporter/

The important add over the official image is the bind mount of the host _/etc/hosts_ file in a specific location in the service.
This mount is used by the container to obtain the hostname of the host where the service is running.

It can be useful to use this value in a swarm cluster when obtaining data in Prometheus, while it does not support
swarm mode natively.

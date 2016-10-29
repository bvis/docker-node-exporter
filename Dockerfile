FROM prom/node-exporter:0.12.0

ENV "NODE_EXPORTER_BIN=/bin/node_exporter"

COPY ./rootfs /

ENTRYPOINT  [ "/docker-entrypoint.sh" ]
CMD [ "/bin/node_exporter" ]

FROM prom/node-exporter:v0.15.0

ARG "version=0.1.0-dev"
ARG "build_date=unknown"
ARG "commit_hash=unknown"
ARG "vcs_url=unknown"
ARG "vcs_branch=unknown"

LABEL org.label-schema.vendor="Basi" \
    org.label-schema.name="node-exporter" \
    org.label-schema.description="" \
    org.label-schema.usage="/src/README.md" \
    org.label-schema.url="https://github.com/bvis/docker-node-exporter/blob/master/README.md" \
    org.label-schema.vcs-url=$vcs_url \
    org.label-schema.vcs-branch=$vcs_branch \
    org.label-schema.vcs-ref=$commit_hash \
    org.label-schema.version=$version \
    org.label-schema.schema-version="1.0" \
    org.label-schema.docker.cmd.devel="" \
    org.label-schema.build-date=$build_date

ENV NODE_EXPORTER_BIN=/bin/node_exporter

COPY ./rootfs /
USER root

ENTRYPOINT  [ "/docker-entrypoint.sh" ]
CMD [ "/bin/node_exporter" ]

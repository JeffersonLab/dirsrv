# TODO: Build image doesn't need gradle.  Just always been my build image...
ARG BUILD_IMAGE=gradle:7.4-jdk17
ARG RUN_IMAGE=389ds/dirsrv:2.4

################## Stage 0
FROM ${BUILD_IMAGE} as builder
USER root
WORKDIR /
COPY . /app

## Let's minimize layers in final-product by organizing files into a single copy structure
RUN mkdir /unicopy \
    && cp /app/scripts/docker-entrypoint.sh /unicopy \
    && cp /app/scripts/docker-healthcheck.sh /unicopy \
    && cp /app/scripts/setup.sh /unicopy \
    && cp /app/scripts/once.sh /unicopy

################## Stage 1
FROM ${RUN_IMAGE} as runner
COPY --from=builder /unicopy /
RUN zypper install -y openldap2-client \
    && /once.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --start-interval=5s --retries=5 CMD /docker-healthcheck.sh
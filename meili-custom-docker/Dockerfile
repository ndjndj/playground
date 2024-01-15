FROM gcr.io/distroless/cc-debian12:latest AS cc
FROM alpine:3.16

COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.7.0 /lambda-adapter /opt/extensions/lambda-adapter

ENV LD_LIBRARY_PATH="/usr/local/lib"
COPY --from=cc --chown=root:root --chmod=755 /lib/*-linux-gnu/* /usr/local/lib/

RUN apk update --quiet \
 && apk add -q --no-cache libgcc tini curl \
 && mkdir /lib64 \ 
 && ln -s /usr/local/lib/ld-linux-*.so.2 /lib64/

# Install Meilisearch
RUN curl -L https://install.meilisearch.com | sh

ENV MEILI_HTTP_ADDR 0.0.0.0:8080
ENV MEILI_SERVER_PROVIDER docker

# This directory should hold all the data related to meilisearch so we're going
# to move our PWD in there.
# We don't want to put the meilisearch binary
WORKDIR /meili_data

EXPOSE 8080/tcp

ENTRYPOINT ["tini", "--"]
CMD     ./meilisearch
FROM alpine:3.16

COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.7.0 /lambda-adapter /opt/extensions/lambda-adapter

ENV MEILI_HTTP_ADDR 0.0.0.0:8080
ENV MEILI_SERVER_PROVIDER docker

RUN apk update --quiet \
    && apk add -q --no-cache libgcc tini curl

# Install Meilisearch
RUN curl -L https://install.meilisearch.com | sh

# This directory should hold all the data related to meilisearch so we're going
# to move our PWD in there.
# We don't want to put the meilisearch binary
#WORKDIR /meili_data

EXPOSE  8080/tcp

#ENTRYPOINT ["tini", "--"]
#CMD     ./meilisearch
FROM alpine:3.16

CMD ["/bin/sh"]

ENV MEILI_HTTP_ADDR=0.0.0.0:7700

ENV MEILI_SERVER_PROVIDER=docker

RUN /bin/sh -c apk update --quiet && apk add -q --no-cache libgcc tini curl 

COPY /target/release/meilisearch /bin/meilisearch 
COPY /target/release/meilitool /bin/meilitool 

RUN /bin/sh -c ln -s /bin/meilisearch /meilisearch

WORKDIR /meili_data

EXPOSE 7700/tcp

ENTRYPOINT ["tini" "--"]

CMD ["/bin/sh" "-c" "/bin/meilisearch"]

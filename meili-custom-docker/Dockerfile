FROM getmeili/meilisearch as local

ENTRYPOINT ["tini", "--"]
CMD ./bin/sh

FROM local

COPY ./dumps /dumps 

ENV MEILI_HTTP_ADDR 0.0.0.0:7700 
EXPOSE 7700/tcp 

ENTRYPOINT ["tini", "--"]

CMD ["./bin/sh", "--import-dump", "dumps/latest.dump"]

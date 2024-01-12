FROM getmeili/meilisearch:v1.5 as local

ENTRYPOINT ["tini", "--"]
CMD ../meilisearch

FROM public.ecr.aws/lambda/python:3.11 as py

COPY requirements.txt ./app/requirements.txt
COPY app.py app.py
COPY app.py ${LAMBDA_TASK_ROOT} 
WORKDIR ./app
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt 

CMD ["app.lambda_handler"]

FROM local

COPY ./meili_data /meili_data
COPY --from=py /app /app 
COPY /app ${LAMBDA_TASK_ROOT} 

ENV MEILI_HTTP_ADDR 0.0.0.0:7700 
EXPOSE 7700/tcp 

ENTRYPOINT ["tini", "--"]

CMD ["../meilisearch", "--import-dump", "dumps/latest.dump", "--ignore-dump-if-db-exists", "--ignore-missing-dump"]

CMD ["app.lambda_handler"]
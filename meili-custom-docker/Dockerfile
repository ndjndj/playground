FROM getmeili/meilisearch:v1.5 as local

ENTRYPOINT ["tini", "--"]
CMD ../meilisearch

FROM public.ecr.aws/lambda/python:3.11

COPY requirements.txt ${LAMBDA_TASK_ROOT}
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt 



FROM local

COPY ./meili_data /meili_data
COPY app.py ${LAMBDA_TASK_ROOT} 

ENV MEILI_HTTP_ADDR 0.0.0.0:7700 
EXPOSE 7700/tcp 

ENTRYPOINT ["tini", "--"]

CMD ["../meilisaerch", "--import-dump", "dumps/latest.dump"]

CMD ["app.lambda_handler"]
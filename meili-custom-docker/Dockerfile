FROM getmeili/meilisearch:v1.5 as meili

FROM local

COPY ./meili_data ./meili_data

COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.7.0 /lambda-adapter /opt/extensions/lambda-adapter

ENV MEILI_HTTP_ADDR 0.0.0.0:8080 
EXPOSE 8080/tcp 

ENTRYPOINT ["tini", "--"]
CMD ["../meilisaerch"]

#FROM public.ecr.aws/lambda/python:3.11 as local

#RUN yum makecache && yum install -y glibc

#COPY --from=meili ../meilisearch ./meilisearch
#COPY --from=meili ./meili_data ./meili_data
#
#COPY requirements.txt ${LAMBDA_TASK_ROOT}
#RUN pip install --upgrade pip 
#RUN pip install -r requirements.txt 
#COPY --from=py ${LAMBDA_TASK_ROOT} ${LAMBDA_TASK_ROOT} 

#COPY app.py ${LAMBDA_TASK_ROOT} 

#CMD ["app.lambda_handler"]

#CMD ["./meilisearch"]
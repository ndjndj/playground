FROM getmeili/meilisearch:v1.5 as meili

FROM public.ecr.aws/lambda/python:3.11 as local

RUN yum makecache && yum install -y glibc

COPY --from=meili ../meilisearch ./meilisearch
COPY --from=meili ./meili_data ./meili_data

COPY requirements.txt ${LAMBDA_TASK_ROOT}
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt 
#COPY --from=py ${LAMBDA_TASK_ROOT} ${LAMBDA_TASK_ROOT} 

COPY app.py ${LAMBDA_TASK_ROOT} 

CMD ["app.lambda_handler"]
CMD ["./meilisearch"]
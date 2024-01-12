FROM getmeili/meilisearch:v1.5 as local

FROM public.ecr.aws/lambda/python:3.11 as py

COPY requirements.txt ${LAMBDA_TASK_ROOT}
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt 

COPY app.py ${LAMBDA_TASK_ROOT} 

#CMD ["app.lambda_handler"]

FROM local

COPY ./meili_data /meili_data
COPY --from=py ${LAMBDA_TASK_ROOT} ${LAMBDA_TASK_ROOT} 

CMD ["app.lambda_handler"]
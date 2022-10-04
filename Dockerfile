FROM python:3.10.7-slim

RUN pip install https://github.com/octue/octue-sdk-python/archive/feature/add-topic-and-subscription-creation-command.zip

COPY create_push_subscription/entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

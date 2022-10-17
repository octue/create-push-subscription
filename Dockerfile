FROM python:3.10.7-slim

RUN pip install git+https://github.com/octue/create-push-subscription.git@0.1.0

COPY create_push_subscription/entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

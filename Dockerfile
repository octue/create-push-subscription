FROM python:3.10.7-slim

RUN apt-get update -y && apt-get install -y --fix-missing git && rm -rf /var/lib/apt/lists/*

RUN pip install git+https://github.com/octue/create-push-subscription.git@add-filter-option

COPY create_push_subscription/entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

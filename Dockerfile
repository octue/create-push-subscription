FROM python:3.10.7-slim

# Install via `.zip` file to avoid having to add `git` to image.
RUN pip install https://github.com/octue/create-push-subscription/archive/0.2.3.beta-0.zip

COPY create_push_subscription/entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

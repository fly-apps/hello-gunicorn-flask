FROM python:slim-buster

RUN mkdir -p /app
WORKDIR /app

COPY . .
RUN pip install -r requirements.txt

ENV FLASK_APP="hellofly"

EXPOSE 4999

# Bind to both IPv4 and IPv6
ENV GUNICORN_CMD_ARGS="--bind=[::]:4999 --workers=2"

# replace APP_NAME with module name
CMD ["gunicorn", "wsgi:app"]

FROM python:slim-buster

RUN mkdir -p /app
WORKDIR /app

COPY . .
# COPY requirements.txt .
RUN pip install -r requirements.txt

# COPY hellofly.py ./
# COPY templates/ ./templates
# COPY wsgi.py .


ENV FLASK_APP="hellofly"

EXPOSE 4999

#ENTRYPOINT ["flask", "run", "--host=0.0.0.0", "--port", "4999"] # ["/bin/sh"]  

ENV GUNICORN_CMD_ARGS="--bind=0.0.0.0:4999 --workers=2"

# replace APP_NAME with module name
CMD ["gunicorn", "wsgi:app"]
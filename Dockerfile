FROM python:3.8-alpine

WORKDIR /app

COPY . .

RUN apk --no-cache add gcc build-base linux-headers
RUN addgroup -S uwsgi && adduser -S -G uwsgi uwsgi
RUN apk --no-cache add build-base
RUN apk --no-cache add postgresql-dev

RUN pip install --upgrade pip setuptools
RUN pip install -U pip \
    && pip install --no-cache-dir -r /app/config/requirements.txt

CMD python manage.py run -h 0.0.0.0
FROM python:3.8-alpine

WORKDIR /var/www/app

COPY . .

RUN apk --no-cache add gcc build-base linux-headers
RUN addgroup -S uwsgi && adduser -S -G uwsgi uwsgi
RUN apk --no-cache add build-base
RUN apk --no-cache add postgresql-dev

RUN pip install --upgrade pip setuptools
RUN pip install -U pip \
    && pip install --no-cache-dir -r /var/www/app/config/requirements.txt

CMD ["uwsgi", "--ini", "/var/www/app/config/uwsgi.ini"]
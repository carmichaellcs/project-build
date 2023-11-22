FROM python:3.10-alpine

ARG API_ENV
ARG API_EXP_PORT

RUN apk add --no-cache --virtual .build-deps g++ python3-dev libffi-dev openssl-dev && \
    apk add --no-cache --update python3 && \
    pip3 install --upgrade pip setuptools

WORKDIR /src/app

COPY ./requirements_${API_ENV}.txt /src/app/requirements.txt

RUN pip3 install -r requirements.txt

EXPOSE $API_EXP_PORT
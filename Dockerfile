FROM alpine:3.14.2

LABEL org.opencontainers.image.source = "https://github.com/timarenz/lacework-demo-app"

RUN apk add --no-cache python3=3.9.5 py3-pip=20.3.4 curl=7.79.1 jq=1.6 bash=5.1.16
# RUN python3 -m pip install --upgrade pip

COPY ./app /app

WORKDIR /app

RUN pip3 install --no-cache-dir --requirement ./requirements.txt

COPY docker-entrypoint.sh /

EXPOSE 5000

CMD [ "/docker-entrypoint.sh" ]

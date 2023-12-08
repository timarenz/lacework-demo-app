# FROM alpine:3.14.2
FROM alpine:3.14.3

LABEL org.opencontainers.image.source = "https://github.com/timarenz/lacework-demo-app"

# RUN apk add --no-cache python3=3.9.5-r2 py3-pip=20.3.4-r1 curl=7.79.1-r3 jq=1.6-r1 bash=5.1.16-r0
RUN apk add --no-cache python3=3.9.17-r0 py3-pip=20.3.4-r1 curl=8.0.1-r0 jq=1.6-r1 bash=5.1.16-r0
# RUN python3 -m pip install --upgrade pip

COPY ./app /app

WORKDIR /app

RUN pip3 install --no-cache-dir --requirement ./requirements.txt

COPY docker-entrypoint.sh /

EXPOSE 5000

CMD [ "/docker-entrypoint.sh" ]

FROM lacework/datacollector:5.1.0-sidecar AS agent-build-image

FROM alpine:3.14.2

RUN apk add --no-cache python3=3.9.5-r2 py3-pip=20.3.4-r1 curl=7.79.1-r0 jq=1.6-r1 bash=5.1.4-r0
# RUN python3 -m pip install --upgrade pip

COPY ./app /app

WORKDIR /app

RUN pip3 install --no-cache-dir --requirement ./requirements.txt

COPY docker-entrypoint.sh /

COPY --from=agent-build-image /var/lib/lacework-backup /var/lib/lacework-backup

EXPOSE 5000

CMD [ "/docker-entrypoint.sh" ]

FROM lacework/datacollector:5.1.0-sidecar AS agent-build-image

FROM alpine:3.10

# RUN apk add --no-cache python3=3.7.10-r0 
RUN apk add --no-cache python3=3.7.10-r0 apk-tools=2.10.8-r0 curl jq
RUN python3 -m pip install --upgrade pip

COPY ./app /app

WORKDIR /app

RUN pip3 install --no-cache-dir --requirement ./requirements.txt

COPY docker-entrypoint.sh /

COPY --from=agent-build-image /var/lib/lacework-backup /var/lib/lacework-backup

EXPOSE 5000

CMD [ "/docker-entrypoint.sh" ]

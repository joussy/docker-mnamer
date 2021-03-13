FROM python:alpine

COPY --from=joussy/shell2http /app/shell2http /usr/local/bin/

ARG MNAMER_VERSION=2.4.2
RUN pip3 install --no-cache-dir --upgrade pip mnamer==${MNAMER_VERSION}
RUN mkdir -p /config
RUN apk --no-cache add bash
VOLUME [ "/srv/input" ]
VOLUME [ "/srv/output" ]

ENTRYPOINT ["/bin/sh", "/config/startup.sh"]

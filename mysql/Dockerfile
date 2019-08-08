FROM alpine:latest

ENV DUMPER_HOST=""
ENV DUMPER_PORT=""
ENV DUMPER_SCHEMA=""
ENV DUMPER_USERNAME=""
ENV DUMPER_PASSWORD=""
ENV DUMPER_ACTION=""
ENV DUMPER_FILENAME="backup.sql"
ENV DUMPER_COMPACT="true"

COPY entrypoint.sh /usr/local/bin/

RUN apk update \
    && apk add mysql-client tar gzip \
    && mkdir -p /var/dump \
    && chmod +x /usr/local/bin/entrypoint.sh

VOLUME /var/dump

ENTRYPOINT ["entrypoint.sh"]
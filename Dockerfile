FROM alpine:3

RUN apk add --no-cache postfix postfix-pcre

COPY run.sh /run.sh

CMD ["/run.sh"]
LABEL "org.opencontainers.image.version"="1.0.2"

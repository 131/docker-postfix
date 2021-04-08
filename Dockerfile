FROM alpine:3

RUN apk add --no-cache postfix postfix-pcre

COPY run.sh /run.sh

CMD ["/run.sh"]



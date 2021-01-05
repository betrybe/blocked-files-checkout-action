FROM alpine:edge

RUN apk update && apk add git yq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

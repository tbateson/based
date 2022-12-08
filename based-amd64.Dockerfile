FROM amd64/alpine:3

RUN apk add --no-cache build-base glib-dev git go

ARG NATS_SERVER_VERSION=2.9.8
RUN apk add --no-cache curl tar && curl -sL "https://github.com/nats-io/nats-server/releases/download/v$NATS_SERVER_VERSION/nats-server-v$NATS_SERVER_VERSION-linux-amd64.tar.gz" --output nats-server.tar.gz && tar xf nats-server.tar.gz && rm -rf nats-server.tar.gz && ln -sf /nats-server-*/nats-server /usr/bin && apk del curl tar

FROM amd64/alpine:3

RUN apk update
RUN apk add build-base go
RUN gcc --version && g++ --version && go version

ARG NATS_SERVER_VERSION=2.9.8
RUN apk add curl tar && curl -sL "https://github.com/nats-io/nats-server/releases/download/v$NATS_SERVER_VERSION/nats-server-v$NATS_SERVER_VERSION-linux-amd64.tar.gz" --output nats-server.tar.gz && tar xf nats-server.tar.gz && rm -rf nats-server.tar.gz && ln -sf /nats-server-*/nats-server /usr/bin && apk del curl tar
RUN nats-server -version
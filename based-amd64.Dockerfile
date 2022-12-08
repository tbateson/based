FROM amd64/alpine:3

RUN apk add --no-cache build-base glib-dev clang llvm git go
RUN gcc --version && g++ --version && go version && clang++ --version && printf "#include <linux/version.h>\nint main() { return 0; }" > main.cpp && clang++ main.cpp && rm -rf main.cpp

ARG NATS_SERVER_VERSION=2.9.8
RUN apk add --no-cache curl tar && curl -sL "https://github.com/nats-io/nats-server/releases/download/v$NATS_SERVER_VERSION/nats-server-v$NATS_SERVER_VERSION-linux-amd64.tar.gz" --output nats-server.tar.gz && tar xf nats-server.tar.gz && rm -rf nats-server.tar.gz && ln -sf /nats-server-*/nats-server /usr/bin && apk del curl tar

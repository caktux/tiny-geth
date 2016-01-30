FROM alpine

ENV GOPATH /go:/go/src/github.com/ethereum/go-ethereum/Godeps/_workspace

RUN deps="go git build-base" && \
    apk update && \
    apk add -y $deps && \
    git clone --branch=develop --depth=1 https://github.com/ethereum/go-ethereum /go/src/github.com/ethereum/go-ethereum && \
    go build -v github.com/ethereum/go-ethereum/cmd/geth && \
    mv geth /usr/bin/ && \
    rm -rf /go && rm -rf /var/cache/apk/* && \
    apk del $deps

EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/usr/bin/geth"]

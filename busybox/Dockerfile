FROM busybox:glibc

ADD geth /usr/bin/
ADD libpthread.so.0 /lib/x86_64-linux-gnu/

EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/usr/bin/geth"]

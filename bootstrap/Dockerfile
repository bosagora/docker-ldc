# Bootstrap the D compiler
FROM bpfk/pkgbuilder:latest AS Builder

RUN sudo apk --no-cache add chrpath cmake llvm5-libs libexecinfo libexecinfo-dev libexecinfo-static
COPY ldc /home/effortman/
WORKDIR /home/effortman/ldc/
RUN abuild -r

FROM alpine:3.10.1

WORKDIR /root/
COPY --from=Builder /home/effortman/.abuild/*.rsa.pub /etc/apk/keys/bpfk.rsa.pub
COPY --from=Builder /home/effortman/packages/ /root/
RUN apk --no-cache add /root/packages/testing/x86_64/ldc*
RUN rm -rf /root/packages/ /etc/apk/keys/bpfk.rsa.pub

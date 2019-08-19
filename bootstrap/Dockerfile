# Bootstrap the D compiler
FROM bpfk/pkgbuilder:latest AS Builder

RUN sudo apk --no-cache add chrpath cmake llvm5-libs libexecinfo libexecinfo-dev libexecinfo-static
ADD --chown=effortman:abuild ldc/ /home/effortman/ldc/
WORKDIR /home/effortman/ldc/
RUN abuild -r

FROM alpine:3.10.1

WORKDIR /root/
COPY --from=Builder --chown=root:root /home/effortman/.abuild/*.rsa.pub /etc/apk/keys/
COPY --from=Builder /home/effortman/packages/ /root/packages/
RUN apk --no-cache add /root/packages/effortman/x86_64/ldc-1.8.0-r0.apk \
    /root/packages/effortman/x86_64/ldc-runtime-1.8.0-r0.apk \
    /root/packages/effortman/x86_64/ldc-static-1.8.0-r0.apk
RUN rm -rf -- /root/packages/ /etc/apk/keys/-*.rsa.pub

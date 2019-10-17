# Builds LDC 1.16.0
FROM bpfk/pkgbuilder:latest AS Builder
RUN sudo apk --no-cache add binutils-gold \
    chrpath cmake curl-dev llvm5-dev llvm5-static \
    libedit-dev \
    libexecinfo-dev libexecinfo-static zlib-dev
# Install previous LDC (1.8.0, FE 2.078.3)
RUN sudo apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing ldc
# Copy package and build
ADD --chown=effortman:abuild ldc/ /home/effortman/ldc/
WORKDIR /home/effortman/ldc/
RUN abuild -r

# Now just copy the registry into a new image
# We do not install it because it is unlikely that someone want to build with just the compiler
# Even if they do, it is trivial to copy the package, apk add, rm -rf the package
FROM alpine:3.10.1
WORKDIR /root/
COPY --from=Builder --chown=root:root /home/effortman/.abuild/*.rsa.pub /etc/apk/keys/
COPY --from=Builder /home/effortman/packages/ /root/packages/

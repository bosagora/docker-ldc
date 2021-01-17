# Builds a custom LDC
FROM bpfk/pkgbuilder:latest AS Builder
ADD --chown=effortman:abuild ldc/ /home/effortman/ldc/
WORKDIR /home/effortman/ldc/
RUN abuild -r

# Now just copy the registry into a new image
# We do not install it because it is unlikely that someone want to build with just the compiler
# Even if they do, it is trivial to copy the package, apk add, rm -rf the package
FROM alpine:3.12
WORKDIR /root/
COPY --from=Builder --chown=root:root /home/effortman/.abuild/*.rsa.pub /etc/apk/keys/
COPY --from=Builder /home/effortman/packages/ /root/packages/

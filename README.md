# Alpine Linux LDC docker image

[This image on Docker Hub](https://hub.docker.com/r/bpfk/pkgbuilder)

[![](https://images.microbadger.com/badges/image/bpfk/ldc.svg)](https://microbadger.com/images/bpfk/ldc)
[![](https://images.microbadger.com/badges/version/bpfk/ldc.svg)](https://microbadger.com/images/bpfk/ldc)

This image contains the LLVM-based D compiler.
As a first step, the compiler is built (using LDC 1.8.0 for bootstrapping),
then it is copied to a lighter image which can then be used as a base for building
microservices applications in D.

Note:
The 'bootstrap' tag (from the same folder) is a cross compiled version of LDC,
distributed by upstream, used to compile other D packages.

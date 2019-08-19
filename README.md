# BPF Korea Docker images

This repository is part of a collection of Docker repositories.
The full list can be found [on Docker hub](https://hub.docker.com/u/bpfk/)

Some of those repositories are needed to circumvent the lack of official
D package in Alpine Linux.
We are working into submitting the packages upstream to remove the need
for such images.

The following repositories are currently being built:
- [pkgbuilder](https://hub.docker.com/u/bpfk/pkgbuilder), the base container for building Alpine packages.
  It contains alpine-sdk, an user, and an installed key.
- [ldc](https://hub.docker.com/u/bpfk/ldc) contains the LLVM-based D compiler.
  Most importantly, it contains the bootstrap version (LDC 1.8.0) used to build all other components.

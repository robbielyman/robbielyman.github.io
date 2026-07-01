FROM ubuntu:noble
WORKDIR /site

RUN apt-get update && apt-get install -y xz-utils

ADD --checksum=sha256:c25e5372b8a5d2759f2b7e581aefb90c8019ff0056a230a97efe3c8edab3bc19 \
    https://github.com/kristoff-it/zine/releases/download/v0.11.3/x86_64-linux-musl.tar.xz /zine.tar.xz

RUN tar -oxf /zine.tar.xz -C /usr/bin
COPY . /site
RUN zine release

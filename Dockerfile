FROM ubuntu:noble

ADD https://github.com/kristoff-it/zine/releases/download/v0.11.3/x86_64-linux-musl.tar.xz .

CMD ["zine" "release"]

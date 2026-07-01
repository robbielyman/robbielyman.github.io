FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl tar && rm -rf /var/lib/apt
RUN curl -sSL https://github.com/kristoff-it/zine/releases/download/v0.11.3/x86_64-linux-musl.tar.xz | tar -xJC .

CMD ["zine" "release"]

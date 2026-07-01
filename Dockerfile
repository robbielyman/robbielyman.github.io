WORKDIR /zine

ADD https://github.com/kristoff-it/zine/releases/download/v0.11.3/x86_64-linux-musl.tar.xz /tmp
ADD /tmp/x86_64-linux.musl.tar.xz /zine

COPY . /zine/.
CMD ["zine" "release"]

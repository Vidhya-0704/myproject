FROM ubuntu:22.04

ENV PATH="/usr/games:${PATH}"

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    apt-get update && \
    apt-get install -y cowsay fortune-mod netcat-openbsd && \
    ln -sf /usr/games/fortune /usr/bin/fortune && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh .
RUN chmod +x wisecow.sh

RUN which cowsay
RUN cowsay "Cowsay test"

EXPOSE 4499

ENTRYPOINT ["./wisecow.sh"]


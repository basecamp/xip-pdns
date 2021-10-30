FROM debian:buster

RUN apt-get update && \
    apt-get install -y pdns-server pdns-backend-pipe && \
    rm -rf /var/cache/apt/lists

WORKDIR /app

COPY ./bin/xip-pdns .
COPY ./etc/xip-pdns.conf.example ./xip-pdns.conf
COPY ./etc/pdns.conf /etc/pdns.conf

CMD ["pdns_server", "--daemon=no"]

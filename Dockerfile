FROM debian:8

RUN apt-get update && \
    apt-get -y install wget

ENV TAG v0.1
ENV IMAGE tib-linux-amd64-$TAG

RUN wget --no-check-certificate https://github.com/TykTechnologies/tyk-identity-broker/releases/download/$TAG/$IMAGE.tar.gz
RUN tar -xvzf $IMAGE.tar.gz -C /tmp
RUN mv /tmp/tib-$TAG /opt/tib && \
    cd /opt/tib

WORKDIR /opt/tib

EXPOSE 3010

ENTRYPOINT ["./tib"]
CMD [""]

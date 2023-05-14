FROM balenalib/raspberrypi4-64

WORKDIR /opt/z-way-server

RUN apt-get update && \
    apt-get install -qqy --no-install-recommends \
    ca-certificates curl \
    wget procps gpg iproute2 openssh-client logrotate && \
    dpkg --add-architecture armhf && \
    apt-get update

RUN wget -q -O - https://storage.z-wave.me/RaspbianInstall |bash
COPY start.sh .
RUN chmod a+x start.sh

EXPOSE 8083
VOLUME /opt/z-way-server/config/zddx

CMD /opt/z-way-server/start.sh

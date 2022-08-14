FROM balenalib/rpi-raspbian

WORKDIR /opt/z-way-server

RUN apt-get update && \
    apt-get install -qqy --no-install-recommends \
    ca-certificates curl \
    wget procps gpg iproute2 openssh-client logrotate \
    dirmngr apt-transport-https && \
    
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 5b2f88a91611e683 && \
    echo "deb https://repo.z-wave.me/z-way/raspbian $distro main" > /etc/apt/sources.list.d/z-wave-me.list && \
    apt-get update -y && \
    apt-get install --reinstall -y z-way-full z-way-server zbw webif
    
COPY start.sh .
RUN chmod a+x start.sh

EXPOSE 8083

CMD /opt/z-way-server/start.sh

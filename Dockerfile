FROM ubuntu:16.04

MAINTAINER Jaekwon Park <jaekwon.park@code-post.com>

ENV VERSION v4.22-9634-beta-2016.11.27
WORKDIR /usr/local/vpnserver

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends make ca-certificates gcc iptables \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* && \
curl http://www.softether-download.com/files/softether/${VERSION}-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-${VERSION}-linux-x64-64bit.tar.gz -o /tmp/softether-vpnserver.tar.gz && \ 
tar -xzvf /tmp/softether-vpnserver.tar.gz -C /usr/local/ && \
rm /tmp/softether-vpnserver.tar.gz && \
make i_read_and_agree_the_license_agreement && \
apt-get purge -y -q --auto-remove make ca-certificates gcc

EXPOSE 443/tcp 992/tcp 1194/tcp 1194/udp 5555/tcp 500/udp 4500/udp

#VOLUME /usr/local/bin/

ADD ./entrypoint.sh /
RUN chmod 0755 /entrypoint.sh 
CMD ["/entrypoint.sh"]

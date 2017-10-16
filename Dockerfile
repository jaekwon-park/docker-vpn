FROM ubuntu:16.04

MAINTAINER Jaekwon Park <jaekwon.park@code-post.com>

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends git make ca-certificates \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/SoftEtherVPN/SoftEtherVPN.git /usr/local/src/vpnserver 
RUN cd /usr/local/src/vpnserver && cp src/makefiles/linux_64bit.mak Makefile && make && \
cp bin/vpnserver/vpnserver /opt/usr/local/vpnserver && \
cp bin/vpnserver/hamcore.se2 /opt/usrl/local/hamcore.se2 && \
cp bin/vpncmd/vpncmd /opt/usr/local/vpncmd && \ 
rm -rf /usr/local/src/vpnserver

EXPOSE 500 4500 1701 1194 443 5555 992 

VOLUME /usr/local/bin/

ADD ./entrypoint.sh /
RUN chmod 0755 /entrypoint.sh 
CMD ["/entrypoint.sh"]

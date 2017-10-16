FROM alpine:3.6

MAINTAINER Jaekwon Park <jaekwon.park@code-post.com>

EXPOSE 500 4500 1701 1194 443 5555 992 

VOLUME /usr/local/bin/

ADD entrypoint.sh /
RUN chmod 0755 /entrypoint.sh \
CMD ["/entrypoint.sh"]

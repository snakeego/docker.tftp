FROM alpine:latest

COPY ./docker-entrypoint.sh /
ADD http://af.it-test.pw/su-exec/alpine/suexec /usr/local/bin/suexec

RUN set -x \
    && apk --update --no-cache add tftp-hpa \
    && chmod +x /docker-entrypoint.sh /usr/local/bin/suexec \
    && mkdir /tftp 

VOLUME /tftp
EXPOSE 69/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-L", "--secure", "/var/tftpboot"]

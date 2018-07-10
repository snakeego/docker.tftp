FROM alpine:latest

COPY ./docker-entrypoint.sh /

RUN set -x \
    && apk --update --no-cache add tftp-hpa \
    && chmod +x /docker-entrypoint.sh \
    && mkdir /tftp 

VOLUME /tftp
EXPOSE 69/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-Lc", "--secure", "/tftp"]

FROM alpine:3.19.1

RUN set -xe && \
    apk add --update --no-cache proftpd && \
    mkdir -vp /run/proftpd && \
    touch /run/proftpd/proftpd.delay

ADD launch /launch
ADD proftpd.conf /etc/proftpd/proftpd.conf

CMD /launch

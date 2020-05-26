FROM debian:10.4-slim

ENV DEBIAN_FRONTEND noninteractive

RUN set -xe && \
    apt-get update -y && \
    apt-get install --no-install-recommends -y proftpd && \
    mkdir /ftp

ADD launch /launch
ADD proftpd.conf /etc/proftpd/proftpd.conf

CMD /launch

FROM alpine

RUN set -xe \
    && apk add --no-cache openssh rsyslog \
    && mkdir -p 700 /root/.ssh \
    && mv /etc/ssh /root/.ssh/ssh \
    && ln -s /root/.ssh/ssh /etc/ssh \
    # unlock the user, otherwise we cannot connect
    && passwd -u root 

COPY docker-entrypoint.sh /entrypoint.sh

WORKDIR /root
VOLUME /root

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]

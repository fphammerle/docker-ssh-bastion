FROM alpine:3.14.1

ARG OPENSSH_SERVER_PACKAGE_VERSION=8.6_p1-r2
RUN apk add --no-cache openssh-server=$OPENSSH_SERVER_PACKAGE_VERSION

ENV SSHD_HOST_KEYS_DIR /etc/ssh/host_keys
VOLUME $SSHD_HOST_KEYS_DIR

COPY sshd_config /etc/ssh/sshd_config

# comma-separated list of usernames
ENV USERS ""

EXPOSE 22/tcp

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e"]

FROM majid7221/debian:stretch

RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        openssh-server \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

RUN set -ex \
    && mkdir -p /var/run/sshd \
    && rm -f /etc/ssh/ssh_host_*key*

COPY files/sshd_config /etc/ssh/sshd_config
COPY files/entry.sh /

EXPOSE 22

ENTRYPOINT ["/entry.sh"]

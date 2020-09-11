FROM jenkin/inbound-agent
ARG DOCKER_VERSION=5:19.03.12~3-0~debian-buster
ARG DC_VERSION=1.27.2
USER root

RUN apt-get update && \
    apt-get install -qq -y --no-install-recommends \
      apt-transport-https ca-certificates curl zip gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" && \
    apt-get update && \
    apt-get install -qq -y --no-install-recommends docker-ce=${DOCKER_VERSION} && \
    curl -L https://github.com/docker/compose/releases/download/${DC_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

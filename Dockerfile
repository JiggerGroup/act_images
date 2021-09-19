# from https://github.com/nikolaik/docker-python-nodejs
FROM debian:buster

RUN apt-get update

# Install docker, from docker website
RUN apt-get install  -yqq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    wget

RUN wget -qO- https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get install -yqq docker-ce docker-ce-cli containerd.io

ARG DOCKER_COMPOSE_VERSION=1.29.2

# Install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

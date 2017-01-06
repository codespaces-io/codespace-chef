FROM ubuntu:14.04
MAINTAINER Babu R <babu@initcron.org>

WORKDIR /workspace
VOLUME /workspace

RUN apt-get update && \
        apt-get install -y make g++ python git curl && \
        curl -sL https://deb.nodesource.com/setup | sudo bash - && \
        apt-get install -y nodejs && \
        npm -g install node-gyp codebox && \
        cd /usr/lib/node_modules/codebox/node_modules/shux/node_modules/pty.js && \
        make clean && \
        make

ENV CODEBOX_USERNAME your_username
ENV CODEBOX_PASSWORD password

COPY 128.png /usr/lib/node_modules/codebox/client/build/static/images/icons

RUN chown nobody.root /usr/lib/node_modules/codebox/client/build/static/images/icons/128.png && \
    chmod 644 /usr/lib/node_modules/codebox/client/build/static/images/icons/128.png

RUN apt-get install -yq wget  && \ 
    cd /opt && \ 
    wget https://packages.chef.io/files/stable/chefdk/1.0.3/ubuntu/14.04/chefdk_1.0.3-1_amd64.deb && \
    dpkg -i chefdk_1.0.3-1_amd64.deb && \
    /opt/chefdk/embedded/bin/gem install kitchen-docker && \
    rm -rf chefdk_1.0.3-1_amd64.deb && \ 
    apt-get purge -yq wget

RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -yq docker-engine  && \
    apt-get install -y openssh-server sudo vim && \ 
    mkdir /var/run/sshd

COPY motd.sh /opt/

RUN chmod +x /opt/motd.sh && \
    sh /opt/motd.sh && \
    rm -rf /opt/motd.sh

RUN useradd -ms /bin/bash devops && \
    echo 'devops:codespaces' |chpasswd && \
    adduser devops sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 22 8000

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

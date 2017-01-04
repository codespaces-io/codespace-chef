From tangym/codebox
MAINTAINER Babu R <babu@initcron.org>

COPY 128.png /usr/lib/node_modules/codebox/client/build/static/images/icons

RUN chown nobody.root /usr/lib/node_modules/codebox/client/build/static/images/icons/128.png && \
    chmod 644 /usr/lib/node_modules/codebox/client/build/static/images/icons/128.png

RUN apt-get update

ADD https://packages.chef.io/files/stable/chefdk/1.0.3/ubuntu/14.04/chefdk_1.0.3-1_amd64.deb /opt

RUN dpkg -i /opt/chefdk_1.0.3-1_amd64.deb && \
    rm -rf /opt/chefdk_1.0.3-1_amd64.deb

RUN apt-get install -y openssh-server sudo vim
RUN mkdir /var/run/sshd

COPY motd.sh /opt/

RUN chmod +x /opt/motd.sh && \
    sh /opt/motd.sh && \
    rm -rf /opt/motd.sh

RUN useradd -ms /bin/bash devops && \
    echo 'devops:schoolofdevops' |chpasswd && \
    adduser devops sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]

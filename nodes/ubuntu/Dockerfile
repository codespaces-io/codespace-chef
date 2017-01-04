FROM       ubuntu:14.04
MAINTAINER Babu <babu@initcron.org>

RUN apt-get update

ADD https://packages.chef.io/files/stable/chef/12.17.44/ubuntu/14.04/chef_12.17.44-1_amd64.deb /opt

RUN dpkg -i /opt/chef_12.17.44-1_amd64.deb && \
    rm -rf /opt/chef_12.17.44-1_amd64.deb

RUN apt-get install -y openssh-server sudo vim python python-apt python-pip
RUN mkdir /var/run/sshd

COPY motd.sh /opt/

RUN chmod +x /opt/motd.sh && \
    sh /opt/motd.sh && \
    rm -rf motd.sh

RUN useradd -ms /bin/bash devops && \
    echo 'devops:schoolofdevops' |chpasswd && \
    adduser devops sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 22

CMD ["/bin/bash","/entrypoint.sh"]

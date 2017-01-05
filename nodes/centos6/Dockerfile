FROM centos:6
MAINTAINER babu <babu@initcron.org>

LABEL env=des

RUN rpm -ivh https://packages.chef.io/files/stable/chef/12.17.44/el/6/chef-12.17.44-1.el6.x86_64.rpm

RUN yum -y install openssh-server shadow-utils sudo

COPY motd.sh /opt/

RUN chmod +x /opt/motd.sh && \
    sh /opt/motd.sh && \
    rm -rf /opt/motd.sh

RUN useradd devops && echo 'devops:codespaces' |chpasswd

RUN echo 'devops ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 22

CMD ["/bin/bash","/entrypoint.sh"]

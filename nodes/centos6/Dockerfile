FROM codespaces/base-centos:6
MAINTAINER Vijayboopathy E <vibe@initcron.org>

LABEL env=des

RUN rpm -ivh https://packages.chef.io/files/stable/chef/12.17.44/el/6/chef-12.17.44-1.el6.x86_64.rpm

EXPOSE 22

CMD ["/bin/bash","/bootstrap.sh"]

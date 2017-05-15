FROM codespaces/akurath:v0.1.0
MAINTAINER Vijayboopathy E <vibe@initcron.org>

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
    apt-get install -yq docker-engine


EXPOSE 22 8000

COPY insecure_key.pem /root/.ssh/id_rsa

COPY docker-entrypoint.sh /usr/local/bin/

ENV PATH="/opt/chefdk/embedded/bin:${PATH}"

RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat

ENTRYPOINT ["docker-entrypoint.sh"]


CMD /usr/bin/akurath run

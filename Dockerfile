From ubuntu:16.04
###########################################################################
# ARG app Version
###########################################################################
ARG DOCKER_VERSION=18.09.0
###########################################################################
# ENV
###########################################################################

###########################################################################
# COPY
###########################################################################

###########################################################################
# RUN
###########################################################################
RUN set -eux \
  echo "######### dash > bash ##########" \
  && mv /bin/sh /bin/sh.old && ln -s bash /bin/sh \
  && echo "######### apt update ##########" \
  && apt-get update  && apt-get install -y default-jre default-jdk sudo vim wget netcat git curl unzip locales unzip rsync python python-pip netcat git \
  && echo "######### add root bashrc ##########" \
  && locale-gen zh_TW.UTF-8 && echo 'export LANGUAGE="zh_TW.UTF-8"' >> /root/.bashrc \
  && echo 'export LANG="zh_TW.UTF-8"' >> /root/.bashrc \
  && echo 'export LC_ALL="zh_TW.UTF-8"' >> /root/.bashrc && update-locale LANG=zh_TW.UTF-8 \
  && echo "######### ssh_config ##########" \
  && echo "Host *" >> /etc/ssh/ssh_config \
  && echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config \
  && echo "    UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config \
  && echo "######### docker client #########"         \          
  && curl -L -o docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar xf docker.tgz  \
  && mv docker/docker /usr/local/bin/docker \
  && chmod a+x /usr/local/bin/docker \
  && rm -rf docker \  
  && echo "######### clear apt cache #########" \ 
  && rm -rf /var/lib/apt/lists/* && apt-get clean    
    
    
###########################################################################
# VOLUME
###########################################################################
###########################################################################
# ENTRYPOINT
###########################################################################

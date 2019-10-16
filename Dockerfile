## 使用docker-compose build --build-arg DockerID=$(cat /etc/group|grep docker|cut -d':' -f3)
###########################################################################
# From
From ubuntu:16.04
###########################################################################
# ARG 
ARG DockerID
###########################################################################
# ENV
ENV DOCKER_VERSION=18.09.0
ENV KUBECTL=v1.15.3
###########################################################################
# ADD

###########################################################################
# RUN
RUN set -eux \
  echo "\n################## dash > bash ###################" \
  && mv /bin/sh /bin/sh.old && ln -s bash /bin/sh \
  && echo "\n################## apt update ###################" \
  && apt-get update  && apt-get install -y sudo vim wget netcat dnsutils git curl unzip locales unzip rsync python \
     python-pip netcat git jq \
  && echo "\n################## add root bashrc ###################" \
  && locale-gen zh_TW.UTF-8 && echo 'export LANGUAGE="zh_TW.UTF-8"' >> /root/.bashrc \
  && echo 'export LANG="zh_TW.UTF-8"' >> /root/.bashrc \
  && echo 'export LC_ALL="zh_TW.UTF-8"' >> /root/.bashrc && update-locale LANG=zh_TW.UTF-8 \
  && echo "\n################## ssh_config ###################" \
  && echo "Host *" >> /etc/ssh/ssh_config \
  && echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config \
  && echo "    UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config \
  && echo "\n################## docker client ##################" \          
  && curl -L -o docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar xf docker.tgz  \
  && mv docker/docker /usr/local/bin/docker \
  && chmod a+x /usr/local/bin/docker \
  && rm -rf docker && rm -f docker.tgz \
  && groupadd docker -g ${DockerID} \
  && touch /var/run/docker.sock \
  && chown root:docker /var/run/docker.sock \
  && echo "\n################## kubernete clinet ##################" \
  && wget https://dl.k8s.io/${KUBECTL}/kubernetes-client-linux-amd64.tar.gz \
  && tar -xzvf kubernetes-client-linux-amd64.tar.gz \
  && mv kubernetes/client/bin/kubectl  /usr/bin/ \
  && rm -f kubernetes-client-linux-amd64.tar.gz \
  && rm -rf kubernetes \
  && echo "\n################## install aws cli ##################" \
  && curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip \
  && unzip awscli-bundle.zip \
  && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
  && rm -f awscli-bundle.zip \
  && rm -rf awscli-bundle \
  && echo "\n################## install ansible ##################" \
  && apt-get update && apt-get install software-properties-common -y \
  && apt-add-repository ppa:ansible/ansible \
  && apt-get install ansible -y \
  && echo "\n################## clear apt cache ##################" \ 
  && rm -rf /var/lib/apt/lists/* && apt-get clean && apt-get autoremove  
    
###########################################################################
# VOLUME
###########################################################################
# ENTRYPOINT
###########################################################################
# CMD

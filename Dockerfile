From ubuntu:18.04                                                                                                                                     
RUN set -eux && \
    apt-get update && \
    apt-get install --no-install-recommends \
    iputils-ping \
    sudo \
    python \
    software-properties-common \
    default-jre \
    default-jdk \
    vim -y && \
    apt-add-repository ppa:ansible/ansible -y && \
    apt-get update && \
    apt-get install ansible -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 && \
    echo "Host *" >> /etc/ssh/ssh_config && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
    echo "    UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config

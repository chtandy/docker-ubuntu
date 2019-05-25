From ubuntu:18.04                                                                                                                                             
RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends iputils-ping \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

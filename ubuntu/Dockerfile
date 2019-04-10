From ubuntu:18.04
RUN apt-get update \
    && apt-get install -y --no-install-recommends iputils-ping \
    && rm -rf /var/lib/apt/lists/*
RUN touch /docker-entrypoint.sh && echo "#!/bin/bash" >> \
    /docker-entrypoint.sh && echo "touch /docker-entrypoint.sh" >> \
    /docker-entrypoint.sh && echo "while [ -f /docker-entrypoint.sh ]" >> \
    /docker-entrypoint.sh && echo "do" >> \
    /docker-entrypoint.sh && echo "  sleep 3600" >> \
    /docker-entrypoint.sh && echo "done" >> \
    /docker-entrypoint.sh && chmod +x docker-entrypoint.sh

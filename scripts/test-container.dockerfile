FROM ubuntu:latest
RUN apt-get update && apt-get install -y --no-install-recommends \
    adduser \
    ca-certificates \
    curl \
    sudo \
    && rm -rf /var/lib/apt/lists/*
RUN adduser --disabled-password --gecos "" testuser && \
    adduser testuser sudo && \
    echo "testuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
COPY .. /home/testuser/.local/share/chezmoi
COPY scripts/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
WORKDIR /home/testuser
USER testuser

FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    # Sandbox dependencies
    bubblewrap socat \
    # Core utilities
    ca-certificates curl wget git less procps file tree \
    zip unzip xz-utils bzip2 nano \
    # Search and data tools
    ripgrep fd-find jq \
    # Python
    python3 python3-pip python3-venv \
    # Compilers and build tools (needed by many npm/pip packages)
    build-essential pkg-config \
    # Networking and diagnostics
    openssh-client dnsutils iputils-ping \
 && ln -s /usr/bin/fdfind /usr/local/bin/fd \
 && ln -s /usr/bin/python3 /usr/local/bin/python \
 && rm -rf /var/lib/apt/lists/*

RUN npm install -g @anthropic-ai/claude-code

COPY managed-settings.json /etc/claude-code/managed-settings.json

USER node
WORKDIR /workspace

FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
        vim nano gcc make git curl wget ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://starship.rs/install.sh | sh -s -- -y \
    && wget -q https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb \
         -O /tmp/fastfetch.deb \
    && dpkg -i /tmp/fastfetch.deb \
    && rm /tmp/fastfetch.deb

RUN mkdir -p /root/.config/fastfetch \
    && echo 'eval "$(starship init bash)"' >> /root/.bashrc \
    && echo 'fastfetch' >> /root/.bashrc

WORKDIR /root
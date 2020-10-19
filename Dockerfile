FROM ros:melodic-ros-core

ENV RUST_VERSION=1.47.0
ENV RUST_ARCH=x86_64

RUN apt-get update && apt-get install -y curl && curl -L https://static.rust-lang.org/dist/rust-"${RUST_VERSION}"-"${RUST_ARCH}"-unknown-linux-gnu.tar.gz | \
    tar -zvx -C /tmp && \
    (cd /tmp/rust-* && ./install.sh) && rm -rf /tmp/rust-* && \
    apt-get remove --purge -y curl && apt-get autoremove --purge -y && \
    rm -rf /var/cache/apt

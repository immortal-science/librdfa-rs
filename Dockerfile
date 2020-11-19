FROM rust:latest
RUN apt-get update
RUN apt-get install -y autoconf automake gcc make pkg-config libtool libxml2 libxml2-dev curl clang
RUN rustup component add rustfmt --toolchain 1.47.0-x86_64-unknown-linux-gnu

# Mount current dir
WORKDIR /librdfa-rs
ADD . .

RUN cargo install bindgen
RUN cargo fetch
# RUN cargo build
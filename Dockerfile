# select image
FROM rust:1.23

# create a new empty shell project
RUN USER=root cargo new --bin server
WORKDIR /server

# copy over your manifests
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml
COPY ./.env ./.env
COPY ./.env ./.env

# this build step will cache your dependencies
RUN rm src/*.rs

# copy your source tree
COPY ./src ./src
RUN rustup default nightly-2018-10-20 \
    && cargo install diesel_cli

COPY ./entryfile.sh ./entryfile.sh
ENTRYPOINT ["./entryfile.sh"]

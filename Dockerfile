# select image
FROM rust:1.29.1

# create a new empty shell project
RUN USER=root cargo new --bin server
WORKDIR /server

# copy over your manifests
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml
COPY ./framework ./framework


# this build step will cache your dependencies
RUN cargo build
RUN rm src/*.rs

# copy your source tree
COPY ./src ./src

# build for release
RUN cargo build

COPY ./entryfile.sh ./entryfile.sh
ENTRYPOINT ["./entryfile.sh"]

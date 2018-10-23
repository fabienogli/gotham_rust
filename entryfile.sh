#!/bin/sh
echo rustup --version
diesel setup
diesel migration run

echo "launching application"
cargo run

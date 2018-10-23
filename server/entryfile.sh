#!/bin/sh
echo "runing migrations"
diesel setup

echo "printing schema"
diesel print-schema > src/schema.rs

echo "launching application"
cargo run

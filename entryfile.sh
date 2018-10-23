#!/bin/sh
echo "runing migrations"
diesel setup

echo "launching application"
cargo run

#!/usr/bin/env bash

DIR=$(
  cd "$(dirname "$0")"
  pwd
)
cd $DIR
set -ex

cargo build --target wasm32-unknown-unknown --release
rust_wasm=./target/wasm32-unknown-unknown/release/_.wasm
wasm-bindgen $rust_wasm --out-dir lib --target nodejs --weak-refs
wasm-opt -O3 -o ./lib/__bg.wasm ./lib/__bg.wasm
mv lib/_.js lib/_.cjs
./gen.coffee

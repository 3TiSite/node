#!/usr/bin/env bash
set -ex
DIR=$(
  cd "$(dirname "$0")"
  pwd
)
exec dist.coffee $DIR

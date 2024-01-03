#!/usr/bin/env bash
set -ex
DIR=$(
  cd "$(dirname "$0")"
  pwd
)
git add -A
git pull

cd $DIR/pkg
jq '.name="@3-/vbyte"' package.json | sponge package.json
version=$(cat package.json | jq -r '.version')
npm version patch

cd $DIR
./build.sh
git add -u
git commit -m "$version"

cd $DIR/pkg
npm publish --access=public

# cd $DIR
# ./build.sh
#
# cd $DIR/pkg
# jq '.name="@3-/vite"' package.json | sponge package.json
# sed -i '/function initSync(module)/,$d' _.js
# sed -i '/__wbg_init\./d' _.js
# cat ../_patch.js >>_.js
# ../patch.coffee
#
# git add -u
# git commit -m "$version vite"
# git push
# npm publish --access=public

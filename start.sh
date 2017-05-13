#!/bin/bash

cp -r /opt/app-root/src/riot /tmp
pushd /tmp/riot
[ -n $HOMESERVER ] && \
  cat config.sample.json | sed s#https://matrix.org#$HOMESERVER# > config.json

python -m SimpleHTTPServer

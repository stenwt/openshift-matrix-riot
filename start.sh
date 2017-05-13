#!/bin/bash

pushd /opt/app-root/src/riot
[ -n $HOMESERVER ] && \
  cat config.sample.json | sed s#https://matrix.org#$HOMESERVER# > config.json

python -m SimpleHTTPServer

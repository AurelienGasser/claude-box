#!/bin/sh

mkdir -p ~/.claude-box-home
container system start
container run -it --rm \
    -v ~/.claude-box-home:/home/node \
    -v "$PWD":"$PWD" \
    -w "$PWD" \
    claude-box claude "$@"

#!/bin/bash
./bin/local_build.sh -r arm64-musl -v v$1
cp -r ../staging/release/v$1 dists/


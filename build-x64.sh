#!/bin/bash
./bin/local_build.sh -r x64-musl -v v$1
cp -r ../staging/release/v$1/ dists/
git checkout -b nodejs/$1
git add dists/v$1/*
git commit -sm "Added x64-musl v$1 binaries"
git push -u origin nodejs/$1


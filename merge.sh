#!/bin/bash
git pull -p
git checkout nodejs/$1
cd dists/v$1
sha256sum * > SHASUMS256.txt
cd ..
npx nodejs-dist-indexer --dist . --indexjson index.json --indextab index.tab
sed -i '' 's/linux-x64-musl/linux-arm64-musl","linux-x64-musl/g' index.json
sed -i '' 's/linux-x64-musl/linux-arm64-musl,linux-x64-musl/g' index.tab
git add index.* v$1/*
git commit -sm "Added arm64-musl v$1 binaries, checksums and indices"
git push


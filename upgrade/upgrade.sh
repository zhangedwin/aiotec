#!/bin/bash
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
echo "SCRIPT_DIR: $SCRIPT_DIR"
cd "$SCRIPT_DIR"
for file in $SCRIPT_DIR/*.bin; do
  echo "Processing ${file}"
  openssl enc -d -aes-256-cbc -pbkdf2 -in "${file}" -out "${file}".zip -k 528deb3a91064fe49358a99e72230b98
  unzip -o "${file}.zip" -d "upgrade"
  cp -r upgrade/* ../
  rm -rf "${file}".zip
  rm -rf "${file}"
  rm -rf upgrade
done
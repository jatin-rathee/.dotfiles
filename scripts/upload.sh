#!/bin/sh
# Uploads file to https://0x0.st/
data="file=@$1"
response=$(curl -F"$data" https://0x0.st)
echo "$1          $response" >> uploads.txt

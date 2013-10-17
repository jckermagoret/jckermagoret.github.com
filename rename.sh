#!/bin/sh

FILENAME=$1
NF=$(echo "$1" | tr " " "_")
echo mv "$FILENAME" $NF
mv "$FILENAME" $NF

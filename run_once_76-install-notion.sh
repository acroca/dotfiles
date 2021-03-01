#!/bin/sh

mkdir -p ~/nativefier
docker run --rm -v ~/nativefier:/target nativefier/nativefier --name notion https://www.notion.so/ /target/

#!/bin/sh

mkdir -p ~/nativefier
docker run --rm -v ~/nativefier:/target nativefier/nativefier --name whatsApp https://web.whatsapp.com/ /target/

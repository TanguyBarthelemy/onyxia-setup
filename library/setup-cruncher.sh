#!/bin/sh

# Installer rjdverse dependencies
apt-get update
apt-get install -y \
  openjdk-21-jdk \
  protobuf-compiler libprotobuf-dev libprotoc-dev \
  unzip

mkdir "/home/onyxia/work/software"

curl -Lo /home/onyxia/work/software/jwsacruncher-3.6.0.zip https://github.com/jdemetra/jdplus-main/releases/download/v3.6.0/jwsacruncher-standalone-3.6.0-linux-x86_64.zip
curl -Lo /home/onyxia/work/software/jwsacruncher-2.2.6.zip https://github.com/jdemetra/jwsacruncher/releases/download/v2.2.6/jwsacruncher-2.2.6-bin.zip

unzip -o /home/onyxia/work/software/jwsacruncher-3.6.0.zip -d /home/onyxia/work/software/
unzip -o /home/onyxia/work/software/jwsacruncher-2.2.6.zip -d /home/onyxia/work/software/

chmod +rwx /home/onyxia/work/software/jwsacruncher-3.6.0/bin/jwsacruncher
chmod +rwx /home/onyxia/work/software/jwsacruncher-2.2.6/bin/jwsacruncher

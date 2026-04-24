#!/bin/sh

# Install rjdverse lib
apt-get update
apt-get install -y \
  openjdk-21-jdk \
  protobuf-compiler libprotobuf-dev libprotoc-dev \
	libcairo2-dev \
	libharfbuzz-dev libfribidi-dev \
	libgit2-dev libssh2-1-dev libssl-dev

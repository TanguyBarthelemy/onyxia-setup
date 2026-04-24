#!/bin/sh

# Installer rjdverse dependencies
apt-get update
apt-get install -y \
  openjdk-21-jdk \
  protobuf-compiler libprotobuf-dev libprotoc-dev \
  unzip

mkdir -p "/home/onyxia/work/software"

curl -Lo /home/onyxia/work/software/jwsacruncher-3.7.1.zip https://github.com/jdemetra/jdplus-main/releases/download/v3.7.1/jwsacruncher-standalone-3.7.1-linux-x86_64.zip
curl -Lo /home/onyxia/work/software/jwsacruncher-2.2.6.zip https://github.com/jdemetra/jwsacruncher/releases/download/v2.2.6/jwsacruncher-2.2.6-bin.zip

unzip -o /home/onyxia/work/software/jwsacruncher-3.7.1.zip -d /home/onyxia/work/software/
unzip -o /home/onyxia/work/software/jwsacruncher-2.2.6.zip -d /home/onyxia/work/software/

chmod +rwx /home/onyxia/work/software/jwsacruncher-3.7.1/bin/jwsacruncher
chmod +rwx /home/onyxia/work/software/jwsacruncher-2.2.6/bin/jwsacruncher

cat << 'EOF' >> ~/.bashrc

# >>> Apache Maven >>>
export JWSACRUNCHER_HOME=/home/onyxia/work/software/jwsacruncher-3.7.1/bin/
export PATH=$JWSACRUNCHER_HOME/bin:$PATH
# <<< Apache Maven <<<

EOF

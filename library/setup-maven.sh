
# Installer maven
mkdir -p "/home/onyxia/work/software"

curl -Lo /home/onyxia/work/software/apache-maven-3.9.15-bin.tar.gz https://dlcdn.apache.org/maven/maven-3/3.9.15/binaries/apache-maven-3.9.15-bin.tar.gz
tar xvf /home/onyxia/work/software/apache-maven-3.9.15-bin.tar.gz -C /home/onyxia/work/software/

cat << 'EOF' >> ~/.bashrc

# >>> Apache Maven >>>
export MAVEN_HOME=/home/onyxia/work/software/apache-maven-3.9.15
export PATH=$MAVEN_HOME/bin:$PATH
# <<< Apache Maven <<<

EOF

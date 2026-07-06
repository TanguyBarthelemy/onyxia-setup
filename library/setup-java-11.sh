#!/bin/bash

# Script d'initialisation pour un service RStudio sur Onyxia avec OpenJDK 11 uniquement

# Mettre à jour les paquets
echo "Mise à jour des paquets..."
apt update -qq

# Supprimer toutes les versions de Java installées, y compris OpenJDK 21
echo "Suppression des versions existantes de Java..."
apt remove -y --purge openjdk-21-jdk openjdk-21-jre openjdk-21-jdk-headless openjdk-21-jre-headless
apt remove -y --purge openjdk-* icedtea-* java-common oracle-java* default-jre default-jdk

# Supprimer les dossiers résiduels
echo "Suppression des dossiers résiduels..."
rm -rf /usr/lib/jvm/java-21-openjdk-amd64
rm -rf /usr/lib/jvm/java-1.21.0-openjdk-amd64

# Nettoyer les dépendances inutiles
echo "Nettoyage des dépendances..."
apt autoremove -y
apt autoclean -y

# Installer OpenJDK 11
echo "Installation d'OpenJDK 11..."
apt install -y openjdk-11-jdk

# Configurer OpenJDK 11 comme version par défaut
echo "Configuration d'OpenJDK 11 comme version par défaut..."
update-alternatives --remove-all java
update-alternatives --remove-all javac
update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-11-openjdk-amd64/bin/java 1
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac 1
update-alternatives --set java /usr/lib/jvm/java-11-openjdk-amd64/bin/java
update-alternatives --set javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac

# Créer un lien symbolique pour libjvm.so
echo "Création d'un lien symbolique pour libjvm.so..."
ln -sf /usr/lib/jvm/java-11-openjdk-amd64/lib/server/libjvm.so /usr/lib/libjvm.so

# Définir les variables d'environnement pour RStudio
echo "Configuration des variables d'environnement pour RStudio..."
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\$JAVA_HOME/lib/server:\$LD_LIBRARY_PATH" >> ~/.bashrc

# Créer un fichier .Renviron pour R
echo "Configuration de .Renviron pour R..."
echo "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" > ~/.Renviron
echo "LD_LIBRARY_PATH=/usr/lib/jvm/java-11-openjdk-amd64/lib/server" >> ~/.Renviron

# Installer rJava dans R avec les bonnes dépendances
echo "Installation de rJava dans R..."
Rscript -e "remove.packages('rJava')"
Rscript -e "install.packages('rJava', configure.args = '--with-java-home=/usr/lib/jvm/java-11-openjdk-amd64')"

# Afficher les informations sur la version de Java installée
echo "Vérification de la version de Java installée..."
java -version

# Vérifier le lien symbolique pour libjvm.so
echo "Vérification du lien symbolique pour libjvm.so..."
ls -l /usr/lib/libjvm.so

# Afficher un message de confirmation
echo "Initialisation terminée. OpenJDK 11 est maintenant la seule version de Java installée et configurée pour RStudio."

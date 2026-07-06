#!/bin/bash

# Script d'initialisation pour un service RStudio sur Onyxia avec OpenJDK 11 uniquement

# Mettre à jour les paquets
echo "Mise à jour des paquets..."
apt update -qq

# Supprimer toutes les versions de Java installées
echo "Suppression des versions existantes de Java..."
apt remove -y --purge openjdk-* icedtea-* icedtea6-* java-common oracle-java* default-jre default-jdk

# Nettoyer les dépendances inutiles
echo "Nettoyage des dépendances..."
apt autoremove -y
apt autoclean -y

# Installer OpenJDK 11
echo "Installation d'OpenJDK 11..."
apt install -y openjdk-11-jdk

# Configurer OpenJDK 11 comme version par défaut
echo "Configuration d'OpenJDK 11 comme version par défaut..."
update-alternatives --set java /usr/lib/jvm/java-11-openjdk-amd64/bin/java
update-alternatives --set javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac

# Définir les variables d'environnement pour RStudio
echo "Configuration des variables d'environnement pour RStudio..."
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\$JAVA_HOME/lib/server:\$LD_LIBRARY_PATH" >> ~/.bashrc

# Créer un fichier .Renviron pour R
echo "Configuration de .Renviron pour R..."
echo "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" > ~/.Renviron
echo "LD_LIBRARY_PATH=/usr/lib/jvm/java-11-openjdk-amd64/lib/server" >> ~/.Renviron

# Afficher les informations sur la version de Java installée
echo "Vérification de la version de Java installée..."
java -version

# Afficher un message de confirmation
echo "Initialisation terminée. OpenJDK 11 est maintenant la seule version de Java installée et configurée pour RStudio."

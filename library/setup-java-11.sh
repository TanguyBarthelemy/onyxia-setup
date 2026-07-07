#!/bin/bash

# Script pour effacer les versions de Java existantes, installer OpenJDK 11,
# configurer JAVA_HOME et reconfigurer R pour utiliser Java 11.

# Effacer tout le contenu de /usr/lib/jvm
echo "Effacement du contenu de /usr/lib/jvm..."
sudo rm -rf /usr/lib/jvm/*

# Installer OpenJDK 11
echo "Installation d'OpenJDK 11..."
sudo apt-get update
sudo apt-get install -y openjdk-11-jdk

# Déclarer la variable d'environnement JAVA_HOME
echo "Déclaration de la variable d'environnement JAVA_HOME..."
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/" >> ~/.bashrc
source ~/.bashrc

# Ajouter JAVA_HOME au fichier .Renviron pour R
echo "Ajout de JAVA_HOME au fichier .Renviron..."
echo "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.Renviron

# Créer un lien symbolique pour libjvm.so
echo "Création d'un lien symbolique pour libjvm.so..."
ln -sf /usr/lib/jvm/java-11-openjdk-amd64/lib/server/libjvm.so /usr/lib/libjvm.so

# Reconfigurer R pour utiliser Java 11
echo "Reconfiguration de R pour utiliser Java 11..."
sudo R CMD javareconf

# Vérification de la version de Java
echo "Vérification de la version de Java installée..."
java -version

# Afficher un message de confirmation
echo "Configuration terminée. OpenJDK 11 est installé et configuré pour R."

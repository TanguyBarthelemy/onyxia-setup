#!/bin/sh

# Préparer Git
git config --global user.name "Tanguy BARTHELEMY"
git config --global user.email tanguy.barthelemy@insee.fr
git config --global credential.username TanguyBarthelemy
git config --global credential.helper 'cache --timeout=604800'

echo "GITHUB_PAT=\${GITHUB_TANGUYBARTHELEMY}" >> "${HOME}/.Renviron"

#!/bin/sh

# Variables personnalisables
USERNAME=${USERNAME:-rstudio}
GROUPNAME=${GROUPNAME:-rstudio}
RSTUDIO_CONFIG_DIR="${HOME}/.config/rstudio"
RSTUDIO_PREFS_FILE="${RSTUDIO_CONFIG_DIR}/rstudio-prefs.json"

# URL du fichier distant sur GitHub (à adapter à ton dépôt)
REMOTE_PREFS_URL="https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/inputs/rstudio-prefs.json"
mkdir -p "$RSTUDIO_CONFIG_DIR"
curl -fsSL "$REMOTE_PREFS_URL" -o "$RSTUDIO_PREFS_FILE"
chown ${USERNAME}:${GROUPNAME} "$RSTUDIO_PREFS_FILE"

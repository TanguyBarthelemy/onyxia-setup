#!/bin/sh

# Installer jarl
curl -LsSf https://github.com/etiennebacher/jarl/releases/latest/download/jarl-installer.sh | sh

# Installer air
curl -LsSf https://github.com/posit-dev/air/releases/latest/download/air-installer.sh | sh

REMOTE_AIR_TOML_URL="https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/inputs/air.toml"
curl -fsSL "$REMOTE_AIR_TOML_URL" -o "/home/onyxia/air.toml"
chown ${USERNAME}:${GROUPNAME} "/home/onyxia/air.toml"

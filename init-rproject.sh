#!/bin/sh

echo "v1.15"

echo "Fetching the parameter..."
GIT_ACCOUNT=$1
GIT_REPO=$2


echo "Changing ownership of init_dir..."
init_dir="/home/onyxia/.cache/init"
mkdir -p "${init_dir}"
chown -R onyxia:users "${init_dir}"
echo "RPROJ_DIR=\"/home/onyxia/work/${GIT_REPO}\"" >> "/home/onyxia/.Renviron"
chown onyxia:users "/home/onyxia/.Renviron"
cd ${init_dir}
echo "init_dir ready - OK"


echo "Downloading the bash files..."
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-git-TanguyBarthelemy.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-rstudio-prefs.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-locales.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-rprofile.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-air.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-firacode.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-rjdverse-lib.sh"
echo "Dowloading is complete - OK"


echo "Changing the ownership..."
chmod +x "setup-git-TanguyBarthelemy.sh"
chmod +x "setup-rstudio-prefs.sh"
chmod +x "setup-locales.sh"
chmod +x "setup-rprofile.sh"
chmod +x "setup-air.sh"
chmod +x "setup-firacode.sh"
chmod +x "setup-rjdverse-lib.sh"
echo "Changed the ownership - OK"


echo "Setting up Git..."
"./setup-git-TanguyBarthelemy.sh"
echo "Git setup - OK"

echo "Setting up RStudio preferences..."
"./setup-rstudio-prefs.sh"
echo "RStudio preferences setup - OK"

echo "Setting up Locales..."
"./setup-locales.sh"
echo "Locales setup - OK"

echo "Setting up .Rprofile..."
"./setup-rprofile.sh"
echo ".Rprofile setup - OK"

echo "Setting up Air..."
"./setup-air.sh"
echo "Air setup - OK"

echo "Setting up Fira Code..."
"./setup-firacode.sh"
echo "Fira Code setup - OK"

echo "Setting up rjdverse lib..."
"./setup-rjdverse-lib.sh"
echo "rjdverse lib setup - OK"


echo "Cloning the repo..."
cd "/home/onyxia/work"
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/${GIT_ACCOUNT}/${GIT_REPO}.git
chown -R onyxia:users ${GIT_REPO}/
chown -R onyxia:users /home/onyxia/.cache/git/credential
echo "Project setup is complete - OK"

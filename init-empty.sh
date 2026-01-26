#!/bin/sh

echo "v1.15"


echo "Changing ownership of init_dir..."
init_dir="/home/onyxia/.cache/init"
mkdir -p "${init_dir}"
chown -R onyxia:users "${init_dir}"
cd ${init_dir}
echo "init_dir ready - OK"


echo "Downloading the bash files..."
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-git-TanguyBarthelemy.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-rstudio-prefs.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-locales.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-rprofile.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-air.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-firacode.sh"
echo "Dowloading is complete - OK"


echo "Changing the ownership..."
chmod +x "setup-git-TanguyBarthelemy.sh"
chmod +x "setup-rstudio-prefs.sh"
chmod +x "setup-locales.sh"
chmod +x "setup-rprofile.sh"
chmod +x "setup-air.sh"
chmod +x "setup-firacode.sh"
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


echo "Prepare access to git credential..."
chown -R onyxia:users /home/onyxia/.cache/git/credential
echo "Project setup is complete - OK"

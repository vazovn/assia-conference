#! /bin/bash

echo $USER

# Create the working directory
mkdir /Users/$USER/Desktop/NDP-view2
mkdir /Users/$USER/Desktop/NDP-view2/data/

# Download and unzip the installer
wget -P /Users/$USER/Desktop/NDP-view2/ https://www.hamamatsu.com/content/dam/hamamatsu-photonics/sites/static/sys/en/download/NDP.view%202.9.29%20RUO.zip

cd /Users/$USER/Desktop/NDP-view2
unzip *.zip
cp NDP*RUO.dmg NDP.view.dmg

MOUNT=$(hdiutil attach NDP.view.dmg | grep Volumes | awk '{print $2 " " $3}')
cp -R "$MOUNT"/*.app /Applications/
hdiutil detach "$MOUNT"

# Clean the directory
rm *.dmg *.zip

# Download the data
#wget -P /Users/$USER/Desktop/NDP-view2/data https:// ......

echo "################################################"
echo "Tool installed and available in Applications!"
echo "Please close this window!"
echo "################################################"


#! /bin/bash

set -e

echo $USER

# Create the working directory
mkdir /Users/$USER/Desktop/NDP-view2
mkdir /Users/$USER/Desktop/NDP-view2/data/


## Install wget and Homebrew if necessary ###

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v wget >/dev/null 2>&1; then
    echo "Installing wget..."
    brew install wget
else
    echo "wget is already installed."
fi

echo "wget: $(wget --version | head -1)"

## wget installed ##


# Download and unzip the installer
wget -P /Users/$USER/Desktop/NDP-view2/ https://www.hamamatsu.com/content/dam/hamamatsu-photonics/sites/static/sys/en/download/NDP.view%202.10.0%20RUO%20Setup.zip


cd /Users/$USER/Desktop/NDP-view2
unzip *.zip
cp NDP*RUO.dmg NDP.view.dmg

MOUNT=$(hdiutil attach NDP.view.dmg | grep Volumes | awk '{print $2 " " $3}')
cp -R "$MOUNT"/*.app /Applications/
hdiutil detach "$MOUNT"

# Clean the directory
rm *.dmg *.zip

# Download the data
#wget -P /Users/$USER/Desktop/NDP-view2/data https://fd.oulo.no/delinger/cmtcwjzy4008o1jnpy7spd94i?mappe=cmtcxn9pm009a1jnp294ytk4g

echo "################################################"
echo "Tool installed and available in Applications!"
echo "Please close this window!"
echo "################################################"

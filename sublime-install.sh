#!/bin/bash

DOWNLOAD_DIR="/tmp"
DOWNLOAD_URL="http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2"
FILENAME=`echo $DOWNLOAD_URL | sed 's/.*\(Sublime.*\)/\1/' | sed 's/\%20/\\ /g'`
TARGET_DIRECTORY="/opt"
BINARY_DIRECTORY="/usr/bin"
SYMLINK_NAME="sublime_text"

# If download doesn't exist
if [ ! -f "$DOWNLOAD_DIR/$FILENAME" ]
    then
    # Download into download dir.
    wget -P $DOWNLOAD_DIR $DOWNLOAD_URL
fi

# Create target dir if if doesn't exist.
sudo mkdir -p $TARGET_DIRECTORY
# Install in target dir.
sudo tar xf "$DOWNLOAD_DIR/$FILENAME" -C $TARGET_DIRECTORY

# Unlink existing sylink if necessary.
if [ -f "$BINARY_DIRECTORY/$SYMLINK_NAME" ]
    then
    sudo unlink "$BINARY_DIRECTORY/$SYMLINK_NAME"
fi
# Create binary symlink
sudo ln -s /opt/Sublime\ Text\ 2/sublime_text $BINARY_DIRECTORY/$SYMLINK_NAME

# Create unity link.
cat <<EOF | sudo tee /usr/share/applications/$SYMLINK_NAME.desktop > /dev/null
[Desktop Entry]
Version=1.0
Name=Sublime Text
# Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413.
GenericName=Text Editor

Exec=$SYMLINK_NAME
Terminal=false
Icon=/opt/Sublime Text 2/Icon/48x48/sublime_text.png
Type=Application
Categories=TextEditor;IDE;Development
X-Ayatana-Desktop-Shortcuts=NewWindow

[NewWindow Shortcut Group]
Name=New Window
Exec=$SYMLINK_NAME -n
TargetEnvironment=Unity
MUHAHA
EOF

# Use sublime instead of Gedit (inline replace)
sudo sed -i.bak s/gedit/$SYMLINK_NAME/g /usr/share/applications/defaults.list
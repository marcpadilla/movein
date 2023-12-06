#!/bin/bash

# Function to change QTerminal settings
configure_qterminal() {
    # Path to the QTerminal configuration file
    QTERM_CONFIG="$HOME/.config/qterminal.org/qterminal.ini"

    # Check if the configuration file exists
    if [ ! -f "$QTERM_CONFIG" ]; then
        echo "QTerminal configuration file not found. QTerminal might not be installed."
        return 1
    fi

    # Set font size to 14 and remove transparency
    sed -i 's/FontSize=.*$/FontSize=14/' "$QTERM_CONFIG"
    sed -i 's/BackgroundOpacity=.*$/BackgroundOpacity=1.0/' "$QTERM_CONFIG"
}

# Function to install necessary packages
install_packages() {
    # Update package lists
    sudo apt update

    # Install packages
    sudo apt install -y autopsy bat exfat-fuse plaso vmfs-tools vmfs6-tools xxd
}

# Function to set desktop background color
set_desktop_background() {
    # Set the background to solid color #111111
    gsettings set org.gnome.desktop.background picture-options 'none'
    gsettings set org.gnome.desktop.background primary-color '#111111'
    gsettings set org.gnome.desktop.background color-shading-type 'solid'
}

# Main execution
configure_qterminal
install_packages
set_desktop_background

echo "Configuration and installation complete."
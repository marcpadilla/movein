#!/bin/bash

# Function to change GNOME Terminal settings
configure_gnome_terminal() {
    # Get the profile ID of the GNOME Terminal
    PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default)
    PROFILE=${PROFILE:1:-1} # remove leading and trailing single quotes

    # Set font size to 14
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE/ font 'Monospace 14'

    # Remove transparency (set background transparency to 100%)
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE/ background-transparency-percent 100
}

# Function to install necessary packages
install_packages() {
    # Update package lists
    sudo apt-get update

    # Install packages
    sudo apt-get install vmfs-tools vmfs6-tools bat xxd -y
}

# Function to set desktop background color
set_desktop_background() {
    # Set the background to solid color #111111
    gsettings set org.gnome.desktop.background picture-options 'none'
    gsettings set org.gnome.desktop.background primary-color '#111111'
    gsettings set org.gnome.desktop.background color-shading-type 'solid'
}

# Main execution
configure_gnome_terminal
install_packages
set_desktop_background

echo "Configuration and installation complete."

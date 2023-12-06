#!/bin/bash

# Function to install necessary packages
install_packages() {
    # Update package lists
    sudo apt update

    # Install packages
    sudo apt install -y autopsy bat exfat-fuse plaso vmfs-tools vmfs6-tools wxhexeditor xxd
}

# Main execution
install_packages

echo "Configuration and installation complete."
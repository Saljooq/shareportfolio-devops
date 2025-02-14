#!/bin/bash

# List of packages to check
PACKAGES=("nodejs" "npm" "golang-go" "nginx")

# Update package list
sudo apt update

# Loop through each package in the list
for PACKAGE_NAME in "${PACKAGES[@]}"; do
  # Check if the package is installed
  dpkg -l | grep -qw "$PACKAGE_NAME"

  # If the package is not installed, install it
  if [ $? -ne 0 ]; then
    echo "$PACKAGE_NAME is not installed. Installing..."
    sudo apt install -y "$PACKAGE_NAME"
  else
    echo "$PACKAGE_NAME is already installed."
  fi
done

sudo systemctl start nginx
sudo systemctl enable nginx
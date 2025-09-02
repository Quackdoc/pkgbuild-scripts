#!/bin/bash

# Ensure the script is not run as root
if [ "$(id -u)" -eq 0 ]; then
    echo "Error: This script should not be run as root or with sudo."
    exit 1
fi

# Get the number of CPU cores for maximum parallelism
num_jobs=$(nproc)

# Export environment variables
export MOLD_JOBS=1

# Set the Cargo target directory to a location in the user's home directory
export CARGO_TARGET_DIR="$HOME/cargo-target"

# Ensure the target directory exists
mkdir -p "$CARGO_TARGET_DIR"

# List of AUR packages to install
packages=(
  "cosmic-applets-git"
  "cosmic-applibrary-git"
  "cosmic-bg-git"
  "cosmic-comp-git"
  #"cosmic-epoch-meta-git"
  "cosmic-files-git"
  "cosmic-launcher-git"
  "cosmic-notifications-git"
  "cosmic-osd-git"
  "cosmic-panel-git"
  #"cosmic-player-git"
  "cosmic-randr-git"
  #"cosmic-reader-git"
  "cosmic-screenshot-git"
  "cosmic-settings-git"
  "cosmic-settings-daemon-git"
  "cosmic-store-git"
  "cosmic-term-git"
  "cosmic-edit-git"
  "cosmic-workspaces-epoch-git"
  "xdg-desktop-portal-cosmic-git"
  "cosmic-greeter-git"
  #"cosmic-session-git"
)
git lfs install
# Install AUR packages
for pkg in "${packages[@]}"; do
  echo "Installing $pkg..."
  cd "$pkg"
  paru -Ui --noconfirm
  cd ..
done

echo "Finishing install..."
paru -S cosmic-session-git

echo "Done."


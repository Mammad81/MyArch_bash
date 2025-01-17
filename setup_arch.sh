#!/bin/bash

# Update the package database and upgrade packages
echo -e "\e[1;34mUpdating package database... \e[0m"
sudo pacman -Syy

echo -e "\e[1;34mUpgrading packages... \e[0m"
sudo pacman -Syu

# Create directories
echo -e "\e[1;34mCreating directories... \e[0m"
sudo mkdir /mnt/Movies
sudo mkdir /mnt/Series
sudo mkdir /mnt/Backup

# Add key and install Chaotic AUR packages
echo -e "\e[1;34mAdding Chaotic AUR key... \e[0m"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

echo -e "\e[1;34mInstalling Chaotic AUR packages... \e[0m"
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'


# Update the package database again
echo -e "\e[1;34mUpdating package database again... \e[0m"
sudo pacman -Syy
echo -e "[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null

# Install desired packages
echo -e "\e[1;34mInstalling packages... \e[0m"
sudo pacman -S telegram-desktop cmatrix firefox smplayer ntfs-3g less fastfetch git vlc libreoffice-still ffmpegthumbs gwenview blanket bleachbit elisa thunar gnome-boxes sysprof persepolis timeshift intel-media-sdk intel-compute-runtime jellyfin-ffmpeg jellyfin-server jellyfin-web starship code go anydesk brave peazip renamemytvseries networkmanager vazirmatn-fonts rustdesk extension-manager gnome-themes-extra catfish drawing penguins-eggs kdeconnect trash-cli

# Enable and start serviceskdeconnect
echo -e "\e[1;34mEnabling and starting NetworkManager.service... \e[0m"
sudo systemctl enable --now NetworkManager.service
sudo systemctl status NetworkManager.service

echo -e "\e[1;34mEnabling and starting jellyfkdeconnectin.service... \e[0m"
sudo systemctl enable --now jellyfin.service
sudo systemctl start jellyfin.service

# Install and configure yay
echo -e "\e[1;34mCloning yay repository... \e[0m"
git clone https://aur.archlinux.org/yay.git
cd yay

echo -e "\e[1;34mBuilding and installing yay... \e[0m"
makepkg -si

echo -e "\e[1;34mInstalling AUR packages via yay... \e[0m"
yay -S v2rayn-bin vazir-code-fonts stacer-bin

# Check disk usage
echo -e "\e[1;34mChecking disk usage... \e[0m"
df -h

# Clean the package cache
echo -e "\e[1;34mCleaning package cache... \e[0m"
cd /var/cache/pacman/pkg/
sudo rm -rf *
# Check disk usage again
echo -e "\e[1;34mChecking disk usage again... \e[0m"
df -h
echo -e "\e[1;34mSetup complete.\e[0m"



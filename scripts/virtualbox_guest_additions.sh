#!/bin/bash

# run with sudo sh

read -p "Enter Guest Additions CD, then press any button to continue..."

sudo apt install build-essential dkms linux-headers-$(uname -r)
sudo mkdir -p /mnt/cdrom
sudo mount /dev/cdrom /mnt/cdrom
cd /mnt/cdrom
sudo sh ./VBoxLinuxAdditions.run --nox11
sudo reboot

#!/bin/bash


install_file="/media/cdrom/VBoxLinuxAdditions.run"

function testInsertedDisk {
	mount /dev/cdrom /media/cdrom

	if [ -f $install_file ]; then #File exists
		echo "Installation found. Getting dependencies"
	else
		read -p "Please insert quest addtions into VM" ANSWER
		mount /dev/cdrom /media/cdrom
	fi

	if [ -f $install_file ]; then
		echo "Installation found. Getting dependencies"
	else
		exit 2
	fi
}

if [ $EUID -ne 0 ]; then
	 echo "This script must be run as root" 1>&2
	 exit 1
fi


testInsertedDisk

apt-get install dkms	# Makes kernal upgrades possible by makeing recompilation of modules automatic
apt-get install build-essential linux-headers-$(uname -r)

apt-get install xserver-xorg xserver-xorg-core #VBoxLinux Additions needs this to install properly

$install_file./
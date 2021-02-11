#!/usr/bin/env bash

# Create a file with less steps.
# Created by davidc
# Release: 2/11/2021

# Sometimes you want to retain any settings in your distro
# and you do not wish to disturb the nature of your environment.

currentUser=$( whoami )
echo ""
read -p "ENTER FILE NAME: " fileName
echo "CREATING FILE NAME: $fileName"
sudo touch "$fileName"
echo "CHANGING OWNER OF $fileName TO $currentUser"
sudo chown "$currentUser":"$currentUser" "$fileName"
echo "CHANGING PERMISSIONS OF $fileName"
chmod 755 "$fileName"
echo "FILE $fileName IS IN $PWD"
ls -l "$fileName"; echo ""


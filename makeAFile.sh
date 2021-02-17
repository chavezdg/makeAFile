#!/usr/bin/env bash

# Create a file with less steps.
# Created by davidc
# Version 1.2
# Release: 2/17/2021

# Sometimes you want to retain any settings in your distro
# and you do not wish to disturb the nature of your environment.

currentUser=$( whoami )
releaseDate=$( date "+%D" )

function generalHeaderTemplate(){
 echo "# Created by $currentUser" >> "$fileName"
 echo "# Version 1" >> "$fileName"
 echo "# Release: $releaseDate" >> "$fileName"
}

echo ""
read -r -p "ENTER FILE NAME: " fileName
echo "CREATING FILE NAME: $fileName"
sudo touch "$fileName"
echo "CHANGING OWNER OF $fileName TO $currentUser"
sudo chown "$currentUser":"$currentUser" "$fileName"
echo "CHANGING PERMISSIONS OF $fileName"
chmod 755 "$fileName"
case $fileName in
 *".sh"*) echo '#/usr/bin/env bash' > "$fileName"
	  echo "" >> "$fileName"
	  echo "# BASH script $fileName" >> "$fileName"
	  generalHeaderTemplate
	  ;;
 *".py"*) echo '#/usr/bin/env python' > "$fileName"
	  echo "" >> "$fileName"
	  echo "# Python program $fileName" >> "$fileName"
	  generalHeaderTemplate
	  ;;
esac
echo "FILE $fileName IS IN $PWD"
ls -l "$fileName"; echo ""

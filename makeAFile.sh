#/usr/bin/env bash

davidc@mainm:~/tools$ cat makeAFile.sh 
#!/usr/bin/env bash

# Create a file with less steps.
# Created by davidc
# Version 1.1
# Release: 2/15/2021

# Sometimes you want to retain any settings in your distro
# and you do not wish to disturb the nature of your environment.
# Also to have a header template made with less typing.

currentUser=$( whoami )
releaseDate=$( date "+%D" )
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
          echo "# Created by $currentUser" >> "$fileName"
          echo "# Version 1" >> "$fileName"
          echo "# Release: $releaseDate" >> "$fileName"
	  ;;
esac
echo "FILE $fileName IS IN $PWD"
ls -l "$fileName"; echo ""

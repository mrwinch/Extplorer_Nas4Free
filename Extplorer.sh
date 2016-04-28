#!/bin/sh
Download_File="https://extplorer.net/attachments/download/68/eXtplorer_2.1.9.zip"
Extplorer_Version="2.1.9"
Install_Dir="/usr/var/local/www/Extplorer"
Confirm(){
  read -r -p "   Continue? [Y/n] " response
  case "$response" in
      [yY][eE][sS]|[yY]) 
                echo -e " Great! Moving on.."
                 ;;
      *)
                # Otherwise exit...
                echo " "
                echo -e "Stopping script.."
                echo " "
                exit
                ;;
  esac  
}
/bin/echo "This script will install Extplorer ver. $Extplorer_Version"
Confirm
echo -e "Creating installation directory..."
mkdir $Install_Dir
chown -R www:www $Install_Dir
echo -e "Downloading Extplorer..."
fetch -o "Extplorer.zip" $Download_File
tar xf "Extplorer.zip" -C $Install_Dir

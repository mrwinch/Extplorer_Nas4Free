#!/bin/sh
Download_File="https://extplorer.net/attachments/download/68/eXtplorer_2.1.9.zip"
Extplorer_Version="2.1.9"
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


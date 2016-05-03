#!/bin/sh
#************* Script's parameters *******************************************
Download_File="https://extplorer.net/attachments/download/68/eXtplorer_2.1.9.zip"
Extplorer_Version="2.1.9"
Install_Dir="/usr/local/www/Extplorer"
Extplorer_Add="https://raw.githubusercontent.com/mrwinch/Extplorer_Nas4Free/master/ExtPlorer.php"
Extplorer_Dest="/usr/local/www/Extplorer.php"
Extplorer_Cfg_Dest="/usr/local/www/Extplorer/config/.htusers.php"
Extplorer_Cfg="https://raw.githubusercontent.com/mrwinch/Extplorer_Nas4Free/master/.htusers.php"
GUI_Patch="https://raw.githubusercontent.com/mrwinch/Extplorer_Nas4Free/master/Gui_Patch.php"
Rt='\033[m'
Br='\033[1m'
#************* Script's routines *********************************************
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
#************* Let's start...
echo -e "${Br}***********************${Rt}"
echo -e "   This script will install Extplorer ver. ${Br}$Extplorer_Version${Rt}"
echo -e "${Br}***********************${Rt}"
Confirm
echo -e "Creating installation directory..."
mkdir $Install_Dir
chown -R www:www $Install_Dir
echo -e "Downloading Extplorer..."
fetch -o "Extplorer.zip" $Download_File
tar xf "Extplorer.zip" -C $Install_Dir
echo -e "Extplorer downloaded and extracted..."
echo -e "Removing Extplorer package..."
rm Extplorer.zip
echo -e "Now installing required packages..."
echo -e "Installing php56 ${Br}(1/10)${Rt}..."
pkg install -y php56
echo -e "Installing php56-extensions ${Br}(2/10)${Rt}..."
pkg install -y php56-extensions
echo -e "Installing php56-xmlrpc ${Br}(3/10)${Rt}..."
pkg install -y php56-xmlrpc
echo -e "Installing php56-gettext ${Br}(4/10)${Rt}..."
pkg install -y php56-gettext
echo -e "Installing php56-mcrypt ${Br}(5/10)${Rt}..."
pkg install -y php56-mcrypt
echo -e "Installing php56-mbstring ${Br}(6/10)${Rt}..."
pkg install -y php56-mbstring
echo -e "Installing php56-zip ${Br}(7/10)${Rt}..."
pkg install -y php56-zip
echo -e "Installing php56-gd ${Br}(8/10)${Rt}..."
pkg install -y php56-gd
echo -e "Installing php56-session ${Br}(9/10)${Rt}..."
pkg install -y php56-session
echo -e "Installing php56-zlib ${Br}(10/10)${Rt}..."
pkg install -y php56-zlib
echo -e "Updating Extplorer config..."
rm $Extplorer_Cfg_Dest
fetch -o $Extplorer_Cfg_Dest $Extplorer_Cfg
echo -e "Updating Web GUI..."
fetch -o $Extplorer_Dest $Extplorer_Add
chown www:www $Extplorer_Dest
echo -e "Patching Web GUI bar..."
fetch -o "GUI_Patch.php" $GUI_Patch
chmod a+x GUI_Patch.php
./Gui_Patch.php
echo -e "Installation complete: enjoy Extplorer $Extplorer_Version"

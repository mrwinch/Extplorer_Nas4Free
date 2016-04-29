#!/bin/sh
#sed -i "s/${search}/${replace}/g" metamorphosis.txt
Download_File="https://extplorer.net/attachments/download/68/eXtplorer_2.1.9.zip"
Extplorer_Version="2.1.9"
Install_Dir="/usr/local/www/Extplorer"
Extplorer_Add="https://raw.githubusercontent.com/mrwinch/Extplorer_Nas4Free/master/ExtPlorer.php"
Extplorer_Cfg="https://raw.githubusercontent.com/mrwinch/Extplorer_Nas4Free/master/.htusers.php"
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
echo -e "This script will install Extplorer ver. $Extplorer_Version"
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
echo -e "Installing php56 (1/10)..."
pkg install -y php56
echo -e "Installing php56-extensions (2/10)..."
pkg install -y php56-extensions
echo -e "Installing php56-xmlrpc (3/10)..."
pkg install -y php56-xmlrpc
echo -e "Installing php56-gettext (4/10)..."
pkg install -y php56-gettext
echo -e "Installing php56-mcrypt (5/10)..."
pkg install -y php56-mcrypt
echo -e "Installing php56-mbstring (6/10)..."
pkg install -y php56-mbstring
echo -e "Installing php56-zip (7/10)..."
pkg install -y php56-zip
echo -e "Installing php56-gd (8/10)..."
pkg install -y php56-gd
echo -e "Installing php56-session (9/10)..."
pkg install -y php56-session
echo -e "Installing php56-zlib (10/10)..."
pkg install -y php56-zlib
echo -e "Updating Web GUI..."
fetch -o "usr/local/www/Extplorer.php" $Extplorer_Add
chown www:www $Extplorer_Add
rm "usr/local/www/Extplorer/config/.htusers.php"
fetch -o "usr/local/www/Extplorer/config/.htusers.php" $Extplorer_Cfg

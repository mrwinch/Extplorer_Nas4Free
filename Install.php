#!/usr/local/bin/php -q
<?php
//Parameters...
$Pkg_Need = array("php56","php56-extensions","php56-xmlrpc","php56-gettext",
                  "php56-mcrypt","php56-mbstring","php56-zip","php56-gd","php56-session","php56-zlib");
$Extplorer_Version="2.1.9";
$Install_Dir="/usr/local/www/Extplorer";
$Download_File="https://extplorer.net/attachments/download/68/eXtplorer_2.1.9.zip";
$HL="\033[m";
$Nr="\033[1m";
//Main script...
echo("##################################\n");
echo("  This script will install Extplorer version $HL $Extplorer_Version $Nr\n");
echo("##################################\n");
echo("Creating installation directory...\n");
if(mkdir($Install_Dir)==false)
  exit("Error creating installation directory: exiting...\n");
if(chown($Install_Dir,"www:www"))
  exit("Error changing directory owner: exiting...\n");
echo("Downloading Extplorer file...\n")
$cmd = "fetch -o Extplorer.zip $Download_File";
exec($cmd);
$cmd = "tar xf Extplorer.zip -C $Install_Dir"
exec($cmd);
echo("Removing Extplorer package...\n");
if(unlink("Extplorer.zip")==false)
  exit("Error removing Extplorer package...\n");
echo("Installing required package...\n");
$Cnt = 1;
foreach($Pkg_Need as $Pkg){
  echo("Installing $HL $Pkg (".$Cnt."/".count($Pkg_Need).")$Nr...\n");
  $Cmd = "pkg install -y $Pkg";
  exec($Cmd);
}
?>

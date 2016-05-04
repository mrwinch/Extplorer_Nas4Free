#!/usr/local/bin/php -q
<?php
$Pkg_Need = array("php56","php56-extensions","php56-xmlrpc","php56-gettext",
                  "php56-mcrypt","php56-mbstring","php56-zip","php56-gd","php56-session","php56-zlib");
$Extplorer_Version="2.1.9";
$Install_Dir="/usr/local/www/Extplorer";
echo("##################################\n");
echo("  This script will install Extplorer version $Extplorer_Version\n");
echo("##################################\n");
echo("Creating installation directory...\n");
mkdir($Install_Dir);
chown($Install_Dir,"www:www");
?>

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
Pkg_Installer();
CFG_Updater();
//Function
function Pkg_Installer(){
  $Cnt = 1;
  echo("Installing required package...\n");  
    foreach($Pkg_Need as $Pkg){
      echo("Installing $HL $Pkg (".$Cnt."/".count($Pkg_Need).")$Nr...\n");
      $Cmd = "pkg install -y $Pkg";
      exec($Cmd);
      $Cnt = $Cnt + 1;
    }
}
function CFG_Updater(){
  $Cfg="/usr/local/www/Extplorer/config/.htusers.php";
  $Cfg_Dest="/usr/local/www/Extplorer/config/.htusers_old.php";
  if(rename($Cfg,$Cfg_Dest) == false)
    exit("Error moving original configuration...\n");
  $File = fopen($Cfg,"w");
  if($File == false){
    rename($Cfg_Dest,$Cfg)
    exit("Errore creating new configuration...\n");
  }
	$Data =	"<?php 
	// ensure this file is being included by a parent file
	if( !defined( '_JEXEC' ) && !defined( '_VALID_MOS' ) ) die( 'Restricted access' );
	\$GLOBALS[\"users\"]=array(
	array('admin','\$2a\$08\$IJQWvN7KRijdhHAnVMfGouyIgEe3c86ZZuEQXY0pSEWLOfjaY16XW','/','http://localhost','1','','7',1),
	); 
	?>";
  fwrite($File,$Data);
  fclose($File);
}
?>

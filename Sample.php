#!/usr/local/bin/php -q
<?php
$Src = fopen("/usr/local/www/fbegin.new", "r") or die("Unable to open file!");
$Dest = fopen("Res.inc","w");
if($Src){
	if($Dest){
		while (($line = fgets($Src)) !== false) {
			if(strrpos($line,"system_filemanager")!=false){
				$Copy = $line;
				$Copy = str_replace("File Manager","Extplorer",$Copy);
				$Copy = str_replace("/quixplorer/system_filemanager.php","/Extplorer.php",$Copy);				
				fwrite($Dest,$Copy);				
			}
			fwrite($Dest,$line);			
	    }
	}
}
fclose($Src);
fclose($Dest);
?>

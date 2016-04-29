<?php
require("auth.inc");
require("guiconfig.inc");
$pgtitle = array(gettext("Advanced"), gettext("Extplorer"));
?>
<?php include("fbegin.inc");?>
<script>
	function FrameLoad(){
		var F=document.getElementById("pagefooter");
		var H=document.getElementById("header");
		var HN=document.getElementById("headernavbar");	
		var Fr=document.getElementById("frame");		
		Fr.style.height=(F.offsetTop-H.clientHeight-130-HN.clientHeight)+"px";
	}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="table">
	<tr>
		<td class="tabcont">
			<iframe width="100%" src="/Extplorer/index.php" onload="FrameLoad()" id="frame"></iframe>
		</td>
	</tr>
</table>
<?php include("fend.inc");?>

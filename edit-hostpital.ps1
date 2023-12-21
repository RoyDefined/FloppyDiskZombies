. "$PSScriptRoot\scripts\edit-project.ps1"

$wad = "ZombieHordeMaps/hospital.wad";
$map = "FDG42";
$configuration = "zandronum_DoomUDMF.cfg";
	
try
{
	editProject -wad $wad -map $map -configuration $configuration;
}
catch
{
	$message = $_.Exception.Message;
	Write-Host -ForegroundColor Red "Editing map failed: $message"
	Read-Host -Prompt "Press any key to exit"
	Exit
}
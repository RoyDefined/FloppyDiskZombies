. "$PSScriptRoot\scripts\play-project.ps1"

$map = "test";
$gameMode = "teamlms";
$sourceFolder = "build";
$extraParameters = "+sv_noteamselect true +sv_keepteams true +sv_norespawninvul true";
$logsPath = "logs";

try
{
	playProject -map $map -sourceFolder $sourceFolder -logOutput $logsPath -gameMode $gameMode -extraParameters $extraParameters
}
catch
{
	$message = $_.Exception.Message;
	Write-Host -ForegroundColor Red "Playing project failed: $message"
	Read-Host -Prompt "Press any key to exit"
	Exit
}
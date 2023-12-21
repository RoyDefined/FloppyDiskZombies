. "$PSScriptRoot\scripts\play-project.ps1"

$map = "test";
$gameMode = "teamlms";
$sourceFolder = "build";
$extraParameters = "";
$config = "host.cfg";
$logsPath = "logs";

try
{
	playProject -map $map -sourceFolder $sourceFolder -logOutput $logsPath -gameMode $gameMode -online $true -extraParameters $extraParameters -config $config;
}
catch
{
	$message = $_.Exception.Message;
	Write-Host -ForegroundColor Red "Playing project failed: $message"
	Read-Host -Prompt "Press any key to exit"
	Exit
}
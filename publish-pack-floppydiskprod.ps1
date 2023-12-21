. "$PSScriptRoot\scripts\publish-project.ps1"

$coreProjectPath = "ZombieHorde";
$mapsProjectPath = "ZombieHordeMaps";
$resourcesProjectPath = "ZombieHordeResources";
$logsPath = "logs";
$engine = "zandronum";
$buildPath = "build";

try
{
	invokePublishTool -projectPath $coreProjectPath -packToOutput $buildPath -logOutput $logsPath -todoAt $logsPath -decorateSummaryAt $logsPath -compileWith "gdccacc" -noWarnForwardReferences $true -defines "floppydisk" -engine $engine -tempProject $true -publicAcs $true -removeAcs $true -removeUnrelated $true -packDecorate $true -removeEmpty $true;
	invokePublishTool -projectPath $mapsProjectPath -packToOutput $buildPath -logOutput $logsPath -tempProject $true -removeUnrelated $true -removeEmpty $true;
	invokePublishTool -projectPath $resourcesProjectPath -packToOutput $buildPath -logOutput $logsPath -todoAt $logsPath -decorateSummaryAt $logsPath -tempProject $true -removeUnrelated $true -packDecorate $true -removeEmpty $true;
}
catch
{
	$message = $_.Exception.Message;
	Write-Host -ForegroundColor Red "Tool invokation failed: $message"
	Read-Host -Prompt "Press any key to exit"
	Exit
}
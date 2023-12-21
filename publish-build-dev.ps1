. "$PSScriptRoot\scripts\publish-project.ps1"

$coreProjectPath = "ZombieHorde";
$resourcesProjectPath = "ZombieHordeResources";
$logsPath = "logs";
$engine = "zandronum";

try
{
	invokePublishTool -projectPath $coreProjectPath -logOutput $logsPath -todoAt $logsPath -decorateSummaryAt $logsPath -compileWith "gdccacc" -noWarnForwardReferences $true -defines "dev" -engine $engine -publicAcs $true;
	invokePublishTool -projectPath $resourcesProjectPath -logOutput $logsPath -todoAt $logsPath -decorateSummaryAt $logsPath;
}
catch
{
	$message = $_.Exception.Message;
	Write-Host -ForegroundColor Red "Tool invokation failed: $message"
	Read-Host -Prompt "Press any key to exit"
	Exit
}

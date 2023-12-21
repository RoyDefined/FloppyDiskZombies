. "$PSScriptRoot\common.ps1"

function playProject()
{
    Param(
        [parameter(Mandatory=$false)][string] $map,
		[parameter(Mandatory=$false)][string] $sourceFolder,
		[parameter(Mandatory=$false)][string] $logOutput,
		[parameter(Mandatory=$false)][string] $gameMode,
		[parameter(Mandatory=$false)][string] $config,
		[parameter(Mandatory=$false)][boolean] $online,
		[parameter(Mandatory=$false)][string[]] $extraParameters)
	
	try
	{
		# The absolute url of the root of the project.
		$rootPath = (Get-Item .).FullName;
		
		# The absolute url of the location of the scripts folder.
		$scriptsPath = Join-Path -Path $rootPath -ChildPath "scripts";
		
		# The absolute url of the location of the source folder.
		$baseSourcePath = Join-Path -Path $rootPath -ChildPath "src";
		if ($sourceFolder) {
			$baseSourcePath = Join-Path -Path $rootPath -ChildPath $sourceFolder;
		}
			
		# Determine the projects to run.
		# Two loops, one gets directories, and one gets files.
		# It could be one, but perhaps it gets more functionality in the future.
		$joinedProjectResources = @()
		foreach($folder in Get-ChildItem -Path $baseSourcePath -Directory)
		{
			$projectDirPath = Join-Path -Path $baseSourcePath -ChildPath $folder;
			$projectDirResource = "-file `"$projectDirPath`""
			$joinedProjectResources += $projectDirResource
		}
		foreach($folder in Get-ChildItem -Path $baseSourcePath -File)
		{
			$projectFilePath = Join-Path -Path $baseSourcePath -ChildPath $folder;
			$projectFileResource = "-file `"$projectFilePath`""
			$joinedProjectResources += $projectFileResource
		}

		# Determine the location of the engine and DOOM2.wad
		$engineExecutable = getFileFromShortcut -rootFolder $scriptsPath -shortcutFolder "Engine.lnk" -fileName "Zandronum.exe";
		$doom2file = getFileFromShortcut -rootFolder $scriptsPath -shortcutFolder "IWads.lnk" -fileName "DOOM2.wad";

		# Detemine wad and arguments to load.
		$doom2wadParameter = "-iwad `"$doom2file`""
		
		# Set log file outputs.
		if (!$logOutput) {
			$logOutput = "logs";
		}
		$logOutput = Join-Path -Path $rootPath -ChildPath (Join-Path -Path $logOutput -ChildPath "log");
		
		if ($gameMode) {
			$gameMode = "+$gameMode true"
		}
		
		$onlineString = "";
		if ($online) {
			$onlineString = "-host -netmode 1";
		}
		
		$mapString = "";
		if ($map) {
			$mapString = "+map $map";
		}
		
		# Add config if specified
		$configPath = "";
		if ($config) {
			$configPath = "+exec " + (Join-Path -Path $rootPath -ChildPath $config);
		}
		
		# Join the extra parameters that were passed.
		$joinedParameters = @()
		foreach ($string in $extraParameters) {
			$joinedParameters += " $string";
		}

		$argumentList = "$doom2wadParameter $joinedProjectResources -skill 4 -stdout $gameMode +logfile `"$logOutput`" $mapString $onlineString $joinedParameters $configPath";
		
		#Write-Host "Final argumentList: $argumentList";
		#Read-Host -Prompt "Press any key to continue"

		$null = New-Item -ItemType Directory -Force -Path (Split-Path -Path $logOutput);

		# Load UDB with the arguments.
		Start-Process -FilePath $engineExecutable -ArgumentList $argumentList;
	}
	catch
	{
		# Only log the line, the main script should catch and handle the rest.
		$line = $_.InvocationInfo.ScriptLineNumber
		Write-Host -ForegroundColor Red "Execution failed at line $line."
		throw;
	}
}
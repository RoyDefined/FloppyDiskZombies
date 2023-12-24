


<!-- Anchor for the "back to top" links -->
<a id="readme-top"></a>

<!-- Project logo -->
<br />
<div align="center">
  <h1>Floppy Disk Zombies</h1>
</div>

This is the public release of Floppy Disk Zombies. Floppy Disk Zombies is a project that was build for Floppy Disk Mod by Br0leg. This repository contains the base assets used to develop the game mode, including source code. Do not use this project for anything but educational purposes or if you are interested in how parts of the game mode works. This project is made for Floppy Disk Mod, nothing else.

## Usage
This is a list of prerequisites that must be met in order to properly work with this project.
- An installation of the latest Zandronum 3.2 release.
- An installation of Ultimate Doombuilder.
- A valid installation of the `GDCC` compiler inside `scripts/gdcc`.
	- GDCC can be found [here](https://github.com/DavidPH/GDCC/tags). Windows builds found [here](https://www.dropbox.com/sh/5wae0ro7vuesud7/AADSyNu4S89Gc2RJc0PdS3qHa?dl=0).
- Ensure the `scripts` folder has the following:
	- A shortcut folder called `Engine` which points to your Zandronum installation.
	- A shortcut folder called `IWads` which points to your folder containing the IWADs.
	- A shortcut folder called `UDB` which points to your folder containing the Ultimate Doombuilder executable.
- Ensure the `scripts/DoomerPublish` folder has a valid installation of the tool. Installations can be found [here](https://github.com/RoyDefined/DoomerPublish/tags). This project requires atleast version `1.1.0`.

## Initial setup
Make sure the following steps are taken:
1. To support Zandronum functions, make sure the GDCC compiler replaces the following specials in `scripts\gdcc\lib\inc\ACS\zspecial.acs`
   - `int 145:Player_SetTeam(1)` -> `int 145:Player_SetTeam(1, 2)`
2. To support Zandronum functions, make sure the GDCC compiler contains the following specials in `scripts\gdcc\lib\inc\ACS\zspecial.acs`
   - `int -155:SetGameplaySetting(2, str, int)`
3. Compile the project once.


## Building and publishing
To build locally, invoke the `publish-build-dev.ps1` file.
To pack locally, invoke the `publish-pack-dev.ps1` file.
To pack for usage in Floppy Disk Mod, invoke the `publish-pack-floppydiskprod.ps1` file.

To play locally offline, either:
 - Invoke `publish-build-dev.ps1`, then invoke `play-offline-dir-test.ps1`.
 - Invoke `publish-pack-dev.ps1`, then invoke `play-offline-build-test.ps1`.
 
To play locally online, invoke `publish-pack-dev.ps1`, then invoke either `play-online-build-nobots-test.ps1` to set up a server with no bots, or invoke `play-online-build-test.ps1` to set up a server with 63 other bots.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
# pseudoscience-modpack

## Installation (3 Methods)
> [!IMPORTANT]
> This pack requires Java 17, which can be installed from https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html, ensure you have it selected in your launcher.

### #1 (Vanilla Launcher)
0. Ensure you have [the latest Fabric for 1.20.1](https://fabricmc.net/use/installer/) installed
1. Download and execute this script for: 
	- Windows: https://github.com/sapientes/pseudoscience-modpack/raw/v2/include/Launcher/install.ps1
	- Mac: https://github.com/sapientes/pseudoscience-modpack/raw/v2/include/Launcher/install.command
#### #2 (Prism Launcher)
> [!NOTE]
> This doesn't work with MultiMC.
1. Open "Add Instance," navigate to Import & input [the direct download](https://github.com/sapientes/pseudoscience-modpack/releases/download/v2.0.0/Pseudoscience.Iteration.II.Prism.zip)
#### #3 (Curseforge)
1. [Download the Curseforge .zip modpack](https://github.com/sapientes/pseudoscience-modpack/releases/download/v2.0.0/Pseudoscience.Iteration.II.Curseforge.zip).
2. In the vanilla launcher, under the profile CF created go to settings => advanced => JVM arguments  
   Go to the very right with your arrow keys and enter `-javaagent:unsup.jar`,add a space between the last argument and this one.
![](include/jvm-args.png)

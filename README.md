# pseudoscience-modpack

## Installation (3 Methods)
> [!IMPORTANT]
> This pack requires Java 17, which can be installed from https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html, ensure you have it selected in your launcher.

### #1 (Vanilla Launcher)
0. Download the latest Forge https://files.minecraftforge.net/net/minecraftforge/forge/index_1.20.1.html
1. Download and execute this script for: 
- Windows: https://github.com/nyxmc/pseudoscience-modpack/raw/v1.1/include/Launcher/install.ps1
- Mac: https://github.com/nyxmc/pseudoscience-modpack/raw/v1.1/include/Launcher/install.command
#### #2 (Prism Launcher)
> [!NOTE]
> This doesn't work with MultiMC.
1. Open "Add Instance," navigate to Import & input the direct download: https://github.com/nyxmc/pseudoscience-modpack/releases/download/v1.1.2/Pseudoscience.SMP.Modpack.Iteration.1.Prism.zip
#### #3 (Curseforge)
1. Download the Curseforge .zip modpack.
2. In the vanilla launcher, under the profile CF created go to settings => advanced => JVM arguments  
   Go to the very right with your arrow keys and enter `-javaagent:unsup.jar`,add a space between the last argument and this one.
![](include/jvm-args.png)

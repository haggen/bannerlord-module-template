# ExampleModule

> Example of a module for Mount & Blade II Bannerlord.

<!-- Delete-me after read -->

# Getting Started

This a starting point for developing a module (mod) for Mount & Blade II Bannerlord with MSBuild, .NET SDK and VSCode but **without Visual Studio**. If you're new to software development in general I suggest you follow a more straightforward guide, this one's a bit more involved.

From a clean Windows 10 installation you'll need:

1. [Git](https://git-scm.com/download/win)
2. [VSCode](https://code.visualstudio.com/download)
3. [Build Tools for Visual Studio](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16)

Follow the links to download the software, and install everything.

On the Visual Studio Installer window you should select **Individual Components** and then pick these:

- .NET Core SDK
- .NET Framework 4.7.2 targeting pack

Once everything is installed, launch VSCode, install the most popular C# extension and follow any instructions.

Finally clone this repository somewhere, open the folder in VSCode, replace every instance of the following, and you're good to go. Remember to rename the files as well.

- `ExampleModule` with the actual module name.
- `YourName` with, you guessed it, your name.

Here's a rundown of the repository:

- The `ExampleModule.csproj` is the entrypoint of the building process and holds all the details of your project.
- The `env.xml` file holds any build configuration particular to your environment, like where the game's installed. It doesn't exist by default though, you have to create it from `env.example.xml`.
- The module's files go into the `Module` directory. Everything there will be copied as-is to the final distributable folder, with just one exception...
- The `SubModule.xml` will have macros, like `$(Name)` and `$(Version)` replaced with their actual value by the `PostBuild.ps1` script.
- The `ExampleModuleSubModule.cs` is the entrypoint of your source code. The resulting DLL will also be copied into the final distributable folder by `PostBuild.ps1` script.
- You build the project using the [MSBuild CLI](https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-command-line-reference?view=vs-2019). See the [Development section](#Development) below.

<!-- /Delete-me after read -->

# Installation

Download the latest release from [Releases](releases) and extract into the `Modules` directory inside your game installation folder. e.g. `C:\Steam\steamapps\common\Mount & Blade II Bannerlord`.

Open the launcher, enable the module and click Play.

# Usage

...

# Development

Copy `env.example.xml` to `env.xml` and edit the settings according to your environment. Watch out for the ampersand in XML files.

Run `dotnet build -c Debug|Release` to debug/build your module.

The `PostBuild.ps1` script will execute on successful builds, and assemble the final distributable folder of the module inside the `.\dist` directory.

## Debug

When you build in `Debug` configuration the `PostBuild.ps1` script will also copy the module folder in place and launch the game loading a bare minimum set of modules for a quick test run.

## Release

When you build in `Release` configuration the `PostBuild.ps1` script will also produce an archive in the `.\dist` directory, specific to the version being built. That's what you upload to the internet.

Remember to bump the version inside the `csproj` file, tag the commit--like this `v1.0.0`--and rebuild.

# Legal

MIT © 2020 YourName

This modification is not created by, affiliated with or sponsored by TaleWorlds Entertainment or its affiliates. The Mount & Blade II Bannerlord API and related logos are intelectual property of TaleWorlds Entertainment. All rights reserved.
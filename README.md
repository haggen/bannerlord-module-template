# ExampleModule

> Example of a module for Mount & Blade II Bannerlord.

<!-- Delete-me after read -->

# Getting Started

This a starting point for developing a module (mod) for Mount & Blade II Bannerlord with GitHub, MSBuild, .NET SDK and VSCode but **without Visual Studio**. If you're new to software development in general I suggest you follow a more straight forward guide, this one's a bit more involved.

From a clean Windows 10 installation you'll need:

1. [Git](https://git-scm.com/download/win)
2. [VSCode](https://code.visualstudio.com/download)
3. [Build Tools for Visual Studio](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16)

Follow the links to download the software, and install everything.

On the Visual Studio Installer window you should select **Individual Components** and then pick these:

- .NET Core SDK
- .NET Framework 4.7.2 targeting pack

Once everything is installed, launch VSCode, install the most popular C# extension and follow any instructions.

Finally clone this repository somewhere, open the folder in VSCode and replace every instance of the following, and you're good to go. Remember to rename the files as well.

- `ExampleModule` with the actual module name.
- `YourName` with, you guessed it, your name.

Here's a rundown of the repository:

- The `ExampleModule.csproj` is the entrypoint of the building process and holds all the details of your project.
- The `env.xml` file holds any build configuration particular to your environment, like where the game's installed. It doesn't exist by default though, you have to create it from `env.example.xml`.
- The module's files go into the `Module` directory. Everything there will be copied as-is to the final distributable folder, with just one exception...
- The `SubModule.xml` will have macros, like `$(Name)` and `$(Version)` replaced with their actual value by the `PostBuild.ps1` script.
- The `ExampleModuleSubModule.cs` is the entrypoint of your source code. The resulting DLL will also be copied into the final distributable folder by `PostBuild.ps1` script.
- You build the project using the [MSBuild CLI](https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-command-line-reference?view=vs-2019). I suggest using PowerShell.
- The `.github` directory holds a workflow configuration to automate building and releasing your module using [GitHub Actions](https://github.com/features/actions).

<!-- /Delete-me after read -->

# Installation

Download the latest release from [Releases](releases) and extract into the `Modules` directory inside your game installation folder. e.g. `C:\Steam\steamapps\common\Mount & Blade II Bannerlord`.

Open the launcher, enable the module and click Play.

# Usage

...

# Development

Copy `env.example.xml` to `env.xml` and edit the settings according to your environment. Watch out for the ampersand in XML files.

Run `dotnet build -c Debug|Release` to debug/build your module.

The `PostBuild.ps1` script will auto execute on successful builds, and;

1. Assemble the `dist` directory with the module folder inside ready for distribution.
2. On `Debug` configuration it'll also install the module and run the game for a test drive.

To release a new version bump the numbers in the `csproj` file, tag the commit like `v1.0.0`, and push to GitHub.

# Legal

MIT © 2020 YourName

This modification is not created by, affiliated with or sponsored by TaleWorlds Entertainment or its affiliates. The Mount & Blade II Bannerlord API and related logos are intelectual property of TaleWorlds Entertainment. All rights reserved.
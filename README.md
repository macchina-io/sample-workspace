# sample-workspace

A sample workspace for a project based on macchina.io IoT Edge Device SDK.
This can be used as a template for your own projects.
The workspace includes the macchina.io IoT Edge SDK sources via a Git submodule.
The workspace includes one sample project, a simple implementation of a
temperature sensor based on the Linux Thermal subsystem (`/sys/class/thermal`).

## Visual Studio Code Integration

Configuration files for Visual Studio Code are included in the workspace.
The following Visual Studio Code extensions should be installed:
  - C/C++ (required)
  - C++ Intellisense (highly recommended)
  - CodeLLDB (required on macOS for debugging)

The following tasks have been defined in [tasks.json](.vscode/tasks.json):
  - *Build all*: Builds the entire workspace using the global `Makefile`.
  - *Clean all*: Cleans the entire workspace.
  - *Build single project*: Builds a single project. The project's `Makefile` must be selected.
  - *Clean single project*: Cleans a single project. The project's `Makefile` must be selected.
  - *RemoteGen*: Runs the Remoting code generator. A `RemoteGen.xml` configuration file must be selected.

Launch configurations for debugging via gdb (on Linux) and lldb (on macOS) are also included.

## Getting Started

  1. Clone the repository, including the macchina.io submodule.
     Either do a recursive clone, or a normal clone followed by
	 a `git submodule update`.
  2. Build macchina.io.
  3. Open the sample-workspace directory in Visual Studio Code.

# Building macchina.io

The following instruction show how to build macchina.io for the host system.
For cross-compiling macchina.io, please refer to the 
[macchina.io documentation](https://macchina.io/docs).

```
$ git clone --recursive https://github.com/macchina-io/sample-workspace.git
$ cd sample-workspace
$ make -s -j8 -C macchina.io 
```

# Building the Sample Workspace 

## Building from the Command-Line

The code in the sample workspace can be built via the global [`Makefile`](Makefile).

First, set up the macchina.io build environment by sourcing the [env.bash](env.bash)
or [env.zsh](env.zsh) script, depending on the shell you're using. This will
define the following environment variables:

  - `PROJECT_BASE`: The root directory of the project workspace, set to current directory.
  - `MACCHINA_BASE`: The root directory of the macchina.io source tree.
  - `POCO_BASE`: The root directory of the POCO C++ Libraries source tree within macchina.io.
  - `MACCHINA_VERSION`: The current macchina.io version number (read from `macchina.io/VERSION).
  - `LD_LIBRARY_PATH` (Linux) and `DYLD_LIBRARY_PATH` (macOS): Shared library search paths.

  After setting up the environment, the project can be build with GNU Make:

```
$ . env.bash
$ make -s -j8
```

## Building in Visual Studio Code

Select *Terminal > Run Build Task* from the menu bar.

# Running macchina.io

To run the release build from a Linux (x86_64) command line shell:

```
$ macchina.io/server/bin/Linux/x86_64/macchina --config=etc/macchina.properties
```

If you're on am ARM-based Linux system, e.g. a Raspberry Pi, the path to the executable must be
slightly changed:

```
$ macchina.io/server/bin/Linux/armv7l/macchina --config=etc/macchina.properties
```

On macOS, change the command to:

```
$ macchina.io/server/bin/Darwin/x86_64/macchina --config=etc/macchina.properties
```

# Debugging Your Application

To debug your application in Visual Studio Code, a [launch.json](.vscode/launch.json) file is
provided that will set up the necessary environment variables and launch the debug
build of macchina.io with the configuration file in the `etc` directory.
To start debugging, select *Run > Start Debugging* from the menu bar.

On macOS, the [CodeLLDB](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb)
extension is required for debugging to work.

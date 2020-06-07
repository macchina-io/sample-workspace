# sample-workspace

A sample workspace for a project based on macchina.io IoT Edge Device SDK.
This can be used as a template for your own projects.
The workspace includes the macchina.io IoT Edge SDK sources via a Git submodule.
The workspace includes one sample project, a simple implementation of a
temperature sensor based on the Linux Thermal subsystem (`/sys/class/thermal`).

## Visual Studio Code

Configuration files for Visual Studio Code are included in the workspace.
The following Visual Studio Code extensions should be installed:
  - C/C++ (required)
  - C++ Intellisense (highly recommended)
  - CodeLLDB (required on macOS for debugging)

The following tasks have been defined in [tasks.json](.vscode/tasks.json):
  - Build all: Builds the entire workspace using the global Makefile.
  - Clean all: Cleans the entire workspace.
  - Build single project: Builds a single project. The project's Makefile must be selected.
  - Clean single project: Cleans a single project. The project's Makefile must be selected.
  - RemoteGen: Runs the Remoting code generator. A RemoteGen.xml configuration file must be selected.

Launch configurations for debugging via gdb (on Linux) and lldb (on macOS) are also included.

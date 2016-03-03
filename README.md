# Curses.NET
Curses.NET is a .NET interface to the Curses family of terminal user interface libraries. The goal of this project is to bring the world of curses/ncurses terminal user interface programming to .NET applications. Curses.NET is based on the [PDCurses](https://github.com/wmcbrine/PDCurses) library which is a curses implementation for environments that don't fit the termcap/terminfo model. Specifically Curses.NET uses the [Win32a](https://github.com/Bill-Gray/PDCurses/) fork of PDCurses by Bill Gray.

##Supported Platforms
Only .NET 4.5+ on Windows works right now but the goal is for the library to be available on Windows and Linux and to build under .NET 4.x, Mono, and the new .NET Core 1.0.

##Status
This project is in the early stages of development but will be updated rapidly. Right now the focus is on translating the semantics of the lower-level C language curses functions to a higher-level appropriate for C#. All the native curses functions from the _curses namespace should in theory work but I've only tested the few implemented in the high-level interface.

##Building

Required:

1) Visual Studio 2015 Community Edition.

2) SWIG 3 Available here: http://www.swig.org/download.html The release tarball has a pre-built executable for Windows. The swig executable must be on the user or system PATH when building.

From VS 2015 set the Solution Platform to x86 and then Build Solution. From the VS 2015 command-line change to the solution directory and run: 

msbuild Curses.NET.sln /property:Platform=x86 

Once the build succeeds the assembly and native library DLLs will be in $(SolutionDir)\Cursesdotnet\Debug.

Cursesdotnet.Tests contains tests of the currently implemented functionality.

##Usage
Reference the Cursesdotnet.dll assembly in your project and place the native _curses.dll in the same folder as the binary outputs from your project.

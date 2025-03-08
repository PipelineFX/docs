---
sidebar_position: 1
---

# Development Options
There are a number of different ways to go about doing tweaks and custom
development with Qube. Here is a list of the main ones for Qube.  

**SimpleCmd**  This python-based framework is a simple way to way to easily
create submission dialog interfaces that generate a standard commandline call.
It is installed dynamically in the simplecmds/ directory of the QubeGUI and
requires no additional Worker installation.  

**Custom jobtypes (backend)**  Instead of using the commandline on the
backend, one can write jobtype scripts to control what is executed when a job
runs on a Worker. There are 3 APIs available. It is recommended to choose
scripting over C++ for ease of updating.

* Perl
* Python
* C++

**QubeGUI Preferences and commandline**  The QubeGUI can be launched via
the commandline and has a number of commandline arguments that can be set. The
Preferences can be used to further configure it.  

**QubeGUI enhancements**  The entire QubeGUI is written in python and comes
in a compiled form for simplicity. The source python scripts are also provided
and the QubeGUI can also be run directly via python. It uses all standard
python libraries and the qb python module. Since full access to the python
code is available, the QubeGUI can also be tailored for a studio past the
exposed commandline arguments and preferences.


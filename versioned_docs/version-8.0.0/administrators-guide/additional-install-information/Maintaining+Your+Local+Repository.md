---
sidebar_position: 8
---

# Maintaining Your Local Repository

## Creating the repository


## Moving or copying the repository
The Qube Installer creates and/or uses a local software repository each time it is run. That repository - which is chosen by the user on the "Manifest Selection" page - contains, at the very least, a .qmf (Qube ManiFest) file.  It may also contain one or more .qks (Qube KickStart) file(s) and/or OS-specific directories (named after their respective OS).

When moving/copying the repository to another location, it is essential that the .qmf goes with it, as the .qmf is the heart of the repository.  The OS-specific directories and the .qks files are optional, though they must remain in the same location relative to the .qmf. For the vast majority of users, this means everything is in the same directory - the .qmf, the .qks(s), and the OS-specific directories.  The location of the installer executable is unimportant.

If the OS-specific directory for the current computer does not exist, it will be created and populated by the installer at runtime on an as-needed basis.  If the directories are to be populated, the current computer must have internet access.

:::tip
The .qmf and .qks files are OS independent. The installer executable itself, however, must be downloaded for each OS on which it is to be run.
:::

## Cleaning the repository
In each OS-specific directory, there exists installation files for each Qube component.  On Windows, this means several .msi files, on macOS there will be several .dmg files, and on Linux there will be several .rpms.

Each time you install/upgrade Qube, a new qmf file, one or more new qks files, a set of installation files will be downloaded to those directories and will accumulate over time.

After an upgrade, you may delete all files related to the old version.  If you delete files related to the current Qube version, they will be downloaded automatically the next time they are needed.

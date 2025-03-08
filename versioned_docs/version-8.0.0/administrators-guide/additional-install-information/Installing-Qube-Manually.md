---
sidebar_position: 10 
---

# Installing Qube! Manually

:::info
If both of the following conditions are true, you will need to take the extra steps outlined in Transferring data from MySQL to PostgreSQL when upgrading the supervisor:
- You are upgrading the supervisor from pre-7.0 to Qube 7 (for example from 6.10-0a to 7.0-0)
- You wish to bring your Qube 6 job data forward into Qube 7
:::

It is generally easier and quicker to use the new Qube! Installer for all installs and upgrades. However, if you have a requirement for manual installs, you can follow these steps. For all of the software components, you will need to log in as an Administrator account (Windows), log in as root or use sudo (Linux) or know the Administrator password (macOS).

You should install the Supervisor first, and then any Workers and/or Clients. It is better to have the Supervisor waiting for Workers to show up, than the other way around.

## Prerequisites
### Linux
Linux requires the following be installed on the Supervisor and Worker machines

The supervisor requires the following packages to be present:
- python3
- xinetd

We suggest installing all the required packages with 'yum' on CentOS/RHEL Linux systems, and 'apt' on Ubuntu.

### Windows / macOS
#### Python
New in 7.5, Python3 (3.6, 3.7, or 3.8) is required for the installation process, as well as for the supervisor. For the workers, it is also required if running jobtypes that are python controlled.
Linux and macOS may not come installed with python3 (CentOS/RHEL 7.x, macOS). If not, for RHEL/CentOS, 'sudo yum install python3' should do the trick. For Windows, free Python distributions can be downloaded from www.python.org.

On a new macOS 10.15 system, you will need to open a terminal, and type "python3" and hit enter. That will run a "stub" script and allow you to download and install python3.

#### Perl
Perl is required only for the Workers running the Jobtypes as most are controlled by Perl (with the exception of the cmdline and cmdrange).
Typically, Linux and macOS come with Perl already installed. If not, yum should be able to install it. On Windows, free Perl distributions can be downloaded from www.perl.org. We recommend Strawberry Perl. On Windows, Qube! is compatible with Perl 5.26.

## Download the Components
- Top: http://repo.pipelinefx.com/downloads/pub/
- Core/Supervisor/Worker: http://repo.pipelinefx.com/downloads/pub/qube/current/
- Supervisor Proxy (new for 7.5-0): http://repo.pipelinefx.com/downloads/pub/qube-supervisorProxy/current/
- Qube UI (new for 7.5-0): http://repo.pipelinefx.com/downloads/pub/QubeUI/current/
- Jobtypes: http://repo.pipelinefx.com/downloads/pub/jobtypes/current/
- QubeLocker: http://repo.pipelinefx.com/downloads/pub/qubeLocker/current/

## Linux

### Installing the Supervisor
- Disable selinux and firewall using "setup" or available initial boot setup utility
- *[optional]* Mount required network locations using /etc/fstab
- Use package installation manager such as yum or apt-get to install "python3" and "xinetd"
- Download the required packages for your distribution qube-core, qube-supervisor.  Optionally download QubeUI. 
- Install qube-core package with the command: $ rpm -ivh qube-core-\*.rpm
- Install qube-supervisor package with the command: $ rpm -ivh qube-supervisor-\*.rpm
- *[optional]* Using your favorite editor, edit /etc/bashrc to contain the lines :


```
export QBDIR=/usr/local/pfx/qube
export PATH=$PATH:$QBDIR/bin:$QBDIR/sbin
```

### Installing the Worker
- Ensure that the worker has all necessary rendering software installed and licensed.
- Disable selinux and firewall using "setup" or available initial boot setup utility.
- Mount required network locations using /etc/fstab.
- Use package installation manager such as yum or apt-get to ensure "xinetd" and "python3" is installed.
- Download required packages for your distribution: qube-core, qube-worker. Optionally download QubeUI and any pertinent jobtypes.
- Install qube-core package with the command: $ rpm -ivh qube-core-\*
- Install qube-worker package with the command: $ rpm -ivh qube-worker-\*

### Installing the Client(s)
There are two clients, and you can install both of them on any user machine. The QubeUI (new in 7.5) is the unified GUI, and intended to soon replace WV. As of 7.5-0, some of the WV features are yet to be ported to QubeUI, such as the administration features.

- Install the QubeUI package with the command: $ rpm -ivh QubeUI
- Optionally install WranglerView: rpm -ivh qubegui-\*
- Make sure that /usr/local/pfx/qube/bin is in the user's PATH variable

## Windows
### Installing the Supervisor 
- Install the qube Core MSI by double-clicking the icon. A short message describing the installation will be displayed. If you need to stop the installation, click Cancel at any time.
- Install the Qube Supervisor MSI by double-clicking the icon. A short message describing the installation will be displayed. If you need to stop the installation, click Cancel at any time:
- Once the MSI finishes, there's a script that must be run one time by hand. From an Administrator command prompt, run "C:\Program Files\pfx\qube\utils\supe_postinstall.bat"
- Once the script finishes running, the Supervisor daemon starts up, and the system will be configured to automatically start up the Supervisor anytime the host is rebooted.
- The installer will also install and start up the PostgreSQL service, followed by the installation and start up of the qubesupervisor service.

### Installing the Worker
- Install the aube Worker MSI by double-clicking the icon. A short message describing the installation will be displayed. If you need to stop the installation, click Cancel at any time.

### Installing the Client(s)
There are two clients, and you can install both of them on any user machine. The QubeUI (new in 7.5) is the unified GUI, and intended to soon replace WV. As of 7.5-0, some of the WV features are yet to be ported to QubeUI, such as the administration features.

- Double-click the QubeUI.msi file to install the QubeUI.
- Optionally use the qubegui.msi file to install the WranglerView GUI.
- Follow the step-by-step instructions in the MSI installer application.
- From the Start Menu, select Pipelinefx?QubeUI to launch the QubeUI, or Pipelinefx?WranglerView to launch the WV GUI, or double click on the respective desktop icon.

## macOS

### Installing the Supervisor
- Double-click the downloaded .dmg file in order to mount the image containing the .pkg file. Open the disk image. Double-click the qube-core .pkg file to launch the Installer..
- The Installer will present a series of screens. Click Continue to proceed. If you need to abort the installation, select Quit from the File menu:
- Installation of the Qube software requires authentication by an Administrative user. If not running as root, type in the user name and password of a user with Administrator privileges and click OK to continue with the installation: 
- Double-click the downloaded .dmg file in order to mount tie image containing the .pkg file. Open the disk image. Double-click the qube-supervisor .pkg file to launch the Installer.
- The Installer will present a series of screens. Click Continue to proceed. If you need to abort the installation, select Quit from the File menu:
- Installation of the Qube software requires authentication by an Administrative user. If not running as root, type in the user name and password of a user with Administrator privileges and click OK to continue with the installation
- Once installed, the Supervisor daemon starts up, and the system will be configured to automatically start up the Supervisor anytime the host is rebooted.
- The installer will also install and start up the PostgreSQL service, followed by the installation and start up of the supervisor service.

### Installing the Worker
- Double-click the downloaded .dmg file in order to mount tie image containing the .pkg file. Open the disk image. Double-click the qube-worker .pkg file to launch the Installer.
- The Installer will present a series of screens. Click Continue to proceed. If you need to abort the installation, select Quit from the File menu: 
- Installation of the Qube software requires authentication by an Administrative user. If not running as root, Type in the user name and password of a user with Administrator privileges and click OK to continue with the installation
- Installing the Client(s)
- Double-click on the .dmg file to mount the disk image file. Open the disk image, and double-click the .pkg file to begin the GUI installation.
- Follow the step-by-step instructions in the Installer application.
In /Applications/pfx/qube/bin, double-click the QubeUI icon to launch the QubeUI, or the Qube Icon to launch WranglerView.

### Installing Multiple Workers using Apple Remote

Apple Remote desktop Client can also push the pkg files out to your farm. Here is a brief description of the process

- Select qube-core, qube-worker, and qubegui and right/ctrl click > open to mount the packages
- Open Remote Desktop application
- Select required machines for installation
- Click Install in the top menu
- Drag qube-core into the install Packages window
- Click Install
- Repeat steps 4 to 6 for qube-worker.
- Repeat steps 4 to 6 for QubeUI

## JobType Installation
Some of the application interfaces construct a command line that is then run directly on the Workers and do not require any additional installation. Other application interfaces (like Maya, and 3dsMax) are controlled via (perl or python) scripts. These scripts are installed on the Worker by installing the desired jobtypes.

The application interfaces with these back-end scripts need to be installed on the Workers. Similarly, there are a few jobtypes that also have front-end scripts to provide in-application submission that should be installed on the Client machines.
See http://www.pipelinefx.com/products/supported-applications and http://www.pipelinefx.com/docs for details on the specific application interfaces that you are using.

:::tip
You can install these jobtypes centrally on a network fileserver. See the configuration parameter worker_template_path for the search path used by the Workers for their jobtypes.
:::

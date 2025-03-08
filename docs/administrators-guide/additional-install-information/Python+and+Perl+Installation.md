---
sidebar_position: 9
---

# Python and Perl Installation

## Python
As of Qube! 7.5, Python 3 is supported (3.6, 3.7, and 3.10, as of 8.0-0). In fact, Python3 is required during the installation process.

Some of the Linux and macOS system that we support may not come standard with Python3 installed. If that's the case, you will need to install it from your distribution media, or downloaded from the Internet.

Python 2.7 is supported, but only to provide backwards compatibility for legacy scripts that use our Qube! Python API. Please port your Python2 scripts to Python3 at the earliest convenience.

Python 2.6 and below are unsupported.

### Python on Windows
Qube! is compatible with Python versions 3.6 through 3.10.  If you're unsure which Python version to install, always choose the latest version of 64-bit Python 3.10.

As of Qube! 7.5, we require installing Python3 prior to installing Qube! software on the supervisor and all workers. Beside being a requirement for installation, Python is also used to support automated log rotation, and with some Python-based jobtypes on the workers. 

For Windows, free (Community Edition) Python distributions can be downloaded from http://www.python.org.  

## Perl
This is required only for the Workers running the Perl-based jobtypes:

Maya
3dsMax
Typically, Linux and Mac come with Perl already installed. In the rare event that your Linux OS didn't come installed with Perl, RPMs should be available on the distribution media or by download from the Internet.

For Windows, Qube! is compatible with Perl 5.26.  A Windows MSI installer for Strawberry Perl 5.26 is available from http://strawberryperl.com/releases.html .

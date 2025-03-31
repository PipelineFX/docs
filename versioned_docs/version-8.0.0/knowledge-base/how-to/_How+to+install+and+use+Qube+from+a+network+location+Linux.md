---
sidebar_position: 14
---

# How to install and use Qube from a network location Linux

Icon

This is only applicable to **client and worker** machines.

Perform a standard installation for the supervisor

#### Download the latest version of the installers either with the
QubeInstaller application, or directly from

  * [PipelineFX Downloads](http://pipelinefx.com/downloads/)

#### Copy the downloaded files in a directory on your shared storage (example:
/mnt/software/qube/6.5-0)

  * If you have other network run software I would suggest retaining your naming convention 
  * A naming convention such as `/mnt/software/qube/6.5-0` is a good method 
  * I find setting up symlinks such as `/mnt/software/qube/qube_current` to the currently extracted version `/mnt/software/qube/6.5-0` is an effective method to easily roll out future versions/updates

#### Change directories into /mnt/software/qube/6.5-0, then extract the RPM's

Run below changing $REL$ for the correct rpm names

  * `$ rpm2cpio qube-core$REL$.rpm | cpio -idmv`
  * `$ rpm2cpio qube-worker$REL$.rpm | cpio -idmv`
  * `$ rpm2cpio qubeGUI$REL$.rpm | cpio -idmv`

This will create a folder structure with `usr/` in the current directory

#### Descend into the extracted usr/local/pfx/qube/utils and run the
installation scripts as root (or 'sudo')

  * `cd usr/local/pfx/qube/utils`
  * `sudo ./install_client --prefix /mnt/software/qube/6.5-0/usr/local/pfx/qube`
  * `sudo ./install_worker --prefix /mnt/software/qube/6.5-0/usr/local/pfx/qube `

You should see output like the following:

`[jburk@VM-CentOS-63-x86_64 utils]$ pwd`  
`/home/jburk/qube/6.5/1/CENTOS-6.3-x86_64/unpack/usr/local/pfx/qube/utils`

`[jburk@VM-CentOS-63-x86_64 utils]$ sudo ./install_client --prefix
/home/jburk/qube/6.5/1/CENTOS-6.3-x86_64/unpack/usr/local/pfx/qube`  
`Installing client qb.conf`  
`old setting: qb_domain = qube`  
`Done!`

`[jburk@VM-CentOS-63-x86_64 utils]$ sudo ./install_worker --prefix
/home/jburk/qube/6.5/1/CENTOS-6.3-x86_64/unpack/usr/local/pfx/qube`  
`Making directories...`  
`Installing db...`  
`journal: /var/spool/qube/worker.jnl`  
`[Sep 10, 2013 12:39:34] VM-CentOS-63-x86_64[3364]: detecting current storage
state...`  
`[Sep 10, 2013 12:39:34] VM-CentOS-63-x86_64[3364]: current storage version:
8`  
`Installing worker init script...`  
`useradd: warning: the home directory already exists.`  
`Not copying any file from skel directory into it.`  
`Creating mailbox file: File exists`  
`Starting worker: `  
`Done!`  
`Remember to configure the worker using its /etc/qb.conf file.`

`[jburk@VM-CentOS-63-x86_64 utils]$`


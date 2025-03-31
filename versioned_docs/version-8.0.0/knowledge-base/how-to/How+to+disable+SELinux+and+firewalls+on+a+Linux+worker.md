---
sidebar_position: 9
---

# How to disable SELinux and firewalls on a Linux worker

## Disable and Stop the Firewalls

Run the following commands while logged in as the root user:

`/sbin/chkconfig iptables off`

`/sbin/chkconfig ip6tables off`

`/etc/init.d/iptables stop`

`/etc/init.d/ip6tables stop`

## Disable SELinux

Edit the file **/etc/selinux/config:**

Change the `SELINUX=` line from

`SELINUX=enforcing`

to:

`SELINUX=disabled`

Normally, this change to the /etc/selinux/config would only take effect on the
next reboot, but you can also disable SELinux immediately by running the
following command as root:

  * `echo 0 >/selinux/enforce`


---
sidebar_position: 11
---

# How to implement locking/unlocking a Linux worker at user login/out

## KDM:

In /usr/share/config/kdm, create the files:

Xstartup (run a logon)  
Xreset (run at logoff)

## GDM:

In /etc/gdm, create the files:

PostLogin/Default  (Logon)  
PostSession/Default (Logoff)

## This is the script that runs on login:

```bash
MYHOSTNAME=`/bin/hostname`
COMMAND="/usr/local/pfx/qube/bin/qblock --lock --purge $MYHOSTNAME"
logger Running "$COMMAND"
$COMMAND
logger Finished running "$COMMAND"
```

## This is the script that runs on logoff:

```bash
MYHOSTNAME=`/bin/hostname`
COMMAND="/usr/local/pfx/qube/bin/qbunlock --unlock $MYHOSTNAME"
logger Running "$COMMAND"
$COMMAND
logger Finished running "$COMMAND"
```

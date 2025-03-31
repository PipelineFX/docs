---
sidebar_position: 12
---

# How to implement locking/unlocking a macOS worker at user login/out

Many users have asked if we have scripts that would automatically lock the
worker when a user logs in, and unlock it when they log out.  Here's how.

  * ensure that no other copies of `com.pipelinefx.WorkerLock.plist` exist in any of these directories:

`/System/Library/LaunchAgents`

`/Library/LaunchAgents`

or the user's `~/Library/LaunchAgents` directories

  * install com.pipelinefx.WorkerLock.plist into `/Library/LaunchAgents`
  * install workerLock.py into `/Applications/pfx/qube/scripts`
  * fix the permissions on both of these files by running the following commands at a terminal prompt: 

`sudo chmod 644 /Library/LaunchAgents/com.pipelinefx.WorkerLock.plist`

`sudo chown root /Library/LaunchAgents/com.pipelinefx.WorkerLock.plist`

`sudo chgrp wheel /Library/LaunchAgents/com.pipelinefx.WorkerLock.plist`

`sudo chmod 755 /Applications/pfx/qube/scripts/workerLock.py`

`sudo chown root /Applications/pfx/qube/scripts/workerLock.py`

`sudo chgrp admin /Applications/pfx/qube/scripts/workerLock.py`

  * test the permissions and ownership:

`ls -l /Library/LaunchAgents/com.pipelinefx.WorkerLock.plist
/Applications/pfx/qube/scripts/workerLock.py`

It should return something like:

`-rwxr-xr-x @ 1 root  admin  2721 Mar 28 13:43
/Applications/pfx/qube/scripts/workerLock.py`

`-rw-r--r--  1 root wheel  685 Mar 28 13:00
/Library/LaunchAgents/com.pipelinefx.WorkerLock.plist`

You're most interested in the values in the first column (the permissions for
user, group, and other), and the owner (root) and group (admin or wheel).

Logout and back in to test, checking the worker lock status from another
machine.

```xml title="com.pipelinefx.WorkerLock.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
        <string>com.pipelinefx.WorkerLock</string>
    <key>LimitLoadToSessionType</key>
        <string>Aqua</string>
    <key>ProgramArguments</key>
        <array>
            <string>/Applications/pfx/qube/scripts/workerLock.py</string>
        </array>
    <key>EnvironmentVariables</key>
        <dict>
            <key>PYTHONPATH</key>
                <string>/Applications/pfx/qube/api/python</string>
        </dict>
    <key>RunAtLoad</key>
        <true/>
</dict>
</plist>
```

```py title="workerLock.py"
#!/usr/bin/env python3
"""
This script will lock the worker and then loop forever until it's killed.  When killed with the
SIGTERM signal, it will unlock the worker.

It is meant to be invoked  on macOS by launchd, specified in a launchd.plist in
/Library/LaunchAgents.  When invoked in this manner, it will serve to lock the
local host at user login, and unlock it at logout.
"""

import sys
import os
import pwd
import signal
import socket
import time
import socket

if 'QBDIR' not in os.environ:
    os.environ['QBDIR'] = '/Applications/pfx/qube'

qbApiDir = '%s/api/python' % os.environ['QBDIR']
if not os.path.exists(qbApiDir):
    sys.exit(2)

if qbApiDir not in sys.path:
    sys.path.append(qbApiDir)
import qb

HOSTNAME = socket.gethostname()
TIME_FMT = '[%b %d, %Y %X]'

#================================================================================================
# define a signal hander for the TERM signal, which will be called when this script is killed by
# launchctl when the user logs out
#================================================================================================
def handler(signum, frame):
    unlocked = qb.workerlock(name=HOSTNAME, lock=False)

    try:
        LOGDIR = '%s/Library/Logs/pfx' % pwd.getpwuid(os.getuid()).pw_dir
        if not os.path.exists(LOGDIR):
            os.mkdir(LOGDIR)
        LOG = '%s/workerLock.log' % LOGDIR

        with open(LOG, 'a+') as fh:
            if unlocked:
                logMsg = '%s [logout]: unlocked worker on localhost:%s' % (time.strftime(TIME_FMT, time.localtime()), unlocked[0])
            else:
                logMsg = '%s [logout]: FAILED to unlock worker on localhost' % time.strftime(TIME_FMT, time.localtime())
            fh.write('%s\n' % logMsg)
    except:
        pass
    
    sys.exit()

#===================================================
#
#   Connect the signal to the handler, 
#   try and lock the worker,
#   then go to sleep.
#
#   Wait to be terminated by the user logging out
#
#===================================================
# Bind the TERM signal (15) to the handler
signal.signal(signal.SIGTERM, handler)

# Attempt to lock the worker
locked = qb.workerlock(name=HOSTNAME, lock=True, purge=True)

try:
    LOGDIR = '%s/Library/Logs/pfx' % pwd.getpwuid(os.getuid()).pw_dir
    if not os.path.exists(LOGDIR):
        os.mkdir(LOGDIR)
    LOG = '%s/workerLock.log' % LOGDIR

    with open(LOG, 'a+') as fh:
        if locked:
            logMsg = '%s [login]: locked worker on localhost: %s' % (time.strftime(TIME_FMT, time.localtime()), locked[0])
        else:
            logMsg = '%s [login]: FAILED to lock worker on localhost' % time.strftime(TIME_FMT, time.localtime())
        fh.write('%s\n' % logMsg)
except:
    pass

# Now we wait to be terminated
while True:
    time.sleep(86400)

```

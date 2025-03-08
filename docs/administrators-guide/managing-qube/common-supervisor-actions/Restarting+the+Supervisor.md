---
sidebar_position: 4
---

# Restarting the Supervisor

**Linux**

```
% sudo /usr/bin/systemctl restart supervisor
```

Or

```
% sudo /sbin/service supervisor restart
```

**macOS**

```
% sudo launchctl stop com.pipelinefx.supervisor
% sudo launchctl start com.pipelinefx.supervisor
```

**Windows (Administrative Tools)**\
Click on the Services icon in the Administrative Tools section of the Windows Control Panel. Select the qubeSupervisor service and right click to select Restart from the menu.

**Windows (Command line)**\
From a command prompt:

```
C:> net stop qubesupervisor
C:> net start qubesupervisor
```

You can also restart the Supervisor via the GUI:\
&nbsp; &nbsp; "Administration > Supervisor > Stop", then\
&nbsp; &nbsp; "Administration > Supervisor > Start"

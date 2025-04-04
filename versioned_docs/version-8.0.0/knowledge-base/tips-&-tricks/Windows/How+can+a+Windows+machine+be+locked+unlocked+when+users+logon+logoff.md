---
sidebar_position: 1
---

# How can a Windows machine be locked/unlocked when users logon/logoff?

You can use Windows' logon/logoff scripts to automatically lock/unlock a
machine when users logon/off. Basically, you'd call `qblock <machinename>` in
the logon script, and `qbunlock <machinename>` in the logoff script. To set up
logon/logoff scripts for local logins, you edit settings in the Windows'
"group policy editor":

1. "Start Menu" -> "Run..."
2. Type `gpedit.msc`, enter-- launches the group policy editor.
3. In the gpedit, in the left pane, choose "User Configurations" -> "Windows Settings" -> "Scripts (Logon/Logoff)"
4. On the right pane, double-click on the "Logon", choose "Add"
5. In the "Script Name", type `C:\Program Files\pfx\qube\bin\qblock`, or browse to the file.
6. In the "Script Parameter", type `%COMPUTERNAME%`.
7. Hit "OK".
8. Do the same for the "Logoff" script, but substitute "qbunlock" for "qblock".

You also need to make sure that all users have permissions to "qblock" a machine. Users have this permission by default, but to make sure, see the "qbusers --list" output, and look for the line for user "[default]". If it looks like:

```
    ---l jcg krmpbuicseyqg-vft      [default]
```

you're good!

:::note
The 4th column's "l" means the default users have lock permission.
:::


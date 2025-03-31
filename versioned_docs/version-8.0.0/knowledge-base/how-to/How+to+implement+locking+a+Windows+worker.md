---
sidebar_position: 13
---

# How to implement locking/unlocking a Windows worker at user login/out

You can use Windows' logon/logoff scripts to automatically lock/unlock a
machine when users logon/off. Basically, you'd call
"[qblock](/advanced-users-guide/command-line-reference/qblock) \<machinename>" in the logon script, and
"[qbunlock](/advanced-users-guide/command-line-reference/qbunlock) \<machinename>" in the logoff script. To
set up logon/logoff scripts for local logins, you edit settings in the
Windows' "group policy editor":

1. "Start Menu" -> "Run..."
2. Type "gpedit.msc", enter-- launches the group policy editor.
3. In the gpedit, in the left pane, choose "User Configurations" -> "Windows Settings" -> "Scripts (Logon/Logoff)"
4. On the right pane, double-click on the "Logon", choose "Add"
5. In the "Script Name", type "C:\Program Files\pfx\qube\bin\qblock", or browse to the file.
6. In the "Script Parameter", type "%COMPUTERNAME%".  Optionally add `--purge` before %COMPUTERNAME%, as in
"`--purge %COMPUTERNAME%`", so that running jobs will immediately be purged when a user logs in.
7. Hit "OK".
8. Do the same for the "Logoff" script, but substitute "qbunlock" for "qblock". You also need to make sure that all
users have permissions to "qblock" a machine. To make sure, see the "qbusers --list" output, and look for the line
for user "[default]". If it looks like:

`---l jcg krmpbuicseyqg-vft [default]`

you're good (the 4th column's "l" means the default users have lock permission).


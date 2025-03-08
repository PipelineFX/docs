---
sidebar_position: 2
---

# Validating the qbwrk.conf

After the qbwrk.conf file is edited, you should check the file for validity. This can also be used to verify macros and inheritance templates. As Administrator (or sudo), run the qbconfigfile command on the qbwrk.conf file. Depending on your OS, that will mean running one of these:

| OS       | Command                                                                             |
|----------|-------------------------------------------------------------------------------------|
|Linux     | /usr/local/pfx/qube/sbin/qbconfigfile /etc/qbwrk.conf                               |
|Windows   | C:\Program Files\pfx\qube\sbin\qbconfigfile.exe  C:\ProgramData\pfx\qube\qbwrk.conf |
|maxOSX    | /Applications/pfx/qube/sbin/qbconfigfile /etc/qbwrk.conf                            |

## Example
File contents:

```
[group]
worker_groups = "mygroup"
[sqb[10-20]] : group
# The range definitions also support use of templates.
...
```

Then running this command gives this result
```
% qbconfigfile qbwrk.conf

[sqb19]
worker_groups = mygroup
[sqb15]
worker_groups = mygroup
[sqb11]
worker_groups = mygroup
[sqb16]
worker_groups = mygroup
[sqb12]
worker_groups = mygroup
```

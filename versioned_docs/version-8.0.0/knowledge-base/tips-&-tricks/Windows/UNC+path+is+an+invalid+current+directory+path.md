---
sidebar_position: 9
---

# UNC path is an invalid current directory path. UNC paths are not supported. Defaulting to Windows directory.

From Microsoft: You must make a registry entry to be able to use a UNC path as
the current directory.

:::warning
Using the Registry Editor incorrectly can cause serious, system-wide
problems that may require you to reinstall Windows to correct them.
Microsoft cannot guarantee that any problems resulting from the use of
Registry Editor can be solved. Use this tool at your own risk.
:::

Under the registry path:

```
    HKEY_CURRENT_USER
         Software
            Microsoft
               Command Processor
```

add the value DisableUNCCheck REG_DWORD and set the value to 0 x 1 (Hex).


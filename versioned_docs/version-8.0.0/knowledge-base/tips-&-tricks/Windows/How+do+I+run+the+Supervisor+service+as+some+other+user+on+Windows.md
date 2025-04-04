---
sidebar_position: 5
---

# How do I run the Supervisor service as some other user on Windows?

1. In the Services Control Panel, right-click the qubesupervisor service and select Properties from the menu.
2. Click the LogOn tab and then
3. click the radio button to set "This Account" with the proper login and password.

:::danger[Permissions]
Remember, the supervisor will read from and write to the database and log
files. The user under which it runs must have read/write access where
appropriate. PipelineFX advises that you do not change the user under which
either the worker or supervisor service runs unless absolutely necessary.
:::


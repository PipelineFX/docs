---
sidebar_position: 12
---

# Why do I get the GUI login window?

:::warning
The auth tool hasn't shipped with Qube! since v5.2, so this page is likely obsolete.
:::

The approach in newer versions of Qube! is to use **WranglerView - > Admin ->
Register Windows Password**

See [Service Mode Authentication: User vs Proxy](/administrators-guide/configuring-qube/worker-configuration/Service+Mode+vs+Desktop+User+Mode) for more information.

In order for you to operate the Workers the "user" mode, each user will need
to register their domain login and password with the Supervisor. That way, the
Worker service can authenticate as the submitting user in order to execute the
job. The GUI window you see comes up in order to make it a little easier for
the user to perform this step.


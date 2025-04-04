---
sidebar_position: 1
---

# In-app submission not showing up with the latest Max jobtype.

The in-application submission not showing up with the latest Max jobtype when
selecting the menu item. Also the QubeGUI launching from within Max is not
working either. What's going on and how does one fix this?

The new in-application submission for the 3ds Max jobtype calls the QubeUI
executable and provides it the scenefile and other parameters. If the QubeUI
(QubeUI.bat) cannot be found, then no dialog will come up.

If this happens, it is likely a path issue. From the commandline, type
"QubeUI.bat". If the UI does not come up, then it likely cannot be found from
within 3ds Max. Add to your System Environment Variables the PATH to where the
QubeUI is located (C:\Program Files\pfx\qube\bin). Alternatively one can adjust
the menu.ms script that calls the QubeUI from within Max.

---
sidebar_position: 1
---

# Run aerender in non-royalty bearing mode

When using AfterEffects CC, some special handling is required when setting up worker nodes to render AfterEffects projects.  Please refer to the Adobe post here:

https://helpx.adobe.com/ca/after-effects/using/automated-rendering-network-rendering.html

From the URL:

After Effects CS5.5 had to be serialized on render-only machines due to licensing issues. In After Effects CS6 and later, you can now run aerender or use Watch Folder in a non-royalty bearing mode, so serialization not required.

To ensure that After Effects is running in non-royalty bearing mode, place a blank file named  ae_render_only_node.txt into the following location:

1. Install After Effects on the render-only machine.

2.  * Mac locations:

		/Users/[username]/Documents/

		/Users/Shared/Adobe/

	* Windows locations:

		C:\Users\[username]\Documents

		C:\Users\Public\Documents\Adobe 


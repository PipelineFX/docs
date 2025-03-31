---
sidebar_position: 6
---

# How to add a Qube! button to your maya shelf

## Maya Shelf Qube! submit button:

:::tip
This tech tip takes you through the steps to create a Qube! Submit button in your "Render" shelf in Maya
:::

<!-- Insert Image Here -->
 
* Select the "render" shelf
	* Right Click and select "Shelf Editor..."
* Create a new button
	* Rename the button Qube!
	* Move the button down to where suitable
	* Select Command in the tabs and enter below
		* macOS:
		system(""+`qube_get_qubeguiPath`+"/Contents/MacOS/qube --submitDict \"{'name':'maya render "+`file -q -sn -shn`+"', 'prototype':'maya', 'package':{'scenefile':'"+`file -q -sn`+"', 'project':'"+`workspace -q -rd`+"', 'range':'"+`getAttr defaultRenderGlobals.startFrame`+"-"+`getAttr defaultRenderGlobals.endFrame`+"', 'cameras_all':'"+stringArrayToString(`listCameras -p -o`, " ")+"', 'renderers_all':'"+stringArrayToString(`renderer -q -ava`, " ")+"', 'layers_all':'"+stringArrayToString(`ls -type renderLayer`, " ")+"'}}\" >/dev/null 2>&1 &");
		* Windows and Linux:
		system(""+`qube_get_qubeguiPath`+" --submitDict \"{'name':'maya render "+`file -q -sn -shn`+"', 'prototype':'maya', 'package':{'scenefile':'"+`file -q -sn`+"', 'project':'"+`workspace -q -rd`+"', 'range':'"+`getAttr defaultRenderGlobals.startFrame`+"-"+`getAttr defaultRenderGlobals.endFrame`+"', 'cameras_all':'"+stringArrayToString(`listCameras -p -o`, " ")+"', 'renderers_all':'"+stringArrayToString(`renderer -q -ava`, " ")+"', 'layers_all':'"+stringArrayToString(`ls -type renderLayer`, " ")+"'}}\" >/dev/null 2>&1 &"); 
* Select icon location
	* Windows:
	C:\program files\pfx\qube\api\python\qb\gui\AppUI\Cinema4D\Qube_Submit\Qube_Submit_WIN.tif
	* macOS:
	/Applications/pfx/qube/api/python/qb/gui/AppUI/Cinema4D/Qube_Submit/Qube_Submit_WIN.tif
	* Linux:
	/usr/local/pfx/qube/api/python/qb/gui/AppUI/Cinema4D/Qube_Submit/Qube_Submit_WIN.tif
* You will see a Qube! button now in your render shelf

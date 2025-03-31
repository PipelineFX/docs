---
sidebar_position: 22
---

# How to setup Windows symlinks for path translation

:::tip
Here is a good technique for Windows rendernodes that need path translation.
:::

**This technique is similar to the "ln -s" symbolic link method used on
macOS/Linux.**  
  
If you are running Windows 10 or above you can use "mklink" on the Renderfarm
Workers to have the `/Volumes/` path work automatically without any path
translations.  The best part is that this also works for paths internal to the
scene files and not just the external ones specified to the renderfarm manager.  
  
On each Worker (assuming you have  MyNetWorkShare folder on MyServer):  

* `mkdir C:\Volumes`
* `cd \Volumes`
* `mklink /D C:\Volumes\MyNetworkShare \\MyServer\MyNetworkShare`

Check with:  

* `dir \Volumes`
* `dir \Volumes\MyNetworkShare`

There is often no need to use Qube's path translation at this point.  When
Windows is given a path that does not contain a drive letter, the root drive
(usually C: ) is assumed.  Most applications that work across multiple
platforms will not care if you use '/' or '\' as a path separator.

Now if you submit a from an macOS machine that uses the path
/Volumes/MyNetworkShare/project/foo.aep, when the job runs on a Windows
worker, the worker will use "/Volumes/MyNetworkShare/project/foo.aep" which is
now equivalent to "c:\Volumes\MyNetworkShare\project\foo.aep".

<!--- See [Cross-Platform Rendering](/display/QUBE/Cross-Platform+Rendering) for more information. --->


---
sidebar_position: 1
---

# Drive Mounting: Remote files I access in macOS aren't visible on the Worker


The problem you describe is caused by a difference between the remote file
services available to a logged in user (such as yourself) and those available
to the host without anyone one logged in. In this particular case, when we
refer to "logged in" we mean running a Finder desktop. Remote (and local)
file systems accessed via the Finder are all mounted under /Volumes.

Qube! runs as a daemon, and so it doesn't access the Finder at all. In
general, any file you access remotely from the Finder is going to be
inaccessible to any Worker running on the farm unless you take steps to make
sure the Worker has those file systems already mounted.

You should consult your Mac administration documentation to learn more about
how to mount your file servers either statically or dynamically so they are
available to your Workers at render time. You will also want to set similar
mounts on your client machines so that the paths to the files you access when
you submit the job will be consistent with your Workers. Here's a link:

http://www.bombich.com/mactips/automount.html


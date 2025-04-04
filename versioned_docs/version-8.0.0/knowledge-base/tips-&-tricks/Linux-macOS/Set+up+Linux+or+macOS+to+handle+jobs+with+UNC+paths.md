---
sidebar_position: 3
---

# Set up Linux or macOS to handle jobs with UNC paths

Let's say you've got a server called "server," and on this server you keep a
maya directory with projects in them. Let's call the project "default," a and
the scenefile "myscene.mb."

So if you want to use UNC, this is what it might look like:

**Project:**  \\\\server\maya\projects\default

**Render:**  \\\\server\maya\projects\default\images

**Scene:**  \\\\server\maya\projects\default\scenes\myscene.mb

This is what you'd need to submit a job. Alas, on the macOS side, it won't make
sense.

First, you need to mount the drive using NFS or SMB. We leave that as an
exercise, but what you should end up with is something like this (the
underlying structure is what matters, so you can have the mount be whatever):

**Project:**  /Volumes/maya/projects/default

**Render:**  /Volumes/maya/projects/default/images

**Scene:**  /Volumes/maya/projects/default/scenes/myscene.mb

Now you need to create a symlink so the path to server will work (you'll need
to do this a root or sudo user on each Worker):

```
mkdir /server
> ln -s /Volumes/maya /server/maya
```

So if you do an 'ls' of /server/maya, you should see projects.

One small change to how you submit, and you should be good to go:

**Project:**  //server/maya/projects/default

**Render:**  //server/maya/projects/default/images

**Scene:**  //server/maya/projects/scenes/myscene.mb


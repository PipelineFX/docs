---
sidebar_position: 1
---

# How do I submit a frame render using qbsub?

Bear in mind that when you submit a command via qbsub, the Supervisor
dispatches as many "subjobs" as you ask for with the "\--cpus" option. Each
subjob will execute the command.

That means, if the command is set up to render a range of frames, each subjob
will render all those frames, wasting a lot of time and work. If you know how
to set up your command to render a single frame, you can use qbsub to instruct
the Supervisor to keep a list of frames to render. With the inclusion of a
macro term to your command, you can instruct the Worker to request a frame
from the Supervisor's list and execute the command on that one frame. Repeat
this across all your subjobs, and you're distributing your frames across your
farm!

Suppose you have a dumb command that renders frames with a couple of
arguments:
 
``` 
Render --start # --end # <scene_file>
```

Where \# are frame numbers and \<scene_file\> is the file.

If you submit the job naively using qbsub:
 
``` 
qbsub -cpus 10 Render --start 1 --end 100 scene_file
```

Your going to have each subjob (all 10 of them) render the whole scene file from
frames 1-100. Not good.

Instead, let's look at rendering a single frame, say 1:
 
``` 
Render --start 1 --end 1 scene_file
```

If we submit that naively:

``` 
qbsub -cpus 10 Render --start 1 --end 1 scene_file
```

We still do the same thing, but only do one frame. What if we could do this,
but get each subjob to do different frames. It's pretty straightforward. Just
give the Supervisor the list of frames, and change the command to include a
placeholder where the frame would go:
 
``` 
qbsub --frames 1-100 --cpus 10 Render --start QB_FRAME_NUMBER --end QB_FRAME_NUMBER scene_file
```

Now, when you submit the job, each subjob will call the Supervisor and ask for
a frame to render, and substitute for the QB_FRAME_NUMBER placeholder. Easy!
Each subjob will render one or more different frames, and will automatically
quit when there are no more to render because the Supervisor keeps track.


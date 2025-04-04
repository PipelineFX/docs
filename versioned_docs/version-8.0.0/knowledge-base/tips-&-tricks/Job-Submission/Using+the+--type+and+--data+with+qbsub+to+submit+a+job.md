---
sidebar_position: 5
---

# Using the --type and --data with qbsub to submit a job

Here's a normal command line sleep 1000 qbsub:

```
qbsub sleep 1000
```

This is how you'd do it with the --data and --type:

```
qbsub --type cmdline --data '(=(cmdline=sleep "1000"))'
```

I found the data string by running

```
qbsub --xml --export job.xja sleep 1000
```

Examining the job.xja file for the \<data>\</data> pair shows:

```
<data>(=(cmdline=sleep "1000"))</data>
```

So you should be able to submit a job, check the xja file in the job
log directory for the \<data> tags and use the contents as a template.


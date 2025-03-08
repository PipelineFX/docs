---
sidebar_position: 3
---

# qb_jobcmp

```
qb_jobcmp($joba, $jobb, $host)
```

This is a comparison function similar to that used in the Perl "sort" routine.

```perl
@items = sort { $a <=> $b } @items;
```

The comparison function is given 2 jobs, "a" and "b" relative to a single host. For queuing algorithms which don't take the host's properties into account, the $host parameter can be ignored. An example of an existing queuing algorithm which does take advantage of the host information is the "Cluster" algorithm because it uses the host's cluster value when comparing the 2 jobs.

This function is to return 1 if $joba is greater in priority than $jobb, 0 if the jobs are equal and -1 if $jobb's priority is greater than $joba.

---
sidebar_position: 1
---

# qb_hostcmp

```
qb_hostcmp($hosta, $hostb, $job)
```

Like the qb_jobcmp() function, this is a comparison function similar to that used in the Perl "sort" routine.

```perl
@items = sort { $a <=> $b } @items;
```

This comparison function is given 2 hosts, "a" and "b" relative to a single job. Although this is not as critical a function as the qb_jobcmp function, the qb_hostcmp comparison function allows the developer to sort the hosts compared to a job based upon which host the job prefers.

This function is to return 1 if $hosta is greater in priority than $hostb, 0 if the hosts are equal and -1 if $hostb's priority is greater than $hosta.

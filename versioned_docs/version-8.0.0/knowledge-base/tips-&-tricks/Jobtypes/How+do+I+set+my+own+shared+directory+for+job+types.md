---
sidebar_position: 2
---

# How do I set my own shared directory for job types?

Set the worker_template_path for the Worker to point to the directory
containing the Job Types. Note, that on Windows, you must use UNC and the path
separator is a forward slash "/".

* Try flipping the slashes to the other direction and see if that solves your problem
 
```
worker_template_path = "//qubesupervisor.as.com/jobtypes"
```

* You may not be able to use worker_template_path in the qbwrk.conf. If that is the case, you will need to modify the local qb.conf.
* If you ever have problems with the qbwrk.conf, use the command line tool:

``` 
qbconfigfile qbwrk.conf
```

* It will show you a fully expanded version of your qbwrk.conf that you can check for errors.

Every change to the qbwrk.conf only requires a reconfiguration:

``` 
qbadmin worker --reconfig
```

while a change to the qb.conf requires a restart of the Worker.

* You can see the current configuration of the Worker:

```
qbadmin worker --config _host_
```


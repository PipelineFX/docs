---
sidebar_position: 6
---

# Supervisor won't start because it can't open port 50002

There is another system which is included on Linux by default which directly
conflicts with port numbers we use:

* 50001
* 50002
* 50011

If a site is unable to start their supervisor, they may need to disable the
hplip service, or they can change their supervisor port number. However if
they do this, every single client and worker will also need to reflect these
settings (for example):

## Supervisor qb.conf
    
`supervisor_port = 10001`   
`supervisor_sub_port = 10002`

## Worker qb.conf

`worker_port = 10011`


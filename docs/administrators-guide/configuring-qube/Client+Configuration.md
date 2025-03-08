---
sidebar_position: 5
---

# Client Configuration

A client is something (often a machine) that is going to submit jobs, but not run them. Compared to the Worker, client configuration is a very simple process - the only thing that requires configuration is the name of the Supervisor. The Supervisor setting can be explicitly set, or it can be determined using auto-discovery.

Like the Workers, Qube! clients can use Supervisor auto-discovery to automatically determine the Supervisor if on the same network subnet. There is a drawback to using auto-discovery: each time a client application executes, it must rediscover the Supervisor. This could result in a slight increase in network traffic or a noticeable delay in execution as the clients waits for a response to the query.

To avoid this added network traffic, you should explicitly set the Supervisor hostname for the client. This can be done from the QubeUI under "Administration-\>Configure (local)..." or by manually editing the client's qb.conf file to specify the qb_supervisor value.

## File Locations
The qb.conf file is located in the following directories depending on the platform:

| OS             |                         |
|----------------|-------------------------|
| Linux & macOS: | /etc                    |
| Windows:       | C:\ProgramData\pfx\qube |

## See Also

* [qb_supervisor](../configuration-parameter-reference/qb_supervisor)

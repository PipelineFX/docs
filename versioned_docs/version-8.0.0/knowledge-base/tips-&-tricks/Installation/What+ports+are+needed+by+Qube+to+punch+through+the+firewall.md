---
sidebar_position: 3
---

# Newly installed Workers are listed as "down". What ports are needed by Qube! to "punch" through the firewall?

This is probably the result of a firewall either on the Worker or the
Supervisor. Disabling all firewalls and restarting the Workers should fix the
problem. If security issues require the firewalls, open the following ports to
TCP/IP and UDP:

* 50001
* 50002
* 50011


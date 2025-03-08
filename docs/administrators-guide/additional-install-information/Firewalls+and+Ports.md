---
sidebar_position: 4
---

# Firewalls & Ports
It is necessary to have certain ports open for the Qube!
Supervisor, Worker, and Client machines to communicate amongst
themselves. You should either disable the firewall completely
on the local machine, or open specific ports for Qube! to
communicate via TCP and UDP.

## Supervisor ports
50001 TCP and UDP inbound
50002 TCP and UDP inbound

## PostgreSQL on the Supervisor:
50055 TCP inbound

## Worker port
50011 TCP and UDP inbound

## Client
No ports need be open on a machine acting soley as a Qube client

## See Also
For Qube! versions earlier than 7.0 that use MySQL, please refer
to the documentation that includes the MySQL port information

Qube 6.x Firewalls & Ports

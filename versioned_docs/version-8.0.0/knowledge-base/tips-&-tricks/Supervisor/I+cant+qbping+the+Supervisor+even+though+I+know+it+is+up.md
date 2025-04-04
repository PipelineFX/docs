---
sidebar_position: 4
---

# I can't qbping the Supervisor even though I know it is up

1. Be sure you can ping the supervisor, using the operating system's `ping`
command-line utility. If you cannot, there is a networking issue outside of
Qube!.
2. Check firewall settings. We prefer that machine-level firewalls are disabled.
If you cannot turn off the firewall, open ports 50001-5002, 50010-50012
3. Be sure qb_supervisor is set to your supervisor's hostname or IP address in
the local machine's qb.conf.
4. Be sure qb_domain is consistent across your facility. The default and
recommended value is "qube" (note: This is the qube domain. It not related to
any other domains in your facility)

## See Also

[qb_domain](/administrators-guide/configuration-parameter-reference/qb_domain)   
[qb_supervisor](/administrators-guide/configuration-parameter-reference/qb_supervisor)


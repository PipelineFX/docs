---
sidebar_position: 21
---

# How to set up a test farm separate from your production farm

It is often prudent to test a new version of Qube! against your production
software prior to committing to upgrading your entire farm. Qube! makes it
easy to set up a "test" farm that won't conflict with your production farm.

## Build the test supervisor

* Ensure that the test supervisor doesn't impact your production farm by
setting the [qb_domain](/administrators-guide/configuration-parameter-reference/qb_domain)
setting to a non-default value, like "test".  Do this after you install the
qube-core package, and before you install the qube-supevisor package,
so that the test supervisor starts up with the
[qb_domain](/administrators-guide/configuration-parameter-reference/qb_domain)
value already different from that of your production supervisor.
* Request a licence for testing purposes from PipelineFX support, [support@pipelinefx.com](mailto:support@pipelinefx.com).
Provide the MAC address of the test supervisor.

## Instruct one or more of your existing workers to bind to the test supervisor

* Ensure no production jobs are running on the worker.  Lock the worker in your production supervisor.
* Set the worker's [qb_supervisor](/administrators-guide/configuration-parameter-reference/qb_supervisor) to the test supervisor's hostname.
* Ensure that the worker can properly resolve an IP address from the hostname; if name resolution is not working, you can resort to using the supervisor IP address.
* Set the worker's [qb_domain](/administrators-guide/configuration-parameter-reference/qb_domain) to match the supervisor's.
* If the worker is running, restart it to apply these changes.
* Check the test supervisor's worker list and ensure that the worker appears in it.

## Configure one or more client stations to use the test supervisor

* Set the client's [qb_supervisor](/administrators-guide/configuration-parameter-reference/qb_supervisor) to the test supervisor's hostname.
* Set the client's [qb_domain](/administrators-guide/configuration-parameter-reference/qb_domain) to the test supervisor's.
* Submit a test job and ensure it's submitted to the new supervisor.  Check in the QubeGUI on the test supervisor.


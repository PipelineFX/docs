---
sidebar_position: 1
---

# Verifying the Supervisor

On the Supervisor, using the QubeUI, perform the following checks:

1. **Verify Supervisor is running** - Confirm that the title bar shows it can connect to the Supervisor.
2. **Verify licenses are installed** - Check the QubeUI title bar to see that the proper number of licenses are available. If the license is not properly installed it will show 0/0), indicating no installed licenses. If this is encountered, see the License Installation section to install or reinstall your license(s).
3. **Verify Workers are registered** - Click on the Host Layout and check that all the expected Workers are listed. If they are not, there may be a firewall issue (see [Firewalls & Ports](../../additional-install-information/Firewalls+and+Ports)) or the Supervisor hostname was not specified for the Worker and/or it is not on the same subnet (see Worker Configuration).
4. **Verify jobtypes (backend) are installed on Workers** - Click on the Worker's entry and check the Properties Panel for the "Jobtypes" list at the bottom. Confirm that all jobtypes that use backend scripts (not cmdline or cmdrange through the SimpleCmd interface) are listed.

See Also
Basic Installation Verification

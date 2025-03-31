---
sidebar_position: 20
---

# How to set the starting job id to other than 250

Icon

Please note that it's not possible to move the starting job id **backwards**
(to a lower number than is currently in use), you can only move it **forward**
to a higher number.

This has to be done with two SQL statements, and should be done after the
supervisor installation has been performed.

To start numbering new jobs at 1001, run the following:

This can be done on a running supervisor, there's no need to stop it before
executing this statement, but it should be done while no users are submitting
jobs.


---
sidebar_position: 96
---

# worker_flight_check_path

## Synopsis

`worker_flight_check_path` =  _path_

The flight check path is used to specify where the Worker should look for
programs that run before and after each job (pre and post-flight check). This
may be a comma-separated list of paths to specify multiple locations. For
details, including how the flight-check path should be structured inside, see
[Flight-Checks (Pre and Post)](../configuring-qube/Flight-Checks)

## Example

```
worker_flight_check_path="/apps/qube/custom/flightChecks"
```

## Defaults

```
$QBDIR/flightCheck
```

## See Also

[Flight-Checks (Pre and Post)](../configuring-qube/Flight-Checks)


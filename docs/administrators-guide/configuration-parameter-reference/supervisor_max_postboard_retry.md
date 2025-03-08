---
sidebar_position: 62
---

# supervisor_max_postboard_retry

## Synopsis

`supervisor_max_postboard_retry` =  _retries_

_Retries_ is the total number of attempts the Supervisor will make before
giving up on communicating to "post" clients before giving up.

A "post"-style callback is set up for client programs (such as a GUI or a
script) to "subscribe" to events. This requires that the client is listening
on a port, and that the client acknowledge the receipt of events, which is
where post comes in. Examples of use include the "waiton" option of
[qbsub](../../advanced-users-guide/command-line-reference/qbsub), which uses the
[qbwaitfor()](../../developers-guide/c++-api-reference/API+Functions#qbwaitfor) API call.
[qbsubmitpost()](../../developers-guide/c++-api-reference/API+Functions#qbsubmitpost) also
submits a "post" callback.

## Example
```
supervisor_max_postboard_retry = 16
```

## Defaults

8


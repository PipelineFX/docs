---
sidebar_position: 1
---

# Callback execution environment

Some things to note regarding the environment in which the callbacks execute:  

  1. Callbacks are executed on the supervisor host, from inside a supervisor process.
  2. Any file paths referenced in the callback code should be valid on the supervisor host.
  3. Print statements in callbacks are output to the \*.cb file in the job's log directory.


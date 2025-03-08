---
sidebar_position: 1
---

# The Qube callback language code strings

# Code strings

The following strings are can be used as callbacks code value when the
callback's language is defined as "qube"

## Job-level code

  * unblock-self
  * block-self
  * fail-self
  * kill-self
  * migrate-self
  * preempt-self
  * interrupt-self
  * suspend-self
  * resume-self

## Agenda-level code

  * block-work-self
  * kill-work-self
  * unblock-work-self
  * retry-work-self
  * requeue-work-self
  * complete-work-self
  * fail-work-self

## Mail code

  * mail-status
  * mail-license-status
  * mail-report-status

## Job Instance-level code

  * unblock-subjob-self-single
  * unblock-subjob-self
  * block-subjob-self
  * fail-subjob-self
  * kill-subjob-self
  * migrate-subjob-self
  * preempt-subjob-self
  * interrupt-subjob-self
  * suspend-subjob-self
  * resume-subjob-self
  * mail-subjob-status

## Example

```perl
callbacks = {
    'language': 'qube',
    'triggers': 'unblock-job-1234'
    'code': 'unblock-self'
}
```


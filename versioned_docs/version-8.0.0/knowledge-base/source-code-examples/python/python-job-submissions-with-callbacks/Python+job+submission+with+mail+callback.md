---
sidebar_position: 1
---

# Python job submission with mail callback

Here, we demonstrate submitting a job through the Qube! Python API that uses an email callback.

:::warning
[supervisor_language_flags](/administrators-guide/configuration-parameter-reference/supervisor_language_flags)
must contain "mail" or this callback will silently fail.
:::

```py
import qb

def main():
    # Set basic job properties
    job = {}
    job['name']         = 'cmdline with email callback'
    job['prototype']    = 'cmdline'

    # Set the package properties
    job['package']      = {}
    job['package']['cmdline'] = 'set'

    # Create the email callback and set the address to send it to
    # NOTE: Make sure that the Qube Supervisor has the email settings configured
    job['mailaddress'] = 'yourname@your.address.com'
    job['callbacks'] = [{'triggers':'done-job-self', 'language':'mail'}]
     
    # Submit
    listOfSubmittedJobs = qb.submit([job])

    # Report on submit results
    for job in listOfSubmittedJobs:
        print(job['id'])

if __name__ == "__main__":
    main()
```

:::tip
See the mail_\* parameters from [Configuration Parameter Reference](./configuration-parameter-reference) for how to both setup mail and adjust the various mail templates.
:::


---
sidebar_position: 11 
---

# The Supervisor Proxy

The Supervisor Proxy facilitates the live updating of the Qube! UI clients across your network. It locally pulls only new data from the supervisor and uses WebSockets to push the changed values out to the UI clients.

## Configuring the Supervisor Proxy
The Supervisor Proxy is configured by overriding default values in an optional supervisorProxy.conf file. The first time you configure the Supervisor Proxy you need to create the supervisorProxy.conf file in the following place on the supervisor:

### Linux/macOS

>/etc/supervisorProxy.conf

### Windows

>C:\ProgramData\Pfx\Qube\supervisorProxy.conf

 

Currently there is only a single configuration value and it is recommended to only set it under direction from PipelineFX support or you are certain you know what you are doing.

| Configuration value | Description | Example |
|---------------------|-------------|---------|
| exclude_job_column  | The Supervisor Proxy will not pull or push data from this column of the Qube! database job table. | exclude_job_columns = data |


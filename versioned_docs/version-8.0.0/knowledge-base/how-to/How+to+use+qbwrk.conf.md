---
sidebar_position: 38
---

# How to use qbwrk.conf

Below is a brief description of a few commonly used properties to set up the
global qbwrk.conf which is distributed to workers with the command:

`$ qbadmin w --reconfigure`

Additional reading can be found at:

* [Centralized Worker Configuration](/centralized-worker-configuration)

## EXAMPLE STUDIO LAYOUT

For this example the studio will be split into hosts based on their role i.e.:

* 3d , 2d & Workstation 3d hosts will be named render3d01 - 10 
* 2d hosts will be named render2d01 - 10
* workstation machines (for setups which use artists workstations for rendering) workstation01 -10

## CREATING TEMPLATES

Use the below examples to model templates of your studio layout.

:::warning
Template name `[default]` is reserved for assignment to all nodes
:::

Copy below and alter for your environment.

```
[Farm]
proxy_execution_mode = user
worker_properties = host.nuke6.2=1, host.maya2011=1
worker_cpus = 1
worker_groups = all,linux,maya,nuke
```

Above is an example of a template that can be set using logical names to
assign a set of commonly used properties.

"`[Farm]`" is the name of the template that can be used to assign the
following properties. you can set as many of these as you see fit.

"`proxy_execution_mode`" is property to set how Qube! executes in your
environment "User" means the submitting user's network credentials and
permissions will be used.

* [proxy_execution_mode](/administrators-guide/configuration-parameter-reference/proxy_execution_mode)

"`worker_properties`" is for assigning global resources such as licenses
global resources are set in qb.conf:

* [worker_properties](/administrators-guide/configuration-parameter-reference/worker_properties)

"`worker_cpus`" is a property to hard set the amount of cpu's on the worker
*if left commented worker default cpu's are calculated*"

* [worker_cpus](/administrators-guide/configuration-parameter-reference/worker_cpus)

"`worker_groups`" one or multiple groups the worker belongs to:

* [worker_groups](/administrators-guide/configuration-parameter-reference/worker_groups)

## TEMPLATE ASSIGNMENT

Below is an exapmle of how to assign the above template to a list of worker
hosts:

**Copy below and alter for your environment**

```
[render2d01]: Farm #[render3d[01-05]]: Farm
[worstation01]: Farm
worker_description = "lead TD workstation"
```

Above is an example of how to assign the template [Farm]

"`[render2d01]: Farm`" is setting the template to a single machine

"`[render3d[01-05]]: Farm`" is setting the template to a range of machines

"`[worstation01]: Farm`" is setting the template to worstation01

"`worker_description =`" assigns a description to the above worker as an
additional property

## GLOBAL PLATFORM NAMES

Using the below example you can assign properties by OS:

`[default]` will assign to all OS's

**Copy below and alter for your environment**

```
[osx]
worker_description = "All macOS workers"

[linux]
worker_description = "All Linux workers"

[winnt] 
worker_description = "All Windows workers"
```

## CLUSTERS

Use the below example to assign clusters to your workers note the examples of
submitting jobs from the cmd line.
Clusters can also be assigned using the template method above
additional reading:

* [Clustering](/administrators-guide/configuring-qube/queuing-algorithms/Clustering)

**Copy below and alter for your environment**

```
[render3d01]
worker_cluster = "/farm"
worker_restrictions = "/farm or /farm/*"
```

Above is to define a host that will run jobs in any cluster at /farm or 1
level below - done with the '\*'.

**Copy below and alter for your environment**

```
[render2d01]
worker_cluster = "/farm/nuke"
worker_restrictions = "/farm/nuke or /farm/nuke/+"
```

Above is to define a host that will only run jobs in /farm/nuke or any level
below - done with the '+'.

**Copy below and alter for your environment**

```
[workstation05]
worker_cluster = "/farm/nuke/workstations"
worker_restrictions = "/farm/nuke/workstations"
```

Above is to define a host that will only run jobs in /farm/nuke/workstations.

## EXAMPLE SUBMISSION USING CLUSTERS

Submit a job that will run only in /farm:

```
qbsub -cluster /farm -restriction /farm
```

Submit a job that will prefer to run in /farm/nuke, but could run in any host
in /farm or in the first level below /farm

```
qbsub -cluster /farm/nuke -restriction '/farm or /farm/*'
```

Submit a job that will prefer to run in /farm/nuke/workstations, but could
run in any host at any level at /farm or below

```
qbsub -cluster /farm/nuke/workstations -restriction '/farm or /farm/+' hostname
```


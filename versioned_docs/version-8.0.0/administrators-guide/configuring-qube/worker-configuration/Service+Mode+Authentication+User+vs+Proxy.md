---
sidebar_position: 5
---

# Service Mode Authentication: User vs Proxy

With Qube! running in [Service Mode](./Service+Mode+vs+Desktop+User+Mode), you have a choice of running jobs on the Workers in one of two ways:

* In **proxy mode**, all jobs execute as the designated proxy user, regardless of who submitted them. 
* In **user mode**, all jobs execute as the user specified in the job, either the user that submitted the job, or some other specified user. All processes executed and files created would then owned by that user.

The default installation uses proxy mode with a local account called "qubeproxy" created on each Worker.

As the Admin, you have some options for configuring this. You can:

* Leave it in proxy mode, with all jobs running as a local user called "qubeproxy".
* Continue to use the "qubeproxy" user, but make it a network account (that is, one that authenticates via Active Directory, LDAP, NIS, etc).
* Continue to run jobs under a single account, but one that is different from "qubeproxy", for example, "renderuser".
* Change to user mode, and have all jobs run as the user who submits them.

## Switching to User Mode
### Centrally from QubeUI

1. Launch QubeUI on the Supervisor as an Administrator
2. Click on the Host/Worker Layout tab
3. Select a worker or workers, right-click, and choose "Configure on Supervisor..."
4. Set under the Worker (User) heading the following fields:

\<Need Image\>

## Setting it Manually

Set the [proxy_execution_mode](../../configuration-parameter-reference/proxy_execution_mode) in the Worker qb.conf or the Supervisor qbwrk.conf:
```
proxy_execution_mode = user
```

 

:::warning Important - Windows Only
When a Worker is in **User mode**, all users wishing to execute jobs on **Windows** hosts will need to register their passwords with the Supervisor.  If this is not done, jobs will fail with a **"badlogin"** error.

Registering a user's Windows password can be done from QubeUI, using the menu item "Administration->Register Windows Password", or by using the qblogin command:

&emsp;qblogin [user]

where user is an optional user name, otherwise the current user is assumed. Qblogin will prompt for a password twice for verification. The encrypted password is stored with the Supervisor, which transmits it to the Worker each time it tries to run a job on a Windows host.

If a user password is changed, the user will need to run qblogin again to update the password with the Supervisor. If the password turns out to be incorrect, the job will will go into the **badlogin** state. A job in the badlogin state will need to be resubmitted after the password is updated in the Supervisor. If the [enforce_password](../../configuration-parameter-reference/supervisor_flags) flag is set in the Supervisor, the user will not be able to submit jobs until the password is updated.
:::

## Switching to Proxy Mode
### Centrally from QubeUI

1. Launch QubeUI on the Supervisor as an Administrator
2. Click on the Host/Worker Layout tab
3. Select the Worker(s) to configure, right-click, and choose "Configure on Supervisor..."
4. Set under the Worker (User) heading the following fields:

\<Need Image\>

* proxy_execution_mode to proxy
* proxy_account to the account to run the jobs as (it is preferable to set this to a network account rather than a local one)
* proxy_password to the encrypted password for the account. You can type it directly (it is masked as you type) or you can run \
&emsp;qblogin --display proxy_account \
&ensp;where proxy_account is the account name, and then enter the encrypted password this prints out.

### Setting it Manually

1. Designate a proxy user account name. By default, Qube! creates a user called "qubeproxy," for example. This proxy account must exist on all workers, either as a local User Account, or as a network account, controlled by a centralized authentication domain (preferred).
2. Use qblogin with the --display option to output an encrypted password for the proxy user. \
&emsp;qblogin --display user \
&ensp;where user is the proxy user name.
3. Add the following settings to the Worker qb.conf or the Supervisor qbwrk.conf. \
&emsp;proxy_account = user \
&ensp;where user is the designated proxy user. \
&emsp;proxy_password = pass \
&ensp;where pass is the encrypted password output from qblogin. \
&emsp;proxy_execution_mode = proxy
4. Remove [enforce_password](../../configuration-parameter-reference/supervisor_flags) from supervisor_flags setting in the Supervisor qb.conf

## Default Proxy User Account
The installation of the qube-worker package creates a local user account named "qubeproxy". The default worker configuration is to run in proxy mode with the qubeproxy user name and password for the proxy user.

* Username: qubeproxy
* Password: Pip3lin3P@$$wd

In the case of Windows, for each job that runs on a Windows host the Worker must supply three pieces of information so that the operating system will allow it to initiate processes as another user:

* Windows Domain
* User login
* User password (encrypted)

---
sidebar_position: 8
---

# How to configure the supervisor to send mail

## Configuration

There are 3 settings in the supervisor's qb.conf that need to be set in order
to enable your supervisor to send mail:

  * [mail_domain](/administrators-guide/configuration-parameter-reference/mail_domain) = `<your mail domain name>`
  * [mail_host](/administrators-guide/configuration-parameter-reference/mail_host) = `<your SMTP mail hostname or IP address>`
  * [mail_administrator](/administrators-guide/configuration-parameter-reference/mail_administrator) = `<address or mailing list to receive supervisor-related emails; warnings, license notifications, etc.>`

If your email server requires SMTP AUTH, which most modern systems do, you
will need to further set up the following 3 parameters:

  * [mail_connection_type](/administrators-guide/configuration-parameter-reference/mail_connection_type) = `<DEFAULT|SSL|TLS>`
  * [mail_user](/administrators-guide/configuration-parameter-reference/mail_user) = `<your SMTP AUTH user name>`
  * [mail_password](/administrators-guide/configuration-parameter-reference/mail_password) = `<your SMTP AUTH password>`

Optionally, you may specify the [mail_port](/administrators-guide/configuration-parameter-reference/mail_port) if the
SMTP server listed in [mail_host](/administrators-guide/configuration-parameter-reference/mail_host) is listening on a
port other than one of the default ports (25 for DEFAULT, 465 for SSL, and 587
for TLS). Leaving mail_port commented out or setting it to 0 will use the
default.

The SMTP host may need to be configured to accept and forward mail from your
supervisor host machine.  You will need to refer to the documentation for
your particular SMTP mail host's application.

:::warning
You will need to restart the supervisor service in order to apply your
changes. See: [Restarting the
Supervisor](/administrators-guide/managing-qube/common-supervisor-actions/Restarting+the+Supervisor)
:::

## Testing

You may use the [qbadmin](/advanced-users-guide/command-line-reference/qbadmin) command from any workstation
to test your supervisor's mail capabilities.  The output is the result of the
conversation between your supervisor and the SMTP host.

```
==================================================================================

jburk$ qbadmin s --emailtest  
START

RECV(l=70)  
data=[220 omta16.emeryville.ca.mail.comcast.net comcast ESMTP server ready  
]

SENT  
HELO jburk-17-mbPro.local

RECV(l=84)  
data=[250 omta16.emeryville.ca.mail.comcast.net hello [24.20.42.74], pleased
to meet you  
]

SENT  
MAIL FROM:<[qube@pipelinefx.com](mailto:qube@pipelinefx.com)>

  
RECV(l=43)  
data=[250 2.1.0 <[qube@pipelinefx.com](mailto:qube@pipelinefx.com)> sender
ok  
]

SENT  
RCPT TO:<[jburk@pipelinefx.com](mailto:jburk@pipelinefx.com)>

  
RECV(l=47)  
data=[250 2.1.5 <[jburk@pipelinefx.com](mailto:jburk@pipelinefx.com)>
recipient ok  
]

SENT  
DATA

  
RECV(l=50)  
data=[354 enter mail, end with "." on a line by itself  
]

SENT  
From: "Qube! - Supervisor" <qube>  
Organization: PipelineFX  
To: [jburk@pipelinefx.com](mailto:jburk@pipelinefx.com)  
Subject: qbadmin - test email  
Content-Type: text/plain; charset=us-ascii  
Content-Transfer-Encoding: 7bit

This is a simple test mail send from qbadmin.  
.

  
RECV(l=67)  
data=[250 2.0.0 Xa9o1k00A1c0X0g8ca9oay mail accepted for delivery  
To: jb]

SUCCESS



SUCCESS: sent mail to user:
[jburk@pipelinefx.com](mailto:jburk@pipelinefx.com) via: smtp.comcast.net

==================================================================================
```

If everything goes well, you should receive an email containing "`This is a
simple test mail send from qbadmin.`" in the message body.

If you **don't** see the `SUCCESS` lines, chances are your SMTP server is
either incorrectly specified, not reachable, or refusing the connection.


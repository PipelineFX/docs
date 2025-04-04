---
sidebar_position: 2
---

# How do I look at the last few lines of an output log on Windows?

On POSIX compliant systems like Unix/Linux/macOS, the utility is called "tail."
However, you will have to find a replacement. Look here for Unix tools for Windows:

http://unxutils.sourceforge.net

On Github you can also find tail.exe separated from the other tools:

https://github.com/alkuzad/unxutils-separated/releases


Qube! also provides a utility in $QBDIR/utils called qbtail.py. This
works just as the tail command would on Linux/macOS, but it does require that
Python is installed.
 
```
C:\Program Files\pfx\qube\utils>qbtail.py -h
Usage: qbtail.py [options] filename

The qbtail utility displays the contents of file to the standard output.
The display begins at a byte or line location in the input. Numbers are
relative to the end of the input, for example, '-n 2' displays the last two
lines of the input. The default starting location is '-n 10', or the last
10 lines of the input.

Options:
  -h, --help  show this help message and exit
  -c CHARS    The location is number bytes.
  -n LINES    The location is number lines.
  -f          The -f option causes tail to not stop when end of file is
              reached, but rather to wait for additional data to be appended
              to the input.

C:\Program Files\pfx\qube\utils>qbtail.py C:\ProgramData\Pfx\Qube\logs\workerlog

[Jan 20, 2014 17:58:36] BRIANKNUDSO15E2[1136]: waiting for udp socket to open up - port: 50011
[Jan 20, 2014 17:58:46] BRIANKNUDSO15E2[1136]: waiting for udp socket to open up - port: 50011
[Jan 20, 2014 17:58:56] BRIANKNUDSO15E2[1136]: waiting for udp socket to open up - port: 50011
[Jan 20, 2014 17:59:06] BRIANKNUDSO15E2[1136]: waiting for udp socket to open up - port: 50011
[Jan 20, 2014 17:59:16] BRIANKNUDSO15E2[1136]: waiting for udp socket to open up - port: 50011
```


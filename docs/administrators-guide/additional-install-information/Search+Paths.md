---
sidebar_position: 5
---

# Search Paths

Having the Qube! commands available in the path from the command-line can be useful. Here is what is needed to set this up:

- Linux (~/.cshrc/ or ~/.tcshrc):
  * setenv QBDIR /usr/local/pfx/qube
  * set path = ($path $QBDIR/bin $QBDIR/sbin)
- Linux (~/.bashrc):
  * export QBDIR=/usr/local/pfx/qube
  * export PATH=$PATH:$QBDIR/bin:$QBDIR/sbin
- macOS (~/.bashrc):
  * export QBDIR=/Applications/pfx/qube
  * export PATH=$PATH:$QBDIR/bin:$QBDIR/sbin
- Windows:   The .msi automatically adds the C:\Program Files\qube\bin to the PATH.

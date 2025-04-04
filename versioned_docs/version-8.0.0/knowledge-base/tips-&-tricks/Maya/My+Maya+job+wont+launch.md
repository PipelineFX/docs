---
sidebar_position: 3
---

# My Maya job won't launch

Looks like your account isn't set up to include the maya bin directory in the
PATH environment. Make sure you set up the MAYA_LOCATION as well.

If your shell is /bin/bash put the following in your $HOME/.profile:

``` 
export QBDIR=/Applications/pfx/qube
export ALIAS_LOCATION=/Applications/Alias
export MAYA_LOCATION=$ALIAS_LOCATION/maya7.0/Maya.app/Contents
export PATH=$QBDIR/bin:$QBDIR/sbin:$MAYA_LOCATION/bin:$PATH
``` 

On csh/tcsh, the following into your $HOME/.cshrc or $HOME/.tcshrc:

``` 
setenv QBDIR /Applications/pfx/qube
setenv ALIAS_LOCATION /Applications/Alias
setenv MAYA_LOCATION $ALIAS_LOCATION/maya7.0/Maya.app/Contents
setenv PATH $QBDIR/bin:$QBDIR/sbin:$MAYA_LOCATION/bin:$PATH
``` 


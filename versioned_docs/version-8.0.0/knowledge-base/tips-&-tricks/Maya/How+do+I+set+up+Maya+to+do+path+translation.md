---
sidebar_position: 1
---

# How do I set up Maya to do path translation?

Your Windows clients need to translate the paths into something understandable
by the Linux/macOS Workers. To do this, we sometimes recommend the use of
the MEL command dirmap. It has the capability to do the translation, and we
have support for it in our Job Type. It has some limitations, so it's not for
every situation.

In order to set up the dirmap, you will need to edit each users userSetup.mel
file. Copy it around. In it, you add a line to enable dirmapping:

`dirmap -en 1;`

Then, you add the map such that the first directory is the FROM and the second
is the TO mapping:

`dirmap -m "<windowsDirectory>" "<linuxDirectory>"`

For example:

`dirmap -en 1;`
`dirmap -m "R:Project" "/uniserver/project"`

To test if you have it set up correctly:

1. launch Maya
2. bring up a Maya shell
3. Type dirmap -gam

You should then see your mappings as output.

When you submit the job, the mappings should be translated when the job gets
submitted. It may take some finagling to get everything working.


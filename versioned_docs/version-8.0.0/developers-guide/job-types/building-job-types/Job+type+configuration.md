---
sidebar_position: 2
---

# Job type configuration

The purpose of the job.conf is to describe to Qube! the vital statistics about
the Job Type, and where to find the auxiliary files for both submission and
execution.  

The format of the job.conf file is:

```
<comment>[topic]key = value
```

The location of the job.conf file is inside the Job Type directory. For
example, on Linux, the Maya job.conf file is found at

```
/usr/local/pfx/jobtypes/maya/job.conf
```

Example job.conf file.

```
##  
[description]  
detail = "Simple String Description"  
## The specification of the file is always relative to  
# the job.conf's directory.  
## You are also allowed to fork the implementation  
# specification by using the operating system specific  
# tags which automatically override the standard tag  
# as long as it is defined.  
##  
[execute module]  
execute_binding = Perl  
execute_library = perl.pm  
execute_binding_osx = Dylib  
execute_library_osx = file.dylib  
execute_binding_linux = Dso  
execute_library_linux = file.dso  
execute_binding_irix = Perl  
execute_library_irix = file.pm  
execute_binding_winnt = Dll  
execute_library_winnt = file.dll  
  
## To specify the GUI submission  
#  
[GUI module]  
GUI_submit_binding = Html  
GUI_submit_library = submit.html  
GUI_icon = icon.xpm  
##
```


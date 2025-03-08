---
sidebar_position: 1
---

# Execution back end

When designing the Job Type, the developer must decide on both the method to
execute the job, and the name of the file to bind.  

## Example
  
Specifying a file binding is simple. You must include both the 'type' of
binding, and the name of the file.  

```
execute_binding = Perlexecute_library = _filename_.pm
```

The available binding types are:

Dylib | macOS dynamic library | \*.dylib  
---|---|---  
DSO | Linux/Unix dynamic library | \*.dso  
Perl | Perl package module | \*.pm, \*pl  
Python | Python script module | \*.py  
DLL | Windows dynamic link library | \*.dll  
  

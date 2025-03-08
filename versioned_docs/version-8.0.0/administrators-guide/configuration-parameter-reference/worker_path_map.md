---
sidebar_position: 110
---

# worker_path_map

## Synopsis

```
   worker_path_map =  
   "pathA" = "pathB"  
   ...  
}
```

Specify the path translation map for a worker.  Any job that supports path
translation (have the convert_path [job flag](../../knowledge-base/Job+Flags) set,
or any pyCmdline, pyCmdrange, or AppFinder jobs) will have `pathB` substituted
for `pathA` when the job runs on the worker.

### Syntax

* One key/value pair per line.
* All key/value pairs are defined with an = (equals) sign. The space before and after the equals sign is optional. The leading whitespace is optional.
* All values must be quoted with double-quotes.
* The closing brace must be on a new line. 
* Backslashes must be escaped by preceding with another backslash, i.e. "\\\\"

:::warning[&emsp;]
The mappings are applied in order, so we recommend that you provide the **"/
= \\\\"** or **"\\ \\ = / "** mappings as either the first or last entries in the map.
:::

## Examples

### Windows worker:

```
   worker_path_map = {  
   "/Volumes/farm" = "//Server/farm"  
   "/Users/jburk" = "Z:"  
   "/Users/jburk/test" = "Y:"  
   "/tmp" = "C:/temp"  
   "/" = "\\"  
}
```

### macOS / Linux worker:

```
    worker_path_map = {  
    "\\" = "/"  
    "//Server/farm" = "/Volumes/farm"  
    "Z:" = "/Users/jburk"  
    "Y:" = "/Users/jburk/test"  
    "C:/temp" = "/tmp"  
}
```

## Defaults

None

## See Also

[AppFinder Jobs](../../advanced-users-guide/job-reference/AppFinder+Jobs)


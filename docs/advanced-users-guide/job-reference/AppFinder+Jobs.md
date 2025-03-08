---
sidebar_position: 13
---

# AppFinder Jobs

:::info

AppFinder jobs require that Python be installed on each executing worker.

:::

## What are they, and what do they do?

These jobs differ from the standard SimpleCmd cmdline and cmdrange based jobs in that they will "find" a particular version of a 3rd-party application on the worker when the job runs.  This has several benefits:

-	The submitting user is not required to know that application's installation path on the remote worker.
-	Since the application does not include a hard-coded path to the 3rd-party application, the job is able to run across machines of differing operating systems at the same time.

:::info

The appFinder jobs do not perform a "best match" for version number. For example, if AfterEffects CS5.5 is specified, but not installed, it will not look for CS6. Instead, a warning message will appear in the job logs, and the job instance will be restarted on another worker.

:::

## Applications currently supported as AppFinder jobs in WranglerView:

-	AfterEffects (all versions)
-	Cinema4D (R14 and later)
-	Maya BatchRender

## How do they work?

When the job is submitted, the command line contains a "application template" that looks like \_\_XYZ\_\_  The XYZ portion between the double-underscores specifies which application to run. Currently, the following application templates are supported, as specified in the API library file $QBDIR/api/python/qb/backend/appDefaultPaths.py

-	AE
-	C4D
-	NUKE
-	MAYA

The job's package dictionary will contain an appVersion python tuple which specifies what version of that application to search for.  So if the command-line contains an \_\_AE\_\_ application template, and the package's appVersion is the tuple (6,), then AfterEffects CS6 will be used on the worker.  To specify CS5.5, the appVersion would be set to (5,5).

The jobtype backend code on the worker will examine the job's command-line and appVersion values, and check and see if a suitable application can be found on the worker.  Only the 3rd-party software developer's default installation paths for a given application are scanned.  See the section Supporting non-default installation paths with AppFinder if your studio installs applications in non-standard locations.

If a suitable application installation is found on the worker, the application template in the command-line is replaced with the path to the application's executable.  Something like the following should appear in the jobs' STDERR logs:

On an macOS worker:

```
INFO:CmdRangeBackEnd: attempting auto-pathing<br/>
INFO:CmdRangeBackEnd: Paths in the command have been translated as per this worker's worker_path_map<br/>
INFO:CmdRangeBackEnd: \_\_C4D\_\_ -nogui -frame 67 67 1 -render "/Users/kmac/Documents/C4D/test.c4d"<br/>
INFO:CmdRangeBackEnd: -> "/Applications/MAXON CINEMA 4D 2024/CINEMA 4D.app/Contents/MacOS/CINEMA 4D" -nogui -frame 67 67 1 -render "/Users/kmac/Documents/C4D/test.c4d"<br/>
```

The same job on a Windows worker:

```
INFO:CmdRangeBackEnd: attempting auto-pathing<br/>
INFO:CmdRangeBackEnd: Paths in the command have been translated as per this worker's worker_path_map<br/>
INFO:CmdRangeBackEnd: \_\_C4D\_\_ -nogui -frame 3 3 1 -oimage "/Users/kmac/Documents/C4D/renders/test" -render "/Users/kmac/Documents/C4D/test_R14.c4d"<br/>
INFO:CmdRangeBackEnd: -> "C:\Program Files\MAXON CINEMA 4D 2024\CINEMA 4D.exe" -nogui -frame 3 3 1 -oimage "Z:/Documents/C4D/renders/test" -render "Z:/Documents/C4D/test_R14.c4d"<br/>
```

Supporting non-default installation paths with AppFinder
If your studio does not install 3rd-party applications into standard locations, there are 2 approaches you can take:

Replace the application template \_\_XYZ\_\_ with the full path to the executable on the worker (not recommended)
Define your own application template in the worker's worker_path_map, and use that application template in the "executable" field in the job submission UI.  NOTE: this approach also requires that you set the 'convert_path' job flag in the submission UI's "Advanced Job Control" section.
 

For example, to implement approach 2 for a non-default installation of AfterEffects 2024, you could decide to use an application template of \_\_AE24\_\_.  Then, define this value in the worker's worker_path_map value (which can be managed via the central worker configuration file qbwork.conf).

Windows example:

```
worker_path_map = { 
    "/Users/kmac" = "Z:"
    "/Users/kmac/test" = "Y:"
    "/tmp" = "C:/temp",
    "__AE24__" = "D:/Programs/AfterEffects/CS6/aerender.exe"
}
```

macOS worker example:

```
worker_path_map = { 
    "Z:" = "/Users/kmac"
    "Y:" = "/Users/kmac/test"
    "C:/temp" = "/tmp"
    "__AE24__" = "/Volumes/HD2/3rd Party Apps/Adobe/AfterEffects/CS6/aerender.exe"
}
```


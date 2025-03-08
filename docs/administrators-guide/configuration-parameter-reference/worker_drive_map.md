---
sidebar_position: 94
---

# worker_drive_map

## Synopsis

The worker drive map feature, particular to Windows workers, which instructs
workers to automatically mount specified drives before they process jobs. If
there is a conflict due to the same drive letter being mapped in the
`worker_drive_map` _and_ in the job's drive mapping (sampled from the
submitting user's environment), the drive mapping in the `worker_drive_map` is
the one that will be used

:::warning[&emsp;]
This parameter also requires that the
[worker_flags](./worker_flags) have the `auto_mount` flag set.
:::

To make worker_drive_maps, either in each worker's qb.conf, or the
[qbwrk.conf](../../centralized-worker-configuration) in the supervisor, set the
following variable:

```
worker_drive_map = {X:|\\SERVER\SHARE  
}
```

To specify username/password for a worker drive map, the following syntax may
be used:

```
worker_drive_map = {X:|USER:ENCRYPTED_PASSWD@\\SERVER\SHARE
}
```

The `ENCRYPTED_PASSWD` parameter comes from the output of 
[qbhash](../../advanced-users-guide/command-line-reference/qbhash) or [qblogin](../../advanced-users-guide/command-line-reference/qblogin) --display.

:::warning[&emsp;]
The syntax for this parameter is very strict:

* the opening brace "\{" must be on the same line as the '**=** ' sign
* the first mapping definition must come immediately after the opening brace
* further mappings must be each on a new line, with no leading spaces
* no blank lines between mappings
* the closing brace must be on its own line, with no leading spaces
:::

## Examples

```    
worker_drive_map = {Z:|\\home\geebers  
}
    
worker_drive_map = {X:|USER:ENCRYPTED_PASSWD@\\SERVER\SHARE  
}
    
worker_drive_map = {Z:|qubeuser:0fbc8b129210914f769564cbd30ae5cb4397f9615299ce8d1e1cf065e97bf063@\\rnd\home  
}
    
worker_drive_map ={X:|qubeuser:0fbc8b129210914f769564cbd30ae5cb4397f9615299ce8d1e1cf065e97bf063@\\rnd\home  
Y:|qubeuser:0fbc8b129210914f769564cbd30ae5cb4397f9615299ce8d1e1cf065e97bf063@\\rnd_2\home2  
}
```

## Defaults

None


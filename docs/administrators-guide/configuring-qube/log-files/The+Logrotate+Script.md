---
sidebar_position: 6
---

# Log logrotate.py Script

## Location

| OS       | Path                                         |
|----------|----------------------------------------------|
| macOS:   | /Applications/pfx/qube/utils/logrotate.py    |
| Windows: | C:\Program Files\pfx\qube\utils\logrotate.py |

## Usage
```
Usage: logrotate.py [-s <logSize> -k <logCount>] <logFile>

Options:
  -h, --help            show this help message and exit
  -s MAX LOG SIZE, --size=MAX LOG SIZE
                        log size threshold which will trigger a log rotation -
                        eg. 100000000, 100000K 100M, 0.1G
  -k COUNT, --keep=COUNT
                        number of logs to keep - default: 4
  -n, --dry-run         do a dry run, but do not actually perform the
                        rotation; implies verbose=True
  -v, --verbose       
```

## Examples

| Command                                    | Action                                                                                        |
|--------------------------------------------|-----------------------------------------------------------------------------------------------|
| $ logrotate.py -s 75M /var/log/supelog     | Rotate the supelog at 75M                                                                     |
| $ logrotate.py -s 0.25G /var/log/workerlog | Rotate the workerlog at 250M (0.25G == 250M)                                                  |
| $ logrotate.py -n -s 50M /var/log/supelog	 | Display what the log rotation script will do, but do not actually do the rotation (a dry run) |

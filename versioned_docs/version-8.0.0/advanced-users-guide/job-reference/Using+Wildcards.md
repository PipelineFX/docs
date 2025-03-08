---
sidebar_position: 16
---

# Using Wildcards, Regular Expressions, and General Expressions to Filter Jobs and Hosts

## Synopsis

Qube! allows the use of wildcard patterns and regular expressions (regex) to perform string matching in many text/string parameters that are used as filters.

For example, with the qbjobs command, you can filter jobs based on the job's name, user, cluster, group, etc., using wildcards or regular expressions.

Wildcards and Regular Expressions are not only supported by command line tools, but also by API routines.

Some commands, namely qbjobs and qbhosts, also support general expressions to filter jobs and hosts, respectively.

## Simple Wildcards
Starting a filtering parameter with either "\*" or "%" indicates that you're using wildcards.  In the string, you can use "%" to match any number of chars, and "\_" to match a single char.

**Examples**
| Command | Meaning |
| ---     | ---     |
| qbjobs -name "\*testjob%"  | list all of my jobs with a job name that starts with "testjob" |
| qbjobs -name "%maya%"     | list all of my jobs with a job name that starts with "maya", like "maya render myscene.ma", or "mayabatch" |
| qbjobs -name "%%maya%"    | list all of my jobs with a job name that includes "maya" anywhere, like "mymayajob", or "not a maya job" |
| qbkill -cluster "%/proj_" 0  | kill all jobs that were submitted to clusters that are like /projA, /projX, /proj1, ... |
| qbhosts -group "%rendserv%"    | list all hosts that belong to a group with a name that starts with "rendserv" |

 

Note that the qbjobs command only displays your own jobs by default, unless you use the special wildcard "all" in the "-user" field, used as in:

```
qbjobs -u all
```

Regular Expressions
Starting a filtering parameter with "~" (tilde) tells the system that you're using a regular expression. Perl-style regex (or Perl Compatible Regex, PCRE) is supported (but without the \s,\S,\d an \D short cuts).

**Examples:**
| Regex | Meaning |
| ---   | ---     |
| [0-9] | all numbers 0 to 9 |
| [abc] | either a, b or c |
| + | requires at least 1 |
| * | 0 or more characters |
| ? | requires 1 |
| ^ | beginning of line |
| $ | end of line |
| () | logical group |
| | | or |

**Examples**
| Command |
| ---     |
| qbjobs -u "~^fred" |
| qbjobs -type '\~^cmd(range\|line)$' -name "~^maya.\*" |
| qbhosts -cluster "~^/proj." |

## General Expressions
The qbjobs and qbhosts commands support filtering by expressions. More specifically, qbjobs supports expressions in its "-expression" option, while qbhosts supports it in its "-resources" option.

Expressions are detailed in the "Job Requirements" page, but here are some examples.

**Examples**
| Command | Meaning |
| ---     | ---     |
| qbjobs -expression "id \>= 1000 \&\& id \<\= 2000"    | list all my jobs with job ID between 1000 and 2000, inclusive | |
| qbjobs -expr "priority \<= 100 \&\& (status=failed \|\| status=killed)"  | list all my jobs with priority 100 or higher, that failed or were killed |
| qbhosts -resource "host.processor_speed \> 4000"    | list all hosts faster than 4000 Hz |
| qbhosts -resource "host.memory.avail \>= 4000"    | list all hosts with available memory of at least 4000 MB |

## See also
PCRE (Perl-compatible Regular Expressions) documentation at http://www.pcre.org/original/doc/html/

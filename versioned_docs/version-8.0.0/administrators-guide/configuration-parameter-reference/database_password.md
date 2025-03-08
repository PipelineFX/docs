---
sidebar_position: 12
---

# database_password

## Synopsis

`database_password` = _encrypted password_

Sets _password_ to the database password for database_user. Use the [qbhash](../../advanced-users-guide/command-line-reference/qbhash) command, found in the "bin" folder, to generate the encrypted password.

:::warning
For backwards-compatibility, the system will also take the password stored in clear-text, but it is recommended to use the encrypted string, for obvious security reasons.
:::

## Example

database_password = 0fbc8b129210914f769564cbd30ae5cb4397f9615299ce8d1e1cf065e97bf063

## Defaults

"" (empty)


---
sidebar_position: 7
---

# Service Mode: Windows: User Rights Assignment

On Windows a Qube! worker running in [Service Mode](./Service+Mode+vs+Desktop+User+Mode) requires the following security policy settings.

| Group Policy Setting | Constant Name |
|----------------------|---------------|
| [Act as part of the operating system](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/security-policy-settings/act-as-part-of-the-operating-system) | SeTcbPrivilege |
| [Adjust memory quotas for a process](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/security-policy-settings/adjust-memory-quotas-for-a-process) | SeIncreaseQuotaPrivilege |
| [Debug programs](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/security-policy-settings/debug-programs) | SeDebugPrivilege |
| [Impersonate a client after authentication](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/security-policy-settings/impersonate-a-client-after-authentication) | SeImpersonatePrivilege |
| [Replace a process level token](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/security-policy-settings/replace-a-process-level-token) | SeAssignPrimaryTokenPrivilege |

When the user rights are correctly set you will see the following output in the [workerlog](../log-files/Worker+Logs).

```
QbWorker::enableRequiredPrivileges(): enabling required privileges for this process
INFO: successfully enabled required privilege[SeAssignPrimaryTokenPrivilege]
INFO: successfully enabled required privilege[SeIncreaseQuotaPrivilege]
INFO: successfully enabled required privilege[SeTcbPrivilege]
INFO: successfully enabled required privilege[SeImpersonatePrivilege]
INFO: successfully enabled required privilege[SeDebugPrivilege]
INFO: successfully enabled all required privileges
```

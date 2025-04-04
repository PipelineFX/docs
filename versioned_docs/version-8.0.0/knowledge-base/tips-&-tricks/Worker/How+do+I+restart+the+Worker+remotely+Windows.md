---
sidebar_position: 5
---

# How do I restart the Worker remotely? (Windows)

Submit a remote job:

```
qbsub --host <hostname> "net stop qubeworker && net start qubeworker"
```

Windows 10 and later now come with ssh included:

```
ssh <hostname> "net stop qubeworker && net start qubeworker"
```


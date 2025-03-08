---
sidebar_position: 3
---

# Restoring Lost Admin Privileges

Since the qbusers command has the capability of altering any user permissions, the scenario exists for an admin user to remove their own admin privileges. Should this happen, it becomes impossible to immediately restore the privileges, because the ability to grant admin privileges also requires the user to have admin privileges.

Here is a workaround that can be used in order to restore admin privileges. However, this workaround will require system access privileges, including the ability to login as another user, and to have access to the Supervisor configuration and operation. The steps listed use the qbusers command, but these steps can similarly be performed using the QubeUI.

1. First, determine if there are any Qube! admin users:
```
  % qbusers -list
  ---l jcg krmpbuicseyqg-vft [default]
  asil jcg krmpbuicseyqgpvft Administrator
  asil jcg krmpbuicseyqgpvft qube
  asil jcg krmpbuicseyqgpvft root
  asil jcg krmpbuicseyqgpvft system
```

2. Qube! installs with the Windows Administrator user and the Unix root already set up with admin privileges. If any of those users (or any other admin user) still have admin privileges, log out and log back in as that user, and use qbusers to restore admin privileges:
`% qbusers --add --all --admin username`
If for some reason there are no users with admin privileges, you will need to add admin privileges to the default user, and then login as any default user in order to restore the privileges. Login to the Supervisor as Administrator, root, or any user with administrator privileges.

3. Launch the QubeUI and specify "Administration->Configure (local)...".

4. Under "Supervisor", click on the choices for "supervisor_default_security".

5. Check the box next to **Administrator**.

6. Click the **OK** button, and confirm when prompted to restart the Supervisor.

7. Logout, and log back in as any user not explicitly listed in the output from the qbusers --list command.

8. Launch the QubeUI UI and update the user permissions under the "User Layout" tab or use the qbusers commandline call
`% qbusers --add --all --admin username`

9. Login to the Supervisor as an Administrator, root, or any user with administrator privileges and set the "supervisor_default_security" back to not have "Administrator" checked. Restart the Supervisor

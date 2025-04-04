---
sidebar_position: 7
---

# I'm getting "file not available" errors on my Windows jobs

Most likely, your drives are not mapped correctly on the Worker. Here are some
notes on how to make sure your Workers can properly map drives at execution time:

1. The Worker will automatically try to map:
	* all the drives mapped on the submitting machine
	* any additional maps specified on the submitting machine using the Configuration GUI in the section "Windows Drive Map."   
	* If you need to reference a domain account, use the Windows domain specification format (DOMAIN\USER) in the login field.
2. On the Worker, Qube! will not automatically fill in authentication for any of the drives that were mapped on the submitting machine, so you will need to set up in advance on the Worker, the authentication for either the submitting user (Worker in user mode) or the proxy user (Worker in proxy mode) making sure to check "map at login."
3. Drive maps that were specified in the Configuration UI will be authenticated using the login and password information specified.

Check out the next two articles for more information on drive sharing with Qube!.

* [Render errors that say "file not found." when using UNC paths.](/knowledge-base/tips-tricks/Windows/Render+errors+that+say+file+not+found+when+using+UNC+paths)
* [UNC path is an invalid current directory path. UNC paths are not supported. Defaulting to Windows directory.](/knowledge-base/tips-tricks/Windows/UNC+path+is+an+invalid+current+directory+path)


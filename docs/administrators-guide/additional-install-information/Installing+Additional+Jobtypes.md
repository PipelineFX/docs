---
sidebar_position: 6
---

# Installing Additional JobTypes

Some of the application interfaces construct a command-line that is then run directly on the Workers and do not require any additional installation. Other application interfaces (like Maya, 3dsMax, and XSI) are controlled via (perl or python) scripts. These scripts are installed on the Worker by installing the desired jobtypes.  

The application interfaces with these back-end scripts need to be installed on the Workers. Similarly, there are a few jobtypes that also have front-end scripts to provide in-application submission that should be installed on the Client machines. 

See http://www.pipelinefx.com/technical-specifications/ for a list of supported job types. Search http://docs.pipelinefx.com for details on the specific application interfaces that you are using.

Note: You can centrally install these jobtypes on the network fileserver. See the configuration parameter worker_template_path for the search path used by the Workers for their jobtypes. Also see Centralized JobTypes **need links**.

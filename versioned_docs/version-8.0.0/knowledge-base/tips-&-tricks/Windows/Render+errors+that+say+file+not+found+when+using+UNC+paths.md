---
sidebar_position: 8
---

# Render errors that say "file not found." when using UNC paths.

1. Our system will automatically map Windows drives based upon whether the jobs and Workers have "auto_mount" enabled. We will detect the maps on the client machine, add any maps specified in the client configuration, and send them along with the job to be automatically mapped on the Worker at execution time. If you don't refer to mapped drives, and instead use UNC, this would be irrelevant.
2. Your servers will need to allow the Qube! proxy user ("qubeproxy") full access to the server. In order to authenticate, the proxy account and password should be added to the AD server so that when the qubeproxy attempts to reference the UNC path, it can be authenticated. The password we locally install on each Worker is:

`Pip3lin3P@$$wd`

Of course, the qubeproxy user will need to be added to appropriate groups in
order to have read and write permission to the server.

3. We only reference the PDC for authentication, so if you have a BDC, you may see some difficulties with authentication of some machines are binding to a BDC or other secondary domain controller.
4. Each job is a description of where to find the scenefile and where to write the output. This description must remain consistent across your farm, or the job will fail. For example, if you reference the scenefile at myservermayamyscene.ma when you submit the job, it can't be located on the Worker at yourservermayamyscene.ma and still work. It will fail.
5. In order to troubleshoot problems with drive mapping initially submit test jobs that try to reference the directories in question, so that you can verify the jobs are able to access the server properly, for example: qbsub --host main1 dir 192.168.1.200Live_Jobs Once you get the correct directory output, you should be able to submit the render job as well.


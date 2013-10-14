Use Case

In a multi-tenant Alfresco, I want to be able to use IMAP4, which is not supported in this situation, except for the host (the main tenant).

A work around consists in mounting other tenants through webdav to be able to copy content from one tenant to another, and then to extract meta-data through a content rule. This feature sounds like the replicate one which is unfortunately unavailable on multi-tenant systems.

Summary

The Alfresco host server acts like the main tenant which receives mails for other tenants then, through webdav, copied them to other tenants.

In very short, Replicate = WebDAV + Content Rule

Solution

The solution is based on mount.davfs.

You can install it through the davfs debian package. Just do:

apt-get install davfs
Mount.davfs Configuration

You then need to edit:

/etc/davfs/secrets, to indicate for each mount point the user and passwd to use
/etc/davfs/certs/yourserver.pem, to indicate the certificate for your alfresco webdav server, using SSL
My /etc/davfs/secrets file contains the following:

/mnt/davfs/test2-admin admin@test2 xxxx
/mnt/davfs/test1-admin admin@test1 xxxx
/mnt/davfs/demo2-admin admin@demo2 xxxx
/mnt/davfs/demo1-admin admin@demo1 xxxx
/mnt/davfs/main-admin admin xxxx
where xxxx must be replaced by your password for each tenant. You can of course make some mountings with other user accounts than the admin one.

You can then mount your webdav server on your mount point. For example:

mount -t davfs https://your.alfresco.server/alfresco/webdav /mnt/davfs/main-admin
where /mnt/davfs/main-admin is a directory you created before the mount command

You can then use your remote alfresco server like any usual file systems and copies the data.

For example, I do:

cp -rf /mnt/davfs/main-admin/Imap\ Home/admin/INBOX/Alfresco/* /mnt/davfs/test1-admin/Sites/test1/documentLibrary/test/Alfresco
Meta-data Extraction Through Content Rule

E-mails are now available in my tenant, but they aren't seen like emails. So, I need to extract the meta-data corresponding to e-mails. To achieve that, I just have to create a content rule which will be triggered on new elements. This content rule will extract common meta-data from freshly copied emails.

Conclusion

It's a little hacky but it does the job!!!

Resources

http://linux.die.net/man/8/mount.davfs
http://www.linuxquestions.org/questions/linux-software-2/force-accept-certificates-when-using-mount-davfs-632056/ to automatically accept certificates when mounting the WebDAV resource with SSL
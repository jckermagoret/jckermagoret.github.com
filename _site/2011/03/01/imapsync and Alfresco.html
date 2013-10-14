Use case

The YaMma (Yet Another Mail Management Application) project aims at managing mails and emails. So we want a way to input emails into the repository, which is for instance an Alfresco one. Moreover, Alfresco provides IMAP support but it lacks one important feature -IMAPS, has one important bug -folder doesn't refresh quickly, a huge drawback -the necessity to configure a new IMAP account on each customer computer.

Solution

To circumvent all these problems, there is a very simple solution, which only consists to create a folder, called Alfresco for example, in each already existing IMAP account of our customers. Then, we'll just need to synchronize this one with the existing IMAP account each customer has. We avoid the 3 previous drawbacks:

no security hole: imapsync supports SSL so by using it on my Alfresco server, I can connect to host1 with IMAPS and to host2 with IMAP through localhost which is safe
my Alfresco folder is always updated like my other mail folders, no refresh problem anymore
no need to install anything on the customer's computer
Which Software?

I had a look at imap synchronization software. I noticed isync and imapsync:

iSync was interesting but there was a final bug preventing me to make things work
imapsync made finally the job but the final solution needed a few hours to get everything ok. So, here is the solution.
Installation

First, make :

apt-get install imapsync
This will install the required libraries for imapsync. Then, go on fedorahosted and get the last available imapsync version (1.434 the 2011-05-25).

If you are using debian Squeeze, imapsync seems not to be available anymore. Don't worry, just add the following into your /etc/apt/sources.list to use the package available for lenny: * deb http://ftp.debian.org/debian lenny main contrib
Then update your sources with the following: * apt-get update
Then just do:

tar xzvf imapsync-xxx.tgz
cd imapsync-xxx
perl -MCPAN -e shell
install Mail::IMAPClient
make install
Synchronization

It's now time to write a little script, called for example imapsync.sh, to make the migration occur. Note that host2 is the server where my Alfresco server resides. On host1 resides my IMAP server with my mailbox. I created an Alfresco folder in it and I only synchronized this one.

///

!/bin/sh
imapsync \

       -host1 yourhost1 -ssl1 -user1 mylogin@bluexml.com -passfile1 pass1.txt -folder INBOX.Alfresco \
       -host2 localhost -prefix2 "INBOX/" -sep2 "/" -user2 myLoginOnAlfresco -passfile2 pass2.txt \
       -useheader Subject -useheader Date \
       -noauthmd5 -syncinternaldates
///

If you want some debug information, just add debug debugimap.

Finally, just type the following:

sh imapsync.sh
If you make a man imapsync, you'll find a very interesting script to synchronize a set of mailboxes with different users and passwords. The script may be very easily updated to indicate also the folder you want to synchronize.
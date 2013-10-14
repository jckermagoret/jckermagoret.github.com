Use Case

How to manage emails in a document management system so it is as convenient as a mail client? Not only plain emails with only a text body, but complex ones with a text body, an html one, one or more attachments?

Requirements

Manage emails means:

file them
process them through workflows
link to them
reuse them
resend them
Analysis

Mails can be seen:

as a whole: the .eml file
as a set of parts: the meta-data, the text body, the attachments
While the .eml file is interesting from a legal point of view, it is not practical because of the necessity to process it each time you want to access it. In contrast, the set of parts, while very interesting from accessibility is more difficult to prevent from modifications.

Solution

The obvious solution is to mix the 2 solutions. So:

REQ1 : a folder to store all the parts of the mail with a name corresponding to the mail subject
REQ2: body
REQ3: attachment1, attachment2, ...
REQ4: some meta-data added to an element (folder or body?) to store a link on the .eml archive
REQ5: ability to link from any document to the mail parts
Alfresco

The solution provided by Alfresco doesn't meet our requiremsnts. In Alfresco, through IMAP subsystem, messages are stored like the following:

Message_1717.eml, the archive with all the embedded content
Message_1717.eml-attachments, a folder with all the attachments extracted from the previous .eml
It is not very interesting from a user point of view when browsing the application (Share or another one) because file names are not readable. Attachment names are readable, but not the text body corresponding to the main message which is encapsulated into the .eml file.

To achieve:

REQ1: store the Message-1717.eml file into the corresponding folder (+-attachments), extract the mail subject and rename the folder and the body to this latter
REQ2: extract the body by transforming the email to text
REQ3: attachments are ok
REQ4: extract meta-data from the document by playing the extract common action on the message
REQ5: let access to the elements and still protecting them from modifications
Finally, the order to follow is:

REQ1: this can be done during file replication from system 1 to 2 in a multi-tenant Alfresco server
REQ4: configure an action to extract meta-data
REQ2: configure an action to transform the content
REQ3: attachments are still ok
REQ5: security configuration
REQ1 can be done through file manipulations REQ4 and REQ2 can be done in the same action. REQ5 is Alfresco configuration

Precautions

Folders containing mails must be preserved from modifications.

Conclusion

By adding workflows, launched automatically, it is possible to get an (e)mail management system. Based on a multi-tenant system, this architecture my provide the base for the YaMma application.
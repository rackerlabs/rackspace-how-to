---
permalink: common-email-bounces/
audit_date:
title: Common Email Bounces
type: article
created_date: '2017-05-18'
created_by: William Loy
last_modified_date: '2017-05-23'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---
**Applies To:** Account Administrator


## Common Email Bounces

### Overview:
Causes of common bounce messages and how to resolve the underlying issue.

**What is a “bounceback” message?**
Bounce messages give a brief report of why a message will not deliver. Bounce messages vary from mail provider to mail provider. If you do not see your particular bounce error here, you can reference the mail provider you were sending to for an interpretation of their bounce.

#### Before continuing
If Rackspace bounced your message, the generating server should show: emailsrvr.com. If you do not see emailsrvr.com in the bounce, the recipient’s provider likely blocked the message.


|SMTP Error|	Explanation|	Solution|
|----------|-------------|----------|
|**450 4.1.8 <user@domain.com>:** Sender address rejected: Domain not found| The recipient is unable to verify the existence of your domain.|	Verify that your domain’s DNS is properly configured [here](how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business)|
|**451 4.3.0 <servername[xx.xx.xx.xx]>:** Client host rejected: Throttled - Too much spam from your mail server. Try again later.| The recipient’s server has received too much spam from this source.|	Try sending the message again later. Follow these steps [Best practices for sending person-to-person email](/how-to/best-practices-for-sending-person-to-person-email/) or [Best practices for sending emails to many recipients](/how-to/best-practices-for-sending-emails-to-many-recipients/) to avoid being marked as spam. Ask the recipient to Safelist/Whitelist your domain.|
|**451 4.3.0 <user@domain.com>:** Temporary lookup failure|	An intermittent issue has occurred.|	Wait and send the message again at a later time.|
|**421** "Too many concurrent connections from this client (G2)"|	The sending IP has too many concurrent connections with our servers.|	Reduce concurrent connections to our servers to five or less.|
|**4.4.1 <user@domain.com>** The recipient's server was temporarily unavailable to accept your message (G6)|	When your domain is Split Domain Routing enabled and the recipient's address (hosted on the external mail server) soft fails.| The message will be deferred to be resent at a later time. Ensure the external mail server is up and running and accepting connections over port 25 (SMTP).|
|**504 5.5.2 <user@nonqualifieddomain>:** Sender address rejected: need fully-qualified address|	The domain you are sending from is not valid.|	You must use a valid domain for sending email.|
|**550** Your message has been rejected because you have been detected sending spam.| The content of this message has been deemed as spam by the internet community| Spam definitions change rapidly. However, there are measures you can take to prevent having your message rejected as spam. Please reference [Best practices for sending person-to-person email](/how-to/best-practices-for-sending-person-to-person-email/) or [Best practices for sending emails to many recipients](/how-to/best-practices-for-sending-emails-to-many-recipients/)|
|**550 5.1.0 <user@domain.com>:** Sender address rejected: User unknown in relay recipient table|	Your domain exists in Rackspace, but the full email address you have sent from does not.|	Create the address in the form of a mailbox, list, or alias to send mail from Rackspace Cloud Office.|
|**550 5.1.1 <user@domain.com>:** Recipient address rejected: User unknown in relay recipient table|	The recipient's email address does not exist in the Rackspace hosted domain.|	Add email address to Rackspace hosted domain.|
|**550 5.7.1 <user@domain.com>:** Relay access denied|	This error usually indicates that the address you are sending to does not exist or there is an issue with the recipient domain's DNS configuration.|	Check the recipient address for any misspellings/typos. Resend the message. If the recipient is hosted at Rackspace Cloud Office, please have them verify their DNS is properly configured to receive mail. [Set up DNS records for Cloud Office Email](set-up-dns-records-for-cloud-office-email-and-skype-for-business/)|
|**550 5.3.4** Message too large (G17)|	The message exceeded the maximum message size allowed by our servers (75 megabytes).|	The sender will need to ensure the message size is under the allowed threshold and re-send the message.|
|**550 5.7.0** [blocked file] - Your message has been rejected because it contains a banned file attachment (G1A)|	The message contains an attachment on the blocked file type list. Blocked Attachment List / File Type Extensions for RSEmail, Exchange and SharePoint| Remove the banned file type and re-send. [Cloud Office blocked attachment list](/cloud-office-blocked-attachment-files/)|
|**550 5.7.0** [blocked file] - Your message has been rejected because it contains a banned file attachment (G1B)|	The message contained an attachment on Outlook's blocked file type list.|	Remove the banned file type and re-send.[Outlook blocked attachment list](https://support.office.com/en-ie/article/Blocked-attachments-in-Outlook-3811cddc-17c3-4279-a30c-060ba0207372)|
|**550 5.7.0** [blocked file] - File attachment is not allowed because they can be used to exploit Winzip (G1C)|	The message contained an attachment that can be used to exploit WinZip associated files:.b64; .bhx; .hqx; .mim; .uue?; .xxe|	Remove the banned file type and re-send.|
|**554 5.7.1 <servername[XX.XX.XX.XX]>:** Client host rejected: The sender's mail server is blocked|	Sending IP is blocked internally| Safelist IP and/or sending domain/address.|
|**5.7.1** ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using Spamhaus PBL. Please visit[http://www.spamhaus.org/lookup/] (http://www.spamhaus.org/lookup/) for more information on why this message could not be delivered (G1)|	The sending server is blacklisted by Spamhaus's PBL.|	The sender needs to follow the link [http://www.spamhaus.org/lookup/](http://www.spamhaus.org/lookup/) to request remediation from Spamhaus's blacklist.Safelisting the sender will NOT allow an exception. The only solution is for the sender to get the IP removed from Spamhaus.|
|**554 5.7.1** ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using sa-ip4tset.blagr.emailsrvr.com=127.26.0.2 Cloudmark CSI. Please visit[http://csi.cloudmark.com/reset-request](http://csi.cloudmark.com/reset-request) for more information on why this message could not be delivered|	The sending server is blacklisted by Cloudmark.|	The sender needs to follow the link [http://csi.cloudmark.com/reset-request](http://csi.cloudmark.com/reset-request) to request remediation from Cloudmark's blacklist. Recipient can Safelist(link to safelist how-to) the sender in the meantime.|
|**5.7.1** ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using sa-ip4tset.blagr.emailsrvr.com=127.22.0.2 Senderscore. Please visit [https://senderscore.org/rtbl/](https://senderscore.org/rtbl/) for more information on why this message could not be delivered|	 The sending server is blacklisted by Senderscore.|	The sender needs to follow the link [https://senderscore.org/rtbl/](https://senderscore.org/rtbl/)  to request remediation from Senderscore's blacklist. Recipient can Safelist the sender in the meantime.|
|**5.7.1** ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using sa-ip4tset.blagr.emailsrvr.com=127.24.0.2 Spamhaus XBL. Please visit [http://www.spamhaus.org/lookup/](http://www.spamhaus.org/lookup/) for more information on why this message could not be delivered|	The sending server is blacklisted by Spamhaus's XBL.|	The sender needs to follow the link [http://www.spamhaus.org/lookup/](http://www.spamhaus.org/lookup/) to request remediation from Spamhaus's blacklist. Recipient can Safelist the sender in the meantime.|
|**5.7.1** ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using sa-ip4tset.blagr.emailsrvr.com=127.23.0.2 Spamhaus SBL. Please visit [http://www.spamhaus.org/lookup/](http://www.spamhaus.org/lookup/) for more information on why this message could not be delivered|	The sending server is blacklisted by Spamhaus's SBL.|	The sender needs to follow the link [http://www.spamhaus.org/lookup/](http://www.spamhaus.org/lookup/) to request remediation from Spamhaus's blacklist. Recipient can Safelist the sender in the meantime (link safelist).|
|**5.7.1** ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using sa-ip4tset.blagr.emailsrvr.com=127.5.0.X Spamcop. Please visit [http://spamcop.net/bl.shtml](http://spamcop.net/bl.shtml) for more information on why this message could not be delivered|	The sending server is blacklisted by Spamcop.|	The sender needs to follow the link [http://spamcop.net/bl.shtml](http://spamcop.net/bl.shtml) to learn more about Spamcop's blacklist. If Spamcop receives no other spam reports from that IP within 24 hours, the IP is removed. Recipient can Safelist the sender in the meantime.|
|**554 5.7.1 <user@domain.com>:** Sender address rejected: Blocked by this domain|	Sender is blacklisted at the domain level|	Remove the sender from the domain level blacklist. or safelist at the recipient level(link for safe/blacklist).|
|**554 5.7.1 <user@domain.com>:** Sender address rejected: Blocked by this recipient|	Sender is blacklisted at the user level|	Remove the sender from the user level blacklist.|
|**554 5.5.2 <user@nonqualifieddomain>:**Invalid data in message> #SMTP#|	Name of attached document is longer than 50 characters.| To correct this, shorten the name of the document you are sending.|
|**550 5.7.1 <${user@example.com}>:** The recipient's server refused to accept your message (G7)|	Occurs when a domain has Split Domain Routing enabled and the recipient's address (hosted on the external mail server) permanently fails|	Confirm that the recipient's address does in fact exist on the external server (check for misspellings) and re-send the message.|
|**550 5.1.1 <${user@example.com}>:** Email address could not be found, or was misspelled (G8)|	Occurs when the recipient address (and domain) does not exist on our system.| 	Check the recipient's address for any potential misspellings/typos. Resend the message.|
|**550 5.1.1 <${user@example.com}>:** Email address could not be found, or was misspelled (G9)|	Occurs when the recipient address (and domain) does not exist on our system.| 	Check the recipient address for any potential misspellings/typos. Resend the message.|
|**550 5.7.1** Email rejected per DMARC policy for [XXXXXXX] (G15)|	The sender failed DMARC; has a DMARC policy of "reject".|	Have the sender verify the sending source and make sure it is compliant with their DMARC policy. It may also be necessary for them to update their DMARC DNS record. The sender will need to re-send the message. Follow the link for more information on [DMARC records](/dns-record-definitions/#txt-record)|
|**550 5.7.23** The message was rejected because of Sender Policy Framework violation| The sender failed SPF policy; has SPF policy set to reject| Have the sender verify the sending source to be sure it is compliant with their SPF policy. This can also fail when a message is automatically forwarded or sent as your domain from a webform. Follow the link for more information on [SPF records](/dns-record-definitions/#txt-record)|

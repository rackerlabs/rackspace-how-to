---
permalink: common-email-bounces/
audit_date: '2018-02-07'
title: Common email bounce messages
type: article
created_date: '2017-05-18'
created_by: William Loy
last_modified_date: '2018-02-07'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains the causes of common email bounce messages and how to resolve the underlying issue.

### Prerequisite

- **Applies to:** Administrators and Users

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

For a video tutorial see [Email Help - Bounce Messages](https://emailhelp.rackspace.com/l/common-bounce-message-solutions).

### Bounce messages

Bounce messages provide a brief explanation of why an email was not delivered. Bounce messages vary among mail providers. If you do not see your particular bounce message here, refer to the mail provider for an interpretation of their message.

- **4xx bounce** - A 400 error indicates a temporary failure, which means that a temporary condition has caused the email to not be delivered. The error can likely be resolved by sending the email again at a later time.

- **5xx bounce** - A 500 error indicates a permanent failure. This error does not mean you will never be able to send email again; you must change some aspect of either the message or the method of delivery for email to successfully be delivered. The bounce message should indicate what needs to change.

**Note:** If Rackspace bounced your email message, the generating server should show **emailsrvr.com** in the bounce message. If you do not see **emailsrvr.com** in the bounce message, the recipient’s provider might have blocked the message.

| SMTP error |Explanation | Solution |
| --- | --- | --- |
|Host or domain name not found. MX host not found.| There are no MX records for the recipient's domain| This message will not deliver. The recipient must create MX records at their DNS host so that they can receive email. More information on [MX records](/how-to/dns-record-definitions/#mx-records). |
| **450 4.1.8** \<user@domain.com\>: Sender address rejected: Domain not found | The recipient cannot verify the existence of your domain. | Verify that your domain’s DNS is properly configured. See [Set up DNS records](/how-to/set-up-dns-records-for-cloud-office-email) for instructions. |
| **451 4.3.0** <servername[xx.xx.xx.xx]>: Client host rejected: Throttled - Too much spam from your mail server. Try again later. | The recipient’s server has received too much spam from this source. | Try sending the message again later. Follow the steps in [Best practices for sending person-to-person email](/how-to/best-practices-for-sending-person-to-person-email) or [Best practices for sending emails to many recipients](/how-to/best-practices-for-sending-emails-to-many-recipients) to avoid having your email marked as spam. Ask the recipient to safelist or whitelist your domain. |
| **451 4.3.0** \<user@domain.com\>: Temporary lookup failure | An intermittent issue has occurred. | Wait and send the message again at a later time. |
| **421** Too many concurrent connections from this client (G2) | The sending IP address has too many concurrent connections with our servers. | Reduce concurrent connections to our servers to five or less, and then send again. |
| **4.4.1** \<user@domain.com\>: The recipient's server was temporarily unavailable to accept your message (G6) | Your domain has split domain routing enabled, and the recipient's address (hosted on the external mail server) soft fails. | The message is deferred to be resent at a later time. Ensure that the external mail server is running and accepting connections over port 25 (SMTP). |
| **504 5.5.2** \<user@nonqualifieddomain\>: Sender address rejected: need fully-qualified address | The domain from which you are sending is not valid. | You must use a valid domain for sending email. |
| **550** Your message has been rejected because you have been detected sending spam. | The content of this message has been deemed spam by the internet community | Spam definitions change rapidly. However, there are measures you can take to prevent having your message rejected as spam. See [Best practices for sending person-to-person email](/how-to/best-practices-for-sending-person-to-person-email) or [Best practices for sending emails to many recipients](/how-to/best-practices-for-sending-emails-to-many-recipients). |
| **550 5.1.0** \<user@domain.com\>: Sender address rejected: User unknown in relay recipient table | Your domain exists in Rackspace, but the full email address you sent from does not. | Create the address in the form of a mailbox, list, or alias to send mail from Rackspace Cloud Office. |
| **550 5.1.1** \<user@domain.com\>: Recipient address rejected: User unknown in relay recipient table | The recipient's email address does not exist in the Rackspace hosted domain. | Add the email address to Rackspace hosted domain. |
| **550 5.3.4** Message too large (G17) | The message size exceeds the maximum message size allowed by our servers (50 MB). | Ensure that the message size is under the allowed threshold and resend the message. |
| **550 5.7.0** [blocked file] - Your message has been rejected because it contains a banned file attachment (G1A)|	The message contains an attachment file type on the [blocked list](/how-to/cloud-office-blocked-attachment-files). | Remove the blocked file type and re send. |
| **550 5.7.0** [blocked file] - Your message has been rejected because it contains a banned file attachment (G1B)|	The message contains an attachment file type on [Outlook's blocked list](https://support.office.com/en-ie/article/Blocked-attachments-in-Outlook-3811cddc-17c3-4279-a30c-060ba0207372). | Remove the blocked file type and resend. |
| **550 5.7.0** [blocked file] - File attachment is not allowed because they can be used to exploit Winzip (G1C) | The message contains an attachment that can be used to exploit WinZip associated files: **.b64**, **.bhx**, **.hqx**, **.mim**, **.uue?**, or **.xxe** | Remove the banned file type and resend. |
| **550 5.7.1** \<user@domain.com\>: Relay access denied | The recipient's address does not exist, or the recipient domain's DNS configuration has an issue. | Check the recipient address for any misspellings or typos. Resend the message. If the recipient is hosted at Rackspace Cloud Office, have them verify that their [DNS is properly configured](/how-to/set-up-dns-records-for-cloud-office-email) to receive mail. |
| **554 5.7.1** <servername[XX.XX.XX.XX]>: Client host rejected: The sender's mail server is blocked | The sending IP address is blocked internally. | Safelist the IP address, the sending domain or address, or both. |
| **5.7.1**  ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using Spamhaus PBL. Please visit <http://www.spamhaus.org/lookup/> for more information on why this message could not be delivered (G1) | The sending server is blacklisted by the Spamhaus PBL. | The sender must follow the <http://www.spamhaus.org/lookup/> link to request remediation from the Spamhaus blacklist. Safelisting the sender will *not* allow an exception. The only solution is for the sender to get the IP address removed from the Spamhaus list. |
| **554 5.7.1** ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using sa-ip4tset.blagr.emailsrvr.com=127.26.0.2 Cloudmark CSI. Please visit <http://csi.cloudmark.com/reset-request> for more information on why this message could not be delivered |	The sending server is blacklisted by Cloudmark. | The sender must follow the <http://csi.cloudmark.com/reset-request> link to request remediation from the Cloudmark blacklist. The recipient can safelist the sender in the meantime.|
| **5.7.1** ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using sa-ip4tset.blagr.emailsrvr.com=127.22.0.2 Senderscore. Please visit <https://senderscore.org/rtbl/> for more information on why this message could not be delivered | The sending server is blacklisted by Senderscore. | The sender must follow the <https://senderscore.org/rtbl/> link to request remediation from Senderscore's blacklist. The recipient can safelist the sender in the meantime. |
| **5.7.1** ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using sa-ip4tset.blagr.emailsrvr.com=127.24.0.2 Spamhaus XBL. Please visit <http://www.spamhaus.org/lookup/> for more information on why this message could not be delivered | The sending server is blacklisted by the Spamhaus XBL. | The sender must follow the <http://www.spamhaus.org/lookup/> link to request remediation from the Spamhaus blacklist. The recipient can safelist the sender in the meantime. |
| **5.7.1** ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using sa-ip4tset.blagr.emailsrvr.com=127.23.0.2 Spamhaus SBL. Please visit <http://www.spamhaus.org/lookup/> for more information on why this message could not be delivered | The sending server is blacklisted by the Spamhaus SBL. | The sender must follow the <http://www.spamhaus.org/lookup/> link to request remediation from the Spamhaus blacklist. The recipient can safelist the sender in the meantime. |
| **5.7.1** ACL dns_rbl; Client host [XX.XX.XX.XX] blocked using sa-ip4tset.blagr.emailsrvr.com=127.5.0.X Spamcop. Please visit <http://spamcop.net/bl.shtml> for more information on why this message could not be delivered | The sending server is blacklisted by Spamcop. | The sender must follow the <http://spamcop.net/bl.shtml> link to learn more about Spamcop's blacklist. If Spamcop receives no other spam reports from that IP address within 24 hours, the IP address is removed. The recipient can safelist the sender in the meantime. |
| **554 5.7.1** \<user@domain.com\>: Sender address rejected: Blocked by this domain | The sender is blacklisted at the domain level. | Remove the sender from the domain level blacklist or safelist at the recipient level. |
| **554 5.7.1** \<user@domain.com\>: Sender address rejected: Blocked by this recipient | The sender is blacklisted at the user level. | Remove the sender from the user level blacklist. |
| **554 5.5.2** \<user@nonqualifieddomain\>: Invalid data in message> #SMTP# | The name of the attached document is longer than 50 characters. | Shorten the name of the document that you are sending, and resend. |
| **550 5.7.1** \<${user@example.com}\>: The recipient's server refused to accept your message (G7) | The domain has split domain routing enabled, and the recipient's address (hosted on the external mail server) permanently fails. | Confirm that the recipient's address exists on the external server (check for misspellings) and resend the message. |
| **550 5.1.1** \<${user@example.com}\>: Email address could not be found, or was misspelled (G8) | The recipient's address (and domain) does not exist on our system. | Check the recipient's address for any potential misspellings or typos, and then resend the message. |
| **550 5.1.1** \<${user@example.com}\>: Email address could not be found, or was misspelled (G9) | The recipient's address (and domain) does not exist on our system. | Check the recipient's address for any potential misspellings or typos, and then resend the message.|
| **550 5.7.1** Email rejected per DMARC policy for [XXXXXXX] (G15) | The sender failed the DMARC policy, and the policy is set to reject. | Verify the sending source and ensure that it is compliant with the DMARC policy. It might also be necessary for the sender to update their DMARC DNS record. The sender must resend the message. For more information, see [DNS record definitions](/how-to/dns-record-definitions). |
| **550 5.7.23** The message was rejected because of Sender Policy Framework violation | The sender failed the SPF policy, and the policy is set to reject.<br/><br/>This error can also occur when a message is automatically forwarded or sent as your domain from a webform. | Verify the sending source and ensure that it is compliant with the SPF policy. For more information, see [DNS record definitions](/how-to/dns-record-definitions) |

---
permalink: identifying-suspicious-email/
audit_date:
title: Identifying suspicious email
type: article
created_date: '2018-09-24'
created_by: Ben Smith
last_modified_date: '2018-09-24'
last_modified_by: Ben Smith
product: Rackspace Email
product_url: rackspace-email
---


### Prerequisites

- **Applies to:** Administrator and User
- **Difficulty:** Easy
- **Tools required:** Webmail Access

#### Identify Suspicious Email

Suspicious email is a gray area between legitimate email and spam. Webmail employs DMARC-based indicators to determine if a message is suspicious. However, there are also several items you can see that indicate if an email message is legitimate. These indicators are simple but extremely valuable in determining the validity of a message.



First, messages that are deemed suspicious by the Hosted Email service will show a yellow warning banner in Webmail's message preview. The intent of this banner is to encourage you to confirm the legitimacy of the sender and the contents of the message before clicking on any links, downloading any attachments, or replying to the message. Even if the suspicious banner is not present, Webmail displays important information about the message that you can use to inspect its validity. The information is displayed for every message, and is easy to scan, once you know what to look for.


<img src="{% asset_path rackspace-email/identifying-suspicious-email/this-is-suspicious.png %}" />

Second, Webmail clearly displays the friendly name and email address of the sender. Comparing the name to the email address is a simple way to check for display name spoofing. Display name spoofing is when bad guys put a name you recognize in the From address, like your boss, but the associated email address is not for that person. For example, Webmail will show you "From: John Doe <sally@notmycompanydomain.com>". Assuming John Doe is your boss's name, sally@notmycompanydomain.com is definitely not your boss's email address. In this case, the bad guy is using a compromised mailbox on another system to pose as your boss.



<img src="{% asset_path rackspace-email/identifying-suspicious-email/sender-discrepancies.png %}" />


Finally, Webmail will tell you if the domain of the sender does not match the domain used to send the message. This is represented by the 'sent from' added to the sender's address. In some cases, this is normal for sending services used in marketing/sales campaigns, newsletters, etc. However, it can also be an indication of spoofing. Building on the above example, if the same bad guy had compromised a Gmail mailbox and was sending email pretending to be your boss, it would show up in Webmail like this: "From: John Doe <john.doe@mycompany.com> sent from gmail.com". Assuming your boss would never use Gmail for work purposes, this would be a clear indicator that the message is suspicious.


<img src="{% asset_path rackspace-email/identifying-suspicious-email/sender-discrepancies-2.png %}" />


The suspicious message banner, the full From: name and email address, and the sent from domain help you ensure sure the messages you interact with are from who you think they are from. Additionally, it is always a best to verify any request for personal information or money that received via email. For more information on how to recognize phishing emails, please visit our blog here: https://blog.rackspace.com/email-phishing-rise-mailbox-safe.

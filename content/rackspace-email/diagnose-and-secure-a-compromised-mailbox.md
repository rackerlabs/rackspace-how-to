---
permalink: diagnose-and-secure-a-compromised-mailbox/
audit_date: '2017-02-24'
title: Diagnose and secure a compromised mailbox
type: article
created_date: '2017-12-18'
created_by: William Loy
last_modified_date: '2017-12-18'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article describes steps to identify a compromised mailbox, stop the attack, and prevent future attacks.

### Prerequisites

- **Applies to:** User or administrator
- **Difficulty:** Moderate
- **Time needed:** Approximately 1 hour
- **Tools required:**  Users need their current password; administrators need Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).


#### Symptoms of a compromised mailbox

- You have started receiving bounce messages for emails that you never sent.
- You notice emails that are unfamiliar.
- Your password has been changed.
- Colleagues or friends report receiving messages from you that you never sent.   
- Forwarding rules have been added that you did not create.
- Your reply-to address has been changed.
- You received an email from Rackspace informing you that your mailbox has been disabled.

If you have noticed any of these symptoms with your mailbox you should take immediate steps to secure the mailbox.

#### Risk factors

- Weak or moderate strength passwords
- Delaying software updates
- Clicking links from unverified sources
- Clicking links without verifying their authenticity. Even links from what appears to be a trusted source can easily be a trick to gain access to    your account.
- Accessing your account from a public computer such as those in libraries or hotels. If a computer is used by strangers all day, you should assume it is unsafe to access your mailbox from it.
- Accessing your account over public WiFi.

Avoiding these factors is a small inconvenience compared to what could be damaged from a successful mailbox compromise. If you find that any of the above factors apply to you, you should take immediate steps to secure your mailbox.


#### Secure a mailbox that has been compromised

1. Change the password to the mailbox immediately.

    - Locking out those who have compromised the mailbox is the top priority. The longer a bad actor has access to your account, the more damage that can be done. Review [Password management and best practices](/how-to/password-management-and-best-practices/#password-best-practices) when crafting a new password.

2. Scan all devices for viruses and malware.

    - Malware and viruses can gather information that you enter through your infected device. If you scan your devices and find an infection, you need to change your password for a second time after you have removed the malicious software. Otherwise you mailbox information could already be in the hands of a hacker.

3. Alert your Colleagues and coworkers. If you are not the administrator for your company you should alert your administrator immediately.

    - It is better to raise the alarm and protect everyone's information than risk the compromise growing beyond your mailbox.

4. Blacklist the return-path and originating IP of the message that lead to the compromise if that was the source. This is usually a message that contained a suspicious link or asked you for account information.

    - [View and read Rackspace Email headers](/how-to/view-and-read-rackspace-email-headers) will help you identify the return-path and originating IP of the malicious email.

5.

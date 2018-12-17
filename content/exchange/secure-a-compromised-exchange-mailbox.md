---
permalink: secure-a-compromised-exchange-mailbox/
audit_date: '2018-01-16'
title: Secure a compromised Exchange mailbox
type: article
created_date: '2017-12-18'
created_by: William Loy
last_modified_date: '2018-01-16'
last_modified_by: Cat Lookabaugh
product: Microsoft Exchange
product_url: exchange
---

This article describes steps to identify a compromised mailbox, stop the attack, and prevent future attacks. If you need instructions on securing a compromised Rackspace Email mailbox, see [Secure a compromised Rackspace Email mailbox](/how-to/secure-a-compromised-rackspace-email-mailbox).

### Prerequisites

- **Applies to:** User or administrator
- **Difficulty:** Moderate
- **Time needed:** Approximately 1 hour
- **Tools required:** Users need their current password; administrators need Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).


### Symptoms of a compromised mailbox

If any of the following symptoms apply to you, take immediate steps to secure the mailbox.

- You have started receiving bounce messages for emails that you never sent.
- You notice emails that are unfamiliar.
- Your password has been changed.
- Colleagues or friends report receiving messages from you that you never sent.
- Forwarding rules have been added that you did not create.
- Your reply-to address has been changed.
- You received an email from Rackspace informing you that your mailbox has been disabled.


### Risk factors

Avoiding the following factors is a small inconvenience compared to the potential damage caused by a successful mailbox compromise. If you find that any of thes factors apply to you, take immediate steps to secure your mailbox.

- Weak or moderate strength passwords
- Delaying software updates
- Clicking links from unverified sources
- Clicking links without verifying their authenticity. Even links from what appears to be a trusted source can easily be a trick to gain access to your account.
- Accessing your account from a public computer, such as those in libraries or hotels. If a computer is used by strangers all day, you should assume it is unsafe to access your mailbox from it.
- Accessing your account over public WiFi.


### Secure a mailbox that has been compromised

Use the following steps to secure a mailbox that has been compromised:

1. Immediately change the password to the mailbox.

    - Locking out those who have compromised the mailbox is the top priority. The longer a bad actor has access to your account, the more damage that can be done. When crafting a new password, review [Password management and best practices](/how-to/password-management-and-best-practices/#password-best-practices).
    
  **Warning:** If you do not update all connected devices with the new password, Exchange mailboxes lock themselves. If the mailbox is locked, see [Troubleshoot a locked Exchange mailbox.](/how-to/troubleshoot-a-locked-exchange-mailbox).

2. Scan all devices for viruses and malware.

    - Malware and viruses can gather information that you enter through your infected device. If you scan your devices and find an infection, you need to change your password for a second time after you have removed the malicious software. Otherwise your mailbox information could already be in the hands of a hacker.

    - If the mailbox was disabled by Rackspace, follow these instructions to [restore mailbox access](/how-to/disable-or-enable-exchange-email-access/#restore-mailbox-access).

    **Warning:** Do not restore access until **after** you have changed the mailbox password and scanned all devices for malicious software.

3. Alert your colleagues and coworkers. If you are not the administrator for your company, you should alert your administrator immediately.

    - It is better to raise the alarm and protect everyone's information than to risk the compromise growing beyond your mailbox.

4. If the return-path and the originating IP address of the message was the source that led to the compromise, blacklist them. Usually, the message contained a suspicious link or asked for your account information.

    - The [View and read email headers in Outlook Web App](/how-to/view-and-read-email-headers-in-owa) article shows how to identify the return-path and originating IP address of the malicious email.

5. Educate your users about the risk factors and symptoms of a compromised mailbox. Email attacks are a constant threat that users and admins should be prepared for at all times.



### References

- [Email spoofing best practices](/how-to/email-spoofing-best-practices-for-exachange-users)
- [Password management and best practices](/how-to/password-management-and-best-practices/#password-best-practices)
- [Troubleshoot a locked Exchange mailbox.](/how-to/troubleshoot-a-locked-exchange-mailbox)
- [View and read email headers in Outlook Web App](/how-to/view-and-read-email-headers-in-owa)

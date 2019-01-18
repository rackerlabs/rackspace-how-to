---
permalink: prevent-spam-in-postfix/
audit_date:
title: Prevent spam in Postfix
created_date: '2019-01-16'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

Spam is a significant problem on mail servers. System administrators work daily, tweaking their configurations to help stop the flow of new variants of spam. Below are some simple configuration changes that you can implement on a [Postfix](http://www.postfix.org) installation on your mail server to help stop some of the flow of spam to your mailboxes.

### Enable Real-time Blackhole Lists

This is a quick and easy way to stop as much as 50% of your spam traffic. RBL's (Real-time Blackhole Lists) are basically a list of IP's of known spammers, and these lists are generally free to use. You can configure Postfix to check the IP address of the incoming message against one or more RBLs. If the IP is a match, then your server will not even permit the message sender to transmit a message. These RBL's are configured under the smtpd_recipient_restrictions parameter in the main Postfix configuration file (usually **/etc/postfix/main.cf**). Here is an example of a Postfix configuration that uses six different RBLs:

smtpd_recipient_restrictions =
            reject_rbl_client zen.spamhaus.org,
            reject_rbl_client bl.spamcop.net,
            reject_rbl_client dnsbl.sorbs.net,
            reject_rbl_client cbl.abuseat.org,
            reject_rbl_client b.barracudacentral.org,
            reject_rbl_client dnsbl-1.uceprotect.net,
            permit

After you have implemented this configuration, you know that the configuration is working on your mail server because you start seeing entries in your mail logs similar to the following example:

Dec 17 15:58:24 mailserver postfix/smtpd[15573]: NOQUEUE: reject: RCPT from unknown[204.12.225.53]: 554 5.7.1 Service unavailable; Client host [204.12.225.53] blocked using zen.spamhaus.org ; http://www.spamhaus.org/sbl/query/SBLCSS / http://www.spamhaus.org/query/bl?ip=204.12.225.53; from=<info@lifeyjingu.com> to=<admin@mymailserver.com> proto=ESMTP helo=<hse53.lif eyjingu.com>

Now if you receive 2,000 spam messages a day to a particular mailbox, and this method only blocks up to 50% of these messages, you may be wondering if enabling RBL's is even worth the effort. Note that RBL's are usually used in conjunction with other spam fighting techniques, such as SpamAssasin. Since SpamAssassin can be very CPU intensive, stopping up to 50% of this mail traffic may save valuable CPU resources on your mail server.

In addition to RBL's, you can help prevent your server from relaying and receiving spam by adding some of the following configuration options under the smtpd_recipient_restrictions parameter:

reject_invalid_hostname - Reject the request when the HELO or EHLO hostname is malformed. This can potentially prevent poorly programed bots from sending spam to your server.

reject_unknown_recipient_domain - Reject the request when Postfix is not final destination for the recipient domain. This can prevent your server from being used as an open relay.

reject_unauth_pipelining - Reject the request when the client sends SMTP commands ahead of time where it is not allowed. This stops mail from bulk mail software that improperly uses ESMTP command pipelining in order to speed up deliveries.
reject_unauth_destination - This is similar to reject_unknown_recipient_domain, but this includes two conditions, one of which must be met, in order for Postfix to accept the message: 1) Postfix is mail forwarder for the domain (as defined in the relay_domains parameter) -or- 2) Postfix is the final destination for the domain 

Of course there may be certain IP's or entire networks that you do not want to be filtered out from your mail server. In this case, you can add the permit_mynetworks option under smtpd_recipient_restrictions to whitelist these IP's. You will also want to ensure that these networks have been defined under the my_networks parameter earlier in the configuration file.


So given the above recommendations, here is an example of an smtpd_recipient_restrictions parameter in the main Postfix configuration file using all of the above configuration options:

smtpd_recipient_restrictions =
            reject_invalid_hostname,
            reject_unknown_recipient_domain,
            reject_unauth_pipelining,
            permit_mynetworks,
            reject_unauth_destination,
            reject_rbl_client zen.spamhaus.org,
            reject_rbl_client bl.spamcop.net,
            reject_rbl_client dnsbl.sorbs.net,
            reject_rbl_client cbl.abuseat.org,
            reject_rbl_client b.barracudacentral.org,
            reject_rbl_client dnsbl-1.uceprotect.net,
            permit


You might also require additional configuration parameters under smtpd_recipient_restrictions, and you can simply add them to this list before the permit option at the end.

Note that these recommended changes to Postfix are by no means a complete solution for fighting spam. This configuration alone might stop up to 50% of spam, but you need additional configuration changes and software (such as SpamAssassin) to block additional spam traffic. There is a good Wiki post on the CentOS&reg; website that shows how to install SpamAssassin along with Amavis and ClamAV (http://wiki.centos.org/HowTos/Amavisd). This article should work for Red Hat&reg;-based distributions.

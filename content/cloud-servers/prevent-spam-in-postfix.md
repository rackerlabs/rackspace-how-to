---
permalink: prevent-spam-in-postfix/
audit_date: '2019-01-18'
title: Prevent spam in Postfix
type: article
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: '2019-01-23'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article demonstrates some simple configuration changes that you can implement on 
a [Postfix](http://www.postfix.org) installation on your mail server to reduce spam.

### Enable Real-time Blackhole Lists

Real-time Blackhole Lists (RBLs) are lists of Internet Protocol (IP) addresses that are associated with known spammers. These lists are generally free. 

You can configure Postfix to check the IP addresses of incoming messages against one or more RBLs. If there's a match, then your server does not permit the sender to transmit the message. Enabling RBLs is a straightforward way to stop up to 50% of your spam traffic. 

You configure RBLs under the `smtpd_recipient_restrictions` parameter in the main Postfix configuration file, which is usually located at **/etc/postfix/main.cf**. The following Postfix configuration file example uses six different RBLs:

       smtpd_recipient_restrictions =
            reject_rbl_client zen.spamhaus.org,
            reject_rbl_client bl.spamcop.net,stop
            reject_rbl_client dnsbl.sorbs.net,
            reject_rbl_client cbl.abuseat.org,
            reject_rbl_client b.barracudacentral.org,
            reject_rbl_client dnsbl-1.uceprotect.net,
            permit

After you implement this configuration, entries similar to the following example appear in your mail logs:

    Dec 17 15:58:24 mailserver postfix/smtpd[15573]: NOQUEUE: reject: RCPT from unknown[204.12.225.53]: 554 5.7.1 Service    unavailable; Client host [204.12.225.53] blocked using zen.spamhaus.org ; http://www.spamhaus.org/sbl/query/SBLCSS / http://www.spamhaus.org/query/bl?ip=204.12.225.53; from=<info@lifeyjingu.com> to=<admin@mymailserver.com> proto=ESMTP helo=<hse53.lif eyjingu.com>

RBLs are typically used in conjunction with other spam-fighting techniques and tools such as Apache&reg; SpamAssasin&trade;. However, because SpamAssassin can be very central processing unit (CPU)-intensive, cutting spam traffic in half by using RBLs first might save valuable CPU resources on your mail server.

In addition to including RBLs, you might also want to add some of the following configuration options under the `smtpd_recipient_restrictions` parameter in the configuration file:

- `reject_invalid_hostname`: Rejects the request when the HELO or EHLO hostname is malformed. This option might block 
  poorly-programmed bots from sending spam to your server.

- `reject_unknown_recipient_domain`: Rejects the request when Postfix is not the final destination for the recipient's domain. 
  This option can prevent your server from being used as an open relay.

- `reject_unauth_pipelining`: Rejects the request when the client sends Simple Mail Transfer Protocol (SMTP) commands ahead of 
  time where it is not allowed. This option stops mail from bulk mail software that improperly uses Extended SMTP (ESMTP) 
  command pipelining to speed up deliveries.

- `reject_unauth_destination`: This option is similar to the `reject_unknown_recipient_domain` option. However, 
  with `reject_unauth_destination`, one of the following conditions must be met for Postfix to accept the message: 
  
  - Postfix is the mail forwarder for the domain (as defined in the `relay_domains parameter`). 
  - Postfix is the final destination for the domain. 

If there are IPs or networks that you do not want to filter out from your mail server, you can add the `permit_mynetworks` option under `smtpd_recipient_restrictions` to whitelist these IPs. You should also ensure that you define these networks under the `my_networks` parameter in the configuration file.

The following example `smtpd_recipient_restrictions` parameter in the Postfix configuration file uses all of the preceding configuration options:

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

**Note**: If you require additional configuration parameters under `smtpd_recipient_restrictions`, you can add them to the bottom of this list, above the `permit` option.

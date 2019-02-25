---
permalink: disable-tls1-for-cloud-load-balancers/
audit_date: '2019-01-23'
title: Disable TLS 1.0 for Cloud Load Balancers
type: article
created_date: '2019-01-29'
created_by: Rackspace Community
last_modified_date: '2019-01-29'
last_modified_by: Kate Dougherty
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

The Transport Layer Security (TLS) 1.0 protocol has been deprecated and
should be disabled for Payment Card Industry (PCI) PCI compliance.

This article shows you how to disable TLS 1.0 on Rackspace Cloud Load
Balancers.

**Note**: You must perform this action by using an Application Programming
Interface (API) command or Rackspace's [Pitchfork](https://pitchfork.rax.io)
tool.

This article assumes that cURL is installed on your desktop machine. Using
cURL is the only method of disabling TLS 1.0. Your cloud load balancer is
out of service while the update is implemented. Ensure that you perform
the procedure at a time when it will not impact your normal operations.

### Get an authentication token

You need to [obtain an authentication
token](https://developer.rackspace.com/docs/cloud-load-balancers/quickstart/#authentication) to complete this process. If you experience any issues with
obtaining a token, contact Rackspace Support.

### Create variables

On the command line, creating the following variables (using the same formats):

- `TOKEN=<>`
- `DDI=<Your account number>`
- `LBID=<The load balancer id>`
- `REG=<region where the load balancer is located>`

Creating these variables and using them in your cURL commands makes the
process of disabling TLS 1.0 easier.

### Disable TLS 1.0

Before you disable TLS 1.0 on the cloud load balancer, check the current
settings by running the following command:

    curl -sX GET -H "x-auth-token:$TOKEN" https://$REG.loadbalancers.api.rackspacecloud.com/v1.0/$DDI/loadbalancers/$LBID/ssltermination

Ensure that you create this command all one line, without any returns or line
breaks. To continue a line without inserting a line break, add a backslash
(`\`) at the end of the command, as shown in the following example:

    curl -sX GET -H "x-auth-token:$TOKEN" \

    https://$REG.loadbalancers.api.rackspacecloud.com/v1.0/$DDI/loadbalancers/$LBID/ssltermination

The following example shows part of the output from this command:

    "secureTrafficOnly": false,
            "securityProtocols": [
                {
                    "securityProtocolName": "TLS_10",
                    "securityProtocolStatus": "ENABLED"

Next, use the following command to disable TLS 1.0 or create a text file with
the required information:

    curl -sX PUT -H "x-auth-token:$TOKEN" https://$REG.loadbalancers.api.rackspacecloud.com/v1.0/$DDI/loadbalancers/$LBID/ssltermination -H "Content-Type: application/json" \
    -d '{"sslTermination":{"securityProtocols":[{"securityProtocolName": "TLS_10","securityProtocolStatus":"DISABLED"}]}}'

The text file must contain the exact information and spacing shown in the following code:
    {
      "sslTermination": {
        "securityProtocols": [
          {
            "securityProtocolName": "TLS_10",
            "securityProtocolStatus": "DISABLED"
          }
        ]
      }
    }

To use the file, run the following command:

    curl -sX PUT -H "x-auth-token:$TOKEN" https://$REG.loadbalancers.api.rackspacecloud.com/v1.0/$DDI/loadbalancers/$LBID/ssltermination -H "Content-Type: application/json" \
    -d @<filename>

You should see some of the certificate returned, along with the following
output:

    enabled":true,"secureTrafficOnly":false,"securePort":443,"cipherProfile":"default","securityProtocols":[{"securityProtocolName":"TLS_10","securityProtocolStatus":"DISABLED"}]}}

Verify that TLS 1.0 is now disabled by running the following command:

    curl -sX GET -H "x-auth-token:$TOKEN" https://$REG.loadbalancers.api.rackspacecloud.com/v1.0/$DDI/loadbalancers/$LBID/ssltermination

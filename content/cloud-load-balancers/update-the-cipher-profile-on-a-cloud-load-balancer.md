---
permalink: update-the-cipher-profile-on-a-cloud-load-balancer/
audit_date: '2019-01-23'
title: Update the cipher profile on a cloud load balancer
type: article
created_date: '2019-02-07'
created_by: Rackspace Community
last_modified_date: '2019-02-07'
last_modified_by: Kate Dougherty
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

SSL ciphers are algorithms that help secure networking connections by using
Transport Layer Security (TLS). However, the cipher
`SSL_RSA_WITH_3DES_EDE_CBC_SHA` has been identified as vulnerable to
potential intrusion. Rackspace is therefore enabling you to update the ciphers
that your cloud load balancers use to better protect your environment.

You can update the cipher profiles by using either the Cloud Load Balancers
API or our interactive web application, [Pitchfork](https://pitchfork.rax.io).

For more information about cipher profiles, see [Ciphers](https://developer.rackspace.com/docs/cloud-load-balancers/v1/api-reference/ciphers/) in the Rackspace developer documentation.

The following cipher profiles are currently available:

- `Default`: The `Default` cipher profile
  has `SSL_RSA_WITH_3DES_EDE_CBC_SHA` enabled.
- `CLBCipherPolicy2017-08`: This cipher profile has `SSL_RSA_WITH_3DES_EDE_CBC_SHA` disabled.

### Update cipher profiles by using the API

This article assumes that you have the cURL utility installed. The cloud load
balancer will be out of service while the update is being applied. As a
result, it is important to ensure that you perform this process when it will
not impact your normal operations.

You need to obtain an authentication token for this process. To learn how to
obtain your token, see [Authentication](https://developer.rackspace.com/docs/cloud-load-balancers/quickstart/#authentication) in the Cloud Load Balancer API developer documentation.

Use the following steps to update the cipher profile by using the Cloud Load
Balancers API:

1. Set the following environment variables:

       # REG={region}
       # DDI={cloud_account_number}
       # LBID={Load balancer ID}
       # TOKEN={API_Token}

2. To see the cipher profile that is enabled on your cloud load balancer, run the
   following cURL command:

       # curl -sX GET -H "X-Auth-Token: $TOKEN" https://$REG.loadbalancers.api.rackspacecloud.com/v1.0/$DDI/loadbalancers/$LBID/ssltermination/ | python -m json.tool | grep cipherProfile

   The output should look like the following example:

       "cipherProfile": "CLBCipherPolicy2017-08"

3. Use the following steps to disable the cipher
   `SSL_RSA_WITH_3DES_EDE_CBC_SHA` by using the API:

   1. Check if the cipher `SSL_RSA_WITH_3DES_EDE_CBC_SHA` is enabled on your
      cloud load balancer by running the following cURL command:

          # curl -X GET -H "X-Auth-Token: $TOKEN" https://$REG.loadbalancers.api.rackspacecloud.com/v1.0/$DDI/loadbalancers/$LBID/ssltermination/ciphers

      The output should look like the following example:

          {"ciphers":[{"name":"SSL_ECDHE_RSA_WITH_AES_128_CBC_SHA"},{"name":"SSL_ECDHE_RSA_WITH_AES_128_CBC_SHA256"},{"name":"SSL_ECDHE_RSA_WITH_AES_128_GCM_SHA256"},{"name":"SSL_ECDHE_RSA_WITH_AES_256_CBC_SHA"},{"name":"SSL_ECDHE_RSA_WITH_AES_256_CBC_SHA384"},{"name":"SSL_ECDHE_RSA_WITH_AES_256_GCM_SHA384"},{"name":"SSL_RSA_WITH_3DES_EDE_CBC_SHA"},{"name":"SSL_RSA_WITH_AES_128_CBC_SHA"},{"name":"SSL_RSA_WITH_AES_128_CBC_SHA256"},{"name":"SSL_RSA_WITH_AES_128_GCM_SHA256"},{"name":"SSL_RSA_WITH_AES_256_CBC_SHA"},{"name":"SSL_RSA_WITH_AES_256_CBC_SHA256"},{"name":"SSL_RSA_WITH_AES_256_GCM_SHA384"}]}

   2. The `SSL_RSA_WITH_3DES_EDE_CBC_SHA` cipher is currently the only cipher
      that you can disable on your cloud load balancer. The cipher profile
      `CLBCipherPolicy2017-08` disables the
      `SSL_RSA_WITH_3DES_EDE_CBC_SHA` cipher, and `Default` enables it.

       Disable the `SSL_RSA_WITH_3DES_EDE_CBC_SHA` cipher by updating the
       cipher profile to `CLBCipherPolicy2017-08`, as shown in the following
       example:

          # curl -X PUT https://$REG.loadbalancers.api.rackspacecloud.com/v1.0/$DDI/loadbalancers/$LBID/ssltermination -H "X-Auth-Token: $TOKEN" -H "Accept: application/json" -H "content-Type: application/json" -d '{"cipherProfile": "CLBCipherPolicy2017-08"}'

### Update the cipher profile by using Pitchfork

Use the following steps to update the cipher profile by using Pitchfork:

1. In your Internet browser, go to
   [Pitchfork](https://pitchfork.rax.io) and log in to the application
   by using your username and API key.

   To learn how to find your API key, see [View and
   reset your API
   key](/how-to/view-and-reset-your-api-key).

2. In the list of products that displays, click **Cloud Load Balancers**.

3. In the drop-down list, select the **Region** where your cloud load balancer
   is located.

4. Scroll down to the **SSL** section. Then, next to **Update or Configure SSL
   Termination**, click **Details**.

5. Enter the load balancer ID in the **lb_id** field and the cipher profile
   that you want to use in the **cipher_profile** field, then click **Send API
   Call**.

6. Verify that the cipher profile is updated by using the following steps:

   1. In the **SSL** section, go to **SSL Termination Configuration** and
      click **Details**.
   2. Enter the load balancer ID in the **lb_id** field and click **Send API
      Call**.

   The response that this call returns should confirm that the cipher profile
   is updated.

---
node_id: 569
title: Test PHP mail functionality
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-06-12'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

To test PHP mail functionality, you can use the following code saved
into a file with a **.php** extension:

**Important:** We recommend using an SMTP relay that requires
authentication. Sending mail through unauthenticated SMTP servers
(including the localhost relay on Cloud Sites) can result in delays or
undelivered email because of stringent anti-spam filters.

    <? $headers = 'From: webmaster@example.com'; mail('nobody@example.com', 'Test email using PHP', 'This is a test email message', $headers, '-fwebmaster@example.com'); ?>

Alternatively, you can use the following test code:

    <?php $to = 'nobody@example.com'; $subject = 'Test email using PHP'; $message = 'This is a test email message'; $headers = 'From: webmaster@example.com' . "\r\n" . 'Reply-To: webmaster@example.com' . "\r\n" . 'X-Mailer: PHP/' . phpversion(); mail($to, $subject, $message, $headers, '-fwebmaster@example.com'); ?>


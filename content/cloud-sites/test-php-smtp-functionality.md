---
permalink: test-php-smtp-functionality/
audit_date:
title: Test PHP SMTP functionality
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

You can test PHP SMTP functions with the following two examples. The
first one is standard SMTP, and the second one is SMTP with SSL.

We recommend that you use an SMTP relay that requires authentication.
Because of stringent anti-spam filters, sending mail through
unauthenticated SMTP servers (including the localhost relay on Cloud
Sites) can result in delays or undelivered email.

The host, username, and password values depend on the provider that
you're using to send your email. If you have a legacy Cloud Sites email
account or are using Rackspace Email, SSL/TLS is required. The host is
**secure.emailsrvr.com**, the username is your email address and the port is 465. If
you're using another service such as Mailgun or Gmail to send email, you
must provide the SMTP server for that service. You can access Mailgun
server information in the Mailgun control panel.

### Sending mail with PHP SMTP

For the following variables, replace the example values with the
appropriate values for your system:

-  $from
-  $to
-  $subject
-  $body
-  $host
-  $username
-  $password  

Following is a sample PHP script to send email via standard SMTP:

    <?php
    require_once "Mail.php";

    $from = "Web Master <webmaster@example.com>";
    $to = "Nobody <nobody@example.com>";
    $subject = "Test email using PHP SMTP\r\n\r\n";
    $body = "This is a test email message";

    $host = "SMTPhostname";
    $username = "webmaster@example.com";
    $password = "yourPassword";
    $headers = array ('From' => $from,
      'To' => $to,
      'Subject' => $subject);
    $smtp = Mail::factory('smtp',
      array ('host' => $host,
        'auth' => true,
        'username' => $username,
        'password' => $password));

    $mail = $smtp->send($to, $headers, $body);

    if (PEAR::isError($mail)) {
      echo("<p>" . $mail->getMessage() . "</p>");
    } else {
      echo("<p>Message successfully sent!</p>");
    }
    ?>


### Sending mail with PHP SMTP with SSL

For the following variables, replace the example values with the
appropriate values for your system:

-   $from
-   $to
-   $subject
-   $body
-   $host
-   $username
-   $password
-   $port

Following is a sample PHP script to send email via SMTP with SSL:

    <?php
    require_once "Mail.php";

    $from = "Web Master <webmaster@example.com>";
    $to = "Nobody <nobody@example.com>";
    $subject = "Test email using PHP SMTP with SSL\r\n\r\n";
    $body = "This is a test email message";

    $host = "ssl://SMTPhostname";
    $port = "465";
    $username = "webmaster@example.com";
    $password = "yourPassword";

    $headers = array ('From' => $from,
      'To' => $to,
      'Subject' => $subject);
    $smtp = Mail::factory('smtp',
      array ('host' => $host,
        'port' => $port,
        'auth' => true,
        'username' => $username,
        'password' => $password));

    $mail = $smtp->send($to, $headers, $body);

    if (PEAR::isError($mail)) {
      echo("<p>" . $mail->getMessage() . "</p>");
    } else {
      echo("<p>Message successfully sent!</p>");
    }
    ?>


**Note**: [Mail.php](http://pear.php.net/package/Mail) is a [PEAR](http://pear.php.net/) module and is installed on the server. It is included in the default [include\_path](http://www.php.net/manual/en/ini.core.php) for PHP, so [requiring](http://php.net/manual/en/function.require.php) it here works by default.

### Related article

[Test CDOSYS SMTP functionality](/how-to/test-cdosys-smtp-functionality)

---
permalink: test-and-send-mail-using-php/
audit_date:
title: Test and send mail using PHP
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-07-13'
last_modified_by: Nate Archer
product:
product_url:
---

PHP mail provides the most granular control of the data and content of the emails sent from your domain or site. However, PHP mail only works when relayed over SMTP. The following article shows you how to test and send different types of email using PHP.

**Important:** We recommend using an SMTP relay that requires
authentication. Sending mail through unauthenticated SMTP servers
(including the localhost relay on Cloud Sites) can result in delays or
undelivered email because of stringent anti-spam filters.

### Test PHP mail functionality

Before you can send PHP mail, it important to test the PHP mail's functionality. You can use the following code saved into a file with a **.php** extension:

    <? $headers = 'From: webmaster@example.com'; mail('nobody@example.com', 'Test email using PHP', 'This is a test email message', $headers, '-fwebmaster@example.com'); ?>

Alternatively, you can use the following test code:

    <?php $to = 'nobody@example.com'; $subject = 'Test email using PHP'; $message = 'This is a test email message'; $headers = 'From: webmaster@example.com' . "\r\n" . 'Reply-To: webmaster@example.com' . "\r\n" . 'X-Mailer: PHP/' . phpversion(); mail($to, $subject, $message, $headers, '-fwebmaster@example.com'); ?>

### Test PHP SMTP functionality

You can test PHP SMTP functions with the following examples. The
first one is standard SMTP, and the second one is SMTP with SSL.

The host, username, and password values depend on the provider that
you're using to send your email.

- If you have a legacy Cloud Sites email account or are using Rackspace Email, SSL/TLS is required. The host is **secure.emailsrvr.com**, the username is your email address and the port is 465.

- If you're using another service such as Mailgun or Gmail to send email, you must provide the SMTP server for that service. You can access Mailgun server information in the [Mailgun control panel](https://mailgun.com/sessions/new).

**Note**: [Mail.php](http://pear.php.net/package/Mail) is a [PEAR](http://pear.php.net/) module and is installed on the server. It is included in the default [include\_path](http://www.php.net/manual/en/ini.core.php) for PHP, so [requiring](http://php.net/manual/en/function.require.php) it in these scripts works by default.

#### Sending mail with PHP SMTP

For the following variables, replace the example values with the
appropriate values for your system:

-  `$from`
-  `$to`
-  `$subject`
-  `$body`
-  `$host`
-  `$username`
-  `$password`

Following is a sample PHP script for sending email via standard SMTP:

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


#### Sending mail with PHP SMTP with SSL

For the following variables, replace the example values with the appropriate values for your system:

-   `$from`
-   `$to`
-   `$subject`
-   `$body`
-   `$host`
-   `$username`
-   `$password`
-   `$port`

Following is a sample PHP script for sending email via SMTP with SSL:

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

### Send HTML email via PHP

Within the Cloud Sites environment, you can craft an HTML formatted email message when using SMTP authentication for delivery by making use of the built in `Mail_Mime` function provided by the PHP PEAR framework.

For the following variables, replace the example values with the appropriate values for your system:

-  `$from`
-  `$to`
-  `$subject`
-  `$text`
-  `$html`
-  `$file`
-  `$mimetype`
-  `$host`
-  `$username`
-  `$password`

You must supply a valid SMTP hostname and user credentials for authentication. If you are using a third-party mail service, replace `mail.emailsrvr.com` with the appropriate SMTP server hostname relative to the service. You can also attach files from your Cloud Sites file system to the message if you provide a valid MIME type definition.

    <?php
    require_once "Mail.php";
    require_once "Mail/mime.php";

    // see http://pear.php.net/manual/en/package.mail.mail-mime.php for further extended documentation on Mail_Mime

    $from = "Web Master <webmaster@example.com>";
    $to = "Nobody <nobody@example.com>";
    $subject = "Test HTML email using PHP Pear w/ SMTP\r\n\r\n";
    $text = "This is a text test email message";
    $html = "<html><body><p>This is an html test email message
      <a href=\"http://www.rackspace.com\">This Is A Link</a></p></body></html>";
    $crlf = "\n";

    // create a new Mail_Mime for use
    $mime = new Mail_mime($crlf);
    // define body for Text only receipt
    $mime->setTXTBody($text);
    // define body for HTML capable recipients
    $mime->setHTMLBody($html);

    // specify a file to attach below, relative to the script's location if not using an attachment, comment these lines out set appropriate MIME type for attachment you are using below, if applicable for reference see http://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types

    $file = "attachment.jpg";
    $mimetype = "image/jpeg";
    $mime->addAttachment($file, $mimetype);

    // specify the SMTP server credentials to be used for delivery if using a third party mail service, be sure to use their hostname
    $host = "mail.emailsrvr.com";
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


    $body = $mime->get();
    $headers = $mime->headers($headers);

    $mail = $smtp->send($to, $headers, $body);

    if (PEAR::isError($mail)) {
      echo("
      " . $mail->getMessage() . "
      ");
    } else {
      echo("
      Message successfully sent!
      ");
    }
    ?>


### Related article

[Test CDOSYS SMTP functionality](/how-to/test-cdosys-smtp-functionality)

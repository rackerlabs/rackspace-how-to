---
permalink: sending-html-mail-via-php-in-cloud-sites/
audit_date:
title: Send HTML Mail via PHP in Cloud Sites
type: article
created_date: '2013-12-18'
created_by: Bryon Farris
last_modified_date: '2013-12-19'
last_modified_by: Ross Diaz
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is an expansion of an existing article regarding basic SMTP authentication with PHP, which can be found [here](/how-to/test-php-smtp-functionality).

Within the Cloud Sites environment, it is possible to craft an HTML formatted email message 
for delivery when using SMTP authentication for delivery by making use of the built in 
Mail_Mime function provided by the PHP Pear framework.

### Sending HTML Enabled Mail via SMTP

The following variables will need to be adjusted as needed:

-  $from
-  $to
-  $subject
-  $text
-  $html
-  $file
-  $mimetype
-  $host
-  $username
-  $password

The code below requires that you supply a valid SMTP hostname along with user credentials 
for authenticating against. If using a third party mail service, you will need to replace 
mail.emailsrvr.com with the appropriate SMTP server hostname relative to the service you 
are employing. The code also allows for the attachment of files from your Cloud Sites 
filesystem to the message, as long as a valid MIME type definition is supplied.

```
<?php
 require_once "Mail.php";
 require_once "Mail/mime.php";

 // see http://pear.php.net/manual/en/package.mail.mail-mime.php
 // for further extended documentation on Mail_Mime

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

 // specify a file to attach below, relative to the script's location
 // if not using an attachment, comment these lines out
 // set appropriate MIME type for attachment you are using below, if applicable
 // for reference see http://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types

 $file = "attachment.jpg";
 $mimetype = "image/jpeg";
 $mime->addAttachment($file, $mimetype);

 // specify the SMTP server credentials to be used for delivery
 // if using a third party mail service, be sure to use their hostname
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
```

**Note:** [Mail.php](http://pear.php.net/package/Mail) and [Mail/mime.php](http://pear.php.net/package/Mail_Mime/) are [PEAR](http://pear.php.net/) modules and are installed on the server. They are included in the default [include_path](http://www.php.net/manual/en/ini.core.php) for PHP, so [requiring](http://php.net/manual/en/function.require.php) it here will work by default without any additional effort on your part.

### Related article

-  [Test PHP SMTP functionality](/how-to/test-php-smtp-functionality)

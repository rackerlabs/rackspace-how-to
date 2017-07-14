---
permalink: introduction-to-mailgun-email-automation/
audit_date:
title: Introduction to Mailgun email automation
type: article
created_date: '2012-12-06'
created_by: Evan Nabors
last_modified_date: '2017-06-28'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

Mailgun is an email automation service provided by Rackspace. It offers
a complete cloud-based email service for sending, receiving and tracking
email sent through your websites and applications. Mailgun features are
available through an intuitive RESTful API or using traditional email
protocols like SMTP.

Rackspace Cloud customers can send 50,000 emails per month for free with
Mailgun's basic plan. As of July 2013, Rackspace pre-configures Windows
and Linux images for Cloud Servers with Managed Operations to send email
via Mailgun using SMTP.

The power of Mailgun comes in its wide array of use cases. Mailgun is
capable of integrating with a local postfix service, sending email
through SMTP and integrating programmatically with your existing cloud
applications. For example, Mailgun, when properly configured, can
deliver emails from a blogging software content management system (CMS)
such as WordPress, integrate with bug tracking software or any open
source software needing to send emails. Mailgun can also be used to
handle incoming email.

Rackspace Cloud customers can access Mailgun from directly within
the Cloud Control Panel from the Rackspace Cloud menu at the top of the window. To send more than the free
50,000 emails per month with the basic plan, you must pick a paid
plan in the Mailgun control panel.

For more information about Mailgun pricing for Rackspace customers, see
the [Rackspace pricing page](http://www.mailgun.com/rackspace).

This article provides example configurations for Mailgun. To get the
most from your services with Mailgun, be sure to view the advanced
resources available in the [Further reading](#further-reading)section.

### Sending emails via SMTP

Integration with Mailgun programatically is available from languages
with an SMTP library. Let's take a look at a trivial Python script that
instructs Mailgun to send an email through SMTP. We will leverage the
smtplib library available natively in Python.

    import smtplib

    def send_message_via_smtp():
      smtp = smtplib.SMTP("smtp.mailgun.org", 587)
      smtp.login("username@example.com", "password")
      smtp.sendmail("from@example.com", "to@example.com", "mime_message_body")

    send_message_via_smtp();

We begin by importing the smtplib package with `import`.  We then create
a Python function to contain the code. Inside we create an object named
smtp which is an instance of SMTP. In the login method we pass our
mailgun SMTP credentials. In the sendmail method we define the sender,
recipient, and email body data. We end the script calling the
`send_message_via_smtp function`.

**Note:** You will use the username and password from the [Mailgun control
panel](https://mailgun.com/sessions/new).

### Sending emails via HTTP

SMTP is the most common protocol used when sending email. It is used by
most email applications. However, SMTP may not be the first choice for
coding due to MIME format underpenings. Sending via HTTP provides a
simpler approach. With HTTP the application simply posts the content as
parameters to Mailgun. The parameters match those required when sending
a normal email: "From", "To", "Cc", "Bcc", "Subject" and so on.

Let's take a look at a trivial cURL example.

    curl -s -k --user api:key-3ax6xnjp29jd6fds4gc373sgvjxteol0 \
    https://api.mailgun.com/v2/samples.mailgun.org/messages \
    -F from='Excited User <me@samples.mailgun.org>'\
    -F to=tom@example.com\
    -F to=mary@example.com\
    -F subject='Hello'\
    -F text='Testing some Mailgun awesomeness!'

The above example sends an email to two different addresses, with a
subject of "Hello" and body "Testing some Mailgun awesomeness!". The
HTTP API supports features such as file uploads, sending in test mode
and more. See the [Mailgun
documentation](http://documentation.mailgun.com/user_manual.html) for
more information.

### Receiving messages via HTTP

Mailgun is able to receive email via rules you define. This is performed
by generating routes within the Mailgun control panel or through the
API. Once added, emails reaching Mailgun, for which a route is generated
can be forwarded to your application via the use of an HTTP POST or your
inbox. The following screenshot presents an example route from the Mailgun
control panel.

<img src="{% asset_path rackspace-email/introduction-to-mailgun-email-automation/1560-3231-newimg2_0.png %}" width="700" />

Routes can be created for static email addresses and for a regular
expression (regex) pattern match. They are also available to forward an
HTTP request, for sending the email to your application. See the [Mailgun
documentation](https://documentation.mailgun.com/user_manual.html#receiving-forwarding-and-storing-messages) for more information.

### Further reading

This article included a few possibilities available with Mailgun. The
mailgun website provides extensive API Reference material for multiple
languages. Following are a few links that will enhance your
experience using the product:

-   Mailgun [Quickstart
    Guide](https://documentation.mailgun.com/quickstart.html)
-   Mailgun [User
    Manual](http://documentation.mailgun.com/user_manual.html)
-   Complete Mailgun [Documentation](http://documentation.mailgun.com/)
-   Mailgun [pricing page for Rackspace
    customers](http://www.mailgun.com/rackspace)

For support with the Mailgun product, please contact Mailgun directly
at:

-   Email: <support@mailgun.com>
-   Chat: <http://www.mailgun.com>

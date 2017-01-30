---
permalink: test-cdosys-smtp-functionality/
audit_date:
title: Test CDOSYS SMTP functionality
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-23'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

To test CDOSYS functionality, use the following code saved into a file
with a **.asp** extension. CDOSYS is a built-in component in ASP, so
using it from your ASP code takes no additional effort on your part.

We recommend that you use an SMTP relay that requires authentication.
Because of stringent anti-spam filters, sending mail through
unauthenticated SMTP servers (including the localhost relay on Cloud
Sites) can result in delays or undelivered email.

### Example code using CDOSYS

For the following variables, replace the example values with the
appropriate values for your system:

-   .Item(cdoSMTPServer)
-   .Item(cdoSendUserName)
-   .Item(cdoSendPassword)
-   .To
-   .From


        <%
        Const cdoSendUsingMethod       = "http://schemas.microsoft.com/cdo/configuration/sendusing"
        Const cdoSendUsingPort         = 2
        Const cdoSMTPServer            = "http://schemas.microsoft.com/cdo/configuration/smtpserver"
        Const cdoSMTPServerPort        = "http://schemas.microsoft.com/cdo/configuration/smtpserverport"
        Const cdoSMTPConnectionTimeout = "http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout"
        Const cdoSMTPAuthenticate      = "http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"
        Const cdoBasic                 = 1
        Const cdoSendUserName          = "http://schemas.microsoft.com/cdo/configuration/sendusername"

        Const cdoSendPassword          = "http://schemas.microsoft.com/cdo/configuration/sendpassword"

        Dim objConfig  ' As CDO.Configuration
        Dim objMessage ' As CDO.Message
        Dim Fields     ' As ADODB.Fields

        `Get a handle on the config object and it's fields.`

        Set objConfig = Server.CreateObject("CDO.Configuration")
        Set Fields = objConfig.Fields

        `Set config fields we care about`
        With Fields
            .Item(cdoSendUsingMethod)       = cdoSendUsingPort
            .Item(cdoSMTPServer)            = "mail.(domain.com)"
            .Item(cdoSMTPServerPort)        = 25
            .Item(cdoSMTPConnectionTimeout) = 10
            .Item(cdoSMTPAuthenticate)      = cdoBasic
            .Item(cdoSendUserName)          = "webmaster@example.com"
            .Item(cdoSendPassword)          = "yourPassword"

            .Update

        `End With`

        Set objMessage = Server.CreateObject("CDO.Message")

        Set objMessage.Configuration = objConfig

        With objMessage
            .To       = "Nobody <nobody@example.com>"
            .From     = "Web Master <webmaster@example.com>"
            .Subject  = "Test message using CDOSYS SMTP"

            .TextBody = "This is a test email message using CDOSYS SMTP Sent @ " & Now()
            .Send
        End With
            Set Fields = Nothing
            Set objMessage = Nothing
            Set objConfig = Nothing %>

### Related article

[Test PHP SMTP functionality](/how-to/test-php-smtp-functionality)

---
permalink: assemble-rackspace-email-webmail-and-outlook-web-access-owa-login-widget/
audit_date:
title: Assemble Rackspace Email webmail and Outlook web access (OWA) login widget
type: article
created_date: '2016-08-24'
created_by: Tom Mitchell
last_modified_date: '2016-08-24'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

Select and run one of the following scripts to add a login portal on your site
for webmail through both Rackspace Email and Exchange mailboxes. Download both
the script and the corresponding image to use.

<table border="1" cellpadding="0" cellspacing="0">
    <tbody>
        <tr>
            <td valign="top" width="422">
                <p>
                    <strong>Background image</strong>
                </p>
            </td>
            <td valign="top" width="298">
                <p>
                    <strong>Script</strong>
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="422">
                <p>
                    <{% include rackspace-email/rackspace-email-and-outlook-web-access-login-widget/Images/stdtall350x210.png %}
                        height="205"
                        width="335"
                    />
                </p>
            </td>
            <td valign="top" width="298">
                <p>
                    &lt;pre&gt;&lt;div
                    style="background-image:url(http://rackspace.com/apps/support/media/widget/BG-350x210.png);width:350px;height:210px;background-repeat:no-repeat;"&gt;
                    &lt;div style="padding:20px;font-family:Verdana, Geneva, sans-serif;font-size:13px;color:#333;"&gt; &lt;form name="loginForm"
                    style="margin:0px" onsubmit="submitForm();" action="https://apps.rackspace.com/login.php" method="post"&gt; &lt;table&gt; &lt;tr
                    height="30px"&gt; &lt;td width="80px"&gt;Username:&lt;/td&gt; &lt;td&gt; &lt;input type="text" name="user_name" class="small"
                    style="width:190px;"&gt;&lt;/td&gt; &lt;/tr&gt; &lt;tr height="30px"&gt; &lt;td width="80px"&gt;Password:&lt;/td&gt; &lt;td&gt;&lt;input
                    type="password" name="password" class="small" style="width:120px;"&gt;&lt;input type="submit" value="Login" class="small"
                    style="width:60px;margin:0px 0px 0px 10px;"&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr height="20px"&gt; &lt;td width="80px"&gt;&lt;/td&gt;
                    &lt;td&gt; &lt;input type="checkbox" name="remember" id="remember" style="width:12px;margin:0px 5px 0px 0px;"&gt;&lt;font
                    style="font-size:11px"&gt;Remember me&lt;/font&gt; &lt;input type=hidden name='useSSL' id='useSSL' value=''&gt; &lt;/td&gt; &lt;/tr&gt;
                    &lt;/table&gt; &lt;/form&gt; &lt;div style="text-align:center;padding-top:10px"&gt; &lt;img
                    src="http://rackspace.com/apps/support/media/widget/rackspace-logo.png" width="120" height="40" border="0" align="center" /&gt;
                    &lt;/div&gt; &lt;div style="text-align:center;padding-top:10px;"&gt; &lt;font style="font-size:9px;"&gt; &lt;a
                    href="http://www.rackspace.com/apps/email_hosting" color="#0000FF" style="text-decoration:none;" target="_blank"&gt;Business Email Hosting
                    by Rackspace&lt;/a&gt; &lt;/font&gt; &lt;/div&gt; &lt;/div&gt; &lt;/div&gt; &lt;script type="text/javascript"
                    src="http://webmail.emailsrvr.com/mail/js/login.js"&gt;&lt;/script&gt;&lt;script type="text/javascript"&gt;preloadForm(); if
                    (getQueryVariable("fail") == 1) {alert("Incorrect username or password.")}&lt;/script&gt; &lt;/pre&gt;
                </p>
            </td>
        </tr>
        <tr>
            <td valign="top" width="422">
                <p>
                    {% include rackspace-email/rackspace-email-and-outlook-web-access-login-widget/Images/stdshort320x150.png %}
                </p>
            </td>
            <td valign="top" width="298">
                <p>
                    &lt;pre&gt;&lt;div
                    style="background-image:url(http://rackspace.com/apps/support/media/widget/BG-320x150.png);width:320px;height:150px;background-repeat:no-repeat;"&gt;
                    &lt;div style="padding:15px;font-family:Verdana, Geneva, sans-serif;font-size:13px;color:#333;"&gt; &lt;form name="loginForm"
                    style="margin:0px" onSubmit="submitForm();" action="https://apps.rackspace.com/login.php" method="post"&gt; &lt;table&gt; &lt;tr
                    height="20px"&gt; &lt;td width="80px"&gt;Username:&lt;/td&gt; &lt;td&gt; &lt;input type="text" name="user_name" class="small"
                    style="width:190px;"&gt;&lt;/td&gt; &lt;/tr&gt; &lt;tr height="20px"&gt; &lt;td width="80px"&gt;Password:&lt;/td&gt; &lt;td&gt;&lt;input
                    type="password" name="password" class="small" style="width:120px;"&gt;&lt;input type="submit" value="Login" class="small"
                    style="width:60px;margin:0px 0px 0px 10px;"&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr height="20px;"&gt; &lt;td width="80px"&gt;&lt;/td&gt;
                    &lt;td&gt; &lt;input type="checkbox" name="remember" id="remember" style="margin:0px 5px 0px 0px;"&gt;&lt;font
                    style="font-size:11px;"&gt;Remember me&lt;/font&gt; &lt;input type=hidden name='useSSL' id='useSSL' value=''&gt; &lt;/td&gt; &lt;/tr&gt;
                    &lt;/table&gt; &lt;/form&gt; &lt;div style="text-align:center;padding-top:15px;"&gt; &lt;font style=";font-size:9px;"&gt; &lt;a
                    href="http://www.rackspace.com/apps/email_hosting/compare" color="#0000FF" style="text-decoration:none;" target="_blank"&gt;Email Hosting
                    Service from Rackspace&lt;/a&gt; &lt;/font&gt; &lt;/div&gt; &lt;/div&gt; &lt;/div&gt; &lt;script type="text/javascript"
                    src="http://webmail.emailsrvr.com/mail/js/login.js"&gt;&lt;/script&gt;&lt;script type="text/javascript"&gt;preloadForm(); if
                    (getQueryVariable("fail") == 1) {alert("Incorrect username or password.")}&lt;/script&gt; &lt;/pre&gt;
                </p>
            </td>
        </tr>
    </tbody>
</table>

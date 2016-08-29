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

**Standard tall:** 350x x 210px

**Image**
   
   <img src="{% asset_path rackspace-email/assemble-email-and-outlook-login-widget/stdtall350x210.png %}"/> 

**Script** 
   
      <div style="background-image:url(http://rackspace.com/apps/support/media/widget/BG-350x210.png);width:350px;height:210px;background-repeat:no-repeat;"> <div style="padding:20px;font-family:Verdana, Geneva, sans-serif;font-size:13px;color:#333;"> <form name="loginForm" style="margin:0px" onsubmit="submitForm();" action="https://apps.rackspace.com/login.php" method="post"> <table> <tr height="30px"> <td width="80px">Username:</td> <td> <input type="text" name="user_name" class="small" style="width:190px;"></td> </tr> <tr height="30px"> <td width="80px">Password:</td> <td><input type="password" name="password" class="small" style="width:120px;"><input type="submit" value="Login" class="small" style="width:60px;margin:0px 0px 0px 10px;"> </td> </tr> <tr height="20px"> <td width="80px"></td> <td> <input type="checkbox" name="remember" id="remember" style="width:12px;margin:0px 5px 0px 0px;"><font style="font-size:11px">Remember me</font> <input type=hidden name='useSSL' id='useSSL' value=''> </td> </tr> </table> </form> <div style="text-align:center;padding-top:10px"> <img src="http://rackspace.com/apps/support/media/widget/rackspace-logo.png" width="120" height="40" border="0" align="center" /> </div> <div style="text-align:center;padding-top:10px;"> <font style="font-size:9px;"> <a href="http://www.rackspace.com/apps/email_hosting" color="#0000FF" style="text-decoration:none;" target="_blank">Business Email Hosting by Rackspace</a> </font> </div> </div> </div> <script type="text/javascript" src="http://webmail.emailsrvr.com/mail/js/login.js"></script><script type="text/javascript">preloadForm(); if (getQueryVariable("fail") == 1) {alert("Incorrect username or password.")}</script>

- - -

**Standard short:** 320x x 150px 

**Image** 
   
   <img src="{% asset_path rackspace-email/assemble-email-and-outlook-login-widget/stdshort320x150.png%}" /> 

**Script** 
   
      <div style="background-image:url(http://rackspace.com/apps/support/media/widget/BG-320x150.png);width:320px;height:150px;background-repeat:no-repeat;"> <div style="padding:15px;font-family:Verdana, Geneva, sans-serif;font-size:13px;color:#333;"> <form name="loginForm" style="margin:0px" onSubmit="submitForm();" action="https://apps.rackspace.com/login.php" method="post"> <table> <tr height="20px"> <td width="80px">Username:</td> <td> <input type="text" name="user_name" class="small" style="width:190px;"></td> </tr> <tr height="20px"> <td width="80px">Password:</td> <td><input type="password" name="password" class="small" style="width:120px;"><input type="submit" value="Login" class="small" style="width:60px;margin:0px 0px 0px 10px;"> </td> </tr> <tr height="20px;"> <td width="80px"></td> <td> <input type="checkbox" name="remember" id="remember" style="margin:0px 5px 0px 0px;"><font style="font-size:11px;">Remember me</font> <input type=hidden name='useSSL' id='useSSL' value=''> </td> </tr> </table> </form> <div style="text-align:center;padding-top:15px;"> <font style=";font-size:9px;"> <a href="http://www.rackspace.com/apps/email_hosting/compare" color="#0000FF" style="text-decoration:none;" target="_blank">Email Hosting Service from Rackspace</a> </font> </div> </div> </div> <script type="text/javascript" src="http://webmail.emailsrvr.com/mail/js/login.js"></script><script type="text/javascript">preloadForm(); if (getQueryVariable("fail") == 1) {alert("Incorrect username or password.")}</script>

- - -

**Footer & Nav Wide:** 820px × 50px

**Image**

   <img src="{% asset_path rackspace-email/assemble-email-and-outlook-login-widget/ftrnavwide820x50.png %}" />  
   
**Script**

      <div style="background-image:url(http://rackspace.com/apps/support/media/widget/BG-820x50.png);width:820px;height:50px;background-repeat:no-repeat;"> <div style="height:50px;font-family:Verdana, Geneva, sans-serif;font-size:13px;color:#333;text-align:left"> <table style="float:right;height:50px;width:200px;font-size:9px;text-align:right;line-height:14px;margin-right:10px"> <tr><td valign="middle"> <a href="http://www.rackspace.com/apps/email_hosting/rackspace_email" color="#0000FF" style="text-decoration:none;" target="_blank">Hosted Email powered by Rackspace</a> </td></tr> </table> <div style="padding:12px 0px 0px 10px"> <form name="loginForm" style="margin:0px" onSubmit="submitForm();" action="https://apps.rackspace.com/login.php" method="post"> Username: <input type="text" name="user_name" class="small" style="width:90px;margin:0px 5px 0px 0px;vertical-align:middle"> Password: <input type="password" name="password" class="small" style="width:90px;margin:0px 5px 0px 0px;vertical-align:middle"> <input type=hidden name='useSSL' id='useSSL' value=''> <input type="submit" value="Login" class="small" style="width:60px;margin:0px 5px 0px 5px;vertical-align:middle"> <input type="checkbox" name="remember" id="remember" style="width:12px;vertical-align:middle;margin-right:5px;"><font style="font-size:11px;vertical-align:middle">Remember me</font> </form> </div> </div> </div> <script type="text/javascript" src="http://webmail.emailsrvr.com/mail/js/login.js"></script><script type="text/javascript">preloadForm(); if (getQueryVariable("fail") == 1) {alert("Incorrect username or password.")}</script> 

- - -


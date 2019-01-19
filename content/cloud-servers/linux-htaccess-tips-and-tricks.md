---
permalink: linux-htaccess-tips-and-tricks 
audit_date:
title: Linux .htaccess Tips and Tricks
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

This article is intended to be used on Cloud Servers (running Apache), Dedicated Servers (running Apache), and Cloud Sites.  Cloud Sites does have some specific .htaccess rules you might be interested in.  I would suggest looking at the article Cloud Sites .htaccess tips and tricks for those.
There are many many modifications you can make to your site via a .htaccess file.  This article is going to go over a few of them.  
Locate your .htaccess file:

In the UNIX and Linux file systems, the names of hidden files are preceded by a period (such as .htaccess and .htpasswd). Fileman and many FTP applications do not display such hidden files by default.

Use the following instructions to display hidden files in Fileman and other popular FTP application.

Core-FTP:
1. Open the server directory in FTP.
2. Right-click in the file listing window. 
3. Select Directory Commands > List Mode > Advanced. 
4. Refresh the list view. 

Hidden files should now be visible.

CuteFTP:
1. Open the Site Manager. 
2. Choose the connection and click Edit. 
3. Ensure that Filters is selected. 
4. Click the Filter button towards the bottom. 
5. Select Enable remote filters (Server applied filter). 
6. In the box, type -al. 
7. Click Apply. 
8. Log in with that connection.

Dreamweaver (versions earlier than Creative Suite 4):
1. Click the Options icon, and navigate to View > Show Hidden Files. 
2. Disconnect from and then reconnect to your server. 

The files should now be visible.

Dreamweaver (Creative Suite 4 and later):
1. Click the Options icon, and navigate to View > Show Hidden Files. The Files tab is in a tab group with a small arrow icon to the far right. 
2. Click this arrow. 
3. In the popup menu, choose View > Show Hidden Files. 
4. Disconnect from and then reconnect to your server. 

The files should now be visible.

Fetch:
1. Open Preferences. 
2. Click Misc. 
3. Click Obscure Options.
4. Select Send LIST -al to UNIX servers.

Fileman:
1. At the top of the screen, click the Prefs button on the Tool menu. 
2. Select the Show Hidden Files? check box. 
3. Click Save.

FileZilla 1:
1. Start FileZilla and then select the View menu. 
2. Select Show Hidden Files.

FileZilla 2:
1. Start FileZilla, and then select the Server menu. 
2. Select Force Showing Hidden Files.

FTP Voyager:
1. In the FTP Site Profile Manager, select a profile. 
2. Click the Advanced button. 
3. Select the Connection category. 
4. Type -la in the Extra LIST Parameter.

LeechFTP:

1. Run LeechFTP. 
2. Select File > Options. 
3. Select the Transfers tab. 
4. In the List Command box, type LIST-a. 
5. Click Accept. 
6. Log in and view the directory.
SecureFX:
1. Before logging on, right-click the connection and select Properties. 
2. Select Category > Options > FTP. 
3. For Directory Listing Options, select All entries. 
4. Log in.
Smart FTP:
1. From the SmartFTP menu, select Favorites > Edit Favorites. 

The SmartFTP Favorites window appears. 

1. Right-click the appropriate favorite and select Properties. The Properties dialog box appears. 
2. Under the FTP option, select Transfer. 
3. On the Transfer tab, under Directory Listing Options, enable the options [-a] Show All Files and [-L] Resolve Links.

Transmit:
1. In Transmit, open the Preferences. 
2. In the toolbar, click Files. 
3. Select the Show All Hidden Files option.

WS_FTP:
1. In WS_FTP, click Connect. 
2. Right-click the site that you want to modify, and select Properties. 
3. Click the Startup tab. 
4. In the Remote File Mask box, type -a, and then click OK to confirm.

How do I change the PHP maximum execution time?:

With a Cloud Server you can make this change in the php.ini.  But you can also do this via a .htaccess file. If you are using Cloud Sites, you will definitely want to do this via the .htaccess.
In an .htaccess file in the same directory as the executing script, include this line:
php_value max_execution_time ? 
Replace "?" with the with the value you need to replace it with. Our default time is set to 30 seconds and a successful modification of the maximum execution will show in your PHP info file.
How Do I Change The PHP Memory Limit Value?:

With a Cloud Server you can make this change in the php.ini.  But you can also do this via a .htaccess file. If you are using Cloud Sites, you will definitely want to do this via the .htaccess.
Include this line in an .htaccess file in the same directory as the script:
php_value memory_limit ?M 
Replace ? with the appropriate megabyte value. Our default size is set to 128MB, and a successful 

modification of the memory limit will show in your PHP info file.
How do I change the PHP maximum upload file size?:

With a Cloud Server you can make this change in the php.ini.  But you can also do this via a .htaccess file. If you are using Cloud Sites, you will definitely want to do this via the .htaccess.
In an .htaccess file in the same directory as the upload script, include this line:
php_value upload_max_filesize ?M
Replace "?" with the applicable value. Our default size is set to 8MB and a successful modification of the 

max upload size will show in your PHP info file.
If you're running WordPress and continue to have problems after increasing the upload_max_filesize value you can try adding these settings as well:
php_value post_max_size ?M php_value max_execution_time 200 php_value max_input_time 200 
How do I change the post max size value?:

With a Cloud Server you can make this change in the php.ini.  But you can also do this via a .htaccess file. If you are using Cloud Sites, you will definitely want to do this via the .htaccess.
In an .htaccess file in the same directory as the executing script, include this line:
php_value post_max_size ?M
Replace "?" with the with the required value needed such as 16.
Performing a 301 redirect:

A 301 redirect is an HTTP status message that permanently diverts a user or search engine to URL that is different from the one originally requested. It is an effective way to ensure that users and search engines will find your site.
The following examples are specific to PHP and work only if your cloud site is configured for PHP. The examples will not work for IIS (ASP / ASP.NET).
Basic redirect examples:
The following examples are basic 301 redirect examples that use the .htaccess text file. Save this file in the folder from which you want to perform the redirect.
For example, if you place the .htaccess file in the /www.domain.com/web/content/ folder (via FTP), the redirect occurs when a visitor goes to http://www.domain.com in their browser.
Redirect a single page:
Redirect 301 /pagename.php http://www.domain.com/pagename.html 
Redirect an entire site:
Redirect 301 / http://www.domain.com/ 
Redirect an entire site to a subfolder:
Redirect 301 / http://www.domain.com/subfolder/ 
Redirect a subfolder to another site:
Redirect 301 /subfolder http://www.domain.com/
Redirect using RedirectMatch 301:
The following syntax redirects any file with the .html extension to use the same filename using the .php extension instead.
RedirectMatch 301 (.*)\.html$ http://www.domain.com$1.php
Rewrite examples:
You can also perform a 301 redirect by rewriting with .htaccess.
Redirect from old domain to new domain:
RewriteEngine on RewriteBase / RewriteRule (.*) http://www.newdomain.com/$1 [R=301,L]
Redirect to www location:
RewriteEngine on RewriteBase / RewriteCond %{HTTP_HOST} ^domain.com [NC] RewriteRule ^(.*)$ http://www.domain.com/$1 [R=301,NC] 
Redirect to www location with subdirectory:
RewriteEngine on RewriteBase / RewriteCond %{HTTP_HOST} domain.com [NC] RewriteRule ^(.*)$ http://www.domain.com/directory/index.html [R=301,NC]
Redirect from www to non-www location:
RewriteEngine on RewriteBase / RewriteCond %{HTTP_HOST} ^www.domain.com [NC] RewriteRule ^(.*)$ http://domain.com/$1 [R=301,L] 
Tip: Use the following SEO tool to verify that your redirect is search engine friendly: http://www.webconfs.com/redirect-check.php
How do I change the default character set for PHP?:

In an .htaccess file placed in the directory you want to have the character set changed on, include this line:
php_value default_charset ? 
Replace the "?" with the character set required for your site, such as ISO-8859-1.
Note: Cloud Sites has a default character set of UTF-8 if otherwise not specified in .htaccess.
Define MIME types on your Linux/Apache based site:

If you find that there is a MIME type that is not defined on your Linux/Apache based site, you can define it via your .htaccess file. You add the following code:
AddType MIMETYPE .extension
For example, to add the MIME type for a QuickTime .mov or .qt file, you would use the following code:
AddType video/quicktime .qt .mov
For an extensive list of the MIME types that Apache supports, go to http://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types.
Note: The preceding link might not be fully formatted correctly for the .htaccess file.
Force SSL on your PHP site:

To force SSL on your PHP site, you can use the following code in a .htaccess file:
#Force SSL on entire site RewriteEngine On RewriteBase / RewriteCond %{ENV:HTTPS} !on [NC] RewriteRule ^(.*)$ https://(YOURDOMAIN)/$1 [R,L]   

#Force SSL on a specific directory  RewriteEngine On RewriteBase / RewriteCond %{ENV:HTTPS} !on [NC] RewriteRule ^DIRNAME/(.*)$ https://YOURDOMAIN/DIRNAME/$1 [R,L] 
Change the default document on your PHP site:

To change the default document on your PHP-based sites, you can use the following code in the .htaccess file:
DirectoryIndex filename.html
This code causes filename.html to be treated as your default page, or default directory page. You can also add additional file names to it, as shown in the following example:
DirectoryIndex filename.html default.htm home.php home.html 
How do I change the default character set for HTML?:

In an .htaccess file placed in the directory you want to have the character set changed on, include the following lines:
AddDefaultCharset ? # Or AddType 'text/html; charset=?' html DefaultLanguage en-US 
Replace the "?" with the character set required for your site, such as UTF-8.
Note: Cloud Sites has a default character set of UTF-8 if otherwise not specified in .htaccess
How do I enable SSI?:

You can activate Server Side Includes (SSI) by using .htaccess with the following directives:
AddType text/html .shtml AddHandler server-parsed .shtml Options Indexes FollowSymLinks Includes 
Note: You cannot serve PHP content using SSI. For PHP content, we recommend using PHP's include or require statements or using an inline frame, such as shown in the following example:
<html> <head></head> <body> <iframe src="/knowledge_center/test.php"> </iframe> </body> </html>
How Do I Stop PHP Scripts From Executing In A Directory?:

In an .htaccess file placed in the directory you want to stop scripts include this line:
removehandler .php 
Then simply add the file extensions you wish to stop.
How Do I Process PHP On HTML Pages Or Other Pages?:

You can cause PHP to be processed on HTM and HTML pages by setting those extensions to be served by the PHP handler. You can enable PHP processing on .htm and .html in your .htaccess with the following directives:
AddHandler application/x-httpd-php php htm html AddType text/html php
Following the above example, if you wanted to process PHP on files with the extension .test, you could do so using:
AddHandler application/x-httpd-php php test AddType text/html php 
You can find more information on AddHandler and AddType at Apache's website.
Note: We recommend using just the PHP extension for PHP pages.
How do I set up error pages for my PHP site?

You can use an .htaccess file to create custom error pages for your site's defaulted to PHP.
ErrorDocument "code" "location of error document"
For example, with a 404 error:
ErrorDocument 404 /404.html
You can use this directive to create error pages for other error codes as well. You will need to specify the path to the error page relative to the location of the .htaccess file.
How do I enable directory listing in PHP?:

In a .htaccess file, insert the following line:
Options +Indexes 
Turning off "magic quotes":

For many Joomla CMS installs, customers need to turn off the “Magic Quotes” option in PHP 5.3. (In PHP 5.4, this feature was removed (http://php.net/manual/en/security.magicquotes.php). Insert the following code into the .htaccess file to turn off the “Magic Quotes” function:
php_flag magic_quotes_gpc Off 
Set the time zone for a Linux/PHP website:

Use the information in this article to change the time zone of your website running on Linux/PHP.
Default time zone:
The default time zone for Rackspace Cloud Sites websites is Central Time (North America), and daylight saving time is observed. The UTC offsets are as follows:
* Central Standard Time    UTC−6:00
* Central Daylight Time     UTC−5:00
To change the time zone:
To change your time zone on your Linux/PHP website, you must edit your .htaccess file to include the following line:
php_value date.timezone TIMEZONE
For a comprehensive list of time zone values to use for TIMEZONE, go to http://www.php.net/manual/en/timezones.php.
The following example shows the time zone set to Dubai:
php_value date.timezone Asia/Dubai
To test the change:
Check the PHP information file, or run the following PHP file:
<?php echo date('l jS \of F Y h:i:s A'); ?>

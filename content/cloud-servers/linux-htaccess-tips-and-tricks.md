---
permalink: linux-htaccess-tips-and-tricks/
audit_date: '2019-01-18'
title: Linux .htaccess tips and tricks
created_date: '2019-02-14'
created_by: Rackspace Community
last_modified_date: '2019-02-14'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article is intended for use with the following technologies:

- Linux&reg; cloud servers that are running Apache&reg;
- Dedicated Linux servers that are running Apache
- Rackspace Cloud Sites

You can make modifications to your site by using an **.htaccess** file.
This article shows you some of the modifications that you can make.

### Locate your .htaccess file

In the UNIX&reg; and Linux file systems, the names of hidden files are
preceded by a period (for example, **.htaccess** and **.htpasswd**). FileMan
and many File Transfer Protocol (FTP) applications do not display hidden 
files by default.

The way that you display hidden files, including your **.htaccess** file,
depends on the FTP program that you are using. This section 
shows you how to do this in popular FTP programs.

### Change the PHP maximum execution time

If you are using Cloud Sites, you must change the PHP&reg; maximum execution
time for a cloud server by using an **.htaccess** file.

In an **.htaccess** file in the same directory as the executing script,
include the following line:

    php_value max_execution_time <PHP maximum execution time>

Replace `PHP maximum execution time` with the value that you
want to use as the maximum execution time. The default time is 30 seconds.
When you successfully modify the file, the new maximum execution time 
displays in your PHP information file.

### Change the PHP memory limit

If you are using Cloud Sites, you must change the PHP memory limit by using an
**.htaccess** file.

In an **.htaccess** file in the same directory as the executing script,
include the following line:

    php_value memory_limit <megabytes>M

Replace `megabytes` with the megabyte value that you want to
use. The default size is 128 MB. When you successfully modify the file, the new
memory limit displays in your PHP information file.

### Change the PHP maximum upload file size

If you are using Cloud Sites, you must change the PHP maximum upload file size
by using an **.htaccess** file.

In an **.htaccess** file in the same directory as the executing script,
include the following line:

    php_value upload_max_filesize <megabytes>M

Replace `megabytes` with the megabyte value that you want
to use. The default size is 8 MB. When you successfully modify the file,
the new maximum upload size displays in your PHP information file.

If you're running WordPress&reg; and continue to have problems after you
increase the maximum upload size, you can try including the following
additional settings:

    php_value post_max_size ?M php_value max_execution_time 200 php_value max_input_time 200

### Change the post maximum size value

If you are using Cloud Sites, you must change the post maximum size by
using an **.htaccess** file.

In an **.htaccess** file in the same directory as the executing script,
include the following line:

    php_value post_max_size <megabytes>M

Replace `megabytes` with the megabyte value that you want
to use (for example, `16`).

### Create a 301 redirect

A 301 redirect is a HyperText Transfer Protocol (HTTP) status message 
that permanently transfers a user or search engine to a 
Uniform Resource Locator (URL) that is different from the one that was 
originally requested. Using a 301 redirect is an effective way 
to ensure that users and search engines find your content.

The following examples are specific to PHP and work only if your cloud site is
configured for PHP. These examples do not work for Internet Information
Services (IIS) with Active Server Pages (ASP) or ASP.NET.

#### Redirect examples

The following examples are basic 301 redirect examples that use an
**.htaccess** file. Save this file in the folder from which you want
to perform the redirect.

For example, if you place the **.htaccess** file in the
**/www.domain.com/web/content/ folder** (by using FTP), the redirect
occurs when a visitor goes to http://www.domain.com in their browser.

The following table shows how to perform different types of redirects
by adding code to your **.htaccess** file:

<table>
  <tr>
    <th>Redirect</th>
    <th>Example</th>
  </tr>
  <tr>
    <td>Redirect a single page</td>
    <td><code>Redirect 301 /pagename.php http://www.domain.com/pagename.html</code></td>
  </tr>
  <tr>
    <td>Redirect an entire site</td>
    <td><code>Redirect 301 / http://www.domain.com/</code></td>
  </tr>
  <tr>
    <td>Redirect an entire site to a subfolder</td>
    <td><code>Redirect 301 / http://www.domain.com/subfolder/</code></td>
  </tr>
  <tr>
    <td>Redirect a subfolder to another site</td>
    <td><code>Redirect 301 /subfolder http://www.domain.com/</code></td>
  </tr>
</table>

##### Redirect by using RedirectMatch 301

The following syntax redirects a file with the **.html** extension to use
the same file name, but with the **.php** extension instead:

    RedirectMatch 301 (.*)\.html$ http://www.domain.com$1.php

You can also perform a 301 redirect by _rewriting_ a URL in your **.htaccess**
file. Several of the following sections include example code for performing this task.

**Redirect from an old domain to a new domain**

Use the following rewrite syntax to redirect from an old domain to a new
domain:

    RewriteEngine on RewriteBase / RewriteRule (.*) http://www.newdomain.com/$1 [R=301,L]

**Redirect to a location that uses the www URL prefix**

Use the following rewriting syntax to redirect to a location that uses the
`www` URL prefix:

    RewriteEngine on RewriteBase / RewriteCond %{HTTP_HOST} ^domain.com [NC] RewriteRule ^(.*)$ http://www.domain.com/$1 [R=301,NC]

**Redirect to a subdirectory of a location that uses the www URL prefix**

Use the following rewriting syntax to redirect to a subdirectory of a location
that uses the `www` URL prefix:

    RewriteEngine on RewriteBase / RewriteCond %{HTTP_HOST} domain.com [NC] RewriteRule ^(.*)$ http://www.domain.com/directory/index.html [R=301,NC]

**Redirect from a location that uses the the www URL prefix to one that does not**

Use the following rewriting syntax to redirect from a location that uses the
`www` URL prefix to one that does not:

    RewriteEngine on RewriteBase / RewriteCond %{HTTP_HOST} ^www.domain.com [NC] RewriteRule ^(.*)$ http://domain.com/$1 [R=301,L]

**Note**: Use the [Search Engine Friendly Redirect Checker
tool](https://www.webconfs.com/redirect-check.php) to verify that your
redirect is search engine friendly.

### Change the default character set for PHP

You can also change the default character set for PHP by modifying your
**.htaccess** file. In an **.htaccess** file in the directory for which you
want to change the character set, include the following line of code:

    php_value default_charset <character set>

Replace `character set` with the character set that your site
requires, such as `ISO-8859-1`.

**Note**: Cloud Sites uses the default character set UTF-8 if you do not
specify a different one in an **.htaccess** file.

### Define MIME types on your Linux and Apache-based website

If there is a Multipurpose Internet Mail Extensions (MIME) type that is not
defined on your Linux and Apache-based website, you can define it in your
**.htaccess** file by adding the following code:

    AddType MIMETYPE .extension

For example, to add the MIME type for a QuickTime **.mov** or **.qt** file,
you add the following code:

    AddType video/quicktime .qt .mov

For an extensive list of the MIME types that Apache supports, see the [Apache
Software Foundation Subversion
Server](http://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types).

**Note**: The formatting in the preceding link might not be entirely correct
for use in an **.htaccess** file.

### Force SSL on your PHP site

You can force users to access your PHP site securely over Secure Sockets Layer
(SSL) by adding code to your **.htaccess** file.

Use the following code to force SSL on an entire website:

    #Force SSL on entire site RewriteEngine On RewriteBase / RewriteCond %{ENV:HTTPS} !on [NC] RewriteRule ^(.*)$ https://(YOURDOMAIN)/$1 [R,L]

Use the following code to force SSL on a specific directory:

    #Force SSL on a specific directory  RewriteEngine On RewriteBase / RewriteCond %{ENV:HTTPS} !on [NC] RewriteRule ^DIRNAME/(.*)$ https://YOURDOMAIN/DIRNAME/$1 [R,L]

### Change the default document on your PHP site

To change the default document on your PHP-based website, add the
following code to the **.htaccess** file:

    DirectoryIndex filename.html

You can also add additional file names to this code, as shown in the following
example:

    DirectoryIndex filename.html default.htm home.php home.html

### Change the default character set for HTML

To change the default character set for HTML, add the following lines to
an **.htaccess** file that is located in the directory for which you want to
change the character set, as shown in the following example:

    AddDefaultCharset <character set>

Replace `character set` with the character set that your site
requires, such as `UTF-8`.

Alternatively, you can use the `AddType` directive, as shown in the following
example:

    AddType 'text/html; charset=<character set>' html DefaultLanguage en-US

**Note**: Cloud Sites uses the default character set UTF-8 if you do not
specify a different one in an **.htaccess** file.

### Enable SSI

You can activate Server Side Includes (SSI) by using **.htaccess** with the
following directives:

    AddType text/html .shtml AddHandler server-parsed .shtml Options Indexes FollowSymLinks Includes

**Note**: You cannot serve PHP content by using SSI. For PHP content, we
recommend that you use PHP's include or require statements, or use an inline
frame, as shown in the following example:

    <html> <head></head> <body> <iframe src="/knowledge_center/test.php"> </iframe> </body> </html>

### Stop PHP scripts from executing in a directory

To stop PHP scripts from executing in a directory, create an **.htaccess**
file in that directory and add the following line:

    removehandler .php

Then, add the file extensions that you want to stop.

### Process PHP on HTML and other pages

You can cause PHP to be processed on HTM and HTML pages by setting those
extensions to be served by the PHP handler. You can enable PHP processing on
**.htm** and **.html** files in your **.htaccess** by using the following
directives:

    AddHandler application/x-httpd-php php htm html AddType text/html php

You can also process PHP on files that have the extension **.test** by using
the following directives:

    AddHandler application/x-httpd-php php test AddType text/html php

You can find more information about the `AddHandler` and `AddType` directives
at the Apache website.

**Note**: We recommend that you use only the PHP extension for PHP pages.

### Set up error pages for your PHP website

You can create custom error pages for your PHP website by placing a line
similar to the following example in your **.htaccess** file:

    ErrorDocument "code" "location of error document"

The following example shows how to create a 404 error page:

    ErrorDocument 404 /404.html

You can use this directive to create error pages for other error codes as
well. However, you need to specify the path to the error page relative to the
location of the **.htaccess** file.

### Enable directory listing in PHP

To enable directory listing in PHP, add the following line to your
**.htaccess** file:

    Options +Indexes

### Turn off Magic Quotes

For many Joomla!&reg; content management system (CMS) installations, customers
need to turn off the **Magic Quotes** option in PHP 5.3. (This feature was
removed as of PHP 5.4). Add the following code to your **.htaccess** file to
turn off the **Magic Quotes** function:

    php_flag magic_quotes_gpc Off

### Set the time zone for a website that is running on Linux and PHP

Use the information in this section to change the time zone for your website
that is running on Linux and PHP.

#### Default time zone

The default time zone for Rackspace Cloud Sites is Central Time
(North America), and daylight saving time is observed. The UTC offsets are as
follows:

* Central Standard Time    UTC−6:00
* Central Daylight Time    UTC−5:00

#### Change the time zone

To change the time zone for your website that is running on Linux and PHP, you
must edit your **.htaccess** file to include the following line:

    php_value date.timezone <TIMEZONE>

For a comprehensive list of possible `TIMEZONE` values, see the
[List of Supported Timezones](http://www.php.net/manual/en/timezones.php).

The following example shows how to set the time zone to Dubai:

    php_value date.timezone Asia/Dubai

#### Test the time zone change

To test the time-zone change, check the PHP information file, or run the
following PHP file:

    <?php echo date('l jS \of F Y h:i:s A'); ?>

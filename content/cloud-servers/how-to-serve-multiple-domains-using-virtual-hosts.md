---
node_id: 1139
title: How to Serve Multiple Domains Using Virtual Hosts
type: article
created_date: '2011-06-17'
created_by: Rackspace Support
last_modified_date: '2016-01-15'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

Most people serve more than one domain on their [Cloud Server](http://www.rackspace.com/cloud/servers/). Whether for different domain names or different subdomains of the same domain, the procedure is the same.

Our Linux Cloud Servers are built from a minimal installation image, meaning there are no additional applications installed beyond the base Operating System.

To begin using your server, you initiate an SSH session to remotely connect to the Cloud Server. In order to make it more useful, you are responsible for installing applications. This can be done by compiling a program from the source code, or more commonly using the Package Manager to install an application from a repository.

The most common application installed is a web server, such as Apache or Nginx.

In order to serve a website you must set up the rest of the framework to serve your content, and then upload the actual content to your server. This entails installing any databases or Content Management Systems your site requires. For networking, you will need to add appropriate DNS records in the Rackspace Cloud control panel, to let the DNS system and the rest of the Internet know that your site is hosted from a Rackspace Cloud IP address.

Finally, you come to the part that allows your Cloud Server to deliver your websites, and for this you will need to create your sites as virtual hosts within your webserver configuration.

### Procedure

Greatly simplified, the procedure for serving a website is as follows:

A browser sends a request to your Cloud Server's IP address asking for the contents of 'http://yourexampledomain.com/' (your domain name).

Your web server jumps into action and says "Yes! I have something for you matching your request". The web server does its 'thing' and serves up an http representation of your site, which is sent to the requesting browser. The browser then translates the http and parses it to a human-readable form.

Simple, right? But how does your web server know what http to serve? If all you are serving is one website from the server, then it will serve the html in your /var/www/html directory, starting with index.html. We've all made a "Hello World" page before, right? But having a unique server for every website you want to serve is costly, and an inefficient use of your resources.

### Virtual Hosts

Here come name based virtual hosts, allowing you to serve content for multiple websites from one server.

One of the first lines in any virtual host configuration file contains the domain name that is associated with the vhost.

This is a sample vhost configuration for Apache, serving domain1.com:

        <VirtualHost \*:80>

          ServerName  domain1.com

          ServerAlias www.domain1.com

        </VirtualHost>

and this is a sample vhost configuration for Nginx:

        server {

          server_name  www.domain1.com;

          rewrite ^/(.\*) http://domain1.com/$1 permanent;

Each configuration starts slightly differently, but the same principle applies - that particular virtual host will respond to queries for 'domain1.com' and 'www.domain1.com'.

### Multiple domains

So, serving different content for different domains is as simple as adding another virtual host.

Let's say you have a subdomain called 'blog.domain1.com' serving a blog.

The basic creation process would be to create a folder in your public_html folder with the relevant files (let's say a Wordpress install).

A virtual host would be created with the server_name or ServerName as 'blog.domain1.com' which would be configured to point to the blog files and folders in your public_html folder.

### Troubleshooting

This section shows you how to troubleshoot problems with Apache name-based virtual host configurations.

It will show you useful commands for testing your virtual host configuration, how to interpret their output, and how they help fix common virtual host configuration problems.

#### Restart Apache

Before we make a start on learning to diagnose your issue, make sure that you have restarted Apache since the last changes you made to your Apache configuration files:

- For Red Hat derived distributions use:

        sudo /usr/sbin/httpd -k restart

- For Debian derived distributions use:

        sudo /usr/sbin/apache2 -k restart

If Apache gives you any warning or error message, make a note of it for the moment because we're first going to take a look at a diagnostic command that's used to check your virtual host configuration.

All the examples that follow assume you have created two virtual hosts: vh1.example.com and vh2.example.com.

We're now ready to make a start, run the following command on the webserver:

- For Red Hat derived distributions use:

        sudo /usr/sbin/httpd -S

- For Debian derived distributions use:

        sudo /usr/sbin/apache2 -S

#### Understanding the Configuration Report

The following example shows the configuration report for a server configured with two name-based virtual hosts.

            VirtualHost configuration:

		    wildcard NameVirtualHosts and \_default\_ servers:

		[1] \*:80        is a NameVirtualHost
		[2] default server vh1.example.com (/etc/httpd/conf/custom/virtualhost.conf:3)
		[3] port 80 namevhost vh1.example.com (/etc/httpd/conf/custom/virtualhost.conf:3)
		[4] port 80 namevhost vh2.example.com (/etc/httpd/conf/custom/virtualhost.conf:8)
		[5] Syntax OK

[1] Reports that the webserver is listening on the default port of 80 for all the IP addresses that Apache is listening to, and that name-based virtual hosting is turned on. The \* is a wildcard specifying all IP addresses.

[2] Reports the default virtual host the webserver will serve for any requests for which no specific hostname is requested. It also shows the path to the configuration file and line number where this configuration is set.

[3] Reports the port and the name of first virtual host configuration found, the file it is configured in and the line number its configuration starts on.

[4] Reports the port and the name of second virtual host configuration found, the file it is configured in and the line number its configuration starts on.

[5] Reports if the configuration syntax is correct, though that does not necessarily mean your site is working!

The output above was produced by the following virtual host file configuration:

        NameVirtualHost \*:80   Turns on name-based host resolution and binds the virtual server to IP addresses and ports as in [1] above. The \* is a wildcard specifying all IP addresses.

		<VirtualHost \*:80>   Configures the first and default virtual host in [2] & [3] above. It is the default because it is the first virtual host whose IP and port matches those in the NameVirtualHost directive before it.
		  ServerName vh1.example.com
		  DocumentRoot /var/www/vhosts/vh1
		</VirtualHost>

		<VirtualHost \*:80>   Configures the second virtual host in [4] above.
		  ServerName vh2.example.com
		  DocumentRoot /var/www/vhosts/vh2
		</VirtualHost>

Now that that you've seen how a basic virtual host configuration looks and how it maps to Apache's own configuration report, let's use those reports to look at common configuration issues.

### Common Virtual Host Configuration Mistakes

1. Running "httpd -S", reports an error stating "[warn] \_default\_ VirtualHost overlap on port 80, the first has precedence"

        [Wed May 18 15:24:51 2011] [warn] \_default\_ VirtualHost overlap on port 80, the first has precedence
		VirtualHost configuration:
		wildcard NameVirtualHosts and \_default\_ servers:
		\*:80                   vh1.example.com (/etc/httpd/conf/custom/virtualhost.conf:3)
		\*:80                   vh2.example.com (/etc/httpd/conf/custom/virtualhost.conf:8)
		Syntax OK

  This indicates that multiple virtual hosts are trying to use the same "socket" without being set up as name-based virtual hosts. This error often shows up on a first pass at creating Apache virtual hosts because the default NameVirtualHost directive is commented out with a hash. That hash instructs Apache to ignore the directive.

  To fix this in a default Apache configuration file, you would check that the "NameVirtualHost \*:80" directive is not commented out. If working with a minimal Apache configuration file, you would add a "NameVirtualHost \*:80" directive prior to the individual virtual host configurations.

  In the example below, we show the commented "NameVirtualHost \*:80" directive that caused the above error:

        #NameVirtualHost \*:80

		<VirtualHost \*:80>
		  ServerName vh1.example.com
		  DocumentRoot /var/www/vhosts/vh1
		</VirtualHost>

		<VirtualHost \*:80>
		  ServerName vh2.example.com
		  DocumentRoot /var/www/vhosts/vh2
		</VirtualHost>

2. Running "httpd -S", we see an error stating "<VirtualHost> directive requires additional arguments"

        Syntax error on line 8 of /etc/httpd/conf/custom/virtualhost.conf:
		<VirtualHost> directive requires additional arguments

  This means that the virtual host's VirtualHost directive is missing a vital element. The VirtualHost is the first line of any individual virtual host configuration. In this case, it is on the 8th line of the configuration file /etc/httpd/conf/custom/virtualhost.conf.

  Let's review the Apache configuration that produced this above error:

        NameVirtualHost \*:80

		<VirtualHost \*:80>
		  ServerName vh1.example.com
		  DocumentRoot /var/www/vhosts/vh1
		</VirtualHost>

		<VirtualHost>
		  ServerName vh2.example.com
		  DocumentRoot /var/www/vhosts/vh2
		</VirtualHost>

  Note how the <VirtualHost> directive has no IP address or port specified. That's the cause of our error.

  Below is a corrected version of the above example. Notice the addition of "\*:80" to the virtual host's <VirtualHost> directive. As always, the \* is a wildcard specifying all IP addresses.

        NameVirtualHost \*:80

		<VirtualHost \*:80>
		  ServerName vh1.example.com
		  DocumentRoot /var/www/vhosts/vh1
		</VirtualHost>

		<VirtualHost \*:80>
		  ServerName vh2.example.com
		  DocumentRoot /var/www/vhosts/vh2
		</VirtualHost>

3. Running "httpd -S", we see evidence that a virtual host is listed above the "is a NameVirtualHost" line:

        VirtualHost configuration:
		wildcard NameVirtualHosts and \_default\_ servers:
		\*:800                  vh2.example.com (/etc/httpd/conf/custom/virtualhost.conf:8)
		\*:80                   is a NameVirtualHost
		default server vh1.example.com (/etc/httpd/conf/custom/virtualhost.conf:3)
		port 80 namevhost vh1.example.com (/etc/httpd/conf/custom/virtualhost.conf:3)
		Syntax OK

  Note in the example above how the configuration test reports about vh2.example.com's configuration before it reports the NameVirtualHost configuration. You may see this error if the VirtualHost IP address or port does not match that of a webserver's NameVirtualHost directive. In this example, the test reports that vh2.example.com uses port 800 rather than the NameVirtualHost's port 80. We mis-typed "80" when we configured the vh2.example.com virtual host's listening port. As a result, Apache is seeing vh2.example.com as a separate port-based virtual host.

  The test command "httpd -S" will not warn you about this because it is permissible to configure virtual hosts to use any port, such as 800, without their being part of the name-based virtual host configuration on the same server.

  If you do make this mistake, you will probably see content from the default virtual host (vh1.example.com in this example) when you try to view the site in your web browser.

  To help you map the above output to how its configuration file might look, here's the virtual host configuration that created this error:

        NameVirtualHost \*:80

		<VirtualHost \*:80>
		  ServerName vh1.example.com
		  DocumentRoot /var/www/vhosts/vh1
		</VirtualHost>

		<VirtualHost \*:800>
		  ServerName vh2.example.com
		  DocumentRoot /var/www/vhosts/vh2
		</VirtualHost>

4. Running "httpd -S" reports an error stating "Warning: DocumentRoot [/etc/httpd/var/www/vhosts/vh2] does not exist"

  This specific error indicates that the directory specified as containing the website files for the vh2.example.com virtual host does not exist, or that Apache cannot access it. Similar errors can appear for any of the file paths specified in a virtual host configuration, such as the paths to the virtual host's log files.

  To fix, make sure you created the directory. If you definitely created it, check there are no mistakes in the DocumentRoot directive. A common mistake is to miss out the path's initial "/". Leaving out the "/" instructs Apache to read the path - the DocumentRoot path in this case - as a relative path. That is, as a path relative to the main Apache configuration's ServerRoot path.

  As there are several ways in which this error is often created, we've created an example of just one of them. In the example below, you'll see that the path for the DocumentRoot in the first virtual host starts with a "/" but the second one does not. This makes Apache read the DocumentRoot path for vh2.example.com as an extension of the default webserver's ServerRoot path /etc/httpd/ to create a DocumentRoot path of /etc/httpd/var/vhosts/vh2.

        ServerRoot /etc/httpd

		NameVirtualHost \*:80

		<VirtualHost \*:80>
		  ServerName vh1.example.com
		  DocumentRoot /var/www/vhosts/vh1
		</VirtualHost>

		<VirtualHost \*:80>
		  ServerName vh2.example.com
		  DocumentRoot var/www/vhosts/vh2
		</VirtualHost>

### Using Curl to Test Your Site

Once you've checked the virtual host configuration files and "httpd -S" reports no issues try to access your site using curl:

        curl -I www.example.com

The output should look something like this:

        HTTP/1.1 200 OK
		Date: Sat, 07 May 2011 15:09:50 GMT
		Server: Apache/2.2.3 (CentOS)
		Last-Modified: Mon, 25 Apr 2011 11:07:43 GMT
		ETag: "2c32e-77-4a1bc37723dc0"
		Accept-Ranges: bytes
		Content-Length: 119
		Content-Type: text/html; charset=UTF-8

The first line shows the all-important status code. We want to see a "200 OK" as in the above line's "HTTP/1.1 200 OK". If that's what you see, test the webserver with your browser, though be careful with this because you browser may be displaying a cached page.

If you don't see "200 OK", some of the common messages you may see are:

1. curl: (6) Couldn't resolve host "vh1.example.com" If curl reports it cannot find the host you need to check that you have an A record for the domain that points to the correct IP address for your server. The dig command can be used to do this:

        dig vh2.example.com

2. curl: (7) couldn't connect to host

Check that your Apache configuration files include the necessary Listen directives and that they are not commented out. You'll need "Listen 80" at the very least.

### Check Error Log

Another way to look for this is check the error log. The default error log is at /var/log/httpd/error\_log on Red Hat-derived systems and at /var/log/apache2/error\_log on Debian-derived systems. You will see "no listening sockets available, shutting down" following Apache's attempt to restart if you're not specifying any port for Apache to listen on.

        [Mon May 09 21:50:21 2011] [notice] SIGHUP received.  Attempting to restart
		no listening sockets available, shutting down
		Unable to open logs

-  HTTP/1.1 403 Forbidden.

        HTTP/1.1 403 Forbidden
		Date: Tue, 10 May 2011 21:14:29 GMT
		Server: Apache/2.2.3 (CentOS)
		Content-Type: text/html; charset=iso-8859-1

If you get this response when using curl it indicates the permissions aren't quite right for allowing Apache access to the page you're requesting. This could be because the directory permissions are incorrect or it could be the page itself.

You may also see a 403 error if the DocumentRoot contains no "index" file - typically named "index.html" or "index.php". Note the filename is case sensitive. Or you may see 403s if the virtual host doesn't contain a DirectoryIndex directive specifying the default index file.

The Apache error logs will usually reveal on which directory or file the permissions are incorrectly set. The default error log is at /var/log/httpd/error\_log on Red Hat-derived systems and at /var/log/apache2/error\_log on Debian-derived systems.

Individual virtual hosts may write errors to their own logs if they were configured to, so check these logs too.

Do not be put off by the volume of data in a busy server's log files. Instead, use the "tail" command to selectively view just the most recent ten lines of a log. For example:

        tail /var/log/apache2/error\_log

Better yet, you can see new entries as they are added to the error\_log - or any log - while you test the server if you instruct the "tail" command to "follow" the log. For example:

        tail -f /var/log/httpd/error\_log

### Common Permissions-Related Errors

To round off our exploration of common Apache configuration errors, here are some examples of how some common permissions-related configuration errors appear in Apache's logs

        [Sun May 15 20:06:17 2011] [error] [client 203.0.113.96] (13)Permission denied: file permissions deny server access: /var/www/vhosts/vh2/index.html

This log entry shows that permissions on the index.html file for vh2.example.com are denying access to Apache.

        [Sun May 15 20:07:37 2011] [error] [client 203.0.113.96] (13)Permission denied: access to /index.html denied

This log entry shows that permissions on the /var/www/vhosts/vh2 directory are blocking Apache's read request.

        [Sun May 15 20:11:32 2011] [error] [client 203.0.113.96] (13)Permission denied: access to / denied

This log entry shows that Apache does not have execute or read permissions on one of the directories above DocumentRoot.

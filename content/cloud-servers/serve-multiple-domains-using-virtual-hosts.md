---
permalink: serve-multiple-domains-by-using-virtual-hosts/
audit_date: '2016-09-21'
title: Serve multiple domains by using virtual hosts
type: article
created_date: '2011-06-17'
created_by: Rackspace Support
last_modified_date: '2016-09-21'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

Most people serve more than one domain on their cloud server. Whether you are
serving different domains or different subdomains of the same domain, the procedure is the same. This article describes how to create virtual hosts to serve multiple domains and how to troubleshoot problems with Apache name-based virtual host configurations.

### Creating virtual hosts for multiple domains

When a browser sends a request to your server's IP address asking for the contents of your domain name (for example, `http://yourexampledomain.com`), your web server serves up an HTTP representation of your site. If the server is serving only one website, it serves the HTML in your `/var/www/html` directory, starting with `index.html`. But having a unique
server for every website that you want to serve is costly and an inefficient use of your resources.

*Name-based virtual hosts* enable you to serve content for multiple websites from one server.

One of the first lines in any virtual host configuration file specifies the domain name that
is associated with the virtual host. Following is an example virtual host configuration for Apache, serving `domain1.com`:

        <VirtualHost \*:80>

          ServerName  domain1.com

          ServerAlias www.domain1.com

        </VirtualHost>

The following example shows a virtual host configuration for NGINX:

        server {

          server_name  www.domain1.com;

          rewrite ^/(.\*) http://domain1.com/$1 permanent;

Each configuration starts slightly differently, but the same principle applies: that particular virtual host responds to queries for `domain1.com` and `www.domain1.com`.

To serve different content for different domains, you add another virtual host.

For example, you have a subdomain called blog.domain1.com that is serving a blog.

First you create a folder in your public_html folder with the relevant files for the blog (for example, a WordPress installation).

Then you create a virtual host with the `server_name` or `ServerName` specified as `blog.domain1.com` and configure it to point to the blog files and folders in your `public_html` folder.  

For more information on virtual hosts, use the Apache document [Name-base Virtual Hosts](https://httpd.apache.org/docs/2.4/vhosts/name-based.html)    

### Troubleshooting

This section shows you how to troubleshoot problems with Apache name-based virtual host configurations. It provides useful commands for testing your virtual host configuration, describes how to interpret their output, and describes how they help fix common virtual host configuration problems.

#### Restart Apache

Before you can diagnose an issue, ensure that you have restarted Apache since the last time you made changes to your Apache configuration files:

- For Red Hat distributions use:

        sudo /usr/sbin/httpd -k restart

- For Debian distributions use:

        sudo /usr/sbin/apache2 -k restart

If Apache gives you a warning or error message, note it for later. Your next step is to get information about the virtual host configuration.

#### Get a configuration report

Run the `-S` command on the web server to check your virtual host configuration

- For Red Hat derived distributions use:

        sudo /usr/sbin/httpd -S

- For Debian derived distributions use:

        sudo /usr/sbin/apache2 -S

The output shows the virtual host settings from the configuration file. The following example shows the configuration report for a server configured with two name-based virtual hosts: vh1.example.com and vh2.example.com. The numbered lines are explained following the example.


          VirtualHost configuration:

		      wildcard NameVirtualHosts and \_default\_ servers:

		  [1] \*:80        is a NameVirtualHost
		  [2] default server vh1.example.com (/etc/httpd/conf/custom/virtualhost.conf:3)
		  [3] port 80 namevhost vh1.example.com (/etc/httpd/conf/custom/virtualhost.conf:3)
		  [4] port 80 namevhost vh2.example.com (/etc/httpd/conf/custom/virtualhost.conf:8)
		  [5] Syntax OK

- Line [1] reports that the web server is listening on the default port of 80 for all the IP addresses that Apache is listening to, and that name-based virtual hosting is turned on. The \* is a wildcard specifying all IP addresses.

- Line [2] reports the default virtual host that the web server ServerAlias for any requests for which no specific hostname is requested. It also shows the path to the configuration file and line number where this configuration is set.

- Line [3] reports the port and the name of the first virtual host configuration found, the file it is configured in and the line number its configuration starts on.

- Line [4] reports the port and the name of the second virtual host configuration found, the file it is configured in and the line number its configuration starts on.

- Line [5] reports whether the configuration syntax is correct, although that doesn't necessarily mean your site is working

The following output was produced by following virtual host file configuration:

      NameVirtualHost \*:80   Turns on name-based host resolution and binds the virtual server to IP addresses and ports as in [1] above. The \* is a wildcard specifying all IP addresses.

		  <VirtualHost \*:80>   Configures the first and default virtual host in [2] & [3] above. It is the default because it is the first virtual host whose IP and port matches those in the NameVirtualHost directive before it.
		  ServerName vh1.example.com
		  DocumentRoot /var/www/vhosts/vh1
	  	</VirtualHost>

		  <VirtualHost \*:80>   Configures the second virtual host in [4] above.
		    ServerName vh2.example.com
		    DocumentRoot /var/www/vhosts/vh2
		  </VirtualHost>

Now that that you've seen a basic virtual host configuration looks and how it maps to Apache's own configuration report, you can use those reports to look at common configuration issues. The following sections describe some of these issues and provide guidance for how to fix them.

#### Hosts not set up as name-based virtual hosts

If running `httpd -S` reports the following warning:

    [Wed May 18 15:24:51 2011] [warn] \_default\_ VirtualHost overlap on port 80, the first has precedence
		VirtualHost configuration:
		wildcard NameVirtualHosts and \_default\_ servers:
		\*:80                   vh1.example.com (/etc/httpd/conf/custom/virtualhost.conf:3)
		\*:80                   vh2.example.com (/etc/httpd/conf/custom/virtualhost.conf:8)
		Syntax OK

This warning indicates that multiple virtual hosts are trying to use the same "socket" without being set up as name-based virtual hosts. This error often occurs when Apache virtual hosts are first created because the default `NameVirtualHost` directive is commented out with a hash symbol. That symbol instructs Apache to ignore the directive.

To fix this issue in a default Apache configuration file, verify that the `NameVirtualHost *:80` directive is not commented out. If you are working with a minimal Apache configuration file, add a `NameVirtualHost *:80` directive above the individual virtual host configurations.

The following example shows the commented directive that caused the error:

    #NameVirtualHost \*:80

		<VirtualHost \*:80>
		  ServerName vh1.example.com
		  DocumentRoot /var/www/vhosts/vh1
		</VirtualHost>

		<VirtualHost \*:80>
		  ServerName vh2.example.com
		  DocumentRoot /var/www/vhosts/vh2
		</VirtualHost>

#### Element missing from VirtualHost directive

If running `httpd -S` reports the following error message:

    Syntax error on line 8 of /etc/httpd/conf/custom/virtualhost.conf:
		<VirtualHost> directive requires additional arguments

This message means that the virtual host's `VirtualHost` directive is missing a necessary element. The `VirtualHost` directive is the first line of any individual virtual host configuration. In this case, the error is on the line 8 of the configuration file `/etc/httpd/conf/custom/virtualhost.conf`.

Following is the Apache configuration that produced this above error:

        NameVirtualHost \*:80

		<VirtualHost \*:80>
		  ServerName vh1.example.com
		  DocumentRoot /var/www/vhosts/vh1
		</VirtualHost>

		<VirtualHost>
		  ServerName vh2.example.com
		  DocumentRoot /var/www/vhosts/vh2
		</VirtualHost>

Note that the second `VirtualHost` directive has no IP address or port specified, which is the cause of the error.

Following is a corrected version of the preceding example, with the addition of `\*:80` to the virtual host's directive. As always, the `\*` is a wildcard specifying all IP addresses.

    NameVirtualHost \*:80

		<VirtualHost \*:80>
		  ServerName vh1.example.com
		  DocumentRoot /var/www/vhosts/vh1
		</VirtualHost>

		<VirtualHost \*:80>
		  ServerName vh2.example.com
		  DocumentRoot /var/www/vhosts/vh2
		</VirtualHost>

#### Port numbers don't match

If running `httpd -S`, shows that a virtual host is listed above the `is a NameVirtualHost` line:

    VirtualHost configuration:
		wildcard NameVirtualHosts and \_default\_ servers:
		\*:800                  vh2.example.com (/etc/httpd/conf/custom/virtualhost.conf:8)
		\*:80                   is a NameVirtualHost
		default server vh1.example.com (/etc/httpd/conf/custom/virtualhost.conf:3)
		port 80 namevhost vh1.example.com (/etc/httpd/conf/custom/virtualhost.conf:3)
		Syntax OK

In this example, the configuration test reports the `vh2.example.com` configuration before it reports the `NameVirtualHost` configuration. You might see this error if the VirtualHost IP address or port doesn’t match the IP address or port of the web server’s `NameVirtualHost` directive. In this example, the report shows that `vh2.example.com` uses port 800 rather than port 80. The port number was mistyped when the `vh2.example.com` virtual host's listening port was configured. As a result, Apache treats `vh2.example.com` as a separate port-based virtual host.

The `httpd -S` test command doesn’t *warn* you about this issue because it’s permissible to configure virtual hosts to use any port, such as 800, without them being part of the name-based virtual host configuration on the same server.

If you do experience this error, you will probably see content from the default virtual host (`vh1.example.com` in this example) when you try to view the site in your web browser.

To help you map the preceding output to its configuration file, following is the virtual host configuration that created this error:

    NameVirtualHost \*:80

		<VirtualHost \*:80>
		  ServerName vh1.example.com
		  DocumentRoot /var/www/vhosts/vh1
		</VirtualHost>

		<VirtualHost \*:800>
		  ServerName vh2.example.com
		  DocumentRoot /var/www/vhosts/vh2
		</VirtualHost>

#### Document root directory does not exist
If running `httpd -S` reports the following error:

    Warning: DocumentRoot [/etc/httpd/var/www/vhosts/vh2] does not exist

This error indicates that the directory specified as containing the website files for the `vh2.example.com` virtual host does not exist, or that Apache cannot access it. Similar errors can appear for any of the file paths specified in a virtual host configuration, such as the paths to the virtual host's log files.

To fix this error, ensure that you created the directory. If you did create it, verify that there are no mistakes in the `DocumentRoot` directive. A common mistake is to omit the path's initial slash (/). Leaving out the slash instructs Apache to read the path—the `DocumentRoot` path in this case—as a relative path, that is, as a path relative to the main Apache configuration's `ServerRoot` path.

The following example shows just one of the ways in which this error is created. The path for the `DocumentRoot` directive in the first virtual host starts with a slash but the second one doesn’t.

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

#### Using cURL to test your site

After you check the virtual host configuration files and the `httpd -S` command reports no issues, try to access your site by using cURL:

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

The first line shows the status code. You want to see `200 OK`, as shown in the example. If that's what you see, test the web server with your browser, but consider that your browser might display a cached page.

If you don't see `200 OK`, you might see one of the following common messages:

- `curl: (6) Couldn't resolve host vh1.example.com`

  If cURL reports that it can’t find the host, verify that there is an A record for the
  domain that points to the correct IP address for your server. You can use the dig to do this:

        dig vh1.example.com

- `curl: (7) couldn't connect to host`

  Verify that your Apache configuration files include the necessary `Listen` directives and that they are not commented out. It needs `Listen 80` at the very least.

  Another way to verify this is to check the error log. The default error log is at `/var/log/httpd/error_log` on Red Hat systems and `/var/log/apache2/error_log` on Debian systems. If no port is specified for Apache to listen on, the message no listening sockets available, shutting down follows Apache's attempt to restart.

      [notice] SIGHUP received.  Attempting to restart no listening sockets available, shutting down
		  Unable to open logs

-  `HTTP/1.1 403 Forbidden`

  This response indicates that the permissions that allow Apache access to the page that you're requesting are not correct. Perhaps the directory permissions are incorrect, or it could be the page itself.

  You might also see a 403 response in the following situations:

    - The `DocumentRoot` contains no index file—-typically named `index.html` or `index.php`. Note that the file name is case sensitive.

    - The virtual host doesn't contain a `DirectoryIndex` directive specifying the default index file.

  The Apache error logs usually show which directory or file has the permissions set incorrectly. Individual virtual hosts might write errors to their own logs if they were configured to, so check these logs too.

  Don’t be discouraged by the amount of data in a busy server's log files. Instead, use the tail command to selectively view just the most recent ten lines of a log. For example:

        tail /var/log/apache2/error\_log

  You can see new entries as they are added to the error log, or any log, while you test the server if you instruct the `tail` command to "follow" the log. For example:

        tail -f /var/log/httpd/error\_log

#### Common permissions-related errors

Following are examples of some common permissions-related configuration errors that can appear in Apache's logs:

- The following log entry shows that permissions on the `index.html` file for `vh2.example.com` are denying access to Apache.

      [error] [client 203.0.113.96] (13)Permission denied: access to /index.html denied

- The following log entry shows that permissions on the `/var/www/vhosts/vh2` directory are blocking Apache's read request.

      [error] [client 203.0.113.96] (13)Permission denied: file permissions deny server access: /var/www/vhosts/vh2/index.html

- The following log entry shows that Apache does not have execute or read
permissions on one of the directories above `DocumentRoot`.

      [error] [client 203.0.113.96] (13)Permission denied: access to / denied

---
permalink: cloud-sites-technology-option-changes/
audit_date:
title: Cloud Sites Technology Option Changes
type: article
created_date: '2012-06-12'
created_by: Rackspace Support
last_modified_date: '2014-01-02'
last_modified_by: Jered Heeschen
product: Cloud Sites
product_url: cloud-sites
---

The Rackspace Cloud Sites product
used to give customers the ability to set up a hosting environment in
which customers serve Windows/IIS applications from a Linux/PHP based
site and vice versa. Cloud Sites removed this ability to host disparate
technologies due to changes in our technology options. The hybrid
technology option removal allows us to release new changes more
quickly.

Please refer to the scenarios below
for rewrite help for sites that need to be adapted to account for the
single-technology requirement.

### SCENARIO 1

Running a single CMS or application on your site, but this application
is running on an inappropriate technology. For example, Wordpress, which is intended for
Linux, running on a .NET site technology.

**Solution.** Simply change your technology selection in the Classic
Cloud Control panel.  On the website features tab, change your site to
the appropriate technology selection to match your application.

Please ensure that you are only running a single application on this
site and ensure that the application is running on the appropriate
technology.

### SCENARIO 2

Running more than one, disparate CMS/Application on your site, and these
applications have different default technologies, one that is an IIS and
one that is PHP/Perl/Python.

**Solutions:**

#### IIS files running on PHP

If you are currently running IIS files (asp, .aspx, etc) on your PHP site, you will need to create
a new site (either a new domain or a subdomain) with Windows/IIS as the
default technology. You will then need to move the IIS files over to
this new domain or subdomain. Once this is finished, you will need to
setup a rewrite on the main PHP site via an
**.htaccess** file to redirect any IIS files to the
new site. An example is given below:

    RewriteRule ^(.+).asp$ http://www.iisexample.com/$1.asp [R=301,NC]

#### PHP files running on IIS

If you are currently running PHP files (.<php, <etc) on your IIS site, you will need to create
a new site (either a new domain or a subdomain) with Linux/PHP as the
default technology. You will then need to move the PHP files over to
this new domain or subdomain. Once this is finished, you will need to
setup a rewrite on the main IIS site via a
web.config file to redirect any PHP files to the
new site. An example is given below:

    <?xml version="1.0" encoding="UTF-8"?>
    <configuration>
        <system.webServer>
            <rewrite>
                <rules>
                    <rule name="Redirect PHP Request" stopProcessing="true">
                        <match url=".*\.php" />
                        <action type="Redirect" url="http://phpexample.com/{R:0}" appendQueryString="true" />
                    </rule>
                </rules>
            </rewrite>
        </system.webServer>
    </configuration>

### PHP based blog running on IIS

If you are currently running a PHP based blog on your IIS based website
(Drupal, Magento, etc) within a blog directory, you can use the
following redirect to redirect any requests to
www.domain.com/blog/\*.php to your new domain (ie blog.domain.com):

    <?xml version="1.0" encoding="UTF-8"?>
    <configuration>
        <system.webServer>
            <rewrite>
                <rules>
                    <rule name="Redirect Blog" stopProcessing="true">
                        <match url="^blog(.*)\.php" />
                        <action type="Redirect" url="http://blog.testingphpstuff.com{R:1}.php" appendQueryString="true" />
                    </rule>
                </rules>
            </rewrite>
        </system.webServer>
    </configuration>

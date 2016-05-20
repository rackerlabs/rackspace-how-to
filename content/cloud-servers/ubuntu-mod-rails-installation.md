---
permalink: ubuntu-mod-rails-installation/
audit_date:
title: Install mod rails on Ubuntu 9.04
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

[Phusion's
Passenger](http://www.modrails.com/ "http://www.modrails.com/")
(mod\_rails) is an exciting development in serving your Ruby on Rails
application with the Apache web server.

Incredibly simple to install and use, you can have a rails application
up and running in no time. You don't have to worry about ports or
setting up a proxy to another server.

### Prerequisites

-   Install Apache
-   Install Ruby and Rubygems



### mod\_rails installation

Passenger (mod\_rails) is a rubygem.

1. Update the rubygems install:

        sudo gem update

2. Install passenger:

        sudo gem install passenger

3. Once passenger is installed, we need to install the Apache2 module:

        sudo passenger-install-apache2-module

4. A dialogue opens in the terminal. Follow the directions in the dialogue.

  The passenger (mod\_rails) install has found a missing dependency.

5. Install the headers using Aptitude:

        sudo aptitude install apache2-prefork-dev

   Once done, we can try the install again:

        sudo passenger-install-apache2-module

6. The install will complete with instructions to add some lines to the main Apache2 config
  file.

        sudo nano /etc/apache2/apache2.conf

**Note:** Passenger is an active gem and is updated all the time.
Rather than copy and paste the following output, please ensure you copy
and paste the output from the install itself.

Because the install used in this article is v2.0.6 install, we added the following lines to my
apache2.conf:

    LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-2.0.6/ext/apache2/mod_passenger.so
       PassengerRoot /usr/lib/ruby/gems/1.8/gems/passenger-2.0.6
       PassengerRuby /usr/bin/ruby1.8

You may have a later version of passenger installed.

### Apache restart 

Use this command to restart Apache:


    sudo /etc/init.d/apache2 restart

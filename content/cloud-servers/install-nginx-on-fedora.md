---
permalink: install-nginx-on-fedora/
audit_date:
title: Install Nginx on Fedora
type: article
created_date: '2020-07-21'
created_by: John Garcia
last_modified_date:
last_modified_by:
product: Cloud Servers
product_url: cloud-servers
---

Nginx&reg; is a web-server service with as much market share as Apache&reg; because of its excellent performance
and flexible feature set. This guide describes how to install Nginx and discusses the next steps for setting up
Nginx to serve your site or application.

### Prerequisites

You need a Linux&reg; server running Fedora&reg;.

### Install Nginx on Fedora

Nginx is available in the default repositories for most popular Linux distributions, including Fedora. To install
Nginx, run the following `dnf` package-manager command:

    sudo dnf install nginx

Enter **y** at the prompt to confirm that you want to install the package.

After the installation completes, run the following command to enable and start the service. These commands start Nginx
and configure it to start up when the server does.

    sudo systemctl enable nginx
    sudo systemctl start nginx

### Open the firewall for Nginx

By default, Nginx listens on the default ports for HTTP and HTTPS traffic (Ports `80` and `443`). However, this does
not mean that it will receive traffic, because the firewall on the system also needs to allow traffic on these ports.
Use the following commands to add the ports necessary for your site by adding the HTTP and HTTPS services:

    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --permanent --add-service=https

Then reload `firewalld` to apply the new settings:

    sudo firewall-cmd --reload

### Test Nginx

After you install the package and open the firewall port or ports, Nginx should display its default webpage. You can see
this by typing your IP address in your web browser. You should see a splash page with the Nginx logo and a "Welcome to Nginx"
message. If you do not see this, double-check that the IP address is correct, Nginx is running, and the firewall settings
are correct. 

### Next steps

You can now use Nginx to start serving your application or website. Use the default configuration to serve a site by putting
its content in the **/var/www/html** directory in your filesystem. If you want to serve more than one site, we recommend that
you set up Nginx server blocks to accommodate this need.

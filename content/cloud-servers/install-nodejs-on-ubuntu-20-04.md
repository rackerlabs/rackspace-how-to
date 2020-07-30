---
permalink: install-nodejs-on-ubuntu-20-04/
audit_date:
title: 'Install Node.js on Ubuntu 20.04'
type: article
created_date: '2020-07-29'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

Node.js is an open-sourced Javascript platform that allows users the ability to quickly build network applications in a scalable manner. 

Node.js lets users use JavaScript for server-side scripting. For the purpose of this article, we will be installing Node.js on a Ubuntu 20.04 machine using a personal package archive (PPA). PPA will have more current versions of node.js available than are available in the standard Ubuntu repository, and you can also explicitly select between Node.js versions to suit your needs.

###Prerequisites 

To follow this guide, you’ll need access to the following:

A non-root user on your server that has sudo privileges enabled (if you’re following best practices, root logins to your Linux servers should be disabled)

###Installing PPA and Node.js

Step 1

Let’s start by making sure that the Ubuntu package installer, apt, has the most up-to-date information:

sudo apt update

###Step 2

Next, install the curl tool, and then install PPA. Notice that in this example we’re requesting “setup_12.x”, which means version 12.x is specifically being requested. You can replace “12.x” with any other desired version in the following commands:

sudo apt-get install curl

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

###Step 3 

Now we can get to the install of Node.js. This command will also install NPM and any dependent packages needed for the install:

sudo apt-get install nodejs

###Step 4

Now that you have Node.js installed, you can check to make sure you have the versions you need installed with the following commands:

node -v
npm -v

###Conclusion

Now that we have installed Node.js, we can move on to building a web server and start making applications.

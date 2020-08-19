---
permalink: install-nodejs-on-ubuntu-20-04/
audit_date: '2020-08-19'
title: 'Install Node.js on Ubuntu 20.04'
type: article
created_date: '2020-07-29'
created_by: Rackspace Support
last_modified_date: '2020-08-19'
last_modified_by: Cat Lookabaugh
product: Cloud Product
product_url: cloud-product
---

Node.js is an open-source JavaScript&reg; platform that enables users to build network applications in a scalable
manner, and do it quickly. 

Node.js lets you use JavaScript for server-side scripting. This article describes how to install Node.js on an
Ubuntu 20.04 server by using a personal package archive (PPA). PPA has more current versions of Node.js available
than you can find in the standard Ubuntu repository. You can also explicitly select between Node.js versions to suit
your needs.

### Prerequisites 

To follow this guide, you need access to a non-root user on your server that has sudo privileges enabled. If you
follow best practices, you should disable root logins to your Linux servers.

### Install PPA and Node.js

Use the following steps to install Node.js:

#### Step 1: Update packages

Ensure that the Ubuntu package installer, `apt`, has the most up-to-date information:

    sudo apt update

#### Step 2: Install PPA

Install the curl tool and then install PPA. This example specifically requests version 12.x with the **setup_12.x** element.
You can replace *12.x* with any other version in the following commands:

    sudo apt-get install curl

    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

#### Step 3: Install Node.js 

The following command installs Node.js, Node Package Manager (NPM), and any dependent packages needed for the install:

    sudo apt-get install nodejs

#### Step 4: Validate the versions

Check to make sure you have the correct versions with the following commands:

    node -v
    npm -v

### Conclusion

With Node.js, you can build a web server and start making applications.

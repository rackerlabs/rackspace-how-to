---
permalink: centos-nginx-virtual-hosts
audit_date:
title: CentOS - Nginx Virtual Hosts
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

### Create the layout

In this example we'll be creating two domains, domain1.com and domain2.com
As the default permissions only allow us, the 'demo' user, to browse our home folder, let's start off by giving Nginx access to this folder as well:
chmod 755 /home/demo
OK, good.
We can now create the basic layout for each domain. In your home directory create a 'public_html' folder:
mkdir /home/demo/public_html
Now for each domain you want to host (I use the examples of domain1.com and domain2.com) create a folder with a standard set of sub-folders:
mkdir -p /home/demo/public_html/domain1.com/{public,private,log,backup}
and
mkdir -p /home/demo/public_html/domain2.com/{public,private,log,backup}
That will create the folders public, private, log and backup for each of our domains (domain1.com and domain2.com).

### Index.html

The content of the public folder is, naturally, up to you but for this example I am going to use a very simple html file so we can check the virtual hosts work.
So for each domain:
nano /home/demo/public_html/domain1.com/public/index.html
Enter something like this into the file:
<html>
  <head>
    <title>domain1.com</title>
  </head>

  <body>
    <h1>domain1.com</h1>
  </body>
</html>
Repeat the process so you have a similar file for domain2.com (don't forget to change the index.html content so it shows domain2.com and not domain1.com).

### Virtual Hosts Layout

If you have been following the articles for the Nginx install, you will have a 'CentOS' style layout (using a conf.d directory to store your configuration files) whether you installed via the package manager or via source.
As such, we'll use that layout from now on when creating the virtual hosts.

### Virtual Host

Let's go ahead and edit the virtual file to add domain1.com:
sudo nano /etc/nginx/conf.d/virtual.conf
Remember to adjust the path according to your install. So installing from source would require:
sudo nano /usr/local/nginx/conf/conf.d/virtual.conf
And add the following:
server {

            listen   80;
            server_name  www.domain1.com;
            rewrite ^/(.*) http://domain1.com/$1 permanent;

           }


server {

            listen   80;
            server_name domain1.com;

            access_log /home/demo/public_html/domain1.com/log/access.log;
            error_log /home/demo/public_html/domain1.com/log/error.log;

            location / {

                        root   /home/demo/public_html/domain1.com/public/;
                        index  index.html;

                        }

            }
The first server module in the file is a simple rewrite rule that redirects visitors to domain1.com from www.domain1.com.
You can, of course, have this the other way around if you prefer.
The second server module has very basic information including the server_name which is the domain name you want to serve.
It then defines the log locations for easy analysis and finally sets the server root and the index file.
As said, very basic at this stage.

### Reload

All that is left to enable our site is to reload Nginx:
sudo /etc/init.d/nginx reload

### Navigate

Now when you navigate to your domain:
http://www.domain1.com
You will see the equivalent of this:
Nice.
### Repeat as necessary

All you need to do for your next virtual host (domain2.com in this example) is to repeat the process:
sudo nano /etc/nginx/conf.d/nginx.conf
...
# Enter the details for domain2.com as per the example shown above
I know I mention it a lot, but do remember to adjust any paths to match your Nginx installation.

### Logs

Remember we defined custom locations for the domain logs?
Well, let's have a check they are there:
ls /home/demo/public_html/domain1.com/log/
...
access.log  error.log
Excellent, everything is working as we expected and we have our domain logs in a nice and convenient location.

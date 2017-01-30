---
permalink: ubuntu-mongrel-and-mongrel-cluster-installation/
audit_date:
title: Install Mongrel and mongrel clusters on Ubuntu
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-13'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

There are variety of options open to the sysadmin when serving Ruby
applications.

One of the original ways is to use [mongrel web
server](http://mongrel.rubyforge.org/ "http://mongrel.rubyforge.org/").
Requests are proxied to the mongrel(s) from the main web server (Apache,
Nginx, etc).

The article may seem quite lengthy but two subjects are tackled here.
One is the basic mongrel gem itself but then we move onto the
mongrel\_cluster gem.

Take each section at a time as each one builds on the previous
explanation.

### Prerequisites

-   Install Ruby and Rubygems

### Install mongrel


Mongrel is a rubygem and installation is as simple as:

    sudo gem instal mongrel

On the test Cloud Server with a basic rubygems and Rails installation,
the process installed the following gems:

    gem_plugin-0.2.3
    daemons-1.0.10
    fastthread-1.0.1
    cgi_multipart_eof_fix-2.5.0
    mongrel-1.1.4

That can vary depending on what you already have installed.

### Mongrel basics

The mongrel package has 3 main commands: start, stop and restart.

However, there are many options you could add to fit your needs such as
the environment or the port and so on:

    mongrel_rails start -e production -p 6000

You need to be in the rails application directory to issue that command
and, perhaps obviously, it would start a mongrel instance in production
mode on port 6000.

If you don't run it in the background (daemonised) then the output in
the terminal will be similar to when using the inbuilt rails webbrick
server.

To run it in the backgroud, simply add the '-d' option:

    mongrel_rails start -e production -p 6000 -d

To stop the running process (assuming it is being run in a daemonised
fashion):

    mongrel_rails stop

Again, the command should be given when in the rails directory.

### Mongrel clusters

You can run as many individual mongrels as you like for your application
but it does get a little unwieldy if you have more than one application.

One solution is to create what are called mongrel clusters. These
'clusters' are predefined groups of mongrels which are easy to start and
stop, etc as a cluster and be configured to start on a Cloud Server
reboot (so your application will start itself on a reboot).

### Install mongrel clusters

Just as with the original mongrel install, the mongrel\_cluster is a
rubygem:

    sudo gem install mongrel_cluster

As I had already installed the mongrel gem with its dependencies, only
the mongrel\_cluster gem itself was installed. This may vary on your
Cloud Server, depending on what you already have installed.

### Configure a mongrel cluster

Configuring a mongrel cluster for your rails application runs along
similar lines to the single mongrel options shown above.

To start a cluster of 2 mongrels in production mode starting from port
8000 would be as follows:

    mongrel_rails cluster::configure -e production -p 8000 -N 2 -c /home/demo/public_html/testapp -a 127.0.0.1

Note that I set the full path of the rails application and set the port
to bind to (localhost in this case).

There are plenty of option available when configuring a mongrel cluster
and the easiest thing is to have a look at the help file:

    mongrel_rails cluster::configure -h


### YAML format

You will have noticed the output of the command is as follows:

    Writing configuration file to config/mongrel_cluster.yml.

The contents of which are:

    cwd: /home/demo/public_html/testapp
    log_file: log/mongrel.log
    port: "8000"
    environment: production
    address: 127.0.0.1
    pid_file: tmp/pids/mongrel.pid
    servers: 2

Well, no real surprises there, it simply puts the mongrel cluster
options into a YAML format.

You can edit the file by hand if you wish to change something and don't
want to go through the configure command again.

### Mongrel\_cluster basics

Starting the cluster is a case of:

    mongrel_rails cluster::start

Ensure you are in your rails application folder when you issue the
command.

Stopping and restarting:

    mongrel_rails cluster::restart
    ...
    mongrel_rails cluster::stop

### init scripts

The final configuration you may want to consider (and I recommend it) is
to create an init script so the mongrel cluster is started on a reboot.

Unlike 'thin' or mod\_rails there is no easy way of doing this so it
does require a some work.

Firstly, create a folder in the /etc folder:

    sudo mkdir /etc/mongrel_cluster

Then create a symlink from the cluster configuration file to the newly
created folder:

    sudo ln -s /home/demo/public_html/testapp/config/mongrel_cluster.yml /etc/mongrel_cluster/testapp.yml

You will have to do that for each and every mongrel\_cluster you create
(if you want them to start automatically). So if you have two rails
applications, you will have two symlinks.

Next, copy the gem init script to the init.d directory:

    sudo cp /usr/lib/ruby/gems/1.8/gems/mongrel_cluster-1.0.5/resources/mongrel_cluster /etc/init.d/

Make it executable:

    sudo chmod +x /etc/init.d/mongrel_cluster

and then add the script to the runlevels:

    sudo /usr/sbin/update-rc.d -f mongrel_cluster defaults

Wow. Quite a long and complicated procedure when compared to using
'thin' or mod\_rails.

### Cluster control

Let's take a quick look at controlling the clusters.

Getting a status of any running clusters is always nice:

    mongrel_cluster_ctl status

The output will show something along the lines of:

    Checking all mongrel_clusters...
    mongrel_rails cluster::status -C testapp.yml
    found pid_file: tmp/pids/mongrel.8000.pid
    found mongrel_rails: port 8000, pid 2343

    found pid_file: tmp/pids/mongrel.8001.pid
    found mongrel_rails: port 8001, pid 2346

That matches the cluster we created earlier so no problems.

To start/stop/restart the cluster(s):

    mongrel_cluster_ctl start
    ...
    mongrel_cluster_ctl stop
    ...
    mongrel_cluster_ctl restart

Remember you may need to put a sudo in front of the 'stop' command if
you have just rebooted as the process started on reboot is owned by
root.

### Summary 

There is a lot happening in this article but when followed all the way
through, we have all the necessary gems and information to create
mongrel clusters for each of our rails applications.

A simple symlink is then all it takes to ensure the cluster is restarted
on a reboot.

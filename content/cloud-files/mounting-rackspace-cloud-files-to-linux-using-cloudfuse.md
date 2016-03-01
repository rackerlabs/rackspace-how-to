---
node_id: 1121
title: Mounting Rackspace Cloud Files to Linux Using CloudFuse
type: article
created_date: '2011-06-07'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Catherine Richardson
product: Cloud Files
product_url: cloud-files
---

NOTE: This article is no longer updated, and the steps listed don't work completely with all current distributions. It is preserved for archival purposes. There are discussions of using CloudFuse in the comments here and on a [blog post by the article's author](http://sandeepsidhu.wordpress.com/2011/03/07/mounting-cloud-files-using-cloudfuse-into-ubuntu-10-10-v2/). You can also get the latest code for CloudFuse from the [CloudFuse github repository](https://github.com/redbo/cloudfuse).

Please do not contact support for assistance with setting up CloudFuse.



### Mounting Rackspace Cloud Files to Linux Using CloudFuse

This article shows how to mount Cloud Files as a directory on an Ubuntu 10.10 Cloud Server using CloudFuse software. This will allow you to access your Cloud Files container data inside a Linux server, just like any other file or folder.

Note: This process will give you easy access to your Cloud Files data, but in no way are we recommending that you use the mounted Cloud Files container as a location for any database/application. Running an application directly from the container would be exceptionally slow.

So, why would one want to mount a Cloud Files container to your Linux Cloud Server? Well, there are plenty of uses for having system-level access to your Cloud Files. For instance, if you have some scripts which create database or website backups, those scripts can create backups automatically into Cloud Files without you needing to use the API or File Manager in the Control Panel.

Note: The following commands are tried and tested on Ubuntu 10.10, but they should be applicable to other versions of Ubuntu or Debian. As long as you install the required packages, you should be able to compile CloudFuse code and use it.

### Compiling and installing CloudFuse

First, download the CloudFuse code from their [GitHub repo](http://github.com/redbo/cloudfuse/tarball/master). Extract the file, and then compile the software:

        $ tar -xvf master
        x redbo-cloudfuse-0a51180/
        x redbo-cloudfuse-0a51180/.gitignore
        x redbo-cloudfuse-0a51180/LICENSE
        x redbo-cloudfuse-0a51180/Makefile.in
        x redbo-cloudfuse-0a51180/README
        x redbo-cloudfuse-0a51180/cloudfsapi.c
        x redbo-cloudfuse-0a51180/cloudfsapi.h
        x redbo-cloudfuse-0a51180/cloudfuse.c
        x redbo-cloudfuse-0a51180/config.h.in
        x redbo-cloudfuse-0a51180/configure
        x redbo-cloudfuse-0a51180/configure.in
        x redbo-cloudfuse-0a51180/install-sh

Once extracted, you should have following files under the newly created directory.

        redbo-cloudfuse-0a51180 $ ls -la
        total 528
        drwxr-xr-x  13 root  root     442 Jun 17  2013 .
        drwx------+ 11 root  root     374 Feb 12 21:55 ..
        -rw-r--r--   1 root  root     137 Jun 17  2013 .gitignore
        -rw-r--r--   1 root  root    1059 Jun 17  2013 LICENSE
        -rw-r--r--   1 root  root    1066 Jun 17  2013 Makefile.in
        -rw-r--r--   1 root  root    4442 Jun 17  2013 README
        -rw-r--r--   1 root  root   20319 Jun 17  2013 cloudfsapi.c
        -rw-r--r--   1 root  root    1238 Jun 17  2013 cloudfsapi.h
        -rw-r--r--   1 root  root   13497 Jun 17  2013 cloudfuse.c
        -rw-r--r--   1 root  root    4772 Jun 17  2013 config.h.in
        -rwxr-xr-x   1 root  root  179778 Jun 17  2013 configure
        -rw-r--r--   1 root  root    1511 Jun 17  2013 configure.in
        -rwxr-xr-x   1 root  root   13184 Jun 17  2013 install-sh

Now it is time to compile CloudFuse and install it. You will need the following utilities and their dev packages installed in order to build it: libcurl, libfuse, and libxml2

CloudFuse is built and installed like any other autoconf-configured code. Normally:

        redbo-cloudfuse-0a51180# ./configure
        redbo-cloudfuse-0a51180# make
        redbo-cloudfuse-0a51180# sudo make install

But, first you need to install the required packages, otherwise the _./configure_ command will fail and generate errors.

        redbo-cloudfuse-0a51180# apt-get update
        redbo-cloudfuse-0a51180# apt-get install gcc
        redbo-cloudfuse-0a51180# apt-get install libcurl4-openssl-dev
        redbo-cloudfuse-0a51180# apt-get install libxml2 libxml2-dev
        redbo-cloudfuse-0a51180# apt-get install libfuse-dev

Now run the following command in the cloudfuse-0.1 source code directory

        redbo-cloudfuse-0a51180# ./configure
        checking for gcc... gcc
        checking for C compiler default output file name... a.out
        checking whether the C compiler works... yes
        checking whether we are cross compiling... no
        checking for suffix of executables...
        checking for suffix of object files... o
        checking whether we are using the GNU C compiler... yes
        checking whether gcc accepts -g... yes
        checking for gcc option to accept ISO C89... none needed
        checking for a BSD-compatible install... /usr/bin/install -c
        checking for a thread-safe mkdir -p... /bin/mkdir -p
        checking for pkg-config... /usr/bin/pkg-config
        checking pkg-config is at least version 0.9.0... yes
        checking for XML... yes
        checking for CURL... yes
        checking for FUSE... yes
        .........
        ............
        configure: creating ./config.status
        config.status: creating Makefile
        config.status: creating config.h
        root@ubuntu-test:~/cloudfuse-0.1# make
        gcc -g -O2 -I/usr/include/libxml2     -D\_FILE\_OFFSET\_BITS=64 -I/usr/include/fuse   -o cloudfuse cloudfsapi.c cloudfuse.c -lxml2   -lcurl   -pthread -lfuse -lrt -ldl
        root@ubuntu-test:~/cloudfuse-0.1# make install
        /usr/bin/install -c cloudfuse /usr/local/bin/cloudfuse
        root@ubuntu-test:~/cloudfuse-0.1#

If everything went fine, you should now have CloudFuse installed properly. Confirm this by running the which command. It should show the location of the CloudFuse binary file.

        redbo-cloudfuse-0a51180# which cloudfuse
        /usr/local/bin/cloudfuse
        redbo-cloudfuse-0a51180#

### Mounting Cloud Files:

Now use CloudFuse to mount our Cloud Files.

You'll have to create a configuration file for CloudFuse in your home directory and put your Rackspace Cloud Files username and API key in it, as shown below. (For information on viewing your Rackspace API key, see [View and reset your API key](/how-to/view-and-reset-your-api-key).)

        $HOME/.cloudfuse
        username=[username]
        api\_key=[api key]
        region=[region-name]

### Auth URLs:

Cloud Files account: [https://auth.api.rackspacecloud.com/v1.0](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#document-developer-guide)

The following entries are optional. You can define these values in the .cloudfuse file.

        use\_snet=[True to use snet for connections]
        cache\_timeout=[seconds for directory caching, default 600]

After creating the above configuration file, run the cloudfuse command as follows. The syntax should be as simple as:

        cloudfuse [mount point]

So, you should be able to mount Cloud Files like this

        root@ubuntu-test:/# mkdir cloudfiles
        root@ubuntu-test:/# cloudfuse /cloudfiles

If you run the # ls -la command inside the /cloudfiles directory you should see your Cloud Files containers.

If you are not logged in as the user root on the system, then your username will need to be part of the _"fuse"_ group. This can be accomplished with the following command:

        sudo usermod -a -G fuse [username]

If you are unable to see any containers inside the mountpoint, then one or more of the above steps didn't work properly. You will need to repeat the process, and verify that all of the above steps were followed precisely.

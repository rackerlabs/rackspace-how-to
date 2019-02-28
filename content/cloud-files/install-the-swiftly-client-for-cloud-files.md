---
permalink: install-the-swiftly-client-for-cloud-files/
audit_date: '2019-02-28'
title: Install the Swiftly client for Cloud Files
type: article
created_date: '2014-04-21'
created_by: Cloud Images
last_modified_date: '2019-02-28'
last_modified_by: Regan Murley
product: Cloud Files
product_url: cloud-files
---

### Install Swiftly

Swiftly is a client tool that you can use to upload objects to and download 
objects from your Rackspace Cloud Files account. Swiftly manages the
storage of large objects in Cloud Files. If you have a very large object
(such as a virtual disk image file), Swiftly splits the file into
smaller segments and then creates the large object manifest for you.

For more information about Swiftly, see the following sites:

-   The Python&reg; package index page:
    <https://pypi.python.org/pypi/swiftly/2.02>
-   Swiftly documentation: <http://gholt.github.io/swiftly/>
-   Swiftly source code: <https://github.com/gholt/swiftly>

#### Install Swiftly on Ubuntu

These instructions were built by Rackspace on an Ubuntu&reg; 13.10 public 
image.

Use the following instructions from a Bash shell on your server:

1.  Update the `apt-get` database.

        sudo apt-get update

2.  Install the Python installer, `pip`, by using `apt-get`.

        sudo apt-get install python-pip

3.  Install Swiftly by using `pip`.

        sudo pip install swiftly

#### Install Swiftly on CentOS

These instructions were verified by Rackspace on a CentOS&reg; 6.5 public 
image.

Use the following instructions from a Bash shell on your server:

1.  Install the Python installer, `pip`, by using `yum`.

        sudo yum install python-pip

    If you get an error saying the package can't be found, the EPEL
    repository needs to be enabled. For information on setting up the
    EPEL repository on your system, see [Install EPEL and additional repositories on CentOS and Red Hat](/how-to/install-epel-and-additional-repositories-on-centos-and-red-hat).
    When EPEL is enabled, run the `install` command for pip again.

2.  Install Swiftly by using `pip`.

        sudo pip install swiftly
        
### Configure Swiftly for Cloud Files

Edit or create the file `~/.swiftly.conf`. By default, Swiftly uses the configuration file 
in the same local directory where it is run, or you can define a file path while running 
Swiftly commands by using the `--conf=PATH` flag. Include the following contents in your 
**.swiftly.conf** file:

        [swiftly]
        auth_user = <yourUserName>
        auth_key = <yourAPIkey>
        auth_url = https://identity.api.rackspacecloud.com/v2.0
        region = <datacenter>

For the full list of options available in the **.swiftly.conf** file, see 
[the sample config file in the Swiftly repo](https://github.com/gholt/swiftly/blob/master/swiftly.conf-sample).

### Install Eventlet (*optional*)

Eventlet is an optional `pip` package that allows you to set a concurrency count when using 
Swiftly. This count is useful when performing bulk actions that are threaded because the Cloud 
Files application programming interface (API) has a limit of 100 concurrent write requests 
per container. 

#### Install Eventlet on Ubuntu

Use the following instructions from a Bash shell on your server:

1. Install the Python developer library package by using `apt-get`.

        sudo apt-get python-dev

2. Install Eventlet by using `pip`.

        sudo pip install eventlet
        
#### Install Eventlet on CentOS

Use the following instructions from a Bash shell on your server:

1. Install the Python developer library package by using `yum`.

        sudo yum install python-devel

2. Install Eventlet by using `pip`.

        sudo pip install eventlet

### Install GNU Screen (*optional*)

GNU Screen is a program that you can use to start a Screen session. A
Screen session looks just like an ordinary shell except that you can
*detach* a terminal from a Screen session, and whatever commands you are
running  continue running in the session. This functionality is useful
when you start a long running process (such as a large object upload)
from the command line. If your laptop battery dies, or your wireless
connection is lost, or you are otherwise disconnected, the process
continues to run in your Screen session.

#### Install Screen in Ubuntu

Use the following instructions from a Bash shell on your server to install 
Screen in Ubuntu:

    sudo apt-get install screen

#### Installing Screen in CentOS

Invoke the following instructions from a Bash shell on your server to install 
Screen in CentOS:

    sudo yum install screen

#### Get started with Screen

To start Screen, run the following command. The `-s`
option tells the program what shell to use. The `-S` option provides a
name for the session, which is helpful if you have several Screen
sessions running at the same time.

    screen -s /bin/bash -S display-Name-For-Screen

After you start Screen, you can enter regular Bash commands. Screen commands, 
that is, commands requesting Screen to do something, are escaped with `Control-a` 
(or `C-a`) . Some Screen commands are single character. For example, to detach from 
Screen, type the following command:

    C-a d

Other Screen commands are longer. To use these, you first type
`C-a:` and then you type the rest of the command in the status line
of the Screen window. For example, you can log Screen's output to a file
so that you can go back and review it later by typing the following
command:

    C-a :

    C-a : logfile name-of-log-file
    C-a : log

The first command sets the name of the file in which the log is
recorded. The second command toggles logging on and off. Because this is
the first time you typed it, it turns logging on.

We encourage you to create a log of Screen output so that you have a
record of everything that happened while you were detached from Screen.

To exit Screen, just type `Control-d` (without prefacing it with
`Control-a`).

You can learn more about Screen by visiting
<http://www.gnu.org/software/screen/manual/screen.html>.

#### Reattach to a running Screen session

You can get a list of what Screen sessions you currently have running by
invoking this command from a Bash shell:

    screen -list

Your response looks something like the following output:

    There are screens on:
        3064.some-other-stuff   (Detached)
        3004.large-obj-transfer (Detached)
        3073.even-more-stuff    (Detached)
    3 Sockets in /var/run/screen/S-root.

To reattach to the Screen session named **large-obj-transfer**, for example,
note the session number (in this example, `3004`) and then use the
following command:

    screen -r 3004

### Swiftly example commands

**Important:** Swiftly allows destructive actions to run against 
one or all containers on an account. Use caution when performing updates 
and deletes to Cloud Files objects because these cannot be undone. 
Test your commands against test containers wherever possible before
running them in production.

Following are some common Swiftly command examples.

#### Get a list of containers

Run the following command to get a list of containers for the configured account:

        swiftly get
        
The response is similar to the following list:

        .ACCESS_LOGS
        .CDN_ACCESS_LOGS
        Books
        
#### Get a list of containers with details

Run the following command to get a list of containers including detailed information:

        swiftly get --raw
        
The response displays in JavaScript&reg; Object Notation (JSON)  format:

        [{"count": 103, "bytes": 22296, "name": ".ACCESS_LOGS"}, 
        {"count": 126, "bytes": 32708, "name": ".CDN_ACCESS_LOGS"}, 
        {"count": 417, "bytes": 1177376576, "name": "Books"}]
        
#### Get a list of objects in a container

Run the following command to get a list of objects in a container:

        swiftly get <containerName>
        
#### Get containers or objects that match a beginning prefix

Run the following command to get containers or objects that match a beginning 
prefix (case sensitive):

        swiftly get --prefix <startingText>
        
        swiftly get <containerName> --prefix <startingText>
        
#### Post new headers to an object

Run the following command to post new headers to an object (supports multiple headers 
in a single command, separated as shown):

        swiftly post -h "<headerName1>:<headerValue1>" -h "<headerName2>:<headerValue2>" <containerName>/<objectName>
        
#### Upload an object 

The following example uploads the local directory file **somefile.png**, renames it to 
**newfilename.png** in the specified container, and places the object into the pseudo 
directory **/images/**).

Run the following command to upload an object:

        swiftly put -i ~/somefile.png <containerName>/images/newfilename.png
        
#### Delete an object

Run the following command to delete an object, or delete an object within a pseudo directory:

        swiftly delete <containerName>/somefile.png
        swiftly delete <containerName>/images/newfilename.png
        
#### Delete all objects within a container and delete the container

Run the following command to delete all objects within a container and delete the container:

        swiftly delete <containerName> --until-empty --recursive
        
#### Bulk update
        
This command performs a bulk update of all files in a container to add the header **HEADERNAME** 
with a value of **HEADERVALUE**. Note that Swiftly `for/do` commands contain 
literal open and close angle bracket characters (`<` and `>`), such as `<item>` in 
the examples shown here. The angle brackets are part of the command, not placeholders 
for variable content. 

As a best practice with `for/do` commands, `--cache-auth` is set to temporarily store 
the authentication token rather than make repeated calls to the Identity API, and 
`--concurrency` is limited to 100 maximum API calls to Cloud Files:

Run the following command to perform a bulk update:

        swiftly --cache-auth --eventlet --concurrency=100 for CONTAINER do post -H "HEADERNAME:HEADERVALUE" "<item>"

#### Bulk delete specified objects

Run the following command to perform a bulk delete of only objects within a container 
whose name begins with a certain prefix (caching the Identity token and limiting to 
100 concurrent API calls):

        swiftly --cache-auth --eventlet --concurrency=100 for CONTAINER --prefix STARTINGTEXT --output-names do delete "<item>"

#### Bulk delete specified containers

Run the following command to perform a bulk delete of only containers whose name 
begins with a certain prefix (caching the Identity token and limiting to 100 
concurrent API calls):


        swiftly --cache-auth --eventlet --concurrency=100 for "" --prefix STARTINGTEXT --output-names do delete "<item>" --recursive --until-empty

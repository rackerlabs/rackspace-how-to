---
permalink: install-the-swiftly-client-for-cloud-files/
node_id: 4030
title: Install the Swiftly client for Cloud Files
type: article
created_date: '2014-04-21'
created_by: Cloud Images
last_modified_date: '2016-04-18'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

Swiftly is a client tool that you can use to upload objects to and
download objects from your Cloud Files account. Swiftly manages the
storage of large objects in Cloud Files. If you have a very large object
(such as a virtual disk image file), Swiftly splits the file into
smaller segments and then creates the large object manifest for you.

For more information about Swiftly, see the following sites:

-   The Python package index page:
    <https://pypi.python.org/pypi/swiftly/2.02>
-   Swiftly documentation: <http://gholt.github.io/swiftly/>
-   Swiftly source code: <https://github.com/gholt/swiftly>

### Install Swiftly on Ubuntu

These instructions were verified on a server built from a Rackspace
Ubuntu 13.10 public image.

Invoke the following instructions from a bash shell on your server.

1.  Update the apt-get database.

        sudo apt-get update

2.  Install the Python installer, pip, using `apt-get`.

        sudo apt-get install python-pip

3.  Install Swiftly using `pip`.

        sudo pip install swiftly

### Install Swiftly on CentOS

These instructions were verified on a server built from a Rackspace
CentOS 6.5 public image.

Invoke the following instructions from a bash shell on your server.

1.  Install the Python installer, pip, using `yum`.

        sudo yum install python-pip

    If you get an error saying the package can't be found, the EPEL
    repository needs to be enabled. For information on setting up the
    EPEL repository on your system, see [Install EPEL and additional repositories on CentOS and Red Hat](/how-to/install-epel-and-additional-repositories-on-centos-and-red-hat).
    When EPEL is enabled, run the `install` command for pip again.

2.  Install swiftly using `pip`.

        sudo pip install swiftly
        
### Configure Swiftly for Rackspace Cloud Files
Edit or create the file `~/.swiftly.conf`. By default, swiftly will use the configuration file in the same local directory where it is run, or you can define a file path while running swiftly commands using the `--conf=PATH` flag. Include the following contents in your `.swiftly.conf` file:

        [swiftly]
        auth_user = <yourUserName>
        auth_key = <yourAPIkey>
        auth_url = https://identity.api.rackspacecloud.com/v2.0
        region = <datacenter>

For the full list of options available in the `.swiftly.conf` file, see [the sample config file in the swiftly repo](https://github.com/gholt/swiftly/blob/master/swiftly.conf-sample).

### Install Eventlet (optional)
Eventlet is an optional pip package that allows you to set a concurrency count when using swiftly. This is useful when performing bulk actions that are threaded, because the Cloud Files API has a limit of 100 concurrent write requests per container. 

### Install Eventlet on Ubuntu

1. Install the Python developer library package using `apt-get`.

        sudo apt-get python-dev

2. Install Eventlet using `pip`.

        sudo pip install eventlet
        
### Install Eventlet on CentOS

1. Install the Python developer library package using `yum`.

        sudo yum install python-devel

2. Install Eventlet using `pip`.

        sudo pip install eventlet

### Install GNU Screen (optional)

GNU Screen is a program that you can use to start a screen session. A
screen session looks just like an ordinary shell except that you can
"detach" a terminal from a screen session, and whatever commands you are
running  continue running in the session. This functionality is useful
when you start a long running process (such as a large object upload)
from the command line. If your laptop battery dies, or your wireless
connection is lost, or you are otherwise disconnected, the process
continue to run in your screen session.

#### Install screen in Ubuntu

Invoke the following command from a bash shell:

    sudo apt-get install screen

#### Installing screen in CentOS

Invoke the following command from a bash shell:

    sudo yum install screen

#### Get started with the screen program

To start the screen program, run the following command. The `-s`
option tells the program what shell to use. The `-S` option provides a
name for the session, which is helpful if you will have several screen
sessions running at the same time.

    screen -s /bin/bash -S display-Name-For-Screen

After you start the screen program, you can enter regular bash
commands. Screen commands, that is, commands requesting screen to do
something, are escaped with `Control-a` (or `C-a`) . Some screen
commands are single character. For example, to detach from screen, you
type the following command:

    C-a d

Other screen commands are longer. To use these, you first type
`C-a:` and then you type the rest of the command in the status line
of the screen window. For example, you can log screen's output to a file
so that you can go back and review it later by typing the following
command:

    C-a :

    C-a : logfile name-of-log-file
    C-a : log

The first command sets the name of the file in which the log will be
recorded. The second command toggles logging on and off; because this is
the first time you typed it, it will turn logging on.

We encourage to create a log of screen output so that you'll have a
record of everything that happened while you were detached from screen.

To exit screen, just type `Control-d` (without prefacing it with
`Control-a`).

You can learn more about screen by visiting
<http://www.gnu.org/software/screen/manual/screen.html>.

#### Reattach to a running screen session

You can get a list of what screen sessions you currently have running by
invoking this command from a bash shell:

    screen -list

Your response will look something like the following:

    There are screens on:
        3064.some-other-stuff   (Detached)
        3004.large-obj-transfer (Detached)
        3073.even-more-stuff    (Detached)
    3 Sockets in /var/run/screen/S-root.

To reattach to the screen session named large-obj-transfer, for example,
you note the session number (in this example, 3004) and then use the
following command:

    screen -r 3004

### Swiftly Example Commands

Important Note: Swiftly allows for destructive actions to be run against 
one or all containers on an account. Please use caution when performing 
updates and deletes to cloud files objects, as these cannot be undone, 
and test out your commands first against test containers wherever possible.

Get a list of containers for the configured account:

        swiftly get
        
The response will be in a list:

        .ACCESS_LOGS
        .CDN_ACCESS_LOGS
        Books
        
Get a list of containers including detailed information:

        swiftly get --raw
        
The response will be in json format:

        [{"count": 103, "bytes": 22296, "name": ".ACCESS_LOGS"}, 
        {"count": 126, "bytes": 32708, "name": ".CDN_ACCESS_LOGS"}, 
        {"count": 417, "bytes": 1177376576, "name": "Books"}]
        
Get a list of objects in a container:

        swiftly get <containerName>
        
Get containers or objects that match a beginning prefix (case sensitive):

        swiftly get --prefix <startingText>
        
        swiftly get <containerName> --prefix <startingText>
        
Post new headers to an object (supports multiple headers in a single 
command, separated out as shown):

        swiftly post -h "<headerName1>:<headerValue1>" -h "<headerName2>:<headerValue2>" <containerName>/<objectName>
        
Upload an object (This example will upload the local directory file 
`somefile.png` and rename it to `newfilename.png` in the specified 
container, placing the object into the pseudo directory `/images/`):

        swiftly put -i ~/somefile.png <containerName>/images/newfilename.png
        
Delete an object, or delete an object within a pseudo directory:

        swiftly delete <containerName>/somefile.png
        swiftly delete <containerName>/images/newfilename.png
        
Delete all objects within a container, then delete the container:

        swiftly delete <containerName> --until-empty --recursive
        
Bulk update all files in a container to add the Header "HEADERNAME" 
with a value of "HEADERVALUE". Note that swiftly for/do commands contain 
literal `<` and `>` characters, include the exact text `<item>` in 
the examples shown here. For best practices on for/do commands, `--cache-auth` 
is set to temporarily store the authentication token rather than make repeated 
calls to the Cloud Identity API, and `--concurrency` is limited to 100 maximum 
api calls to Cloud Files:

        swiftly --cache-auth --eventlet --concurrency=100 for CONTAINER do post -H "HEADERNAME:HEADERVALUE" "<item>"

Bulk delete only objects within a container whose name beings with a certain 
prefix (caching the identity token and limiting to 100 concurrent API calls):

        swiftly --cache-auth --eventlet --concurrency=100 for CONTAINER --prefix STARTINGTEXT --output-names do delete "<item>"


Bulk delete only containers whose name begins with a certain prefix (caching 
the identity token and limiting to 100 concurrent API calls):

        swiftly --cache-auth --eventlet --concurrency=100 for "" --prefix STARTINGTEXT --output-names do delete "<item>" --recursive --until-empty
        

---
permalink: vnc-install/
audit_date:
title: Install VNC on a Cloud Server
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-13'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

This page explains how to install VNC on your Cloud Server. This article
was based upon the CentOS 5 distribution. This tutorial assumes you have
root access to your server and are running on a clean installation.

**Note:** In order to use this you must have at least 512MB of RAM or X
Windows will not run.

**Warning:** Running VNC on your Cloud Server will consume large amounts
of bandwidth. Please use wisely!

If you would like information about tunnelling VNC over SSH please visit
<http://martybugs.net/smoothwall/puttyvnc.cgi>

### Install the Necessary Packages

-  Install perl with the following command:

        yum install perl

-  Install X Windows

  We will need to install the X-Windows platform to run the graphical
portion of this project. X11 is a graphical display server, and will
server and will sit above the Window Manager.

  To install run the following as root:

        yum groupinstall "X Window System"

-  Install a Window Manager

  Window Managers and are the human usable layer that you are probably
familiar with. This gives you the access to use a mouse and send calls
to the X11 server.
  -  [KDE](http://www.kde.org/)
  -  [GNOME](http://www.gnome.org./)
  -  [TWM](http://xwinman.org/vtwm.php)

-  Install KDE Desktop

        yum groupinstall "KDE Desktop"

  Also, this may be needed:

        yum install kde-session

-  Install GNOME Desktop Environment

        yum groupinstall "GNOME Desktop Environment"

  Also, this may be needed:

        yum install gnome-session

-  Install TWM

  TWM is the default X-Window Manager and you don't have to install any
additional packages, it is light and will run on almost anything, but is
also not very user friendly and almost requires a power-user.

-  Install VNC Server

  VNC is the service that display your X output to a tcp connection over
the internet.

        yum install vnc-server

### Configuration

#### Configure VNC

Modify the **/etc/sysconfig/vncservers** configuration file by performing the following command:

    nano /etc/sysconfig/vncservers

Insert the following lines into the file:

    VNCSERVERS="1:someguy"
    VNCSERVERARGS[1]="-geometry 800x600 -depth 16"

This will create a VNC session for one user with the username of
**someguy**. If you would like to setup multiple users you will need to
add additional users to that line. For example:

    1:someguy 2:someperson 3:somegirl

You will also need to add additional VNCSERVERARGS lines to correspond
to each user. Change the [1] to match the session number.

#### Configure firewall

If you have a firewall running, you will need to open port 5901. For
example, on CentOS, run:

    iptables -I INPUT 1 -p tcp --dport 5901 -j ACCEPT

If needed, replace 5901 with a range, depending on the number of
sessions required (e.g. 5901:5905).

Save the new iptables rule:

    service iptables save

### Test the Server

1.  Switch to your User

        su username
        cd ~

2.  Create a .vnc directory

        mkdir .vnc
        cd .vnc

    **Note:** Rake note of the '.' in front of the name.

3. Create the xstartup file

  Insert the configuration below (this is for a KDE-VNC session):

       #!/bin/sh
       unset SESSION_MANAGER
       exec /etc/X11/xinit/xinitrc
       [ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
       [ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
       xsetroot -solid grey
       vncconfig -iconic &
       xterm -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &

       startx &
       exec kde-session &

    - If you are using GNOME, change 'kde-session' to 'gnome-session'

    - Make the file executable:

           chmod u+x xstartup

4. Setup your VNC user

  Set the user's private VNC connection password

        vncpasswd

  You will be required to confirm your password.

5. Start the VNC server

  Make sure you exit out of your user session and go back to 'root'.

  Start the server:

        service vncserver start

  You may see some error messages here stating 'unexpected EOF' or syntax errors -- these are normal. If you see **[ OK ]** then the service has started properly.

6. Connect to your VNC

  Open up your VNC client and type in your external IP address, colon,
then your session ID configured in **/etc/sysconfig/vncservers**. The
session number must correspond to the user name or it will not connect.

  Example: 64.25.25.25:1

  Type in the password you chose with vncpasswd and you will
    be connected.

  To close the connection simple close the window.

7. Stopping the VNC Server

  To stop the VNC server type the following:

        service vncserver stop

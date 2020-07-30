---
permalink: install-plex-media-server-on-debian-9/
audit_date:
title: 'Install Plex Media Server on Debian 9'
type: article
created_date: '2020-07-29'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

Plex is a popular free media server that allows you to organize and stream your movies, shows, music, and photos. In this guide we’ll step through how to install Plex on a Cloud Server, making the media available from any remote location.

###Update Your Server

Before installing Plex, you’ll want to make sure your server’s package management repositories are fully up to date. Run this command to get the latest package listings and update installed packages to their latest versions:

sudo apt update && sudo apt upgrade

###Add the Plex repository

The easiest way to install Plex is by adding the repository to your server. Run the following commands:

sudo apt install apt-transport-https
sudo echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
sudo curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
sudo apt update

###Install Plex

Now that the repository is added, simply install the plexmediaserver package with apt:

sudo apt install plexmediaserver
SSH Tunnel

Plex requires you to access your server from the local network for initial setup. We can get around this with an SSH tunnel. If your local machine is a Mac or Linux-based, create the tunnel by running this command from your local machine’s terminal, replacing <Cloud_Server_IP> with your cloud server’s IP address:

ssh root@<Cloud_Server_IP> -L 8888:localhost:32400

Linux and Mac users can now skip to the Create Your Plex Account step.

If you are running Windows, the most popular way to run SSH is using the free PuTTY tool which can be downloaded here. Windows 10 also has a built-in SSH client, but enabling this feature still requires a lot of advanced configuration changes and is outside the scope of this guide.

If you’re using PuTTY, and you now have it up and running, input your Cloud Servers IP address in the Host Name (or IP address) field.

Click on the plus next to SSH and then select Tunnels.

Input 8888 into Source port and your Cloud Server IP address followed by :32400 into Destination.

Click Add and then Open.

###Create your Plex account

Once the SSH tunnel is set up, navigate to your Plex setup page at the following address in your browser: http://localhost:8888/web

If you already have an account, you can skip this step and just sign in. Otherwise, click CONTINUE WITH EMAIL.

Click sign up with email and create your account

###Set up Plex

After creating your account or logging in, you’ll be redirected to the setup wizard.

On the next page you’ll be asked to purchase a Plex Pass. Simply click the “X” in the top right corner if you don’t want Plex Pass.

Give your server a name and make sure you leave the Allow me to access my media outside my home box ticked like in the screenshot.

For now, skip adding a library and click NEXT:

Click DONE to finish the setup.

Customize your navigation menu to your liking and click FINISH SETUP:

###Create library directories

Back on your Cloud Server, we’ll create a movies library in the default location. You can also create a shows, music, or photos directory at this time. The library directories can be created anywhere the plex user has read access to, but we’ll use the default location of “/var/lib/plexmediaserver/Library” in this guide.

mkdir /var/lib/plexmediaserver/Library/Movies
Add libraries to Plex
Now that the directory is created, we can add a library. Back in your browser, click on MORE.

Click your Plex server name.

Click MANAGE LIBRARIES.

Click ADD LIBRARY.

Choose the library type and name it. Something simple like Movies will work. Click NEXT.

Click BROWSE FOR MEDIA FOLDER and navigate to the library directory you created earlier.

Finally, click ADD LIBRARY.

Add Media to Your Library

The easiest way to upload your media is with SFTP.

These two Plex support articles will show you how to properly organize your media so Plex can understand it and fetch the proper metadata:

Movies: https://support.plex.tv/articles/naming-and-organizing-your-movie-media-files/

TV Shows: https://support.plex.tv/articles/naming-and-organizing-your-tv-show-files/

Once you’ve added your media, you’ll need to scan your library files before Plex will see them. Do this by clicking on the three dots next to your library and clicking Scan Library Files:

###Enjoy Your Media!

Congratulations! Everything should be working at this point. Now you can enjoy your media with one of Plex’s client apps or by navigating to app.plex.tv in a web browser.

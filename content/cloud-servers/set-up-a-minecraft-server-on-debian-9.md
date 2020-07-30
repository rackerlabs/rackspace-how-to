---
permalink: set-up-a-minecraft-server-on-debian-9/
audit_date:
title: 'Set up a Minecraft Server on Debian 9'
type: article
created_date: '2020-07-29'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

This guide is designed to be a quick and easy way to get your Minecraft server up and running. It will assume that you’ve just created your server, and have made no other changes to it.

• Access to a Cloud Server running Debian 9, with a public IP address.

SSH into your Cloud Server as the root user. Once you’re logged in, we’ll want to create a user that the Minecraft server will run under. Issue the following command to create the user and follow the prompts:

adduser minecraftuser

Now we’ll want to add this user to a group with the proper permissions, in Debian this group is appropriately called ‘sudo’. Execute the following command to add the user to the group:

usermod -aG sudo minecraftuser

Lastly, we’ll want to switch over and begin using the new user we created. Perform the following command and follow the prompts.

su - minecraftuser
 
First, we’ll need to install Java, which is required by Minecraft. Execute the following command to install the Java version currently required for Minecraft servers. You can include the -y at the end to avoid being prompted to hit ‘y’ on your keyboard to approve the install:

sudo apt install openjdk-8-jdk -y

Now we can check our version of Java installed. It should report back that it has installed java-1.8.x, which is the most current as of this article creation date.

java -version

Now that we have Java installed, it’s good to have a directory to store all our Minecraft related directories. Let’s create a new directory to install Minecraft into:

mkdir minecraftdir

Now let’s move into that new directory:

cd minecraftdir

We’ll now download the jar file which is essentially the executable for the server. We’ll use the wget command to download the file over the internet. In your browser, go to https://www.minecraft.net/en-us/download/server and right-click and copy the link to download the .jar file. Now back inside of your server’s command line, execute the following:

wget https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar

Now that the download has finished, we want to make the jar file executable. Run the following command to make this change:

sudo chmod +x server.jar

For the Minecraft server to run, we need to create and add a line to the End User License Agreement file. We’ll use the ‘vi’ command to create and open the file in the vi text editor like this:

vi eula.txt

Once you’re in the file, press ‘I’ on your keyboard to enter into INSERT mode. Now type the following:

eula=true

Once you’ve typed this out, press ESC on your keyboard, and then type :wq and hit ENTER. This will save and quit the file.
 
Now that we have everything installed, we just need to start the server and open our server’s port so that others can connect.

We’re going to run the server in something called ‘screen’ which you can think of as a sort of like having another tab open in your browser. This allows you to have the Minecraft server running while being able to still access your server’s command line for anything else you may need to do. If you do not run it on the screen, you’ll have to stop the Minecraft server any time you want to access the server’s command line. Execute the following to install the screen software:

sudo apt install screen

Now, we’ll start the screen with the -S option, and give it an identifiable name ‘minecraftserver’:

screen -S minecraftserver

If you get an error saying screen cannot open your terminal, run this command and try again:

script /dev/null

For more information on the screen and what it can do check out our Using screen on your server article.

Next, we’ll want to open up our server’s port 25565 which is the port used by Minecraft. Execute this command:

sudo iptables -I INPUT -p tcp -m tcp --dport 25565 -j ACCEPT

Finally, we can start the actual server. It’s worth noting that the command used to start the server also dictates how much memory (RAM) the server is allowed to use.

Xmx specifies the maximum heap size available to an application
Xms specifies the minimum heap size available to an application
Depending on the amount of RAM your server has, you can adjust these values by altering the numbers. In the example we use, we’re giving our Minecraft server 1024 megabytes (1GB) to function. If your server has more resources, you can raise these amounts. Ensure you leave enough memory for the system to function, don’t dedicate the entire quantity of memory on your server to Minecraft, or you might experience out of memory (OOM) situations.

Execute the command to start the server:

java -Xmx1024M -Xms1024M -jar server.jar nogui

Once you issue this command, you’ll see the output from the server log which shows the status of your server, who is connected, whether the world is ready, etc.

If you need to stop your server, you can simply type ‘stop’ and press ENTER.

When your server reboots, you’ll want to start screen and your Minecraft server again before anyone will be able to connect.

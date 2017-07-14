---
permalink: add-another-wordpress-site-to-an-existing-cloud-orchestration-stack/
audit_date:
title: Add another WordPress site to an existing Cloud Orchestration stack
type: article
created_date: '2013-12-13'
created_by: Jered Heeschen
last_modified_date: '2016-05-12'
last_modified_by: Kyle Laffoon
---

This article shows how to manually add another WordPress site to an existing WordPress Cloud Orchestration stack on Cloud Servers.

Note that in most situations, it's better to create a new WordPress stack for each site. This allows for better performance, security, and scalability, and is much easier to manage. Furthermore, creating a new WordPress stack is a simple process involving just a few clicks through the Cloud Control Panel.

Adding a site to an existing stack requires changes to the configurations for multiple services. The effort may be acceptable when the existing stack runs well under capacity or when you're trying to minimize the number of server instances you maintain.

### Connect to the backend (database) server

1. Log in to the [Cloud Control Panel](http://mycloud.rackspace.com).

2. In the top navigation bar, click **Orchestration > Stacks** to view the list of existing stacks.

3. From the Stacks list, click on the name of the stack to which you want to add a WordPress site.

4. From the list of servers, click the name of the "backend" server to view its details page.

   On the backend server's detail page, you will find the PublicNet IP address in the Networks section.

  **Note:** If "backend" does not appear on your server list, find details for "database", which acts as your backend server.

5. Use the public IP address from the server details page and the private key provided when the stack was created to connect to the back end server with SSH.

        ssh user@<ip_address_of_backend_server> -i /path/to/key

  If you do not have the private key, you can reset the back end server's root password. For help connecting to your server via SSH, see the articles on using SSH with a private key in our How To center for [Mac and Linux](/how-to/logging-in-with-an-ssh-private-key-on-linuxmac) or [Windows](/how-to/logging-in-with-an-ssh-private-key-on-windows).

### Set up a database

1. After logging in to your back end server, run the `mysql` command to connect to MySQL.

2. Create a database for the new WordPress site with the `create database` command in the MySQL shell.  

  For this example we'll call the site "blogsrock.rackspace.com".

        create database blogsrock_rackspace_com;

3. Create a user and password for this site.

  Please use a strong password (not like the one in this tutorial).

        grant all on `blogsrock_rackspace_com`.* to 'blogsrock'@'localhost' identified by 'mystrongpassword';

4. Grant access for this user when connecting from our web servers.

  For this tutorial we are going to grant access to all `10.x.x.x` IP addresses; however, for additional security, you can replace this with the specific ServiceNet IP addresses of your web servers.

        grant all on `blogsrock_rackspace_com`.* to 'blogsrock'@'10.%' identified by 'mystrongpassword';

5. When you are finished, type `exit` to leave MySQL and type `exit` again to disconnect from the backend server.

### Set up WordPress

Now that the database is ready, you can install WordPress on the master node.

1. From the stack's detail page, click the link for the "master" server.

  On the master server's detail page, you will find the PublicNet IP address in the Networks section.

2. Use the IP address and private key to connect to the server via `ssh`.

        ssh user@<ip_address_of_master_server> -i /path/to/key

3. Use `wget` to download the latest WordPress tarball.

        wget http://wordpress.org/latest.tar.gz

4. Download a script called [wordpress-cli-installer](https://github.com/nexcess/wordpress-cli-installer).

  This script simplifies the final steps of the WordPress setup.

    wget https://raw.github.com/nexcess/wordpress-cli-installer/master/wordpress-cli-installer.sh

5. Navigate to the web server's data directory.

    cd /var/www/vhosts

  The directory should contain subdirectories for any WordPress sites that are already configured on the server.

6. Make a new directory for the new site with WordPress subdirectories.

        sudo mkdir -p blogsrock.rackspace.com/{conf,http_docs,.ssh}

    The new directory should contain subdirectories named `conf`, `http_docs`, and `.ssh`.

        $ ls -l blogsrock.rackspace.com
        total 20
        drwxr-xr-x 5 root root 4096 Dec  3 16:23 ./
        drwxr-xr-x 4 root root 4096 Dec  3 16:23 ../
        drwxr-xr-x 2 root root 4096 Dec  3 16:23 conf/
        drwxr-xr-x 2 root root 4096 Dec  3 16:23 http_docs/
        drwxr-xr-x 2 root root 4096 Dec  3 16:23 .ssh/

7. Extract the WordPress tarball you downloaded earlier to the `http_docs` directory.

        sudo tar --strip-components 1 -xvzf ~/latest.tar.gz -C http_docs/

8. Change to the **http_docs** directory.

        cd http_docs/

  The extracted WordPress files should be present, including the **wp-config-sample.php** file.

9. Copy the **wp-config-sample.php** file to make a new WordPress config file.

        sudo cp wp-config-sample.php wp-config.php

10. Edit the new configuration file and add some extras to help with file permissions and load balancing.

  For HTTP-only sites, you can easily make the necessary changes by running, all on one line:

        sudo bash -c "echo -e "define('FS_METHOD', \"direct\");\ndefine('FS_CHMOD_DIR', (02775 & ~umask()));\ndefine('FS_CHMOD_FILE', (0664 & ~ umask()));\ndefine('FORCE_SSL_ADMIN', false);\nif ( isset(\$_SERVER['HTTP_X_PROXY_PROTO']) && \$_SERVER['HTTP_X_PROXY_PROTO'] == 'HTTPS' ) { \$_SERVER['HTTPS'] = 1; }" >> wp-config.php"

  If you are running an HTTPS site, run this command instead:

        sudo bash -c "echo -e "define('FS_METHOD', \"direct\");\ndefine('FS_CHMOD_DIR', (02775 & ~umask()));\ndefine('FS_CHMOD_FILE', (0664 & ~ umask()));\ndefine('FORCE_SSL_ADMIN', true);\nif ( isset($_SERVER['HTTP_X_PROXY_PROTO']) && \$_SERVER['HTTP_X_PROXY_PROTO'] == 'HTTPS' ) { \$_SERVER['HTTPS'] = 1; }" >> wp-config.php"

11. Generate new secure keys using the WordPress API.

        curl -q https://api.wordpress.org/secret-key/1.1/salt/

  You should get output similar to the following:

        define('AUTH_KEY',         'V}zrS|PsyH3]!p!AEufS{7:Jjy);(ooKx/aG-S6VWcpd3D47zc3Xr~2=.W3|Yfw:');
        define('SECURE_AUTH_KEY',  'w1|o-0:5i};kj&V1SY}2O[2MGTwo8NhoI2+Gmj!qDgG<~1A+*,DAQ?^0xO_&g%se');
        define('LOGGED_IN_KEY',    'Ce6g>+OA$u+-H5`/ZU|f#`=J,rb!.-^ayr20jG.BF$Q7q>]G&lPG nTS^Ox*mMET');
        define('NONCE_KEY',        'G$Or)@Rp%Im#eezD{P.P[/eMv9q_wNe+.GVt| y,rN~sA;`y@UY76S|J[p7-n*s&');
        define('AUTH_SALT',        '$iPgS$t^,h!=YSW0ju*jqmk!@eLAn<JM?tG/+5c=|-#[8*G7-mnp6HG!t{J3>o4u');
        define('SECURE_AUTH_SALT', 'ciy$1-c^X-mkb<2ULD7+ua;_kjd9ku&:bZX>}B-GnI5ITu`(q)]3{p#TQ)-:`w@c');
        define('LOGGED_IN_SALT',   'VE]+84A?6Qen-p`iuthBw;Cqh:z2-9)Rdcw2AY_7?W;D`W5T7ATmJHrK~}-1`e2E');
        define('NONCE_SALT',       'XV}nFzYqXJ}jr)tD2vZ`-|!w]f>3;*`?#U8*l(C:/*)w.cf}6i{Adw@,Yj7p(F?d');

12. Edit the **wp-config.php** file to replace the default keys with the keys generated in the previous step.

        sudo nano wp-config.php

  **Note:** Replace `nano` in that command with your text editor of choice.

13. Edit the **wp-config.php** file to replace the default database values with the database name, username, and password created in the previous section.

  The relevant section of the configuration file looks similar to the following:

        // ** MySQL settings - You can get this info from your web host ** //
        /** The name of the database for WordPress */
        define('DB_NAME', 'database_name_here');

        /** MySQL database username */
        define('DB_USER', 'username_here');

        /** MySQL database password */
        define('DB_PASSWORD', 'password_here');

        /** MySQL hostname */
        define('DB_HOST', 'localhost');

  For the `DB_HOST` value, replace `localhost` with the ServiceNet IP address of the back end server.

14. Run `wordpress-cli-installer`, passing it arguments for the site's base URL, title, admin email address, and WordPress location.

        sudo sh ~/wordpress-cli-installer.sh -b 'http://blogsrock.rackspace.com' -T 'BLOGS ROCK' -e 'admin@example.com' /var/www/vhosts/blogsrock.rackspace.com/http_docs/

### Set up the system

Now you should make some changes to the system to accommodate the new WordPress site.

1. Create a new user for the site, setting the user's home directory to the new site's directory.  

  For example:

        sudo useradd -M -d /var/www/vhosts/blogsrock.rackspace.com -p 'mystrongpassword' -s '/bin/bash' -U -G www-data wp_user2

2. Set up a new SSH key-pair for `lsyncd` connections between the master and back end nodes in the new user's `.ssh` directory.

        cd .ssh
        sudo ssh-keygen -f id_rsa.lsyncd
        sudo mv id_rsa.lsyncd.pub authorized_keys

3. Change to the **conf** subdirectory of the new site.

        cd /var/www/vhosts/blogsrock.rackspace.com/conf/

4. Copy any configuration files for the existing WordPress site to the new directory.

        sudo cp /var/www/vhosts/iloveblog.rackspace.com/conf/* /var/www/vhosts/blogsrock.rackspace.com/conf/

5. Change the name of the new config file to match the new site.

        sudo mv iloveblog.rackspace.com__http.conf blogsrock.rackspace.com__http.conf

  If your site supports HTTPS you'll also need to rename the copied HTTPS configuration file.

        sudo mv iloveblog.rackspace.com__https.conf blogsrock.rackspace.com__https.conf

6. Edit the configuration file to use the domain name of the new site in place of the existing site.

        sudo sed -i 's/iloveblog.rackspace.com/blogsrock.rackspace.com/g' blogsrock.rackspace.com__http.conf

  If your site supports HTTPS you'll need to make the same change to the HTTPS file.

        sudo sed -i 's/iloveblog.rackspace.com/blogsrock.rackspace.com/g' blogsrock.rackspace.com__https.conf

7. If your site supports HTTPS, you will need to change the SSL certificate being used in the new "https" file to point to the SSL certificate for the new site. Specific instructions for this step are beyond the scope of this tutorial.

8. Set appropriate permissions for all the new site's directories and files. Replace `wp_user2` with the name of the user you created for the site in Step 1 of this section.

        cd /var/www/vhosts/blogsrock.rackspace.com/
        sudo chown -R wp_user2:www-data http_docs
        sudo chown -R wp_user2:wp_user2 conf .ssh
        sudo chmod -R ug=rwX,o=rX http_docs
        sudo chmod u+s http_docs
        sudo find http_docs/ -type d -exec chmod u+s {} \;
        sudo chmod -R u=rwX,go= .ssh

### Set up Apache

After configuring the system for the new WordPress site, you need to create an Apache virtual host configuration file for the new site.

1.  Change to Apache's sites-available directory.

        cd /etc/apache2/sites-available

2. Copy the existing site's configuration file for the new site.

        sudo cp iloveblog.rackspace.com.conf blogsrock.rackspace.com.conf

3. Edit the new virtual host configuration file to change any domain references for the new site.

        sudo sed -i 's/iloveblog.rackspace.com/blogsrock.rackspace.com/g' blogsrock.rackspace.com.conf

### Set up Varnish

Just like for Apache, you need to copy the existing site's varnish configuration to a new file and change the domain name it looks for as well.

1. Change to the Varnish **include** directory.

        cd /etc/varnish/include/

2. Copy the existing site's configuration file for the new site.

        sudo cp iloveblog.rackspace.com_.vcl blogsrock.rackspace.com_.vcl

3. Edit the new virtual host configuration file to change any domain references for the new site.

        sudo sed -i 's/iloveblog.rackspace.com/blogsrock.rackspace.com/g' blogsrock.rackspace.com_.vcl

### Set up lsyncd

Now you need to add the new site to your lsyncd configuration so that the master server knows to push content for the new site to the slave servers.

1. Change to the lsyncd configuration directory.

        cd /etc/lsyncd/

2. Open the **lsync.conf.lua** file for editing to add a node for the new site.

        sudo nano lsync.conf.lua

   **Note:** Replace `nano` in that command with your text editor of choice.

3. For each slave server in the WordPress stack, make a new `sync` section, changing the `source` value to match the new site, the `target` value to match the new system user, and changing the directory reference in the `excludeFrom` value.

  The **lsync.conf.lua** file consists of a `settings` section followed by one or more `sync` sections, one for each slave site. Since our example stack only has one slave, we only have to add one new `sync` section.  You can copy the existing `sync` section then modify the directory references and username in the new section to match the new site.

  For our example site, the edited file looks like this:

        settings = {
           logfile    = "/var/log/lsyncd/lsyncd.log",
           statusFile = "/var/log/lsyncd/lsyncd-status.log",
           statusInterval = 5,
           pidfile = "/var/run/lsyncd.pid"
        }
          sync{
                default.rsync,
                source="/var/www/vhosts/iloveblog.rackspace.com/http_docs",
                target="wp_user@<slave_node_ip_address>:/var/www/vhosts/iloveblog.rackspace.com/http_docs",
                excludeFrom="/etc/lsyncd/lsyncd.exclude",
                rsyncOps={"-rlpgoDvz", "-e", "/usr/bin/ssh -i /var/www/vhosts/iloveblog.rackspace.com/.ssh/id_rsa.lsyncd -o StrictHostKeyChecking=no"}
          }
          sync{
                default.rsync,
                source="/var/www/vhosts/blogsrock.rackspace.com/http_docs",
                target="wp_user2@<slave_node_ip_address>:/var/www/vhosts/blogsrock.rackspace.com/http_docs",
                excludeFrom="/etc/lsyncd/lsyncd.exclude",
                rsyncOps={"-rlpgoDvz", "-e", "/usr/bin/ssh -i /var/www/vhosts/blogsrock.rackspace.com/.ssh/id_rsa.lsyncd -o StrictHostKeyChecking=no"}
          }

### Set up the slave node

Next, you need to create the new user on each slave node in order to prepare for the new site. To do this, you must set up the stack's SSH key (the one you used to log in to each node) on the master server and use `pssh` to make the process faster.

1. If you aren't already on the root account, switch to a root shell to execute privileged commands and use root's SSH keys.

        sudo su - root

2. Edit root's private key file to add the stack's SSH private key.

        nano ~/.ssh/id_rsa

    Replace `nano` in that command with your text editor of choice.

3. Add the stack's SSH private key to the file and save the change.  

   If the file isn't empty, add the key on a new line at the end of the file.

4. Change permissions on the key file so only root can access it.

        chmod 600 ~/.ssh/id_rsa

5.  Install `pssh` on the master server.

        apt-get update
        apt-get install pssh

6. Run `pssh` to add the new user to each slave server.

   Note that the `-H` flag here is only used once, but you should repeat it for each additional slave node you have.

        parallel-ssh -P -H <ip_address_of_slave_node> -x "-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null" useradd -M -d /var/www/vhosts/blogsrock.rackspace.com -p 'mystrongpassword' -s '/bin/bash' -U -G www-data wp_user2

   You should see `pssh` report `SUCCESS` for each slave node.

7. Run an `id` command through `pssh` to verify the user creation on each slave node, again adding `-H` flags for each additional slave node.

        parallel-ssh -P -H <ip_address_of_slave_node> -x "-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null" id wp_user2

  You should see something similar to the following from each slave node:

        uid=1001(wp_user2) gid=1001(wp_user2) groups=1001(wp_user2),33(www-data)

8. Copy the new site's content from the master server to each slave server using `rsync`.

        rsync -avz -e ssh /var/www/vhosts/blogsrock.rackspace.com root@<slave_node_ip>:/var/www/vhosts

  Repeat the `rsync` for each slave node in your stack.

9.  Copy the Apache and Varnish configuration files to the slave nodes.

  To make things easier, use a loop with the `parallel-scp` command (part of the `pssh` package). Add extra `-H` flags for each additional slave node.

        for file in /etc/apache2/sites-available/blogsrock.rackspace.com.conf /etc/varnish/include/blogsrock.rackspace.com_.vcl; do parallel-scp -H <ip_address_of_slave_node> -x "-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null" $file $file; done

### Final steps

Now you can finally start putting everything together and run the new site.

1. Restart `lsyncd` on the master node in order to start syncing content for the new site to the slaves.

        service lsyncd restart

2. Enable the new site's Apache configuration on the master server and slave nodes.

        parallel-ssh -i -H <ip_address_of_slave_node> -x "-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null" /usr/sbin/a2ensite blogsrock.rackspace.com.conf; /usr/sbin/a2ensite blogsrock.rackspace.com.conf

3. Reload Apache's configuration on the master server and slave nodes.

        parallel-ssh -i -H <ip_address_of_slave_node> -x "-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null" service apache2 reload; service apache2 reload

4. Reload Varnish's configuration on the master server and slave nodes.

        parallel-ssh -i -H <ip_address_of_slave_node> -x "-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null" service varnish reload; service varnish reload

Your new WordPress site should now be online.

---
permalink: logging-in-with-an-ssh-private-key-on-linuxmac/
audit_date: '2016-06-07'
title: Log in with an SSH private key on Linux and Mac
type: article
created_date: '2013-09-25'
created_by: Brint Ohearn
last_modified_date: '2016-06-07'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

This example demonstrates how to use a private key to log in to a Linux
server by using a private key by using a Terminal session on OS X. However,
you can follow the same process to use a private key when using any
terminal software on Linux.

**Note:** For information about using SSH private keys on Windows operating systems, see [Logging in with an SSH Private Key on Windows](/how-to/logging-in-with-an-ssh-private-key-on-windows).

###Prerequisites

To complete this process, you need the following software applications:

 - ssh - SSH client software is installed on your Linux or OS X
    operating system by default
 - Your favorite text editor. This example uses the vim text editor.

### Log in with a private key

1. Using a text editor, create a file in which to store your private
key. This example uses the file **deployment_key.txt**.

2. To edit the file in vim, type the following command

          vim deployment_key.txt

3. After the editor starts, press **i** to turn on insert mode. 

4. Paste the private key into the file. Be sure to include the BEGIN and END lines.
        
     <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-linuxmac/Linux2.png %}" width="764" height="660" />

5. To save your changes, press **Esc**. 

6. Type **:wq** to write the file and return to the command line.

7. Run the following command to change the file permissions to 600 to secure the key. You can also set them to 400.
**This step is required**:

          chmod 600 deployment_key.txt

8. Use the key to log in to the SSH client as shown in the following example, which loads the key in file **deployment\_key.txt**, and logs in as user **demo**,to IP **192.237.248.66**:

          ssh -i deployment_key.txt demo@192.237.248.66

9. When the prompt to confirm the connection request is displayed, type **yes** and then press **Enter**. 

10. If your SSH key requires a password, enter it when prompted to complete the connection.


<script type="application/ld+json">
  {
   "@context": "http://schema.org/",
   "@type": "HowTo",
   "name":"Log in with an SSH private key on Linux and Mac",
   "description": "This example demonstrates how to use a private key to log in to a Linux server by using a private key by using a Terminal session on OS X. However, you can follow the same process to use a private key when using any terminal software on Linux.",
   "step": [
   	{
   	"@type": "HowToSection",
   	"name": "Create a file with your private key",
       "position": "1",
   	"itemListElement": "Using a text editor, create a new file and store your private key in it."
   	},{
    "@type": "HowToSection",
   	"name": "Change the file permissions",
       "position": "2",
   	"itemListElement": "Run the chmod 600 deployment_key.txt command to change the file permissions to 600 to secure the key."
    },{
   	"@type": "HowToSection",
   	"name": "Log in to the SSH client",
       "position": "3",
   	"itemListElement": "Use the key to log in to the SSH client."
    },{
   	"@type": "HowToSection",
   	"name": "Confirm connection",
       "position": "4",
   	"itemListElement": "When the prompt to confirm the connection request is displayed, type yes and then press Enter."
    },{
   	"@type": "HowToSection",
   	"name": "Complete connection",
       "position": "5",
   	"itemListElement": "If your SSH key requires a password, enter it when prompted to complete the connection."
   }]}
</script>

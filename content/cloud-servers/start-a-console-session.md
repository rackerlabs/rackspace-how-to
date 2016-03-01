---
node_id: 1356
title: Start a Console session
type: article
created_date: '2012-03-27'
created_by: Rackspace Support
last_modified_date: '2015-12-31'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

### Previous section
[Getting Started with Cloud Servers](/how-to/create-a-cloud-server)

As the administrator for your cloud servers, you might need to occasionally log in to one of your servers by using the Console feature in the Cloud Control Panel.

### To access the Console

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
2.  Click on the name of your server to open the details page.
3.  From the Actions menu, select Connect Via Console.

A terminal emulator window opens and displays your server's console. If you see a blank screen, hit Enter to bring up a login prompt or Windows desktop.

<img alt="" src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Console2.png" border="1" width="650" />

If you get a security error message from Java, you might need to add the console URL to Java's security exceptions list.  For more information, see [How can I configure the Exception Site List?](http://java.com/en/download/faq/exception_sitelist.xml)

**Note:** First-generation servers load a different version of the console with a reduced feature set.

### Working in the console

The top row of the console displays functions that you can use during a Console session.

- Click the Options button to open the XVP Viewer Options dialog box, in which you can modify certain display and interface options.

- Click the Clipboard button to open the XVP Viewer Clipboard dialog box, which provides a convenient location to copy and paste lines of text.

    <img alt="" src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/OptionsClipboard2.png" width="650" border="1" />

- Select the Ctrl or Alt check boxes while choosing an F key from the Fx list to emulate the corresponding keyboard functions in the Console.

- For Windows servers, click the Ctrl-Alt-Del button to send an interrupt command to the server.

- Click the Refresh button to refresh the Console screen.

- The Shutdown and Reboot buttons are inactive by default. When you are logged in to your server as root/administrator or as a user with those privileges, those buttons become active.

### Closing the console

Before closing the console, log out of your account to ensure that the account is not active the next time a user connects to your server's Console.

You can disconnect the Console from your server by clicking the Disconnect button to end the session.

### Next section
[Reboot your server](/how-to/reboot-your-server)

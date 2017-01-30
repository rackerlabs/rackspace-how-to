---
permalink: troubleshooting-an-offline-website/
audit_date: '2016-09-26'
title: Troubleshooting an offline website
type: article
created_date: '2016-09-08'
created_by: Nate Archer
last_modified_date: '2016-01-05'
last_modified_by: Nate Archer
product: Cloud Networks
product_url: cloud-networks
---

More than half of all deployment issues involve an offline website. The causes of a website being offline are often easy to fix. This article describes how to troubleshoot an offline website.

**Note:** This article assumes knowledge of networking tools such as `ping` and `nmap` and `traceroute`. For more information about these tools, see [Common network troubleshooting tools](/how-to/common-network-troubleshooting-tools/)

### Prerequisites

Gather the following information before troubleshooting your site:

- The URL of the website
- The name and IP address of the server that hosts the site
- A list of the methods that you have tried to resolve the issues

### Troubleshooting steps

1. Try to access the website through a web browser.

    - If the site does not load or you receive a `Server Not Found` message, skip to step 2.

    - If the site loads but an error page visible, review the current deployment configuration.

         **Note:** Rackspace Support can't assist with configuration errors.

    - If the site loads and functions as intended, load the site through a different web browser. It is possible that you are experiencing [network issues](/how-to/common-network-troubleshooting-tools/).

2. Ping the web server using the server's IP address.

    - If packets are transmitted and received, skip to step 3.

          $ ping 104.130.8.75
          PING 104.130.8.75 (104.130.8.75) 56(84) bytes of data.
          64 bytes from 104.130.8.75: icmp_seq=1 ttl=55 time=32.3 ms
          64 bytes from 104.130.8.75: icmp_seq=2 ttl=55 time=32.3 ms
          64 bytes from 104.130.8.75: icmp_seq=3 ttl=55 time=32.3 ms
          64 bytes from 104.130.8.75: icmp_seq=4 ttl=55 time=32.2 ms
          64 bytes from 104.130.8.75: icmp_seq=5 ttl=55 time=32.3 ms
          ^C
          --- 104.130.8.75 ping statistics ---
          5 packets transmitted, 5 received, 0% packet loss, time 4005ms
          rtt min/avg/max/mdev = 32.283/32.346/32.377/0.118 ms

    - If no packets are received, skip to the "Test your connection using the server's console" section.  

          $ ping 50.51.225.132
          PING 50.51.225.132 (50.51.225.132) 56(84) bytes of data.
          ^C
          --- 50.51.225.132 ping statistics ---
          5 packets transmitted, 0 received, 100% packet loss, time 3999ms

3. Ping the website by using the host name.

    - If packets are transmitted and received, skip to step 4.

          $ ping website.com
          PING website.com (104.130.7.75) 56(84) bytes of data.
          64 bytes from 104.130.7.75: icmp_seq=1 ttl=55 time=32.4 ms
          64 bytes from 104.130.7.75: icmp_seq=2 ttl=55 time=32.2 ms
          64 bytes from 104.130.7.75: icmp_seq=3 ttl=55 time=32.2 ms
          64 bytes from 104.130.7.75: icmp_seq=4 ttl=55 time=32.2 ms
          64 bytes from 104.130.7.75: icmp_seq=5 ttl=55 time=32.2 ms
          ^C
          --- website.com ping statistics ---
          5 packets transmitted, 5 received, 0% packet loss, time 4008ms
          rtt min/avg/max/mdev = 32.208/32.261/32.429/0.141 ms

    - If you receive a `ping: unknown host` response, check the DNS settings for a missing or misconfigured A record.

4. Run the `nmap` command on the IP address of the server.

    - If port 80 is shown as `open` and using `http`, skip to the "Test your connection using server's console" section.

          $ nmap website.com
     
           Starting Nmap 5.51 ( http://nmap.org ) at 2016-08-25 12:23 UTC
           Nmap scan report for website.com (104.130.8.75)
           Host is up (0.0000060s latency).
           rDNS record for 104.130.8.75: elector
           Not shown: 997 closed ports
           PORT     STATE SERVICE
           21/tcp   open  ftp
           80/tcp   open  http
           3306/tcp open  mysql
     
          Nmap done: 1 IP address (1 host up) scanned in 0.07 seconds

    - If port 80 is shown as `closed` or `filtered`, ensure that the web service for the server is running and that port 80 is open on the server's firewall.

          $ nmap -Pn -p 443 website.com
     
            Starting Nmap 5.51 ( http://nmap.org ) at 2016-08-25 12:25 UTC
            Nmap scan report for website.com (104.130.8.75)
            Host is up (0.000052s latency).
            rDNS record for 104.130.8.75: elector
            PORT    STATE  SERVICE
            443/tcp closed https
     
            Nmap done: 1 IP address (1 host up) scanned in 0.05 seconds

### Test your connection using your server's console

Even if your website appears back online after you perform the preceding steps, you need to test the site’s connectivity by using the console of the cloud server that hosts the site. To access the server's console, perform the following steps:

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. Select **Servers** > **Cloud Servers**.

3. Click the gear icon next to the name of the server that hosts your website and select **Emergency Console**.

Use the following steps to test the server's connectivity with the console.

**For Linux servers**

Press **Enter** to see if the server is responsive during the login process.

- If the server is responsive, you should see the following login prompts each time you press **Enter**.

        CentOS Linux 7 (Core)
        Kernel 3.10.0-327.22.2.e17.x86_64 on an x86_64
 
        server-01 login:
 

- If you receive an `Out of memory` error (as shown in the following example), reboot the server and attempt to use the server's console again.

         kernel: Out of memory: Kill process 9163 (mysqld) score 511 or sacrifice child
         kernel: Killed process 9163, UID 27, (mysqld) total-vm:2457368kB, anon-rss:816780kB, file-rss:4kB

 If the `Out of memory` error occurs again, determine whether you need to resize the server or tweak the configuration for scalability.

**For Windows servers**

Press **Ctrl+Alt+Del** to see if the server prompts you to log in.

- If you are prompted to log in, the server is powered on and active. Your website should be online.

- If the console switches to a blank screen, the server has likely crashed. Reboot the server and open the console again. If login prompt does not appear, press **Esc**.

**Note:** If you can’t connect to your Windows server’s console at all, contact Support to ensure that your host is not down.


If none of the preceding troubleshooting steps bring your website online, review the steps in [Common network troubleshooting tools](/how-to/common-network-troubleshooting-tools/) before contacting Rackspace support.

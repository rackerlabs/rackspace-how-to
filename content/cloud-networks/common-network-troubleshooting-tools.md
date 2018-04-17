---
permalink: common-network-troubleshooting-tools/
audit_date: '2018-04-13'
title: Common network troubleshooting tools
type: article
created_date: '2016-10-03'
created_by: Nate Archer
last_modified_date: '2018-04-13'
last_modified_by: Cat Lookabaugh
product: Cloud Networks
product_url: cloud-networks
---

This article describes common networking tools that can help you identify network connectivity issues for your server or website. Some of these tools are installed on your system by default and some require installation.

### Common tools installed by default for Windows, Mac, and Linux

The following tools are installed on all Windows, Mac, and Linux operating systems and servers by default.

#### Ping

Ping is a computer network administration utility that you can use to test how reachable a host is on an Internet Protocol (IP) network. Ping also measures the amount of time that messages (or `packets`) take to travel from the origin host to a destination computer and back.

Ping commands require no flags to test. Enter the `ping` command followed by the Universal Resource Locator (URL) or IP addresses of the website or server that you are testing. You can find the IP address in the **Servers** section of the [Cloud Control Panel](https://mycloud.rackspace.com/). The following example uses the URL:

    ping google.com

**Successful ping response**

If the `ping` command indicates that an equal number of packets were transmitted and received and shows a response time of under 100 ms in the US and under 200 ms outside of the US, no networking issues exist. The following example shows a successful response:

    $ ping google.com
    PING google.com (216.58.218.238) 56(84) bytes of data.
    64 bytes from iad23s40-in-f14.1e100.net (216.58.218.238): icmp_seq=1 ttl=55 time=0.971 ms
    64 bytes from iad23s40-in-f14.1e100.net (216.58.218.238): icmp_seq=2 ttl=55 time=0.983 ms
    64 bytes from iad23s40-in-f14.1e100.net (216.58.218.238): icmp_seq=3 ttl=55 time=0.924 ms
    64 bytes from iad23s40-in-f14.1e100.net (216.58.218.238): icmp_seq=4 ttl=55 time=0.957 ms
    64 bytes from iad23s40-in-f14.1e100.net (216.58.218.238): icmp_seq=5 ttl=55 time=0.981 ms
    ^C
    --- google.com ping statistics ---
    5 packets transmitted, 5 received, 0% packet loss, time 4007ms
    rtt min/avg/max/mdev = 0.924/0.963/0.983/0.029 ms

**Unsuccessful ping response**

If no packets are received, as shown in the following example, the network might be down. To verify this, consider performing additional troubleshooting with the traceroute or My traceroute (MTR) tools that are described in this article.

    $ ping engadget.com
    PING engadget.com (149.174.110.102) 56(84) bytes of data.

    --- engadget.com ping statistics ---
    5 packets transmitted, 0 received, 100% packet loss, time 3999ms


#### Traceroute

Traceroute is a computer network diagnostic tool that displays the route (or path) of a network hop and measures transit delays of packets across an IP network. Traceroute is particularly useful for identifying network latency issues.

**Note:** On Windows operating systems the `traceroute` command is named `tracert`. When performing a traceroute from your computer you should substitute the command name for the appropriate one for your system.

Use the `traceroute` command followed by URL of the website or the IP address of the server that you want to test as shown in the following example:

    $ traceroute google.com
    traceroute to google.com (216.58.217.174), 30 hops max, 60 byte packets
    1  162.242.237.3 (162.242.237.3)  0.644 ms  0.623 ms  0.740 ms
    2  aggr403b-9-core8.iad3.rackspace.net (72.4.122.254)  1.217 ms  2.539 ms aggr403b-9-core7.iad3.rackspace.net (72.4.122.250)  1.205 ms
    3  core7-corea.iad3.rackspace.net (69.20.2.96)  1.177 ms core7-coreb.iad3.rackspace.net (69.20.2.112)  1.237 ms  0.962 ms
    4  dcpe1-coreb.iad3.rackspace.net (69.20.2.164)  1.492 ms  1.148 ms dcpe1-corea.iad3.rackspace.net (69.20.2.160)  1.502 ms
    5  be2-mspe4.iad30.rackspace.net (10.25.2.99)  1.712 ms  1.465 ms be1-mspe4.iad30.rackspace.net (10.25.2.83)  1.527 ms
    6  72.14.203.106 (72.14.203.106)  3.746 ms  0.965 ms  0.937 ms
    7  209.85.253.197 (209.85.253.197)  1.062 ms 209.85.251.249 (209.85.251.249)  1.022 ms  1.009 ms
    8  209.85.143.143 (209.85.143.143)  1.570 ms 209.85.143.145 (209.85.143.145)  1.092 ms 209.85.143.143 (209.85.143.143)  1.523 ms
    9  iad23s44-in-f14.1e100.net (216.58.217.174)  0.971 ms  0.962 ms  0.943 ms

The preceding output identifies the location of each hop along a networks route, as shown by `aggr403b-9-core8.iad3.rackspace.net`.

If a hop is located within a Rackspace network and other networking issues exist, contact [Rackspace Support](https://www.rackspace.com/en-us/support) with the steps that you have taken to troubleshoot your network. If a hop is *not* located within a Rackspace network and other networking issues exist, contact your Internet service provider.

To learn more about how to troubleshoot latency issues with traceroute, see this MaxCDN tutorial: [Reading a Traceroute](https://www.maxcdn.com/one/tutorial/how-to-read-a-traceroute/).

### Additional tools installed by default for Mac and Linux

The following tools are installed on all Mac and Linux operating systems and servers by default.

#### Telnet

Telnet is a Transmission Control Protocol (TCP)/IP protocol that is used for accessing hardware on a network remotely.

Use the `telnet` command to test if a networking port is open. Follow the `telnet` command with the server's IP address and the port number that you want to test.

    telnet 104.130.5.20 22

**Common flags**

The following flags are commonly used with the `telnet` command:

- `-4` forces telnet to use IPv4 addresses only.

- `-6` forces telnet to use IPv6 addresses only.

**Successful telnet response**

If telnet connects to the server's IP address through an open port (as shown in the following example), no networking issues exist.

    $ telnet 104.130.5.20 22
    Trying 104.130.5.20...
    Connected to 104.130.5.20.
    Escape character is '^]'.
    SSH-2.0-OpenSSH_5.3

**Note:** Use **CTRL ]** and then enter `exit` to leave the telnet connected state.

**Unsuccessful Telnet response**

If the port that you tried to use is not open (as shown in the following example), either the connection is refused or the command becomes stuck in a `trying` state.

    telnet 104.130.5.20 443
    Trying 104.130.5.20...
    telnet: connect to address 104.130.5.20: Connection refused

**Note:** Use **CTRL c** to get out of a `trying` state.

#### Netcat

Netcat (nc) is a networking tool for interfacing with network connections by using TCP or User Datagram Protocol (UDP). Test if a host's connection succeeds or fails by using the `nc` command, followed by the URL and the port for which you want to test connectivity.

    $ nc -vz google.com 80

**Common flags**

The following flags are commonly used with `nc` command:

- `-v` or `--verbose` sets the amount of information you want to see in each response.

- `-4` is used by IPv4 only.

- `-6` is used by IPv6 only.

- `-z` sets netcat to scan for connected servers without sending any actual data to the servers.


**Successful netcat response**

If netcat connects to the website through the port indicated in the command (as shown in the following example), no network connectivity issues exist.

    $ nc -vz google.com 80
    found 0 associations
    found 1 connections:
        1:    flags=82<CONNECTED,PREFERRED>
        outif utun0
        src 10.15.171.172 port 53429
        dst 216.58.194.110 port 80
        rank info not available
        TCP aux info available

    Connection to google.com port 80 [tcp/http] succeeded!

**Unsuccessful netcat response**

If netcat fails to connect to the website through the port indicated in the command (as shown in the following example), try using the tools described in the next section, "Other networking tools."

    $ nc -vz google.com 8080
    nc: connectx to google.com port 8080 (tcp) failed: Operation timed out
    nc: connectx to google.com port 8080 (tcp) failed: No route to host


### Other networking tools

You can install the following tools on your local system or a Rackspace cloud server.

#### My traceroute

My traceroute (MTR) combines the functions of the traceroute and ping programs. MTR tracks routers on the route path by limiting the number of hops individual packets can traverse. It tracks the response times of hops along the route path.

**Installation**

MTR is installed by default on Linux, and you can install it on Mac and Windows by using the following instructions:

- Mac: Enter the following command: `brew install mtr`

- Windows: Download from http://winmtr.net/download-winmtr/.

**Common flags**

The following are flags commonly used with the `mtr` command:

- `-4` is used with IPv4 only.

- `-6` is used with IPv6 only.  (IPv4 can be used for DNS lookups.)

- `-w` puts MTR into wide report mode. In this mode, MRT will include hostnames on the route path in the report.

- `-c` sets the number of pings sent to determine both the machines on the  network and the reliability of those machines.  Each cycle lasts one second.

- `-b` tells MTR to display both the host names and the numeric IP addresses. In split mode, an extra field is added to the output. In report mode, the IP addresses are usually truncated. To see the IP addresses in report mode, use the wide report (`-w`) mode.

- `web4c` sets the number of packets that MTR counts along the route path.


**MTR example**

The `mtr` command requires flags to get the desired response with IP addresses and formatting. Most MTR commands begin with the flag `-web4c`, followed the number of packets that you want MTR to count. You then provide the IP address or URL to which you want send the packets.

A successful response shows a packet loss of 0% and a response time below 10 ms, as shown in the columns `Last`, `Avg`, `Best`, and `Wrst` in the following example:

    $ mtr -web4c 10 google.com
    Start: Fri Apr  8 15:53:25 2016
    HOST: test-cent7--070604apr08                              Loss%   Snt   Last   Avg  Best  Wrst StDev
      1.|-- 162.242.237.3                                       0.0%    10    0.5   0.5   0.4   0.6   0.0
      2.|-- aggr403b-9-core7.iad3.rackspace.net (72.4.122.250)  0.0%    10    1.9   1.3   1.2   1.9   0.0
      3.|-- core7-corea.iad3.rackspace.net (69.20.2.96)         0.0%    10    1.1   1.2   0.9   2.6   0.5
      4.|-- dcpe2-corea.iad3.rackspace.net (69.20.2.168)        0.0%    10    0.9   1.3   0.9   1.7   0.0
      5.|-- be2-mspe4.iad30.rackspace.net (10.25.2.99)          0.0%    10    1.0   1.2   1.0   1.4   0.0
      6.|-- 72.14.203.106                                       0.0%    10    0.7   0.7   0.7   0.8   0.0
      7.|-- 209.85.252.80                                       0.0%    10    1.1   1.0   1.0   1.1   0.0
      8.|-- 72.14.233.97                                        0.0%    10    1.3   1.7   1.2   5.4   1.2
      9.|-- iad23s26-in-f14.1e100.net (172.217.1.206)           0.0%    10    0.9   0.9   0.9   1.0   0.0

#### Network Mapper

Network Mapper (Nmap) is a security scanner that discovers hosts and services on a computer network, thus creating a "map" of the network. To accomplish its goal, Nmap sends specially crafted packets to the target host and then analyzes the responses.

**Installation**

Use the following commands or URLs to install Nmap on each operating system:

- Linux: Enter the following command: `yum install nmap`

- Mac: Enter the following command: `brew install nmap`

- Windows: Download from https://nmap.org/download.html.

**Common flags**

Nmap is most useful when used in conjunction with the following common flags:

- `-Pn` (No ping) skips the Nmap discovery stage. Normally, Nmap uses the discovery stage to determine active machines for heavier scanning.

- `-sV` enables version detection. Alternatively, you can use `-A`, which enables version detection, OS detection, script scanning, and traceroute.

 - `-v` increases the verbosity level, causing Nmap to print more information about the scan in progress. Open ports are shown as they are found, and completion time estimates are provided when Nmap determines that a scan will take more than a few minutes.

 **Nmap example**

 The `nmap` command is best used to test whether a port is behind a firewall, and if that firewall is preventing the port from listening to the Nmap service, as shown in the following example:

      $ nmap -Pn $IP

      Starting Nmap 6.40 ( http://nmap.org ) at 2016-04-08 15:34 UTC
      Nmap scan report for 23.253.48.249
      Host is up (0.022s latency).
      Not shown: 998 filtered ports
      PORT STATE SERVICE
      80/tcp open http
      443/tcp open https

      Nmap done: 1 IP address (1 host up) scanned in 6.38 seconds

### Next steps

For help troubleshooting an offline website, see [Troubleshooting an offline website](https://support.rackspace.com/how-to/troubleshooting-an-offline-website/).

If you have received any of the preceding *unsuccessful* responses, contact [Rackspace Support](https://www.rackspace.com/en-us/support) with the steps that you have taken to troubleshoot your network.

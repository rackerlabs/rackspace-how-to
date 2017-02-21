---
permalink: application-and-load-testing-guidelines/
audit_date:
title: Application load testing
type: article
created_date: '2012-10-29'
created_by: Lee Kimber
last_modified_date: '2016-05-31'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Part of offering a professional experience to your customers is knowing how your applications perform and getting performance benchmarks for your Rackspace-hosted assets. This article provides some helpful application, load, and performance-benchmarking tests to help you get useful data. It also explains your obligations when performing the tests and provides technical guidance for performing the tests.

**Note:** When you perform any testing on or against Rackspace cloud servers, you are operating under the terms of our [Global Acceptable Use Policy (AUP)](http://www.rackspace.com/information/legal/global/aup).

### Policing and enforcement

Rackspace monitors all of our cloud host servers for activities that reduce the performance of customers' virtual servers. If we find that a customer's virtual server is being used in a way that affects other customers' virtual servers, we reserve the right to hard reboot, suspend, or switch off the impacting server. We further reserve the right to suspend or terminate the impacting customer's Rackspace Cloud account.

When you perform the recommended application tests, load tests, and performance-benchmarking tests in this article, observe the following guidelines before and during each test, and stop the test immediately if the indicated thresholds are breached.

### Load testing

You should continually monitor the effect of your test as you apply load. Before running load tests, ensure that you know how to view actual RAM, disk IO, and network usage in real-time. These metrics show whether a test risks interfering with other customers' servers on the same host. See the following sections for specific thresholds. Alternatively, there are several load-testing services that are managed with external servers, located globally. <a href="https://www.loadview-testing.com">Load testing with LoadView,</a> for example, will allow me to use their external servers and can also offer additional testing of api load or application load testing. If you are looking for an all-in-one solution and want to bundle together your page speed testing, DNS testing, etc., then I suggest a company such as theirs.

### Linux virtual servers

Install and use the `screen` package for your Linux distribution to run and view the following commands at the same time. To compile the screen from source, go to the [GNU homepage]( http://www.gnu.org/software/screen/).

#### RAM

Use the following command to view RAM usage as you perform tests:

     watch free -m

Don't let the value in the Free column in the +/- buffers/cache line go lower than 1,000.

#### Disk IO

Use the following command to view disk IO usage as you perform tests:

     top

Watch the `%wa` number in the second line. It might occasionally rise above 1.0, but it should not be above 1.0 for more than a couple of seconds.

#### Network use

Use the following command to view network usage as you perform tests:

     sudo watch -n 10 -d /sbin/ip addr show eth0

Watch the `RX bytes` number. Every 10 seconds, the `-d` argument highlights any changes in this number. The 10-second pause gives you time to note the RX bytes number before it changes. You can reduce the amount of math required to calculate exact changes if you remember that at least eight digits must change&mdash;per `watch -d` highlighting&mdash;between each 10-second update before you need to apply any arithmetic. For virtual machines with 2 GB RAM or more, at least nine digits must change before you need to calculate the exact change. The following table shows the maximum change in RX bytes per second by server size before exact change should be calculated:

<table>
	<tr>
		<th>Cloud server size</th>
		<th>Maximum change in RX bytes per second</th>
	</tr>
	<tr>
		<td>512 MB</td>
		<td>66,000,000</td>
	</tr>
	<tr>
		<td>1 GB</td>
		<td>99,000,000</td>
	</tr>
	<tr>
		<td>2 GB</td>
		<td>198,000,000</td>
	</tr>
		<td>4 GB</td>
		<td>330,000,000</td>
	</tr>
	<tr>
		<td>8 GB</td>
		<td>495,000,000</td>
	</tr>
	<tr>
		<td>15 GB</td>
		<td>660,000,000</td>
	</tr>
	<tr>
		<td>30 GB</td>
		<td>990,000,000</td>
	</tr>
</table>

### Windows virtual servers

To view and log the performance of a Windows server as you perform load tests, you need to use the Performance Monitor.

Run the following command to start the monitor:

     perfmon.exe

This section describes some counters that you can use to ensure that you do not exceed the thresholds and affect other customers on the server. You have to change the scale of the graphs and also the counters in Performance Monitor, especially regarding memory use. If you find these graphs hard to read and track, we recommend that you use the `resmon.exe` utility to track them.

#### Processor use

Counter: **Processor Information > % Processor Time > _Total**

Purpose: Monitors CPU load as a percentage

Threshold: Don't let this counter exceed 90 percent.

#### Memory use

Watch the following memory-related counters during load testing:

- Counter: **Process > Working Set > _Total** (or per specific process)

  Purpose: Shows the current allocated or used RAM by the machine or specific application or process

  Threshold: Don't let this counter exceed 90 percent of the VM's total physical RAM.

- Counter: **Paging File > % Usage > Total**

  Purpose: Review this value in conjunction with Available MBytes to understand paging activity on your system.

  Threshold: Don't let this counter rise above 50 percent of the total paging size.

- Counter: **Memory > Available MBytes**

  Purpose: Free RAM available to be used by new processes, in megabytes

  Threshold: Don't let this counter fall below 10 percent of total physical RAM.

**Note:** If you are unsure of the amount of RAM installed, run the `msinfo32` command from the **Run** box.

#### Disk use

Watch the following disk use counters during load testing:

- Counter: **PhysicalDisk > Disk Time > _Total**

  Purpose: Amount of time that the disk is active

  Threshold: 90 percent

- Counter: **PhysicalDisk > Avg. Disk Queue Length > _Total**

  Purpose: Validates the communication medium

  Threshold: Don't let this counter rise above 4.

#### Network use

Counter: **Network Interface > Bytes Total/sec > Network Interface**

Purpose: Measures the number of bytes sent or received

Threshold: Don't let link speed rise above the **Maximum PerfMon Link Speed (%)** value for your VM's size, as shown in the following table:

<table>
	<tr>
		<th>Cloud server size</th>
		<th>Maximum PerfMon Link Speed (%)</th>
	</tr>
	<tr>
		<td>512 MB</td>
		<td>1.00%</td>
	</tr>
	<tr>
		<td>1 GB</td>
		<td>1.50%</td>
	</tr>
		<td>2 GB</td>
		<td>3.00%</td>
	<tr>
		<td>4 GB</td>
		<td>5.00%</td>
	</tr>
	<tr>
		<td>8 GB</td>
		<td>7.50%</td>
	</tr>
	<tr>
		<td>15 GB</td>
	    <td>10.00%</td>
	</tr>
	<tr>
		<td>30 GB</td>
		<td>15.00%</td>
	</tr>
</table>

### Network latency testing

Remote testing can cause network latency. To test the network latency to our various data centers, ping them and then review the response times or the ping returns. Each Rackspace data center has its own sandbox server that you can use for ping and other network tests. Because most of our Cloud infrastructure is hosted in the same data centers, this test also works for cloud servers.

Ping is publicly accessible for the following servers:

- sandbox.dfw1.rackspace.net
- sandbox.iad3.rackspace.net
- sandbox.lon3.rackspace.net
- sandbox.hkg1.rackspace.net
- sandbox.ord1.rackspace.net
- sandbox.syd2.rackspace.net

**Note:** To remove DNS lookup effects, you might want to determine each test server's IP address and ping the IP address directly.

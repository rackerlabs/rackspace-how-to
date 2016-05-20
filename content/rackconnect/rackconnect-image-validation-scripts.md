---
permalink: rackconnect-image-validation-scripts/
audit_date:
title: RackConnect image validation scripts
type: article
created_date: '2013-02-01'
created_by: Russell Lambert
last_modified_date: '2016-01-15'
last_modified_by: Kelly Holcomb
product: RackConnect
product_url: rackconnect
---

You've built your base server and are about to take an image of it. You
can determine whether the RackConnect portion of the build process will
succeed before you spend the time necessary to create the image by using
the RackConnect image validation scripts.

The RackConnect image validation scripts are a pair of scripts&mdash;one for
Windows servers, one for Linux servers&mdash;that look for signs of the most
common issues that cause RackConnect automation to fail. They are
designed to run on a cloud server that will be used as a template for
creating other servers. They won't necessarily find all possible issues
with an image&mdash;you might still need Rackspace Support to investigate&mdash;but they will find the issues we've identified as the most common causes of RackConnect build failures.

### When to use the scripts

The best time to run the scripts is after you have finished building
your base server, at the last possible moment before you take a snapshot
image of it. Although you *can* use them as a diagnostic tool after a
failure (assuming the failed server has network access or the
appropriate script is preinstalled), the primary purpose of the scripts
is to detect possible issues with a server *before* it is used to build
a template image.

### Where to find the scripts

The latest versions of the RackConnect image validation scripts are
available at the following URLs:

-   Linux: <http://scripts.rackconnect.rackspace.com/preflight.sh>
-   Windows: <http://scripts.rackconnect.rackspace.com/preflight.hta>

### Use the script on Linux

1.  Download the Linux validation script onto the target server.

        wget http://scripts.rackconnect.rackspace.com/preflight.sh

2.  Run the script. The script requires superuser privileges to run, so
    use sudo or run as root:

        sudo bash preflight.sh

    The output varies slightly from server to server, depending on
    the OS and configuration. For example, if no DenyUsers SSH
    configuration directive is found, a single PASS line is printed
    and no further DenyUser tests are done.

    If any of the tests result in failure, a brief synopsis of the
    problem is provided:

        # sudo bash preflight.sh
        02/01/13 01:23:45 PM UTC: BEGIN [LINUX] Rackspace RackConnect Image Validation Script Version 2.1.112

        ### OS Detection ###
          Detected OS type: Ubuntu

        ### Root Permissions ###
          [PASS] User is root: OK

        ...snip...

        ### SSH Daemon Config ###
          [PASS] SSH listening on all IPv4 IPs: OK
          [PASS] SSH listening on port 22: OK
          [PASS] Protocol set to version 2: OK
          [FAIL] Password or ChallengeResponse Authentication enabled: FAIL (One of these must be enabled)
          [PASS] PermitRootLogin enabled: OK
          [PASS] No DenyUsers configuration directive found.
          [PASS] No AllowUsers configuration directive found.
          [PASS] No DenyGroups configuration directive found.
          [PASS] No AllowGroups configuration directive found.
          [WARNING] WARNING: sshd_config file is newer than sshd process.  We recommend restarting sshd to ensure running config matches disk file.

        ### Public HTTPS Connectivity ###
          [PASS] Fetch test URL: OK
        02/01/13 01:23:47 PM UTC: END [LINUX] Rackspace RackConnect Image Validation Script Version 2.1.112

3.  After you have identified any issues and corrected them, re-run the
    script. After all tests pass, you can safely create an image of the
    server. If you make changes to the server and need to re-image,
    re-run the validation script. Because the script makes no changes to
    the file system, it is safe to run as many times as you need.

#### For advanced Linux users

To ease scripting, all warnings and failures are printed to `stderr` instead of `stdout`. As a result, you can ignore the output of successful tests and just see those items that need attention by redirecting `stdout` to `/dev/null`. Note however that section headers are still printed to `stdout`, so you might still want the full script output if the context of a test is not immediately obvious.

    # sudo bash preflight.sh 1>/dev/null
      [FAIL] Password or ChallengeResponse Authentication enabled: FAIL (One of these must be enabled)
      [WARNING] WARNING: sshd_config file is newer than sshd process.  We recommend restarting sshd to ensure running config matches disk file.

Additionally, if any tests fail, the script exits with a non-zero exit status. This makes it easy to call the validation script from another script and react to the results appropriately. Note that only failures cause a non-zero exit; if a warning is issued without any test failures, the script still exits with a zero (successful) exit status.

    # sudo bash preflight.sh 1>/dev/null 2>/dev/null && echo "Success" || echo "A test failed."
    A test failed.

If there are no issues, script still exits with a zero (successful) exit status.

    # sudo bash preflight.sh 1>/dev/null 2>/dev/null && echo "Success" || echo "A test failed."
    Success

### Use the script on Windows

1.  Download the Windows validation script onto the target server from
    the link provided at the beginning of this article. You do not have
    to do this as a user with Administrator rights, but you will need to run the script as a user with
    Administrator rights.

    If you are using Internet Explorer to download the script and
    Enhanced Security is configured (the default for all Windows Server
    base images), you might be prompted that
    **scripts.rackconnect.rackspace.com** is not part of your Trusted
    Sites. If so, add the domain to your Trusted Sites and retry step 1.

2.  Save the script to disk.

3.  Browse to where you saved the file (for Internet Explorer, this is
    probably your user's **Downloads** folder) and run the
    downloaded script.

4.  In the preflight window that appears, click **Run Preflight**.
    You might see a command prompt window briefly appear and
    then disappear. This is normal behavior.

    When the script has finished gathering data, it displays a results
    report:

    <img src="{% asset_path rackconnect/rackconnect-image-validation-scripts/winpreflight-fail.png %}" alt=" True" width="354" height="233" />

5.  If there are any issues, click the + icon to expand the item and
    display more detail:

    <img src="{% asset_path rackconnect/rackconnect-image-validation-scripts/winpreflight-fail-expanded.png %}" alt="Preflight results report, Firewall error expanded" width="354" height="255" />

6.  After you resolve any issues, repeat steps 3 and 4 until
    the script reports that all tests have passed with the message **RackConnect ready**.

### Disable Windows Firewall

To run the script successfully on Windows, you might need to disable Windows Firewall. There are three Windows Firewall profiles (Domain, Private, and Public), but the Windows Firewall configuration utility available via the Control Panel can disable only two of these (Public and Private). You can disable all of the profiles by performing the following steps:

1.  Open the Windows Firewall with Advanced Security utility under **Start &gt; Administrative Tools &gt; Windows Firewall with Advanced Security**.

    The overview page that is displayed shows the profiles for which Windows Firewall is still enabled.

2.  Click the **Windows Firewall Properties** link.

    <img src="{% asset_path rackconnect/rackconnect-image-validation-scripts/winfirewall-overview.png %}" alt="Windows Firewall overview page; Clicking Windows Firewall Properties" width="550" />

3.  From the Windows Firewall Properties page, disable Windows Firewall for all three profiles. On the **Domain Profile** tab, choose **Off** for the **Firewall state** setting. Do the same for the Public and Private profiles if Windows Firewall is still enabled for either profile.

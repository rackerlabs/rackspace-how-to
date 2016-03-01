---
node_id: 3286
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
with an image&mdash;you might still need Rackspace Support to investigate&mdash;but they will find the issues we've identified as the most common causes
of RackConnect build failures.

### When to use the scripts

The best time to run the scripts is after you have finished building
your base server, at the last possible moment before you take a snapshot
image of it. Although you *can* use them as a diagnostic tool after a
failure (assuming the failed server has network access or the
appropriate script is pre-installed), the primary purpose of the scripts
is to detect possible issues with a server *before* it is used to build
a template image.

### Where to find the scripts

The latest versions of the RackConnect image validation scripts are
available at the following URLs:

-   Linux: <http://scripts.rackconnect.rackspace.com/preflight.sh>
-   Windows: <http://scripts.rackconnect.rackspace.com/preflight.hta>

### How to use the script on Linux

1.  Download the Linux validation script onto the target server.

        wget http://scripts.rackconnect.rackspace.com/preflight.sh

2.  Run the script. The script requires superuser privileges to run, so
    use sudo or run as root:

        sudo bash preflight.sh

    The output varies slightly from server to server, depending on
    the OS and configuration. For example, if no DenyUsers SSH
    configuration directive is found, a single PASS line is printed
    and no further DenyUser tests is done.

    If any of the tests result in failure, a brief synopsis of the
    problem will be given:

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

4.  **For advanced Linux users:** To ease scripting, all warnings and
    failures are printed to `stderr` instead of `stdout`. This makes it easy
    to ignore the output of successful tests and just see those items
    that need attention by redirecting `stdout` to `/dev/null`. Note however
    that section headers are still printed to `stdout`, so you might still
    want the full script output if the context of a test is not
    immediately obvious:

        # sudo bash preflight.sh 1>/dev/null
          [FAIL] Password or ChallengeResponse Authentication enabled: FAIL (One of these must be enabled)
          [WARNING] WARNING: sshd_config file is newer than sshd process.  We recommend restarting sshd to ensure running config matches disk file.

    Additionally, the script will exit with a non-zero exit status if
    any tests fail. This makes it easy to call the validation script
    from another script and react to the results appropriately. Note
    that only failures will cause a non-zero exit; if a warning is
    issued without any test failures the script will still exit with a
    zero (successful) exit status.

        # sudo bash preflight.sh 1>/dev/null 2>/dev/null && echo "Success" || echo "A test failed."
        A test failed.

    Or, if there are no issues:

        # sudo bash preflight.sh 1>/dev/null 2>/dev/null && echo "Success" || echo "A test failed."
        Success

### How to use the script on Windows

1.  Download the Windows validation script onto the target server from
    the link provided at the beginning of this article. You do not have
    to do this as a user with Administrator rights, but it may be easier
    because you will need to run the script as a user with
    Administrator rights.

2.  If you are using Internet Explorer to download the script and
    Enhanced Security is configured (the default for all Windows Server
    base images), you might be prompted that
    **scripts.rackconnect.rackspace.com** is not part of your Trusted
    Sites. If so, add the domain to your Trusted Sites and retry step 1.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/winpreflight-download2-1.png" alt="URL not in Trusted Sites dialog box; Clicking Add" width="550" />

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/winpreflight-download2-2.png" alt="Add URL to Trusted Sites dialog box; Clicking Add" width="550" />

3.  Save the script to disk.

4.  Browse to where you saved the file (for Internet Explorer, this is
    probably your user's **Downloads** folder) and run the
    downloaded script.

5.  When you are ready to run the pre-flight, click **Run Preflight**.
    You might see a command prompt window briefly appear and
    then disappear. This is normal behavior.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/winpreflight-start.png" alt="Preflight script start screen; Clicking Run Preflight" width="354" height="179" />

    When the script has finished gathering data, it displays a results
    report:

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/winpreflight-fail.png" alt=" True" width="354" height="233" />

6.  If there are any issues, click the + icon to expand the item and
    display more detail:

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/winpreflight-fail-expanded.png" alt="Preflight results report, Firewall error expanded" width="354" height="255" />

7.  After all of the issues have been resolved, repeat steps 4-5 until
    the script reports that all tests have passed:

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/winpreflight-success.png" alt="Preflight results report, all tests successful" width="354" height="233" />

### Disable Windows Firewall

There are three Windows Firewall profiles (Domain, Private, and Public),
but the Windows Firewall configuration utility available via the Control
Panel can disable only two of these (Public and Private). You can
disable the third by performing the following steps:

1.  Open the Windows Firewall with Advanced Security utility under **Start &gt; Administrative Tools &gt; Windows Firewall with Advanced Security**.

    The overview page that is displayed shows the profiles for which Windows Firewall is still enabled.

2.  Click the **Windows Firewall Properties** link.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/winfirewall-overview.png" alt="Windows Firewall overview page; Clicking Windows Firewall Properties" width="550" />

3.  From the Windows Firewall Properties page, you can disable Windows Firewall for all three profiles. On the **Domain Profile** tab, choose **Off** for the **Firewall state** setting. Do the same for the Public and Private profiles if Windows Firewall is still enabled for either profile.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/winfirewall-domainoff.png" alt="Windows Firewall properties; Domain Profile tab; Clicking Firewall state Off" width="408" height="452" />

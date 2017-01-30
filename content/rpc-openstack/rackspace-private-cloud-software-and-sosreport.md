---
permalink: rackspace-private-cloud-software-and-sosreport/
audit_date:
title: Rackspace Private Cloud Software and sosreport
type: article
created_date: '2012-11-09'
created_by: Karin Levenstein
last_modified_date: '2016-06-24'
last_modified_by: Kyle Laffoon
product: Rackspace Private Cloud Powered by OpenStack
product_url: rpc-openstack
---

This document is intended for Rackspace Private Cloud customers who want
use `sosreport` tool to help troubleshoot their Rackspace Private Cloud
environment. It is assumed that you have successfully installed a cloud
with Rackspace Private Cloud Software and are familiar with OpenStack.

### The SOS Tool

Rackspace Private Cloud Software installs the [`sosreport` tool for
Ubuntu](https://github.com/sosreport/sosreport), which can be used to
collect, analyze, and report information that will help you or Rackspace
Support troubleshoot issues in your Rackspace Private Cloud environment.
The `sosreport` package is installed from the [OS Ops team
PPA](https://launchpad.net/~osops-packaging/+archive/ppa).

### sosreport Command List

The complete list of `sosreport` options is displayed with
`sosreport --help`.

``` {.screen}
$ sosreport --help
Usage: sosreport [options]

Options:
  -h, --help            show this help message and exit
  -l, --list-plugins    list plugins and available plugin options
  -n NOPLUGINS, --skip-plugins=NOPLUGINS
                        skip these plugins
  -e ENABLEPLUGINS, --enable-plugins=ENABLEPLUGINS
                        enable these plugins
  -o ONLYPLUGINS, --only-plugins=ONLYPLUGINS
                        enable these plugins only
  -k PLUGOPTS           plugin options in plugname.option=value format (see
                        -l)
  -a, --alloptions      enable all options for loaded plugins
  -u UPLOAD, --upload=UPLOAD
                        upload the report to an ftp server
  --batch               do not ask any question (batch mode)
  --no-colors           do not use terminal colors for text
  -v, --verbose         increase verbosity
  --silent              Only display FATAL errors on stdout
  --debug               enabling debugging through python debugger
  --ticket-number=TICKETNUMBER
                        set ticket number
  --name=CUSTOMERNAME   define customer name
  --config-file=CONFIG_FILE
                        specify alternate configuration file
  --tmp-dir=TMP_DIR     specify alternate temporary directory
  --diagnose            enable diagnostics
  --analyze             enable analyzations
  --report              Enable html/xml reporting
  --profile             turn on profiling
  -z COMPRESSION_TYPE, --compression-type=COMPRESSION_TYPE
                        compression technology to use [auto, zip, gzip, bzip2,
                        xz] (default=auto)
```

### Using sosreport

Before you begin to use `sosreport`, log into the node with the OS
username and password that you created during the installation process.
Once you are successfully logged in, use <span class="command">**sudo
-i**</span> to switch to root access.

#### Generating a report

To generate a basic report with default settings, run the command on the
command line:

    {.screen}
    $ sosreport

You will be prompted to confirm that you want to generate the report.
Press **Enter** to continue.

At the prompt, enter your first initial and last name. If you have been
assigned a case number by your Rackspace support representative, enter
it at the prompt.

    {.screen}
    Please enter your first initial and last name [ctrl]: jdoe
    Please enter the case number that you are generating this report for: 1234

When the report is complete, the utility will display a message showing
you where the report `tar.xz`{.filename} file has been saved and the
checksum for the report.

``` {.screen}
Your sosreport has been generated and saved in:
  /tmp/sosreport-jdoe.1234-20120907125725.tar.xz

The checksum is: acfcceaa72242483edece9e3b97687f1
```

You can now send the `.tar.xz`{.filename} file to Rackspace Support.

If required, you can run `sosreport` with additional reporting options.
For example, the **--diagnose** option
includes diagnostic options, and the **--report** option generates an html-formatted
list of the files copied in the report. Include additional options if
requested by Rackspace Support.

#### sosreport plugins

Depending on your issue and the instructions of Rackspace Support, you
may need to disable or enable certain plugins when the report is
generated. To view a full list of the plugins, use **sosreport -l**. The output will be similar to
the following example.

``` {.screen}
root@ctrl:~# sosreport -l

sosreport (version 2.3)
```

The following plugins are currently enabled:

--- | --- |
apache | Apache related information for Debian distributions
apparmor | Apparmor related information
apport | apport information
bootloader | Bootloader information
crontab | Crontab information
dpkg | dpkg information
filesys | information on filesystems
gdm | gdm related information
general | Basic system information for Debian based distributions
hardware | hardware related information for Debian distribution
i18n | i18n related information
kernel | kernel related information
kvm | KVM related information
libraries | information on shared libraries
libvirt | libvirt-related information
memory | memory usage information
openssl | openssl related information for Debian distributions
printing | printing related information (cups)
ssh | ssh-related information
x11 | X related information

The following plugins are currently disabled:

--- | --- | ---
as7 | inactive | JBoss related information
autofs | inactive | autofs server-related on Debian based distributions
dhcp | inactive | DHCP related information for Debian based distributions
initrd  | not default | initrd related information
ipsec | inactive | ipsec related information for Debian distributions
iscsi | inactive | iscsi-initiator related information Debian based distributions
kdump | inactive | Kdump related information for Debian distributions
nscd | inactive | NSCD related information
openstack | inactive | OpenStack related information for Debian based distributions
radius | inactive | radius related information on Debian distributions
sar | inactive | Generate the sar file from /var/log/sa/saXX files
sssd | inactive | sssd-related Diagnostic Information on Debian based distributions
xinetdv | inactive | xinetd information

The following plugin options are available:

--- | --- | ---
apache.log | off | gathers all apache logs
filesys.dumpe2fs | off | dump filesystem information
general.syslogsize | 15 | max size (MiB) to collect per syslog file
general.all_logs | off | collect all log files defined in syslog.conf
kernel.modinfo | on | gathers information on all kernel modules
kvm.topOutput | off | 5x iterations of top data
libraries.ldconfigv | off | the name of each directory as it is scanned, and any links that are created.
printing.cups | 50 | max size (MiB) to collect per cups log file


Here are some examples of using sosreport plugins to customize the
report.

-   To enable only the OpenStack plugin:

    {.screen}
    $ sosreport -o openstack

-   To disable apache and xll plugins:

    {.screen}
    $ sosreport -n apache,xll

-   To collect all log files defined in syslog.conf:

    {.screen}
    $ sosreport -k general.all_logs=on

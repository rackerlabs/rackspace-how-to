---
permalink: rackspace-private-cloud-software-and-sosreport/
audit_date: '2018-09-12'
title: Rackspace Private Cloud Software and sosreport
type: article
created_date: '2012-11-09'
created_by: Karin Levenstein
last_modified_date: '2018-09-12'
last_modified_by: Kate Dougherty
product: Rackspace Private Cloud Powered by OpenStack
product_url: rpc-openstack
---

This document is intended for Rackspace Private Cloud customers who want
to use the sosreport tool to help troubleshoot their Rackspace Private
Cloud environment. It is assumed that you have successfully installed a cloud
with Rackspace Private Cloud Software and are familiar with OpenStack
(OS).

### The SOS tool

Rackspace Private Cloud Software installs the [sosreport tool for
Ubuntu&reg;](https://github.com/sosreport/sosreport), which you can use to
collect, analyze, and report information that helps you or Rackspace
Support troubleshoot issues in your Rackspace Private Cloud environment.
The `sosreport` package is installed from the [OS Ops team
personal package archive
(PPA)](https://launchpad.net/~osops-packaging/+archive/ppa).

### Generate a list of sosreport commands

You can display the complete list of sosreport options by using the command
`sosreport --help`, as shown in the following example:

    {.screen}
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

### Use sosreport

Before you begin to use sosreport, log in to the node with the OS
username and password that you created during the installation process.
After you are successfully logged in, switch to root access by using the
`sudo -i` command.

#### Generate a report

To generate a basic report with the default settings, enter the following
command on the command line:

    {.screen}
    $ sosreport

You are prompted to confirm that you want to generate the report.
Press **Enter** to continue.

At the prompt, enter your first initial and last name. If you have been
assigned a case number by your Rackspace support representative, enter
it at the prompt, as shown in the following example:

    {.screen}
    Please enter your first initial and last name [ctrl]: jdoe
    Please enter the case number that you are generating this report for: 1234

When the report is complete, the utility displays a message showing
you where the report `tar.xz {.filename}` file is saved and the
checksum for the report, as shown in the following example:

```
{.screen}
Your sosreport has been generated and saved in:
  /tmp/sosreport-jdoe.1234-20120907125725.tar.xz

The checksum is: acfcceaa72242483edece9e3b97687f1
```

You can now send the `.tar.xz {.filename}` file to Rackspace Support.

If required, you can run sosreport with additional reporting options.
For example, the `--diagnose` flag includes diagnostic options, and the
`--report` flag generates an HTML-formatted list of the files that were copied
in the report. Include additional options if requested by Rackspace Support.

#### sosreport plugins

Depending on the issue you're experiencing and the instructions that Rackspace
Support provides, you might need to disable or enable certain plugins when you
generate the report. To view a full list of available plugins, use the command
`sosreport -l`.

The output is similar to the following example:

```
{.screen}
root@ctrl:~# sosreport -l

sosreport (version 2.3)
```

The following plugins are currently enabled:

--- | --- |
apache | Apache-related information for Debian&trade; distributions
apparmor | AppArmor-related information
apport | Apport information
bootloader | Bootloader information
crontab | crontab information
dpkg | dpkg information
filesys | Information about file systems
gdm | gdm-related information
general | Basic system information for Debian-based distributions
hardware | Hardware-related information for Debian distributions
i18n | i18n-related information
kernel | kernel-related information
kvm | KVM-related information
libraries | Information about shared libraries
libvirt | libvirt-related information
memory | Memory usage information
openssl | OpenSSL-related information for Debian distributions
printing | Printing-related information (cups)
ssh | SSH-related information
x11 | X-related information

The following plugins are currently disabled:

--- | --- | ---
as7 | inactive | JBoss-related information
autofs | inactive | autofs server-related about Debian-based distributions
dhcp | inactive | DHCP-related information for Debian-based distributions
initrd  | not default | INIRTD-related information
ipsec | inactive | IPSec-related information for Debian distributions
iscsi | inactive | iSCSI Initiator-related information for Debian-based distributions
kdump | inactive | kdump-related information for Debian distributions
ncsd | inactive | NSCD-related information
openstack | inactive | OpenStack-related information for Debian distributions
radius | inactive | Radius-related information about Debian distributions
sar | inactive | Generates the SAR file from the files at `/var/log/sa/saXX`
sssd | inactive | SSSD-related diagnostic information about Debian-based distributions
xinetdv | inactive | xinetd information

The following plugin options are available:

--- | --- | ---
apache.log | off | Gathers all Apache logs
filesys.dumpe2fs | off | Provides dump file system information
general.syslogsize | 15 | The max size (MiB) to collect per `syslog` file
general.all_logs | off | Collects all log files defined in `syslog.conf`
kernel.modinfo | on | Gathers information about all kernel modules
kvm.topOutput | off | 5x iterations of top data
libraries.ldconfigv | off | The name of each directory as it's scanned and any links that are created
printing.cups | 50 | The max size (MiB) to collect per cups `log` file

The following section provides examples that show how you can use `sosreport`
plugins to customize the report.

-   To enable only the openstack plugin, use the following command:

        {.screen}
        $ sosreport -o openstack

-   To disable the apache and xll plugins, use the following command:

        {.screen}
        $ sosreport -n apache,xll

-   To collect all of the log files that are defined in the file
    `syslog.conf`, use the following command:

        {.screen}
        $ sosreport -k general.all_logs=on

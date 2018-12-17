---
permalink: oracle-business-intelligence-enterprise-edition-tips/
audit_date: '2017-10-06'
title: Oracle Business Intelligence Enterprise Edition tips
type: article
created_date: '2017-10-03'
created_by: Catherine Richardson
last_modified_date: '2017-10-03'
last_modified_by: Catherine Richardson
product: Managed Operations
product_url: managed-operations
---

Oracle® Business Intelligence Enterprise Edition (OBIEE) offers agile visual
analytics and self-service discovery. This article is for those who know the
basics of OBIEE and want to take their skills to the next level. It includes
answers to frequently asked questions and provides best practices for OBIEE.

This article includes tips to perform the following tasks:

- [Upload the repository in OBIEE 11g and 12c](#upload-the-repository-in-obiee-11g-and-12c)
- [Fix patch application issues](#fix-patch-appliation-issues)
- [Change the WebLogic password](#change-the-weblogic-password)
- [Fix OBIEE report errors](#fix-obiee-report-errors)
- [Increase the row limit](#increase-the-row-limit)
- [Resolve stuck threads](#resolve-stuck-threads)
- [Customize the OBIEE 11g Analytics logo](#customize-the-obiee-11g-analytics-logo)
- [Customize the OBIEE 11g Analytics banner text](#customize-the-obiee-11g-analytics-banner-text)
- [Start and stop servers in OBIEE 11g and 12c](#start-and-stop-servers-in-obiee-11g-and-12c)

You might also be interested in the article [Oracle Business Intelligence 12c release features](https://support.rackspace.com/how-to/oracle-business-intelligence-12c-release-new-features/).

For more information,
[contact us](https://www.tricoresolutions.com/about-us/contact-us/).

### Upload the repository in OBIEE 11g and 12c

The following procedure is for OBIEE administrators to follow to upload a
repository ``.rpd`` file in both OBIEE 11g and 12c versions under Unix or Linux
environments. This step-by-step approach helps OBIEE users and administrators
understand the main difference in the process between version 11g and version
12c.

#### OBIEE 11g procedure

In version 11g, the Enterprise Manager (EM) URL http://localhost:7001/em was
used for uploading the repository ``.rpd`` file. You use the following deployment path in a Business Intelligence Instance to
upload the latest ``.rpd`` file: **Deployment Upload > BI Server Repository > Upload New Files > Restart
BI Services > Upload the latest RPD**.

#### OBIEE 12 procedure

In version 12c, the ``.rpd`` file  is uploaded by using the WebLogic Scripting
command ``uploadrpd``. In Unix or Linux, get the ``data-model-cmd.sh`` script
to execute at the following location:

    <Oracle_Home>/user_projects/domains/bi/bitools/bin

**Note**: The Oracle Home ``<Oracle_Home>`` that you use in OBIEE 12c is
referred to as Middleware Home ``<MW_HOME>`` in OBIEE 11c.

Use the following commands to upload the ``.rpd`` file,
``OBIEE12CBusinessIntelligence.rpd``, in Unix and Linux environments:

    [OSuser@LocalHostDetails bin]$ ./data-model-cmd.sh uploadrpd -I
    /temp/OBIEE12CBusinessIntelligence.rpd -SI ssi -U Username -Password -S
    LocalHostDetails.com -N PortNo9502
    RPD Password: <Enter the RPD password>
    Service Instance: <Enter the RPD password - the ssi>
    Operation successful.
    RPD upload completed successfully.
    [OSuser@LocalHostDetails bin]$

The descriptions for arguments you can use with the script are as follows:

  -   ``I`` specifies the name of the repository that you want to
      upload.

      **Note:** For the preceding command, the uploaded OBIEE12C ``.rpd`` file
      (``OBIEE12CBusinessIntelligence.rpd``) was copied into the ``/temp``
      directory in the Unix environment. You can copy this ``.rpd`` file to a
      convenient location and provide the path details after ``-I`` in the script.

  -   ``W`` is the repository’s password. If you do not supply the
      password, you will be prompted for the password when the
      command is run. For security purposes, Oracle recommends that you
      include a password in the command only if you are using automated
      scripting to run the command.

  -   ``SI`` denotes the name of the service instance.

  -   ``U`` specifies a valid user name to be used for OBIEE
      authentication.

  -   ``P`` specifies the password corresponding to the user’s name that
      you specified for ``U``. If you do not supply the password, you
      will be prompted for the password when the command is run. For
      security purposes, Oracle recommends that you include a password in
      the command only if you are using automated scripting to run the
      command.

  -   ``S`` denotes the OBIEE host name. Include this option only
      when you are running the command from a client installation.

  -   ``N`` specifies the OBIEE port number. Include this
      option only when you are running the command from a client installation.

  -   ``SSL`` specifies to use SSL to connect to the WebLogic Server to
      run the command. Include this option only when you are running the
      command from a client installation.

  -   ``H`` displays usage information and exits the command.      

For additional information, see these references for the 12c procedure:

- [*New and Deprecated*](https://docs.oracle.com/middleware/1212/core/ASCON/whatsnew.htm#ASCON11224)

- [*Terminology for 12c
 (12.1.2)*](https://docs.oracle.com/middleware/1212/core/ASCON/whatsnew.htm#ASCON11224)


### Fix patch application issues

This section discusses several common issues that you might encounter as you
apply patches in OBIEE and provides solutions for you to try.

#### Encountered unrecognized patch

You might encounter this error when you try to apply a patch in Solaris by
using the Smart Update tool (BSU):

    Encountered unrecognized patch ID: XXXX (ID based on patch)

To resolve the issue, change the name of the catalog ``xml`` file from the
patch, such as ``patch-catalog_24474.xml``, to the more generic file name,
``patch-catalog.xml``.

Then, try to apply the patch again using BSU tool.

**Note**: The patch directory needs to have 777 permissions.

#### Exception thread in main

You might encounter this error when you try to apply a patch in Solaris by
using the Smart Update tool (BSU):

    Exception in thread "main" java.lang.OutOfMemoryError: GC overhead limit
    exceeded at java.util.Arrays.copyOf(Arrays.java:2367)
    at
    java.lang.AbstractStringBuilder.expandCapacity(AbstractStringBuilder.java:130)
    at
    java.lang.AbstractStringBuilder.ensureCapacityInternal(AbstractStringBuilder.java:114)
    at java.lang.AbstractStringBuilder.append(AbstractStringBuilder.java:415)
    at java.lang.StringBuilder.append(StringBuilder.java:132)
    at java.lang.Class.getMethod(Class.java:1665)

To resolve this issue, remove the Java path from the ``bsu.sh`` file and apply
the path again.

### Change the WebLogic password

Use the steps in this section to change your WebLogic password.

#### Log in and change your password

To change the WebLogic password, first log in and provide a new password by
using the following steps:

1. Log in to the WebLogic console.

2. In the left-hand navigation pane, click **Security > My Realm**.

3.  Click the **Users and Groups** tab.

4.  Scroll down to **WebLogic user**.

5.  Navigate to the **Password** tab.

6.  Enter the password into the **New Password** and **Confirm Password**
    boxes.

7.  Save the new password.   

#### Remove or rename the boot.properties file

The next step is to rename or remove the ``boot.properties`` file in several
locations:

1.  Navigate to the following location:

    OBIEE11g\product\fmw\user_projects\domains\bifoundation_domain\servers\ **AdminServer**\security

2.  Rename the ``boot.properties`` file to any name or remove the file.    

3.  Navigate to the following location:

    OBIEE11g\product\fmw\user_projects\domains\bifoundation_domain\servers\ **bi_server1**\security

4.  Rename the ``boot.properties`` file to any name or remove the file.

#### Stop and restart BI Services

1.  Stop Business Intelligence (BI) Services.

2.  When prompted for the WebLogic username and password, provide the username
    and modified password.

3.  Delete the ``tmp`` files for Admin and BI servers before
    starting the services.

4.  Start BI Services.

### Fix OBIEE report errors

This section discusses several common OBIEE report errors that you might
encounter and provides solutions for you to try.

#### Catalog object schema validation failed

When you try to access reports in OBIEE 12c, you might receive the following
error message:

    Catalog object schema validation failed

Some font values that are available in Oracle Discoverer are not supported in
OBIEE 12c. If a Discoverer report uses the Dialog font, and you are
migrating the report from Discoverer to OBIEE, this error might occur.

The following steps might provide a solution for the error:

1.  Go to the report folder.

2.  Edit the report.

3.  Go to the **Advanced** tab.

4.  Copy the XML code to a text editor for use.

#### Datatype error: Type:InvalidDatatypeValueException ...

When you try to access reports in OBIEE 12c, you might receive the following
error message:

    Datatype error: Type:InvalidDatatypeValueException,
    Message: Value 'Dialog' is not in enumeration

A possible solution is to edit the XML code, remove the parameter
``fontFamily="Dialog"`` from the **Advanced** tab, and rerun the report.

If you want to display report with all of the default font values in
OBIEE, remove the following parameters in the XML code:

    <saw:displayFormat><saw:formatSpec suppress="default"
    interaction="default" backgroundColor="\#FFFFFF" fontColor="\#000000"
    fontStyle="regular" fontSize="11" fontEffects="none" hAlign="left"
    vAlign="top" fontFamily="Dialog"><saw:dataFormat xsi:type="saw:custom"
    customFormat="DD-MMM-YYYY"/></saw:formatSpec></saw:displayFormat>

### Increase the row limit

When downloading reports in Microsoft® Excel® CSV file format,
you might receive the following error message:

    OBIEE Maximum total number of cells exceeded

When you download reports in CSV file format, you cannot exceed more
than 65,000 rows by default. This is a common issue that you can fix by
increasing the row limit in OBIEE 12c.

By adding the parameter ``DefaultRowsDisplayedInDownloadCSV`` in the
``instanceconfig.xml``, you control the number of rows that can be
downloaded in CSV format.

The ``instanceconfig.xml`` file is the parameter file for the Oracle BI
Presentation Services and stores the configuration settings for the service.
For more information, see [this OBIEE Blog article](http://obiee-blog.info/uncategorized/65000-rows-csv-limit-hidden-parameter/).

**Note**: In the earlier versions of OBIEE, such as 1.1.1.6.x or 11.1.1.7.x,
you could download more than 65,000 rows because there were no specific
parameters that limited the number of rows that you could download to CSV
format.

Use the following steps to increase the row limit:

1.  Take a backup copy of the ``instanceconfig.xml`` file.

    Use the following paths to the ``instanceconfig.xml`` file for the different
    versions of OBIEE:

    For OBIEE 12c:

        <obiee_home>/user_projects/domains/bi/config/fmwconfig/biconfig/OBIPS

    For OBIEE 11g:

        <obiee\home>/instances/instance1/config/OracleBIPresentationServicesComponent/coreapplication_obips1

2.  Open ``instanceconfig.xml`` for editing.

3.  Add the parameter ``DefaultRowsDisplayedInDownloadCVS`` under the
    ``<Table>...</Table`` definition.

    Before adding the parameter:

        <Table>
        <MaxCells>65000000</MaxCells>
        <MaxVisiblePages>10000</MaxVisiblePages>
        <MaxVisibleRows>1000000</MaxVisibleRows>
        <MaxVisibleSections>25000</MaxVisibleSections>
        <DefaultRowsDisplayed>75</DefaultRowsDisplayed>
        <!–This Configuration setting is managed by Oracle Enterprise Manager Fusion Middleware Control–>
        <DefaultRowsDisplayedInDelivery>250000</DefaultRowsDisplayedInDelivery>
        <!–This Configuration setting is managed by Oracle Enterprise Manager Fusion Middleware Control–>
        <DefaultRowsDisplayedInDownload>250000</DefaultRowsDisplayedInDownload>
        </Table>

    After adding the parameter just above ``</Table>``:

        <Table>  
        <MaxCells>65000000</MaxCells>
        <MaxVisiblePages>10000</MaxVisiblePages>
        <MaxVisibleRows>1000000</MaxVisibleRows>
        <MaxVisibleSections>25000</MaxVisibleSections>
        <DefaultRowsDisplayed>75</DefaultRowsDisplayed>
        <!–This Configuration setting is managed by Oracle Enterprise Manager Fusion Middleware Control–>
        <DefaultRowsDisplayedInDelivery>250000</DefaultRowsDisplayedInDelivery>
        <!–This Configuration setting is managed by Oracle Enterprise Manager Fusion Middleware Control–>
        <DefaultRowsDisplayedInDownload>250000</DefaultRowsDisplayedInDownload>
        <DefaultRowsDisplayedInDownloadCSV>250000</DefaultRowsDisplayedInDownloadCSV>
        </Table>

4. Set the value of the ``DefaultRowsDisplayedInDownloadCSV`` parameter
   to a number that is appropriate for your application.

5.  Save your changes.

6.  Restart OBIEE services.

After you have completed all of the preceding steps, you should be able to
export the reports in CSV format without any issues.

###  Resolve stuck threads

In WebLogic, you might receive the following warning:

    ThreadPool has stuck threads

Stuck threads are Java Virtual Machine (JVM) threads that have been running
for more than a configurable time (the default value is 600 seconds). The
WebLogic Server automatically detects when a thread in an execution queue gets
stuck. When a stuck thread cannot complete its current work or accept new work,
the server logs a message each time that it diagnoses a stuck thread. If all
threads in an execution queue become stuck, the server changes its health
state to either **Warning** or **Critical**. As the number of stuck threads
increase, your server might crash.

Use the following steps to resolve this problem:

1.  Log in to the Administration Console.

2.  Click **Lock & Edit**.

3.  In the left pane of the console, expand **Environment > Servers**.

4.  On the Summary of Servers page, select the server instance,
   **bi_server1**, that is noted with a state of **RUNNING** and
    with a health state of **Warning**.

5.  Click **bi-server1** to check for the reason for the **Warning** state.

    If you see that the reason is ``ThreadPool has stuck threads``, continue to
    the next step.

6.  Select the **Configuration > Tuning** tab and update the following
    parameters as necessary:

    a.  **Stuck Thread Max Time**: The amount of time, in seconds, that a thread must be continually working before a server instance diagnoses a thread as being stuck. The default value is 600. Oracle recommends a value of 2400 for this parameter to resolve stuck threads.

    b.  **Stuck Thread Timer Interval**: The amount of time, in seconds, after which a server instance periodically scans threads to see if they have been continually working for the configured **Stuck Thread Max Time**. The default value is 60. The range of this parameter is 0 to 2147483647. Oracle recommends a value of 2400 for this parameter to resolve stuck threads.

7.  Click **Save**.

8.  To activate these changes, in the Change Center of the Administration
    Console, click **Activate Changes**.

    Not all changes take effect immediately. Some require a restart (see [Use the Change Center](https://docs.oracle.com/cd/E13222_01/wls/docs100/ConsoleHelp/taskhelp/console/UseTheChangeCenter.html).

9.  After you finish the preceding steps, you must reboot the server to use
    the new stuck thread detection behavior values.

For more information about low memory detection properties, see
[Configuration Options](https://docs.oracle.com/cd/E13222_01/wls/docs100/ConsoleHelp/pagehelp/Corecoreserverserverconfigtuningtitle.html#attributes).

### Customize the OBIEE 11g Analytics logo

After OBIEE finishes installing, you can see the Oracle logo on
the OBIEE Analytics Home page as well as on the Login page. Administrators are
often required to customize the OBIEE logo based on their application.
The main advantage of this customization is that it personalizes the tool. The
following procedure helps you understand the user interface (UI) elements in
OBIEE 11g to reduce the time that you spend customizing your environment.

Use the following steps to customize the logo in OBIEE Analytics:

1.  Log in to the environment where OBIEE is installed.

2.  Use the following the path to go to the logo file for the Oracle Home page:

        $FMW_HOME/user_projects/domains/DR_domain/servers/
        bi_server/tmp/\_WL_user/analytics_11.1.1/7dezjl/war/res/s_Skyros/master

    Here you see the ``oracle_logo.png`` file, which is based on the default
    skin style to help you quickly customize the logo.  

    **Note**: The default dimensions for the logo file is 119 x 25 pixels for OBIEE
    11.1.1.7 and 104 x 14 pixels for OBIEE 11.1.1.9. Only OBIEE 11.1.1.9 allows changes
    to the entire screen (Login page, Home, dashboards, and logout page) in
    one pass of the change to the ``oracle_logo.png`` file.

3.  Rename your customized ``.png`` file to ``oracle_logo.png`` and place the
    file in the path given in Step 2. Your logo should be the same size as
    the Oracle logo.

4.  Restart Oracle Process Manager and Notification (OPMN) services.

5.  Clear the browser cache and check the changes to see your custom logo on
    the Login and Home page of Oracle Analytics.

After completing this procedure, your customized logo displays
on the Login page and Home page for Oracle Analytics.     

### Customize the OBIEE 11g Analytics banner text

After OBIEE finishes installing, you can see the Oracle
banner text (Business Intelligence) on the OBIEE Analytics Home page and Login
page. The following procedure helps you understand the UI
elements in OBIEE 11g to reduce the time that you spend customizing your
environment.

Use the following steps to customize the banner text:

1.  Log in to the environment where OBIEE is installed.

2.  Use the following the path to go to the location of the default banner
    text file:

        /FMW_HOME/Oracle_BI1/bifoundation/web/msgdb/l-en/messages

3.  Search for the ``productmessages.xml`` file.

4.  Create a backup of the ``productmessages.xml`` file.

5.  Edit ``productmessages.xml``. Go to:

        <WebMessage name="kmsgHeaderBIBrandName"><TEXT>Business Intelligence</TEXT></WebMessage>line

    Change the ``Business Intelligence`` text within ``<TEXT></TEXT>``
    to the text that you want to display in your customized banner. For
    example, change the banner text to ``BI Dashboards``.

7.  Save the file.

8.  Restart all of the OBIEE services.

9.  Clear the browser cache and check that the pages reflect your customized
    banner text.

After completing this procedure, your customized banner text
displays on the Login page and Home page for Oracle
Analytics.   

### Start and stop servers in OBIEE 11g and 12c

In OBIEE, you can use the following procedures to start and stop servers in
Unix or Linux environments. The step-by-step approach shows
the main differences between the process in OBIEE
11g and OBIEE 12c. Oracle’s changes in OBIEE 12c have made the startup and
shutdown of servers easier.

#### OBIEE 11g: Start servers

Use the following steps to start servers in OBIEE 11g:

1.  To start a WebLogic server, go to the Middleware home at the following
    path:

        <MW_HOME>/user_projects/domains/bifoundation_domain/bin

2.  Execute the script **./startWebLogic.sh (space) &** or use the ``nohup``
    utility by using the following command:

        nohup ./startWebLogic.sh 2>&1 &

3.  Go to the Middleware home at the following path:

        <MW_HOME>/wlserver_10.3/server/bin

4.  Set up the Environment by using the following script:

          ./setWLSEnv.sh

    After the Environment is set, the following message displays:

        Your Environment has been set.

5.  Set up the Node Manager by using the following syntax:

        ./startNodeManager.sh (space) &

    After the Node Manager is up, the following message displays:

        Secure Socket Listener started on port No

6.  Start the Admin and Managed servers simultaneously though the console at
    http://localhost:7001/console by following these selections:
    **Environments > Servers > Control**.

    Then check the servers from the list, and select **Start**.

7.  Start the OPMN services:

    a.  Go to the following location in the Middleware Home:

            <MW_HOME>/instances/instance1/bin

    b.  Enter the following syntax:

            ./opmnctl (space) startall

    c. Check the status by using the following syntax:

            ./opmnctl status

       All the services should show status as **Alive**.

#### OBIEE 11g: Stop servers

Use the following steps to stop servers in OBIEE 11g:

1.  Go to the following location in the Middleware Home:

        <MW_HOME>/instances/instance1/bin

2.  Enter the following syntax:

        ./opmnctl (space) stopall

3.  Check the status by using the following syntax:

        ./opmnctl status

    All the services should be down.

4.  Stop the Admin and Managed servers simultaneously though the console at
    http://localhost:7001/console by following these selections:
    **Environments > Servers > Control**

    Then check the servers from the list, and select
    **Shutdown > Force shutdown**.    

#### OBIEE 12c: Start servers

Use the following steps to start servers in OBIEE 12c:

1.  Go to the following path in Oracle Home:

        <ORACLE_HOME>/user_projects/domains/BIDomain/bitools/bin

2.  Start OBIEE 12c services with the following command:

        ./start.sh

3.  Check status with the following command:

        ./status     

#### OBIEE 12c: Stop servers

Use the following steps to stop servers in OBIEE 12c: 

1.  Go to the following path in Oracle Home:

        <ORACLE_HOME>/user_projects/domains/BIDomain/bitools/bin

2.  Stop OBIEE 12c services with the following command:

        ./stop.sh

3.  Check status with the following command:

        ./status

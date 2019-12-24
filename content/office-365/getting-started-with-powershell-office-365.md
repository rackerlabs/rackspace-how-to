---
permalink: getting-started-with-powershell-office-365/
audit_date:
title: How to Access and Manage your Office 365 Tenant with PowerShell
type: article
created_date: '2019-12-24'
created_by: Simon Ponder
last_modified_date: '2019-12-24'
last_modified_by: Walter Stubbs
product: Office 365
product_url: office-365
---

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Moderate
- **Time Needed:** Approximately 15 minutes
- **Tools Needed:** Office 365 Administrator access, 64-Bit Version of Windows, Microsoft .NET Framework 4.5.x, Windows Management Framework 4.0

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

As an Office 365 Administrator, you may be required to utilize PowerShell to perform certain administrative tasks on your tenant. PowerShell is also useful for performing bulk operations and accessing data.

### Installing the MSOnline Module for PowerShell

There are several PowerShell modules that are required to manage Office 365. This article will only cover the primary management module, the MSOnline module.

Use the following steps to install the MSOnline module.

1.	Run the Windows PowerShell app with elevated privileges (Run as Administrator).

2.	Type the following command to allow PowerShell to run signed scripts and hit **Enter**:

  Set-ExecutionPolicy RemoteSigned

3.	To Install the MSOnline module, type the following command and hit **Enter**:

  Install-Module MSOnline

**NOTE:** If prompted about installing modules from an untrusted repository, type Y and press ENTER.

4.	Copy and paste the following code block into PowerShell. This code block is a script that will connect you to your Office 365 tenant using the administrative credentials you provide. Lines that begin with # are comments relating to the line of code above them. When prompted, enter your Global Administrator credentials:

    ```PowerShell
    Import-Module Msonline
    #Imports the MSOnline module that you just installed
    $Cred = Get-Credential
    #Prompts you for your Administrator credentials and saves them to a variable
    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $cred -Authentication Basic -AllowRedirection
    #Creates a PowerShell session with the Exchange Admin Center using the previous stored credential
    Connect-MsolService -Credential $cred
    #Connects to Office 365 and Azure Active Directory using the previously stored credential
    Import-PSSession $Session
    #Starts your Exchange Online PowerShell Session
    ```

5.  After you are connected to your Office 365 tenant, we recommend validating your connection by running the following simple command to get a list of all of your users:

    Get-MSOLUser

6.  When you are finished with PowerShell, simply close the PowerShell application.

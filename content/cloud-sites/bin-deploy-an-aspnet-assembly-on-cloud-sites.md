---
permalink: bin-deploy-an-aspnet-assembly-on-cloud-sites/
audit_date:
title: Bin-deploy an ASP.NET assembly on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

On the ASP.NET platform, it's common to use a third-party assembly to
provide access to features from your code that you find useful but that
might not be available from the .NET framework. To do this, you deploy
the assembly to the **Bin** directory, which is the reserved location in
your application directory for assemblies. Then, you update your
**web.config** file to load this assembly for use on your website. This
process is commonly known as *bin-deploying* an assembly, or *binary
deployment*. This article describes how to bin-deploy an assembly.

### Prerequisites

-   You must have an existing Cloud Sites website. If you do not have
    one, see [Adding a new website](/how-to/getting-started-with-cloud-sites-how-to-add-a-new-website).
-   IIS and ASP.NET should be the default technology on the site or
    should, at a minimum, be enabled on this site.
-   The Rackspace cloud uses [a modified medium trust configuration](/how-to/modified-medium-trust-on-cloud-sites).
    To function correctly, the assembly must allow partially
    trusted callers. If you do not know whether the assembly will work
    in medium trust, contact the vendor.
    -   After confirming that the assembly does work in medium trust,
        continue to the Get started section.
    -   If you have a list of requirements for the assembly, contact
        Support to confirm whether the requirements are met.
    -   Any assembly requiring full trust is not supported at this time.

### Get started

To get started, you must obtain the assembly that you want to bin
deploy. As an example, the instructions in this article bin-deploy
[UrlRewriter.NET](https://sourceforge.net/projects/urlrewriter/),
a URL rewriter for ASP.NET applications that do not have the URL Rewrite
Module installed.

### Obtain the assembly

The following steps use UrlRewriter.NET. Substitute with the assembly
that you want to deploy.

1.  Go to <https://sourceforge.net/projects/urlrewriter/>.
2.  Click the **Files** tab, and then click the **urlrewriter.net for .net v1.1** link
    to download the binaries and source code.
3.  The most recent binary file at the time this article was written was
    **UrlRewriterNet-1_8.zip**.
4.  If the download doesn't start within a few seconds, click the
    direct link.
5.  Save the file to your computer.
6.  Extract the **Intelligencia.UrlRewriter.dll** file.

### Upload the assembly

To use the assembly from your website code, the module must be located
in the **Bin** directory on your FTP server, which is the standard
location for bin-deploying assemblies. Following the example, to
bin-deploy **Intelligencia.UrlRewriter.dll**, [connect to your website's FTP server and upload the DLL file](/how-to/getting-started-with-cloud-sites-uploading-your-content)
to the following directory (**www.example.com** is your website name):

    /www.example.com/web/content/Bin

### Load the assembly in the web.config file

Some assemblies require different definitions in the **web.config** file
to work correctly. The best way to learn how to load an assembly is to
consult the vendor's website. In this example, we are bin-deploying
**Intelligencia.UrlRewriter.dll**, you could load UrlRewriter.NET by using the
following example **web.config** configuration:

    <?xml version="1.0" encoding="UTF-8"?>
    <configuration>
      <configSections>
        <section name="rewriter"
                 requirePermission="false"
                 type="Intelligencia.UrlRewriter.Configuration.RewriterConfigurationSectionHandler, Intelligencia.UrlRewriter" />

      </configSections>

      <system.web>
        <httpModules>
          <add name="UrlRewriter" type="Intelligencia.UrlRewriter.RewriterHttpModule, Intelligencia.UrlRewriter" />

        </httpModules>
      </system.web>

      <system.webServer>
        <modules runAllManagedModulesForAllRequests="true">
          <add name="UrlRewriter" type="Intelligencia.UrlRewriter.RewriterHttpModule" />

        </modules>
        <validation validateIntegratedModeConfiguration="false" />
      </system.webServer>
    </configuration>

### Use the assembly

Because of the vast amount of assemblies that can be bin-deployed, it's
impossible to cover usage of them in this article. As with loading the
assembly, the best way to learn how to use an assembly is to consult the
vendor's website. To learn how to use the
**Intelligencia.UrlRewriter.dll** used in this example, [see the article on URL rewriting in ASP.NET](/how-to/rewrite-urls-from-aspnet-on-cloud-sites).

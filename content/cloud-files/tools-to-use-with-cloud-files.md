---
permalink: tools-to-use-with-cloud-files/
audit_date:
title: Tools to use with Cloud Files
type: article
created_date: '2016-01-15'
created_by: Stephanie Fillmon
last_modified_date: '2016-04-19'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

The following tools are some of the methods you can use to upload and manage content with Cloud Files:

[Rackspace Cloud Files CDN](https://wordpress.org/plugins/rackspace-cloud-files-cdn/%20) is a WordPress plug-in that allows any media in your WordPress uploads folder to be uploaded to Rackspace Cloud Files, powered by CDN. Once the file is uploaded, it is deleted from the local server.

[Cyberduck](http://cyberduck.ch/) is a full-featured browser to publish your content on Cloud Files and manage your CDN distributions with a click of a button. Access your Rackspace Cloud Files remote storage using the familiar Cyberduck browser interface to create containers and upload content using drag and drop. Create a distribution to register that container with the Akamai's Content Distribution Network through using the Info panel of the browser that displays the CDN URL. Distribution can be toggled on or off at any time. Supporting the latest and greatest version of the Cloud Files protocol, you can also browse hierarchical pseudo-folder structures.

[Django-Cloudfiles](http://github.com/rossdakin/django-cloudfiles/) is an extension to the management system of Django, the popular website framework. Django-Cloudfiles lets you synchronize the static content directory of your Django-powered website to your Cloudfiles account effortlessly.
    1. Django-Cloudfiles only uploads files that have been modified (but can force upload-all)
    2. It can create a new container for you
    3. It preserves your file hierarchy by naming your remote files such that they emulate nested directories: no need to flatten your existing structure!
    4. You can store credentials in your site's configuration file (for easy use) or specify them on the command line (for greater security)
    5. It ignores files you probably don't want to upload, like .DS_Store, .git, and Thumbs.db.
    6. Plug-ins for the Django management system do exist (e.g. django-extensions), but none integrate with Cloudfiles yet (or any CDN to my knowledge)
    7. A simple drop-in (no coding necessary)
    8. No external dependancies required
    9. Django is all about reusability; Django developers always look for an existing solution first (like this one)!
    10. Django is gaining steam: it's supported by Google App Engine, and it is gaining traction.

**Media manager** plug-in will mirror your media library to your Cloud Files CDN. All URL's to this content will use the Cloud Files path when you insert them via the media manager. You can import all of your media to the CDN.

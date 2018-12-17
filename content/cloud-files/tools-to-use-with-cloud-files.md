---
permalink: tools-to-use-with-cloud-files/
audit_date:
title: Tools to use with Cloud Files
type: article
created_date: '2016-01-15'
created_by: Stephanie Fillmon
last_modified_date: '2018-04-20'
last_modified_by: Nate Archer
product: Cloud Files
product_url: cloud-files
---

You can use the following tools to upload and manage content with Cloud Files.

### Rackspace Cloud Files CDN

[Rackspace Cloud Files CDN](https://wordpress.org/plugins/rackspace-cloud-files-cdn/%20)
is a WordPress plug-in that allows any media in your WordPress **uploads** folder
to be uploaded to Rackspace Cloud Files, powered by CDN. After the file is
uploaded, it is deleted from the local server.

### Django-Cloudfiles

[Django-Cloudfiles](http://github.com/rossdakin/django-cloudfiles/) is an
extension to the management system of Django, which is a popular website framework.
Django-Cloudfiles lets you synchronize the static content directory of your
Django-powered website to your Cloud Files account effortlessly.

Django-Cloudfiles has the following characteristics:

   1. It uploads only files that have been modified (but can force upload-all).
   2. It can create a new container for you.
   3. It preserves your file hierarchy by naming your remote files so that they emulate nested directories: no need to flatten your existing structure.
   4. You can store credentials in your site's configuration file (for easy use) or specify them on the command line (for greater security).
   5. It ignores files you probably don't want to upload like **.DS_Store**, **.git**, and **Thumbs.db**.
   6. Plug-ins for the Django management system do exist (for example, django-extensions), but none integrate with Cloud Files.
   7. It is a simple drop-in with no coding necessary.
   8. It requires no external dependencies.
   9. Django is reusable, so Django developers always look for an existing solution before building a new one.
   10. Django is supported by Google App Engine.
   
### Media manager

**Media manager** is a plug-in that mirrors your media library to your Cloud Files CDN.
All URL's to this content use the Cloud Files path when you insert them
by using the Media manager. You can import all of your media to the CDN.

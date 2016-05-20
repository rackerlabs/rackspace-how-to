---
permalink: sample-ruby-application-for-cloud-files/
audit_date:
title: Sample Ruby Application for Cloud Files
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-04-18'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

*From Connection to Objects*

In the sample command below, use your Rackspace Cloud account username
and API key, where indicated by 'UsernameGoesHere' and 'APIKeyGoesHere' in
the following command. For information about how to find your API key,
see [View and reset your API key.](/how-to/view-and-reset-your-api-key)

    #!/usr/bin/env ruby
    require 'rubygems'
    require 'cloudfiles'
    # Log into the Cloud Files system
    cf = CloudFiles::Connection.new('UsernameGoesHere','APIKeyGoesHere')
    #Create a Container
    container = cf.create_container('ContainerNameGoesHere')
    #Create an Object
    object = container.create_object('ObjectNameGoesHere')
    # Write Data to an Object
    object.write('DataGoesHere')

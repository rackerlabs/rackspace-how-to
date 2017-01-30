---
permalink: connect-to-your-onmetal-server-through-cloud-init/
audit_date:
title: Connect to your OnMetal Server through cloud-init
type: article
created_date: '2014-07-22'
created_by: Paul Querna
last_modified_date: '2014-07-24'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

Cloud-init works out of the box with OnMetal servers. Therefore, you can
create a **cloud-config.yml** file as follows:

    #cloud-config
    write_files:
    - path: /hello-world
    permissions: 755
    content: |
    #!/bin/bash -e
    echo "hello world"

Next, run the following command with your SSH key name:

    supernova iad boot --flavor onmetal-compute-v1 --image b59fc7a5-de35-4fd3-87f8-c5f2e390f1ad --user-data cloud-config.yml --key-name pquerna
    pq-cloud-init-test

When the server starts, a */hello-world* bash script is present in your
OnMetal instance.

**Note**: Many more examples of what cloud-init can do are available in
the cloud-init's documentation at:
<http://cloudinit.readthedocs.org/en/latest/>.

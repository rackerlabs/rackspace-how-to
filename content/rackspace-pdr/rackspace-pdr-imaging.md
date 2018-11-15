---
permalink: rackspace-pdr-imaging/
title: Rackspace PDR imaging hosts
type: article
audit_date: '2018-11-13'
created_date: '2018-11-12'
created_by: Nick Shobe
last_modified_date: '2018-11-13'
last_modified_by: Nick Shobe
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

If you need to take an image for future deployments of a host that has Rackspace Proactive Detection & Response (PDR) agents installed, the agents must be removed or prepared for bulk deployment before you take an image.

### Remove agents

According to our standard method to prepare Golden images, we remove the vendor agents. It supports our normal auto-deploy tooling and usually works similarly to building off a new base Operating System (OS) image. There are two primary paths to choose from: keep the origional host as a working host, or use the original host as the Golden image.

#### Keep the original host as a working host

You might take an image of a live host that you intend to keep. If you choose to keep the original host that the image is based on, you must image the original host and create a new temporary host for image preperation. It is best to start or build the new host that will become the Golden image without a route to the internet(0.0.0.0/24) to prevent any agents from communicating to the vendor endpoints.

After the Rackspace PDR team has prepared the new host for deployment, you can take an image of that host to be used as a Golden image for future deployments.

Use the following steps to keep the original host as a working host:

1. Take an image of your original host.
2. Build a new host with no Internet access. If we need to access the Internet from that host during preparation, we will contact you or your support team.
3. Contact Rackspace PDR and let us know which host to prepare as a Golden image.
4. Take an image of the new host after it has been prepared by the Rackspace PDR team.
5. Remove the new host, keeping the new host image as your Golden image.
6. Deploy hosts based on the new Golden image as normal.

#### Use the original host as the Golden image

If you intend to shutdown the original host after the image has been taken, you can have the Rackspace PDR team prepare that host as the Golden image directly. After the Rackspace PDR team has prepared the image for future deployment, you can take an image and use it to deploy future hosts.

Use the following steps to use the original host as the Golden image:

1. Contact Rackspace PDR and let us know which host to prepare as a Golden image.
2. Take an image of the new host after it has been prepared by the Rackspace PDR team.
3. Remove the running host and keep the image as your Golden image.
4. Deploy hosts based on the new Golden image as normal.

### Prepare agents for bulk deployment

It is possible to prepare a base image so that the agents automatically assign unique agent ID's without needing to be installed by our deployment tooling. This option is not the normal way that Rackspace PDR manages agent deployments because it usually results in an image that is not compatible with our agent auto-deployment tooling. 

If you and your support team decide that you need a pre-imaged Golden image for autoscale or other rapid cloud deployment models, reach out to the Rackspace PDR team and discuss this option with us so that we can architect a solution that maintains coverage while addressing your image deployment needs.

### Take an image for a system backup

If you are just backing up a host, then it is not nessessary to prepare the image for Rackspace PDR deployment. However, if you later decide to use that backup image to deploy new hosts other then restoration, then you must prepare that image for Rackspace PDR agent deployment before deploying new hosts. For more information, see the *Remove agents* section above.

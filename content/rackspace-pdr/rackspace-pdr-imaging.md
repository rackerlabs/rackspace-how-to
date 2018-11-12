---
title: Rackspace PDR Imaging Hosts
type: article
created_date: '2018-11-12'
created_by: Nick Shobe
last_modified_date: '2018-11-12'
last_modified_by: Nick Shobe
permalink: rackspace-pdr-imaging/
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

If you need to take an image for future deployments of a host that has Rackspace PDR agents installed, those will need to be prepared or removed before you take an image.

### Taking an image for use as a base or "Golden" image - Removal of agents.

Removal of vendor agents is the standard method we use to prepare Golden images. It supports our normal auto deploy tooling and will usually just "work" like building off a new base os image. There are two primary paths to choose from; Keep the origional host and Use the origional host as the Golden image.

#### Keep the origional host as a working host
You may take an image of a live host you intend to keep. If you choose to keep the origional host that the image is based on, you will need to image the origional host and create a new temporary host for image preperation. It is best to start/build the new host that will become the Golden image without a route to the internet(0.0.0.0/24) to prevent any agents from communicating to the vendor endpoints.

Once the Rackspace PDR team has prepared the new host for deployment, you may take an image of that host to be used as a Golden image for future deployments.

##### Quick recap
1. Take an image of your old host.
2. Build a new host with no internet access(we will contact you or your support team if we need to access the internet from that host during preperation).
3. Contact Rackspace PDR and let us know which host to prepare as a Golden image.
4. Take an image of the new host once it has been prepared.
5. Remove the running new host, keeping the new host image as your Golden image.
6. Deploy hosts base on the new Golden image as normal.

#### Use the origional host as the Golden image
If you intend to shutdown the origional host once the image has been taken you can have the PDR team prepare that as the Golden image directly. Once the Rackspace PDR team has prepared the image for future deployment, you may take an image and use it to deploy future hosts.

##### Quick recap
1. Contact Rackspace PDR and let us know which host to prepare as a Golden image.
2. Take an image of the new host once it has been prepared.
3. Remove the running host keeping the image as your Golden image.
4. Deploy hosts base on the new Golden image as normal.

### Taking an image for use as a base or "Golden" image - Agents remain installed but prepared for bulk deployment
It is possible to prepare a base image so that the agents will auto assign unique agent ID's without needing to be installed by our deployment tooling. This option is not the normal way that Rackspace PDR manages agent deployments as it usually results in an image that is not compatible with our agent autodeployment tooling. However, if you and your support team decide that you need a pre-imaged Golden image for autoscale or other rapid "cloudy" deployment models. Reach out to the Rackspace PDR team and discuss this option with us so that we can architect a solution that maintains coverage while addressing your image deployment needs.

### Taking an image for a system backup - not going to use as a base(Golden) image

If you are just backing up a host then it is not nessessary to prepare the image for PDR deployment. However, if later you decide to use that backup image to deploy new hosts other then restoration then you will need to prepare that image for PDR agent deployment before deploying new hosts. See the section above "Taking an image for use as a base or "Golden" image - Removal of agents.""

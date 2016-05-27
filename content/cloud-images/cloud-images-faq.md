---
permalink: cloud-images-faq/
audit_date:
title: Cloud Images FAQ
type: article
created_date: '2014-01-14'
created_by: Cloud Images
last_modified_date: '2016-04-20'
last_modified_by: Stephanie Fillmon
product: Cloud Images
product_url: cloud-images
---

### Getting Started

#### Where is the documentation?

There are several types of documentation available:

-   The [Rackspace Cloud Images Getting Started Guide](https://developer.rackspace.com/docs/cloud-images/v2/developer-guide/#document-getting-started)
    walks you through the basics of using the Images API for all your
    image-related needs
-   The [Rackspace Cloud Images Developer Guide](https://developer.rackspace.com/docs/cloud-images/v2/developer-guide/)
    gives you details on the Cloud Images v2 API
-   There are links to Rackspace How-To articles giving
    step-by-step instructions for various Cloud Images operations at
    appropriate places in this document.

#### What is Cloud Images and how does it relate to Glance?

Glance is the OpenStack image registry and storage service. Cloud Images
is the product name for the initiative where we expose the Glance image
service endpoints in the Rackspace open cloud.

#### What does Cloud Images expose?

Cloud Images exposes the Rackspace open cloud deployment of the
OpenStack Images v2 API powered by OpenStack Glance.

#### Why are the Glance operations being exposed?

Glance features that aren't available in the Compute API or Cloud
Control Panel can be accessed directly via the Cloud Images API. You
already use Glance behind the scenes whenever you boot a cloud server,
make an image from a server, look at a list of images, or look at
detailed information for a particular image. The Cloud Images API
enables direct access to those operations.

Exposing the Glance functions in the API also lets us add new image
functionality more quickly and transparently in the future.

#### What kind of new functionality can be accessed with the Cloud Images API?

-   Image sharing
-   Image tags
-   More flexible image list filtering
-   RBAC
-   Image import
-   Image export

#### Can the API return responses in XML format?

The Images API returns JSON exclusively. There is no option to receive
responses in XML.

------------------------------------------------------------------------

### Image Sharing

#### Can I share or accept images in the Control Panel?

Yes! Image sharing is now available in the Cloud Control Panel. Please
see the following How-To article for details: [Sharing images in the Cloud Control Panel](/how-to/sharing-images-in-the-cloud-control-panel).

#### Where can I read a quick summary of image sharing?

The Cloud Images API documentation has a section on [Image Sharing](https://developer.rackspace.com/docs/cloud-images/v2/developer-guide/#image-sharing)
that will give you an overview (along with links to details).

#### Does it cost anything to share images?

There will not be a charge for sharing images. Sharing an image merely
makes the image accessible/viewable to the person to whom it is shared.
For example, you will be able to see the image in an API response, a
client `image-list` call, or in the Cloud Control Panel. As it is not a
copy of the image, the cost of storage is handled by the image producer
(who is charged at normal Cloud Files rates).

#### Is there a limit to what kinds of images, or how many, I can share or have shared with me?

There is no limit on the number of images that can be shared from, or
shared to, a cloud user. You can act as an image producer and share as
many images as you like to other users, and you can act as an image
consumer and have as many images shared with you as other people are
willing to offer you.

If you are acting as an image producer, it's your responsibility to
ensure that any images you share contain properly licensed software for
which the vendor allows sharing. As a consumer, you should only use
images containing properly licensed software. You are expected to follow
the Rackspace [Acceptable Use Policy](http://www.rackspace.com/information/legal/aup) with regard to
the type of software included on images.

#### Will I be charged extra for images that are shared to me?

No, image charges are the responsibility of the person sharing the
image. However, if you create an image of a server built from an image
shared to you, that image will then be stored in your account and
charged at normal Cloud Files rates.

#### What information is required to share an image from one account to another?

You need to know the account number of the customer with whom you
want to share the image. When the customer is logged in to the Cloud
Control Panel, their account number is displayed under their account name in the
upper-right of the Control Panel (it is the first item in the
**Account** menu.

#### Someone shared an image with me. Why don't I see it in my image list?

The process of image sharing requires you to accept the share request
before you will be able to see the image. To do this, you'll need to
know the UUID of the image that was shared with you. Please consult the
[Cloud Images v2 API documentation](https://developer.rackspace.com/docs/cloud-images/v2/developer-guide/#image-sharing)
for instructions on how to accept an image.

#### Can I share or accept an image in the Chicago (ORD) region?

If you are an image producer who wants to share an image in the ORD
region of the Rackspace cloud, please be aware that the provisioning of
cloud services in the ORD region has not been available to recent
customers. If you share an image with such a customer, the sharing will
occur without error from your perspective. If the consumer you are
sharing with doesn't have cloud services in ORD, of course, they will
not see the image and won't be able to boot from it. (If you don't have
service in ORD, this question won't even come up, because you won't have
any images in ORD to share!) A customer can tell if they don't have
access to the ORD region by looking in the Control Panel - it won't show
up as an option in the Region dropdown on either the Server List or
Create Server pages. API users can look directly in their service
catalog. To learn more about regions in the Rackspace cloud, please see
the How-To article [Rackspace data centers and regions](/how-to/rackspace-data-centers-and-regions).

#### What if someone shares an image to me that I don't want, or if I don't know the person?

The process of image sharing requires you to accept the share request
before you can see the image in your image list. This is so that other
customers cannot spam you with images you're not interested in. If you
don't know or trust the person sharing the image, we advise against
using the image. Only create servers from images you trust.

#### What if I accepted an image but have decided that I don't want it?

You can reject the image and it will no longer be displayed in your
image list. Please consult the [Cloud Images v2 API documentation](https://developer.rackspace.com/docs/cloud-images/v2/developer-guide/#image-sharing)
for instructions on how to reject an image.

#### What happens if someone accidentally (or intentionally) shares an image with malware, root kits, backdoors, or other vulnerabilities? Who is liable?

Customers are liable for any activities resulting from the use of Cloud
Images. For your protection, only use images shared by people you know.
If you encounter fraudulent activities, please contact Support.

#### What happens if an image with malware, etc. is shared to me? How can I report it?

You can report suspicious activities to Rackspace Support and to
<cloudimageshelp@rackspace.com>.

#### What happens if I build a server from a shared image and then have to rebuild the server?

Information necessary for a server rebuild is stored in the server
record in our infrastructure. You should be able to rebuild a server
even if the image has been un-shared with you or if the image owner has
deleted the image. You can also create your own image from a server
built using a shared image.

#### What happens if an image is un-shared with me or if the image owner deletes the image?

If an image is un-shared with you, or if the owner deletes the image,
you will no longer have access to the image. If access to a particular
image is important to you, create your own image of a server you've
built from that image. You will be the owner of the image you created
and can create new servers from that image.

Some images have disappeared from my Compute v2 API (nova) image list.
Where did they go?

Images that were manually shared by Support previous to this API release
have been put in pending state. The nova client's `image-list` command
originally displayed those images, but planned changes to the client
will cause it to display only images in an accepted" state to match the
API behavior.

To add those images back to your displayed images list, accept the
images [via the API](https://developer.rackspace.com/docs/cloud-images/v2/developer-guide/#image-sharing).

#### Can I share an image across regions (for example, from ORD to SYD)?

Image sharing can only occur within a single region of the Rackspace
open cloud. For example, you cannot share an image in the ORD region in
a way that allows it to be used in the SYD region. If your image is in
IAD, and you share it with someone else, they will only be able to build
servers from the image in the IAD region.

------------------------------------------------------------------------

### Image Tags

#### What are image tags?

Image tags are a set of arbitrary strings you can associate with an
image.

#### What are the restrictions on image tag strings?

Tag strings can include up to 255 unicode characters. In practice,
however, since you might need to create, delete, or filter tags in a
URL, it is best to use ASCII-range alphanumeric characters with an
underscore ("\_") replacing any spaces. With that approach you don't
have to worry about URL-encoding tags correctly.

#### Why would I use image tags?

Image tags make it easy to group images into functional units. You can
retrieve a particular group of images by using the `tag=<tag_value>`
filter on an `image-list` call.

------------------------------------------------------------------------

### RBAC

#### What roles are available for Cloud Images?

The standard **identity:user-admin**,
cross-product **admin**, and cross-product **observer** are included.
There are also three product-specific roles:

-   **cloudImages:admin**
-   **cloudImages:creator**
-   **cloudImages:observer**

#### What are the capabilities of these roles?

For details on the Cloud Image roles, see the How-To article
[Detailed Permission Matrix for Cloud Images](/how-to/detailed-permissions-matrix-for-cloud-images).

------------------------------------------------------------------------

### Image Tasks

#### What are image tasks?

The OpenStack Images v2 API introduces tasks as a way for users to
request image operations. This provides a common task interface across
all Glance installations. At the same time, since the infrastructures of
OpenStack clouds can vary greatly, tasks can be customized for each
particular cloud.

#### What can I do with tasks?

You can import and export images. See the Image Import and Export
section in this FAQ.

#### What RBAC roles can create tasks?

You must have an **Admin** role to create tasks.

#### Where can I find out more about tasks?

See the [Rackspace Cloud Images Developer Guide](https://developer.rackspace.com/docs/cloud-images/v2/developer-guide/)
for more details.

------------------------------------------------------------------------

### Image Import and Export

#### What is the import/export functionality?

Import and export functionality lets you upload images to, and download
images from your Cloud Servers account. The images can be saved server
images or custom server images created by you or third parties.

#### Is the import/export functionality something proprietary to Rackspace?

No, the functionality to import and export is provided by the Glance
OpenStack project API (Icehouse release). We're simply making it
available to our customers.

#### Does it cost extra to import or export images? What charges should I expect?

The costs for importing, storing, and exporting images follow the same
conventions as normal storage and bandwidth usage:

-   Uploading an image: There is no charge for inbound bandwidth.
    Standard rates for Cloud Files storage will apply.
-   Downloading an image: Exported images are stored in your Cloud Files
    account and charged at normal Cloud Files rates. If you download the
    image from Cloud Files, you'll be charged for outgoing bandwidth at
    standard Cloud Files rates.

#### What formats are supported for image imports?

Currently, an image must be in the [VHD (Virtual Hard Disk) format](http://en.wikipedia.org/wiki/VHD_(file_format)) in order to be
imported into the Rackspace open cloud. Being in the correct format,
however, is not sufficient to guarantee a "bootable" image. The image
must also follow Rackspace open cloud bootstrapping practices. For
details on these practices, please see the How-To article
[Preparing an Image for Import into the Rackspace Open Cloud](/how-to/preparing-an-image-for-import-into-the-rackspace-opencloud).

#### Are there any limitations on the operating system installed on an image?

Microsoft product use rights do not allow the use of License Mobility
for Windows licenses. Given the limitations related to this software
platform, image import is not available for Windows images. You may
import other operating system as long as you do not violate any
licensing restrictions. Please contact the vendor of any operating
system you wish to import for details.

#### Are there any limitations on the software I can import on an image?

It is your responsibility to make sure that any software you place on an
image to be imported is properly licensed for use in the cloud. Be aware
that Microsoft licensing, in particular, is extremely restrictive. If
you are in doubt, do not import any software until you have checked with
the vendor.

#### Is Rackspace responsible for the content of imported images?

No, as covered in the [Rackspace Cloud Terms of Service](https://www.rackspace.com/information/legal/cloud/tos) (and
standard practice among hosting providers), Rackspace can take no
responsibility for content or application licensing when it is uploaded
by the customer.

#### Are all images available for export?

Certain images may not be available for export if they are using
licenses or licensing schemes for which Rackspace is responsible, or has
an agreement with the provider. The export task will go into an error
state with a message indicating that the image cannot be exported.

It's important to note that when you export an image using Cloud Images,
your image does not leave the Rackspace open cloud. It is deposited in
your Cloud Files account so that you may have a personal copy of the
image. Why is this important? This process lets you have a copy of your
image without in any way distributing the image (or any software
contained therein) outside of the Rackspace open cloud. This is an
important distinction for some licensing agreements.

As described in the [Rackspace Cloud Terms of Service](https://www.rackspace.com/information/legal/cloud/tos), you are
responsible for understanding licensing terms regarding all software
contained in any image you export. Do not distribute your image outside
the Rackspace open cloud unless you're certain that all relevant
licenses allow you to do so. You may need to obtain and apply your own
licenses in order to use an image outside the Rackspace open cloud,
depending on the software licenses involved. Please contact the
appropriate software vendor if you have questions.

#### How can I tell if an image can be exported?

First, only the image owner can export an image. You cannot export a
Rackspace public image and you cannot export an image that has been
shared with you.

**Note:** If you have a use case where you really want
to export one of these, you can create a server from that image then
make an image of the new server to get your own copy of the original
image.

Next, some images are not available for export due to licensing or
billing issues. Currently, these include all Windows and Red Hat images.
You can tell for sure by looking at the image you want to export. It
will have a property named `com.rackspace__1__options`. If the value is
zero, you may export the image.

#### Can you give me step-by-step instructions for exporting an image?

You can find a detailed example of exporting an image in the first half
of the article [Transferring images between regions of the Rackspace Open Cloud](/how-to/transferring-images-between-regions-of-the-rackspace-open-cloud).

#### Where is my exported image?

Your image is exported into a container you specify in your cloud files
account. It's stored as a "Dynamic Large Object" in Cloud Files. What
this means is that your image is actually stored as a series of
"segments" along with a "manifest object". In order to download the
image, what you'll want to download is the "manifest object". Cloud
Files will stream all the segments in the correct order. Here's a
screenshot so you can see what this looks like in the Cloud Control
Panel:

<img src="{% asset_path cloud-images/cloud-images-faq/file-listing_0.png %}" alt="" />

In the screenshot, the "manifest objects" are contained in red boxes.
Note that each one is zero bytes in size and has a filename of the form
`{image_uuid}.vhd`. The other objects in the screenshot (the ones whose
names end with `-00001`, `-00002`, etc. are the "segments". *It is
extremely important that you do not delete any of the segments unless
you also intend to delete the entire image*. If you delete a single
segment and then download the "manifest object", the download will
succeed, but your image will be corrupt (since part of it will be
missing).

To summarize: to download your image, you want to download the Cloud
Files object whose name follows the format `{image_uuid}.vhd`. (We do
not, however, suggest that you attempt to download an object the size of
a typical VM image through the Cloud Control Panel.)

#### Can you recommend a way for me to download my exported image from Cloud Files?

We recommend using the **Swiftly** Cloud Files client. Please read [Use Swiftly to Download an Exported Image](/how-to/use-swiftly-to-download-an-exported-image).

#### If I have cloud servers in multiple regions, will an imported image be available in all regions?

An imported image is only available in the region into which it has been
imported. If you want the image in multiple regions, you'll have to
transfer it from your Cloud Files account in region A to your Cloud
Files account in region B, and then use the Cloud Images endpoint for
region B to import the image into region B.

We're working on building an "image cloning" functionality that will
allow you to move images directly from region to region without having
to perform the intermediate Cloud Files transfer and image import in
each region.

#### How do I transfer an image to another region?

See the How-To article [Transferring Images Between Regions of the Rackspace Open Cloud](/how-to/transferring-images-between-regions-of-the-rackspace-open-cloud).

#### Can I use image export and import to move between Infrastructure and Managed accounts?

Yes, it is possible to now move images between Infrastructure and
Managed accounts by following the steps in the article [Transferring Images Between Regions of the Rackspace Open Cloud](/how-to/transferring-images-between-regions-of-the-rackspace-open-cloud)
to export the required image, then import it into whatever account the
customer requires. Any images that are shared, imported, or exported are
deemed to be non-standard, therefore the *Infrastructure* service level
will be applied regardless of the type of account the image is being
shared with or imported into. Back-up configurations and monitoring
checks are applied uniquely to each Cloud instance and therefore will
need to be recreated upon successful import or share.

#### How do I prepare an image for import?

See the How-To article [Preparing an Image for Import into the Rackspace Open Cloud](/how-to/preparing-an-image-for-import-into-the-rackspace-opencloud).

#### Can you recommend a way to upload my image to Cloud Files so it can be imported?

We recommend using the **Swiftly** Cloud Files client. Please see this
How-To article: [Use Swiftly to upload an image to be imported](/how-to/use-swiftly-to-upload-an-image).

#### Can you give me step-by-step instructions for importing an image?

You can find a detailed example of importing an image in the second half
of the article [Transferring images between regions of the Rackspace Open Cloud](/how-to/transferring-images-between-regions-of-the-rackspace-open-cloud).

#### What's the deal with the checksum on my imported (or exported) image?

Customers who are really, really careful with their data may have this
question: When I look at my image in the Images (or Compute) API, I see
that its checksum is 12345. But when I export my image and download it
from Cloud Files, its checksum is 98765. (Or: I've prepared my own image
outside the Rackspace cloud. It's got checksum 98765, but when I look at
the imported image in the API, it says that the image checksum is
12345.) What's up with that?

The difference is that images are stored internally in the public cloud
in a different format from the way they're transferred.

On the input side, the VHD format image is packaged as a gzipped OVA so
that it's in the format the hypervisor expects to see. Therefore, the
checksum will be different.

On the export side, to keep server image creation fast, the hypervisor
stores a server "snapshot" as an OVA containing multiple VHD files. When
we export the image, we coalesce these multiple VHDs into a single VHD.
So the checksums again will be completely different between what's in
the cloud and what's exported.

One other thing: during the coalesce operation that happens on export,
some information is updated in the headers and footers of the VHD. So
even if you have a VHD with checksum 56789 and you import it and then
immediately export the imported image, the checksum of the VHD that's
exported will be different (although the "content" of the VHD, i.e., the
non-header and non-footer part, will be identical).

#### I want to boot a server from my imported image, but I can't find the image in the Cloud Control Panel. Where is it?

On the Create Server page in the Control Panel, you see a list of images
you can choose from. The Cloud Control Panel sorts your images according
to what server they're a snapshot of, but because your image is an
import, it's not a snapshot of any existing server in the Cloud. Thus,
the Control Panel considers this is a snapshot of a deleted server. Your
imported image is listed under the **Deleted Servers** category.

------------------------------------------------------------------------

### Image Metadata and Property Protection

#### What's the difference between "image metadata" and "image properties"?

The Compute API talks about "image metadata", while the Images v2 API
uses the terminology "image properties". These refer to the same thing.

#### Why are some image properties protected?

There are some image properties that Rackspace puts on images for the
purposes of determining licensing, billing, and VM configuration. These
are inherited by snapshots of servers booted from these images and may
not be modified by customers.

#### Does protection affect image metadata calls in the Compute v2 API?

The Compute (nova) API acts as a proxy for Glance, so property
protections apply to all image metadata operations performed via the
Compute v2 API.

#### What happens if I try to modify a protected property?

You'll get a 403 (Forbidden) response to your API request. The response
will contain an error message to the effect that you're trying to modify
a property that you don't have permission to modify.

#### How do I know what properties are protected?

Most of the properties that appear on an image by default, before you
have added any custom properties, are protected. An exception is "name",
which you may change at any time. You aren't allowed to create any new
properties with the prefix "com.rackspace" (we use that prefix to
indicate Rackspace properties). The simplest way to determine this is to
try to modify a property. If you aren't allowed to modify it, you'll get
a 403 (Forbidden) response.

#### I'm creating sub-users on my account and assigning them RBAC roles. Which roles can modify image properties?

A user must have a customer-admin role (like **identity:user-admin**, **admin**,
or **cloudImages:admin**) in order to modify image properties.

#### Which roles can create image properties?

A user must have a customer-admin role to create image properties.
Because of the way the Images v2 API works, any user that can create
image properties can also modify and delete image properties. Those
privileges exceed the capabilities that should properly be assigned to a
"creator" role, so we restrict image property creation to users with a
customer-admin role.

------------------------------------------------------------------------

### Image Support

#### Where can I find the Rackspace Cloud Terms of Service?

-   For the UK cloud:
    <http://www.rackspace.co.uk/legal/cloud-terms-of-service>
-   For the US cloud:
    <http://www.rackspace.com/information/legal/cloud/tos>

The Terms of Service incorporate the Rackspace Acceptable Use Policy.
You can find links to the appropriate AUP document for your region from
the TOS pages at the above URLs.

#### What kind of support can I expect for imported and shared images?

Imported and shared images are considered to be non-standard images,
read the article [Standard and Non-Standard Images](/how-to/rackspace-standard-and-non-standard-images).
For servers booted from non-standard images, you may expect that we will
ensure host servers are functioning properly and that the API
availability meets the SLA. We will also provide advice on sharing,
importing, and exporting images.

#### I'm a managed cloud customer - do I still only get infrastructure level support for servers built from non-standard images?

Our managed cloud support team wants to create amazing customer
outcomes, so when you build a server from a non-standard image, your
support representative will do what he or she can to troubleshoot and
provide guidance. Because the technologies contained in a non-standard
image are not always popular or well documented, technical support for
those technologies is not guaranteed and may vary by support
representative. Any assistance provided in response to a support request
for a server built from a non-standard image is not an agreement of
continuing support, and future requests will be handled on a
case-by-case basis. When you consider deploying a server built from a
non-standard image as part of your infrastructure, please keep in mind
that if you incur downtime or a degraded state due to problems with the
image or any technology contained therein, it will not be covered by the
standard Cloud Servers SLA.

#### I've got a question that's not listed here. How can I get an answer?

For additional questions, either contact Support or send an email to
<cloudimageshelp@rackspace.com>.

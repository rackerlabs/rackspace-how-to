---
permalink: set-up-cloud-files-and-acls/
audit_date: '2019-01-22'
title: Set up Cloud Files and ACLs
type: article
created_date: '2019-02-08'
created_by: Rackspace Community
last_modified_date: '2019-02-08'
last_modified_by: Kate Dougherty
product: Cloud Files
product_url: cloud-files
---

This tutorial teaches account owners how to use Access Control Lists (ACLs)
with Cloud Files. A Cloud Files ACL enables account owners to specify read or
write access to a particular container for a specific user.

### Set up a new user

Use the following steps to set up a new Role-Based Access Control (RBAC) user:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).
2. Click on your **username** at the top right of the screen, then click
   **User Management**.
3. Click **Create User**.
4. Enter the user's information and click **Create User**.
5. On the **User Details** page that appears, assign the user
   [roles](/how-to/overview-role-based-access-control-rbac/). Under
   **User Permissions**, ensure that you leave the Cloud Files role set
   to **No Access**.
6. In the **Security Settings** section, click **Show** to display your
   **Rackspace API Key** and make a note of it.

### About container headers

You cannot create ACLs in the Cloud Control Panel. However, you can enable
container-level access by using cURL and passing in the following headers:

- `X-Container-Read`: This header holds a comma-delimited list
  of the users that can read the container. It allows the GET HTTP method for
  all of the objects in the container.
- `X-Container-Write`: This header holds a comma-delimited
  list of users that can write to the container. It allows the PUT, POST, COPY
  and DELETE HTTP methods for all of the objects in the container.

You set these special headers only on containers. The headers apply to all of the
objects in a container.

For example, if you create a user named `RBAC_USER` and have a container named
`ACL_Container` in Cloud Files, you can give this user read access to
`ACL_Container` by setting the `X-Container-Read` header to `RBAC_USER`.
Similarly, you can give the user write access to `ACL_Container` by setting its
`X-Container-Write header` to `RBAC_USER`.

You do not need to include yourself in either ACL because the account owner
always has read and write access to everything in their Cloud Files
account. If you create additional users, you can set the header values to
`RBAC_USER, RBAC_USER2, RBAC_USER3,` where a space before or after a comma is
acceptable.

### Authenticate by using cURL

First, you need to authenticate with the Identity service by
using your username and API key, as shown in the following example:

    curl -s -XPOST https://identity.api.rackspacecloud.com/v2.0/tokens -d '{ "auth":{ "RAX-KSKEY:apiKeyCredentials":{ "username":"USERNAME_HERE", "apiKey":"API_KEY_HERE" } } }' -H "Content-type: application/json" |python -m json.tool

The response to this request includes a `token`, as shown
in the following example:

    "token": {
    "RAX-AUTH:authenticatedBy": [
    "APIKEY"
    ],
    "expires": "2014-09-12T03:02:40.024Z",
    "id": "TOKEN_HERE",
    "tenant": {
    "id": "ACCOUNT_ID",
    "name": "ACCOUNT_ID"
    }
    },
    .
    .
    .

### Create a container

Next, create a container by using the token that you retrieved. You need to
provide the following information in the request:

- The token
- The correct storage endpoint
- The name of the container that you are creating

The following example creates the container `ACL_Container` by using cURL:

    curl -XPUT -H 'X-Auth-Token: $token' https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_0a0a000a-000a-000a-000a-00a00000a00a/ACL_Container

Alternatively, you can use the python-swiftclient, or _[swift](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-interfaces/cli/swift/)_, a Python-based tool that is primarily used to manage Rackspace Cloud
Files.

The following example creates the same container by using swift:

    swift -A https://auth.api.rackspacecloud.com/v1.0 -U USERNAME_HERE -K API_KEY_HERE post ACL_Container

### Add ACLs to the container

After you have successfully added the container, you can add ACLs to the
container by using a cURL command that is similar to the following example:

    curl -XPOST -H 'X-Auth-Token: $token' https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_0a0a000a-000a-000a-000a-00a00000a00a/ACL_Container -H 'x-container-read: RBAC_USER' -H 'x-container-write: RBAC_USER'

The following example shows how to add ACLs to the container by using swift:

    swift -A https://auth.api.rackspacecloud.com/v1.0 -U ACCOUNT_USERNAME -K ACCOUNT_APIKEY post -r RBAC_USER ACL_Container
    swift -A https://auth.api.rackspacecloud.com/v1.0 -U ACCOUNT_USERNAME -K ACCOUNT_APIKEY post -w RBAC_USER ACL_Container

### Verify the new ACLs

Check the container headers to verify the ACLs by using the following cURL
command:

    curl -i -XHEAD -H 'X-Auth-Token: $token' https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_0a0a000a-000a-000a-000a-00a00000a00a/ACL_Container
    HTTP/1.1 204 No Content
    Content-Length: 0
    X-Container-Object-Count: 0
    X-Container-Write: RBAC_USER
    Accept-Ranges: bytes
    X-Storage-Policy: Policy-0
    X-Container-Read: RBAC_USER
    X-Container-Bytes-Used: 0
    X-Timestamp: 1410426988.44932
    Content-Type: text/plain; charset=utf-8
    X-Trans-Id: tx898647c0f1d5410aa4168-00541168bdord1
    Date: Thu, 11 Sep 2014 09:17:49 GMT

The following example shows how to check the headers by using swift:

    swift -A https://auth.api.rackspacecloud.com/v1.0 -U ACCOUNT_USERNAME -K ACCOUNT_APIKEY stat ACL_Container
    Account: MossoCloudFS_0a0a000a-000a-000a-000a-00a00000a00a
    Container: ACL_Container
    Objects: 0
    Bytes: 0
    Read ACL: RBAC_USER
    Write ACL: RBAC_USER
    Sync To:
    Sync Key:
    Accept-Ranges: bytes
    X-Storage-Policy: Policy-0
    X-Timestamp: 1410425120.72477
    X-Trans-Id: txc8a18e53f6d24796b5cd7-0054116635ord1
    Content-Type: text/plain; charset=utf-8

### ACL issue with swift

Swift is a helpful tool, but it has some limitations. The most significant
issue occurs when an `RBAC_USER` who does not have access to Cloud Files and
has only read/write access to the container that they specify attempts to upload
a file by using a command like the following example:

    swift -A https://auth.api.rackspacecloud.com/v1.0 -U RBAC_USER -K $API_KEY upload ACL_Container testfile

This example first attempts to create the container `ACL_Container`. However,
because the restricted user does not have access to Cloud Files, this command
returns a `403 Forbidden` HTTP response and then attempts to upload the file
`testfile`.

You can avoid this issue by using another tool for swift, _[swiftly](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-interfaces/cli/swiftly/#swiftly)_. You can pass additional parameters with swiftly, which
enables your restricted user to upload the file directly, without attempting
to create the container. The swiftly command for performing this action looks
like the following example:

    swiftly -A https://identity.api.rackspacecloud.com/v2.0/ -U RBAC_USER -K $API_KEY put --input=testfile ACL_Container/testfile

This command returns a `201 Created` HTTP response and uploads the file.

### Conclusion

Because you gave `No Access` to `RBAC_USER` when you created this user,
`RBAC_USER` cannot access the container from the Cloud Control Panel.
After using the tools described in this article, `RBAC_USER` now has
read and write access to the container `ACL_Container` and
can only access the container and its objects by using the Cloud Files API.

ACL functionality enables account owners to set up fine-grained access
control for their Cloud Files containers.

### Helpful resources

You might find the following additional resources helpful:

- [Cloud Files Developer Documentation](http://docs.rackspace.com/files/api/v1/cf-devguide/content/Overview-d1e70.html)
- [Create Cloud Files container-level Access Control Policies](http://www.rackspace.com/blog/create-cloud-files-container-level-access-control-policies/)

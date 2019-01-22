---
permalink: pitchfork-the-rackspace-cloud-api-web-application/
audit_date: '2019-01-22'
title: Pitchfork - the Rackspace Cloud API web application
type: article
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: '2019-01-22'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

If you want an interactive way to reference documentation and run API commands
for Rackspace Cloud products, you need to interact with a product quickly, or
you want to take advantage of new products or features that are not available
in the Control Panel, Pitchfork might be the tool for you.

Pitchfork is an interactive web API application that allows a user to interact
quickly with Rackspace Cloud products. There is no need to pull up a command
prompt or look up how to send data objects by using a cURL command. The application
handles all of this for you and displays the results and responses from the
product API requests that you made against your Cloud account.

Pitchfork was designed to make the API calls and to show you what you need for
API calls so you can perform them by using other tools or methods. You can use
the mock feature to check the data structure for a call, which can serve as a
reference tool in your Rackspace API programs.

APIs can be confusing for beginners. Because Pitchfork lays out the call
structure for you, you can learn much more quickly. Sometimes the API
is the only way to make a configuration change on a load balancer or cloud
database, for instance, and Pitchfork can both show you how to make the call and
execute it for you.

### Where to find Pitchfork

You can access Pitchfork at the following address: [https://pitchfork.rax.io](https://pitchfork.rax.io)

Look at the code in [GitHub](https://github.com/oldarmyc/pitchfork).

### Login requirements

You do not have to log in to the application to mock or browse any of the API
calls. You need to log in only if you want to execute those calls against your
account.

To log in, click **Login** and enter your authentication credentials.

### Authentication

Pitchfork uses the same credentials that you use in an API authentication
request to Rackspace Cloud. You supply your username and API key, and the system
makes the authentication request for you over HTTPS. If the request succeeds,
the application stores the token and service catalog that is returned and
expires the session along with the token when it is time.

### Use Pitchfork to send an API call

After you have logged in, use the following steps to send an API call by using
Pitchfork:

1. Browse to any of the products, and find the call you want to execute.
2. Choose the region that you want to interact with.
3. Click **Details**.
4. If there are any variables for the call, enter them.
5. Click **Send API Call**.

The application shows you the following information:

- **Request URL:** The fully constructed URL that you sent the call to.

- **Request Headers:** The headers portion of the request that you sent to the
  API.

- **Request Data Object:** If there is a data object that was created for the call,
  it is displayed including the values that you specified.

- **Response Headers:** The headers received in the response from the API.

- **Response Body:** The response data from the API server. This response could
  include a status code, a returned object, or an error message.

- **Note:** Response headers and the response body are shown only for executed
  calls and not for call mocks. Because mocks are not executed, there is no
  response to show.

### Mocks

The mock option lets you create a call without executing it so that you can see
how the call is structured. Click **Mock API Call** when you want to see all of
the request details for a call. The request data object, if there is one, is
shown with all of the options available for the call, and, for reference, you
can see how the object is structured.

### Caveats for call execution

When you are logged in, the calls execute against your Cloud account. There are
notes on the calls to warn you when you are doing something that will affect
billing, so be mindful when executing the calls.

When you mock a call, no API call is executed, so there is no impact on your
account.

### Call history

You can easily see the history of calls that you have made by clicking **History**
in the menu. The history displays the calls you have made along with all of the
details. The history is saved for calls that you have executed against the API
regardless of the response. Mock API calls are not recorded in your history.
You must be logged in to see your history.

The call history is saved to allow you to audit or reference past calls made
within the system. This is helpful when multiple users are using the same
set of credentials. The call history includes the following elements:

- **Completed:** The timestamp when the call was made (UTC time zone).

- **Call Details:** Details about the call including the description,
  documentation URL, and title.

- **Region:** The region where you executed the call, such as DFW or ORD.

- **Request:** The parts of the request that are saved for reference include
  the URL, verb, and any data object passed to the API.

- **Response:** The response body, response headers, and the response code.

- **Username:** The username of the user who is executing the calls against the
  API.

- **Account Number:** The Cloud account number.

### Frequently repeated calls

If you have a call that you frequently execute,  click the star icon next to the
call. This adds it to your favorites, and you can access these calls from the
front page or from **Favorites** in the menu. You can only add or view your
favorites when you are logged into the application.


---
node_id: 4661
title: Create and manage caching rules in Rackspace CDN
type: article
created_date: '2015-05-11'
created_by: Rackspace Support
last_modified_date: '2016-01-25'
last_modified_by: Catherine Richardson
product: Rackspace CDN
product_url: rackspace-cdn
---

Caching rules are designed to determine how long your content should
live on the edge nodes before the origin is checked for an update. If
your content changes frequently, you might want to set up a time to live
(TTL) rule that pulls content from the origin every few minutes. If your
content does not change frequently, we suggest you set a longer TTL of
12-24 hours.

When you create multiple rules, you must order rules from least specific
to most specific.

For more information about rules, see the following sections and
[Rackspace CDN edge
rules](/how-to/rackspace-cdn-edge-rules).

After you create your service, you enter caching rules in the **Caching
Rules** section of the CDN service page.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Screen%20Shot%202015-10-02%20at%2011.19.22%20AM.png" width="604" height="188" />

### To create a caching rule

After you have created your service, follow these steps to create a
caching rule:

1\. Click **Add Rule**. A popup dialog box appears.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Screen%20Shot%202015-10-02%20at%2011.22.58%20AM.png" width="392" height="185" />

2\. Enter the following information to define the rule:

-   **Name**: Name for the rule.
-   **TTL**: The TTL to wait before the origin is checked for updates.
    Enter a value, and then select seconds, minutes, hours, or days as
    the unit for the TTL.
-   **Path**: Path for the rule.

3\. Click **Save Rule**. The **Service Status** is **Pending** until the
new rule is deployed. After the rule is deployed, it is displayed in the
**Caching Rules** list.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Screen%20Shot%202015-10-02%20at%2011.28.41%20AM.png" width="635" height="211" />



### To edit a caching rule

To edit a caching rule, follow these steps:

1\. Click the gear icon beside the rule that you want to edit, and select
**Edit Rule**.

2\. Edit the name, the TTL, or the path for the rule.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Screen%20Shot%202015-10-02%20at%2011.39.23%20AM.png" width="354" height="172" />

3\. Click **Save Rule**. The **Service Status** is **Pending** until the
updated rule is deployed. After the rule is deployed, it is displayed in
the **Caching Rules** list.



### To delete a caching rule

To delete a caching rule, follow these steps:

1\. Click the gear icon beside the rule that you want to delete, and
select **Delete Rule**.

2\. In the popup dialog box, click **Delete Rule**.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/DeleteOriginRule_0.png" width="196" height="127" />

The **Service Status** is **Pending** until the caching rule is deleted.
After the rule is deleted, it is removed from the **Caching Rules**
list.



#### [&lt; Work with origins and origin rules in Rackspace CDN](/how-to/work-with-origins-and-origin-rules-in-rackspace-cdn)    -    [Create and manage restrictions in Rackspace CDN &gt;](/how-to/create-and-manage-restrictions-in-rackspace-cdn)

---
permalink: optimizing-mysql-indexes/
audit_date:
title: Optimizing MySQL - Indexes
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2011-09-07'
last_modified_by: Rackspace Support
product: Cloud Sites
product_url: cloud-sites
---

### Importance of using Indexes in your MySQL database:

Indexes help the system to access data fast and provide an ordering on
the rows of a table as well as help enforce uniqueness of the values in
a table. A lot of performance problems occur in Cloud Sites for database
queries when customers have not created the necessary indexes on their
tables. To look into how to create an index in MySQL, please refer to:

<http://dev.mysql.com/doc/refman/5.0/en/create-index.html>

### The Explain Statement

The best way to analyze your query and to see if indexes are being used
is by running an explain plan on it. This will show you the path chosen
by the optimizer in executing the query and help give you an idea as to
whether or not you will benefit from creating an index. More on the
explain plan here:

<http://dev.mysql.com/doc/refman/5.0/en/explain.html>

### Prefixing index lengths with an example

Say you run this SQL frequently:

    SELECT user_id, user_id AS ID, user_login, display_name, user_email, meta_value FROM insider_users,
     usermeta WHERE insider_users.ID = usermeta.user_id AND meta_key = 'S' ORDER BY usermeta.user_id;

Say you have this table:

    CREATE TABLE `usermeta` ( `umeta_id` bigint(20) unsigned NOT NULL auto_increment, `user_id` bigint
    (20) unsigned NOT NULL default '0', `meta_key` varchar(255) default NULL, `meta_value` longtext, PRIMARY KEY
    (`umeta_id`), KEY `user_id` (`user_id`), KEY `meta_key` (`meta_key`) ENGINE=InnoDB AUTO_INCREMENT=25199
    DEFAULT CHARSET=utf8

For table usermeta table above, the original meta_key index that is
varchar(255).

**Note:** When you index a full and large column like the meta_key index, then you will hurt your performance.**

What would benefit this query is prefixing the length - dropping the
meta_key index and then re-creating an index but at prefix length of 20. Doing this helps gain performance and saves space. This also reduces
disk IO which buys your faster performance also.

### Covering Index

**The following is an example of a slow MySQL query which also does not
have an Index(s) in place:**

    # Query_time: 82.420792  Lock_time: 0.015179  Rows_sent: 1  Rows_examined: 15828351  Rows_affected: 0  Rows_read: 15828351
    use 393870_p2LIVE; SELECT `Impression`.`id`, `Impression`.`account_id`, `Impression`.`content_id`, `Impression`.`networks_id`,
    `Impression`.`ip`, `Impression`.`recorded` FROM `impressions` AS `Impression`   WHERE `account_id` = 222 AND `content_id` = 19 AND `networks_id` = 8

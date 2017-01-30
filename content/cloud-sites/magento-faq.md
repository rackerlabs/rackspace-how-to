---
permalink: magento-faq/
audit_date:
title: Magento FAQ
type: article
created_date: '2014-05-07'
created_by: Mike Hicklen
last_modified_date: '2016-01-21'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

Many Rackspace Manager Cloud customers already use the power of the open
cloud to support their Magento Community Edition deployments, and many
more utilize the Rackspace Hybrid Cloud offering for their Magento
Enterprise edition deployments. The following questions and answers are
intended to provide pointers on some common gotchas or questions that
you may have.

However, the Rackspace Cloud highly recommends consulting the vendors of
the application for in-depth and up-to-date information. For this,
Magento has a [consulting group](http://www.magentocommerce.com/consulting),
[a well-documented wiki](http://www.magentocommerce.com/wiki/),
[a friendly forum community](http://www.magentocommerce.com/boards),
and even [dedicated support](http://www.magentocommerce.com/support/overview)
from Varien (the makers of Magento)--for a fee.

Get quick answers to common questions about Magento.

### General questions

#### What is Magento?

Magento is a deployed ecommerce shopping platform. Store administrators
download a set of files (just like with WordPress), extract them, set up
a database, and get started. Magento is one of the most followed and
used carts available.

Magento Go is a hosted solution and is typically used in combination
with hosted shopping sites so that all you get is a web back-end login.

#### Does Magento have an enterprise edition?

Yes. Magento Enterprise Edition starts with the open-source Magento
Community Edition, adds built-in full-page cache and other features, and
creates a package that is priced yearly. It comes with support directly
from the developers of Magento and is compatible with our Rackspace
Hybrid Cloud offering.

#### How does Magento Enterprise Edition differ from Magento Community Edition?

Magento Community Edition and Magento Enterprise Edition are similar at
the file and database level, but Enterprise has more features and better
caching. Enterprise is not free of charge, like the community edition,
with pricing for today's packages starting at about $15,000 per year
(subject to change).

The Enterprise Edition of Magento includes the following features:

-   Powerful marketing and merchandising tools
-   Dedicated assistance from the official Magento Technical Support
    Team with a Gold Level SLA\*
-   Security (PA-DSS compliant platform that supports strong
    data encryption)
-   Scalable performance
-   Unparalleled flexibility and site functionality
-   Superior search capabilities
-   Easy-to-use, permission-based administration panel
-   Mobile HTML5 web store
-   Ability to run multiple sites from one instance
-   Pre-integrated technologies, tools, and applications that enhance
    your store

\* Includes one production and one nonproduction server license with
Gold level support. Multiyear, multiserver, and Platinum level support
options are also available.

### Typical questions after installation

#### Where can I find the database/memcache configuration file for Magento?

This file, which is commonly used to control the database connection
strings, session storage mechanism, and caching backends, is located at
**`/var/www/vhosts/domain.tld/app/etc/local.xml`**.

#### What, and where, is the Magento Connect Manager?

The Magento Connect Manager is like the Install Plugins area of
WordPress. You get an *extension key* for the plug-in that you want,
which is just a URL from the Magento Connect plug-in repository, located
at
[http://www.magentocommerce.com/magento-connect/](http://www.magentocommerce.com/magento-connect/).

Typically the Magento Connect Manager should be at
http://www.domain.tld/downloader. This is the location
where you install and uninstall extensions, update extensions, and
change the preference on extensions from stable to beta, alpha, and
possibly pre-alpha. We recommend that you use the Magento Connect
Manager instead of the command-line **mage** utility because **mage**
sometimes does not perform post-uninstallation cleanup.

#### How do I clear the cache on a Magento store?

How you clear the cache depends on what cache back end you use. Out of
the box, Magento stores cache entries in the file system.

You can purge the cache gracefully from the admin panel, which is
located by default at <http://www.domain.tld/admin>. Navigate
to **System > Cache Management** and refresh the caches or purge the
**image/js/css** cache (which is useful if you just enabled or disabled
minifying).

To purge the cache forcefully, go to the document root and *rename* the
**var/cache** folder (**cache.old** should suffice).

#### Why rename the cache folder? Shouldn't I just delete it because it's an old cache?

Clearing the cache refreshes the site and shows what it looks like
underneath as caches build up. Cache buildup causes a site to stop
working, and this is also why it's a good idea to only rename the cache
folder. If the site breaks, you can put the cache folder back in place
and debug at a better time for you and your visitors.

#### What is re-indexing, and how can I do it via the command line?

Re-indexing is a process that helps build a search index for the
catalog, helps build the product catalog onto the front end, sets up URL
rewrites, and so on. Re-indexing needs to be done from time to time, for
example, if products are missing on the front end. Note that
command-line re-indexing produces errors if there are any problems, but
the back end of Magento does not produce these errors. Thus, if a store
is having issues, it's typically best to re-index via SSH to catch those
errors.

If you run **/shell/indexer.php** on the CLI with no arguments, the
response lists the actions that the indexer can perform. For example,
you can check the status of your indexes, as follows:

    /usr/bin/php /var/www/vhosts/domain.tld/shell/indexer.php --status

You can also refresh a single index by name. Get the list of indexes
first:

    /usr/bin/php /var/www/vhosts/domain.tld/shell/indexer.php info

The response looks as follows, with command-line-friendly names of the
indexes on the left:

    catalog_product_attribute Product Attributes
    catalog_product_price Product Prices
    catalog_url Catalog Url Rewrites
    catalog_product_flat Product Flat Data
    catalog_category_flat Category Flat Data
    catalog_category_product Category Products
    catalogsearch_fulltext Catalog Search Index
    cataloginventory_stock Stock status

You can use the index names to re-index:

    /usr/bin/php /var/www/vhosts/domain.tld/shell/indexer.php --reindex catalog_product_flat

You can use this entire command in a cron job, so if, for example, you
need the catalog's stock status updated quickly - perhaps for a big
sale - you can set up a cron job to re-index the cataloginventory_stock
index every minute, 5 minutes, 10 minutes, or another frequency. Be sure
to set the frequency to something reasonable; you do not want cron jobs
running on top of each other, using too much CPU, and causing stress on
the MySQL database server.

### What other maintenance tasks can I do with the Magento shell scripts?

You can use the following script to clean logs:

    /usr/bin/php /var/www/vhosts/domain.tld/shell/log.php clean

You also have the Magento Compiler, which can produce performance
benefits by reducing the number of include paths (four, by default) to
one include path. This change is useful if Magento is using too much
CPU, but you should use it with caution because the compiler tends to
not interact well with extensions.

Check the state in which the compiler currently resides by running the
following command:

     /usr/bin/php /var/www/vhosts/domain.tld/shell/compiler.php state

Use the following script to disable or enable the compiler, and run the
compile process:

    /usr/bin/php /var/www/vhosts/domain.tld/shell/compiler.php disable
    /usr/bin/php /var/www/vhosts/domain.tld/shell/compiler.php compile
    /usr/bin/php /var/www/vhosts/domain.tld/shell/compiler.php enable

#### "An Error Log Record Number" doesn't tell me anything meaningful. Where can I find the actual error instead of just a number?

The number you get references a plain text file of the same name in your
Magento directory under **var/report/1234567890**. Look at the contents
of the file, which is easily readable with the **cat** command via SSH
or in a text editor. It can offer some insight into your issue.

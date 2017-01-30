---
permalink: optimize-sugarcrm-on-cloud-sites/
audit_date:
title: Optimize SugarCRM on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-22'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is intended for advanced users.

To learn about optimization techniques for any web application,
Rackspace recommends consulting the vendors of the application. However,
SugarCRM does have detailed documentation on their [Support Wiki](http://www.sugarcrm.com/kb/index.php?title=Sugar_Support_Wiki),
some of which we have made available here.

### Quick guide

Following is the quick guide to modifying your SugarCRM configuration
for improved performance in the cloud.

**Modify the .htaccess file**

Add the following PHP configuration directives to your **.htaccess**
file:

    php_value memory_limit 80M
    php_value post_max_size 75M
    php_value upload_max_filesize 75M
    php_value max_execution_time 601
    php_value timeout 601

The PHP5 section of your **.htaccess** should look similar to the
following example when done:

    # PHP 5, Apache 1 and 2.
    <IfModule mod_php5.c>
    php_value magic_quotes_gpc 0
    php_value register_globals 0
    php_value session.auto_start 0
    php_value mbstring.http_input pass
    php_value mbstring.http_output pass
    php_value mbstring.encoding_translation 0
    php_value memory_limit 80M
    php_value post_max_size 75M
    php_value upload_max_filesize 75M
    php_value max_execution_time 601
    php_value timeout 601
    </IfModule>

**Modify the config_override.php file**

**Note:** The following configuration options should improve the
performance of your SugarCRM installation, but might change the way some
of the front-end looks. For a detailed explanation of the configuration
options, see [SugarCRM's Performance Tweaks page](http://www.sugarcrm.com/wiki/index.php?title=Performance_Tweaks_for_Large_Systems).

Add the following SugarCRM configuration options to your
**config_override.php** file:

    $sugar_config['disable_count_query'] = true;
    $sugar_config['disable_vcr'] = true;
    $sugar_config['hide_subpanels'] = true;
    $sugar_config['hide_subpanels_on_login'] = true;
    $sugar_config['save_query'] = 'populate_only';
    $sugar_config['verify_client_ip'] = false;

### Developer tools

The [SugarDev.net Developer Tools](http://www.sugarforge.org/projects/sugardevtools/)
also provide some performance options that you might find useful.

### External links

-   [SugarCRM Support Wiki](http://www.sugarcrm.com/wiki/index.php?title=Sugar_Support_Wiki)
-   [SugarCRM Support Wiki: Performance Tweaks for Large Systems](http://www.sugarcrm.com/kb/index.php?title=Performance_Tweaks_for_Large_Systems)
-   [SugarDev.net Developer Tools](http://www.sugarforge.org/projects/sugardevtools/)

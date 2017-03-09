---
permalink: using-ssl-with-your-cloud-database-instance/
audit_date:
title: Use SSL with your Cloud Database instance
type: article
created_date: '2014-10-02'
created_by: Neha Verma
last_modified_date: '2014-10-17'
last_modified_by: Jered Heeschen
product: Cloud Databases
product_url: cloud-databases
---

SSL (Secure Sockets Layer) is a security protocol that uses encryption
technology to ensure that sensitive information sent over the Internet
is protected. Users on your site might need to divulge personal
information to you such as credit card numbers, Social Security numbers,
user names, and passwords. By making an SSL connection to your database,
your customers can trust that their data will be encrypted when it's
sent to and from your web application.

**Note:** Using SSL encryption is resource-intensive and might impact
the latency of your database connection.

### Download the CA certificate

Cloud Databases configures your database instance to support the use of
SSL when the instance is provisioned. To encrypt data in transit using
SSL, your database connections will need to use an SSL certificate
associated with Cloud Databases.

**Note:** All database instances created before October 20, 2014, should
be restarted before accepting SSL connections.

Download the appropriate SSL certificate, based on when the Cloud Databases instance was created.

-   For instances created before March 1, 2016, [download the SSL
certificate](http://ssl.rackspaceclouddb.com/ca-cert.pem) from the
following URL:

    `http://ssl.rackspaceclouddb.com/ca-cert.pem`
    
-   For instances created on or after March 1, 2016, [download the SSL
certificate](http://ssl.rackspaceclouddb.com/rackspace-ca-2016.pem) from the
following URL:

    `http://ssl.rackspaceclouddb.com/rackspace-ca-2016.pem`

Your applications should use the downloaded certificate as the CA
certificate for SSL connections to your database.

#### Use the certificate with the mysql client

To make SSL connections using the `mysql` command line client, specify
the location of the certificate when you start the client:

    mysql --ssl-ca=/path/to/ca-cert.pem

More information about using SSL with MySQL can be found in the [MySQL
5.6
documentation](http://dev.mysql.com/doc/refman/5.6/en/using-ssl-connections.html).

#### Require SSL connections

You can also set up restrictions on a user to require SSL when
communicating with the database. MySQL supports the `GRANT` statement
modifier `REQUIRE SSL`. For example, to restrict `database_user` to have
read, write, and delete permissions for `prod_database` only when
connected with an SSL connection, log in to MySQL as root and then issue
the following command.

    GRANT SELECT, INSERT, UPDATE, DELETE ON prod_database.* TO 'database_user'@'%' REQUIRE SSL;

**Note:** If the user already exists, you must revoke all existing
privileges for the user and then use the preceding `GRANT` statement to
give the appropriate privileges to the user.

Remember to run a `FLUSH PRIVILEGES` for the database to make the
privilege change take effect.

---
permalink: choosing-between-rdbms-and-nosql/
audit_date: '2018-03-21'
title: 'Choosing between a relational database and a NoSQL database'
type: article
created_date: '2018-02-27'
created_by: Satyakam Mishra
last_modified_date: '2018-03-23'
last_modified_by: Kate Dougherty
product: Database Services
product_url: dba-services
---

This page presents information that is helpful for deciding whether to use a relational database, a NoSQL database, or a hybrid solution.

### Features of relational databases and NoSQL databases

 The following table provides a high-level comparison of the characteristics of relational and NoSQL databases:

 | Relational databases                             | NoSQL databases                                        |
 |--------------------------------------------------|--------------------------------------------------------|
 | Moderate incoming data velocity                  | High incoming data velocity (from sensors and devices) |
 | Data originates from one or a few locations      | Data originates from many locations                    |
 | Primarily structured data                        | Both structured and semi-unstructured data             |
 | Nested or complex transactions                   | Simple transactions                                    |
 | Protect uptime through failover and log shipping | Protect uptime through architecture                    |
 | High availability                                | Continuous availability                                |
 | Deploy an app to one server    | Deploy an app to many servers                             |
 | Primarily write data to one location             | Write data to any location                             |
 | Primary concern is to scale reads                   | Scale writes and reads                                 |
 | Scale up for more users and data                     | Scale out for more users and data                          |
 | Maintain data volumes with purges                 | High data volumes; retain forever                      |

The following image visualizes the structures of various types of databases, as well as the data complexity they are designed to accommodate:

<img src="{% asset_path intro-to-databases/data-complexity-value-in-relationships.png %}" />

The following table compares the characteristics of relational databases and NoSQL graph databases:

| Relational database                                                    | Graph (NoSQL)                                                                                                           |
|------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| Simple to moderate data complexity                                     | Heavy data complexity                                                                                                   |
| Hundreds of potential relationships                                    | Billions of potential relationships                                                                                     |
| Moderate JOIN operations with good performance                         | Heavy to extreme JOIN operations required                                                                               |
| Static to semi-static data changes                                     | Dynamic, constantly changing data                                                                                       |
| Primarily structured data                                              | Both structured and unstructured data                                                                                   |
| Nested or complex transactions                                         | Simple transactions                                                                                                     |
| Always strongly consistent                                             | Tunable consistency (eventual to strong)                                                                                |
| Moderate incoming data velocity                                        | High incoming data velocity (from sensors and devices)                                                                  |
| High availability (handled with failover)                              | Continuous availability (no downtime)                                                                                   |
| Centralized application that is location-dependent (a single location) | Distributed application that is location-independent (multiple locations involving multiple data centers and/or clouds) |
| Scale up for increased performance                                     | Scale out for increased performance                                                                                     |

### Questions to ask before choosing a NoSQL database

If you are evaluating whether a NoSQL database is appropriate for your production environment, you should address the following technical, business, and deployment considerations.

#### Technical considerations

Before deciding to use a NoSQL database, ask the following technical questions:  

- Can the database serve as the primary data source for the online application?
- Does the database have features that prevent the loss of critical data? Are writes durable in nature by default so that the data is safe?
- Is the database fault-tolerant, and is it capable of providing continuous availability?
- Can the database easily replicate data located in the same data center, across multiple data centers, and across different cloud availability zones?
- Does the database offer read/write anywhere capabilities? (Can any node in the cluster be written to and read from?)
- Does the database provide a robust set of security features?
- Does the database support backup and recovery procedures that are easy to create and manage?
- Does the database require special caching layers?
- Is the database capable of managing big data and delivering high performance regardless of data size?
- Does the database offer linear scalability for adding new nodes?
- Can new nodes be added and removed online without impacting your business?
- Does the database support key platforms and developer languages?
- Does the database provide a query language that is similar to SQL?
- Can the database run on commodity hardware with no special requirements?
- Is the database easy to implement and maintain for large deployments?
- Does the database offer data compression that results in significant storage savings?
- Is it easy to run analytic operations on the database?
- Can the database easily interface with and support modern data warehouses or lakes that use Hadoop?
- Is it easy to carry out search operations and functions directly on the NoSQL database?
- Can the database isolate the online, analytic, and search workloads within a single application?
- Does the database have solid command-line and visual tools for development, administration, and performance management?

#### Business considerations

The following list presents business-related questions that you should ask before deciding to use a NoSQL database:

- Is the database backed by a commercial entity?
- If so, does the commercial entity provide 24x7 enterprise-level support and services?
- Does the database have professional online documentation?
- Does the database have customers across a wide range of industries that use the product in critical production environments?
- Does the database have an attractive pricing structure?
- If the database is open source, does it have a thriving open source community?

#### Deployment considerations

A NoSQL database can be used as part of a new application, to augment an existing application, or to fully replace an application. Before choosing a database, consider your deployment needs.

##### New applications

Many organizations begin using NoSQL on a new application. This approach enables you to avoid rewriting applications, migrating data, and performing related tasks.

##### Augmentations

Some organizations choose to augment an existing system by adding a NoSQL component. This often happens with applications that have outgrown a relational database due to scale problems, the need for better availability, or other issues. Parts of the existing system continue to use the existing RDBMS, while other components of the application are modified to use the NoSQL database.

##### Rip and replace projects

If a system is too costly or is breaking due to an increase in user concurrency, data velocity, or data volume from cloud applications, it can be fully replaced with a NoSQL database.

### Guidelines for deciding between a relational database and a NoSQL database

The following questions can help you determine whether a relational database or a NoSQL database is best for your application.

- Do you need a flexible data model that includes a combination of structured, semi-structured, and unstructured data?
- Are complex JOIN operations overwhelming your RDBMS and slowing response times?  
- Do you care more about the value derived from the relationships between tables than the tables themselves?
- Do you need continuous availability with redundancy in both data and function across one or more locations, rather than simple failover for the database?
- Do you need a database that runs over multiple data centers and cloud availability zones?
- Do you need to handle high-velocity data originating from sensors, mobile devices, and similar sources? If so, do you need to handle this data with extreme write speed and low-latency query speed?
- Do you need to go beyond single-machine limits for scale-up? Does your system require a scale-out architecture that makes it easy to add more processing power and storage capacity?
- Do you need to run different workloads (such as online, analytics, and search) on the same data without manually loading it onto separate systems or machines?
- Do you need to manage a widely distributed system with minimal staff?

### Support

If you have further questions about the topics presented in this series of articles, please contact [Satyakam.mishra@Rackspace.com](mailto:Satyakam.mishra@Rackspace.com).    

Learn more about [Rackspace database services](https://www.rackspace.com/dba-services).

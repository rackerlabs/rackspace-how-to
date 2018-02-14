---
permalink: understanding-the-cloud-computing-stack-saas-paas-iaas/
audit_date: '2017-11-30'
title: 'Understanding the cloud computing stack: SaaS, PaaS, IaaS'
type: page
created_date: '2012-07-23'
created_by: Rackspace Support
last_modified_date: '2017-11-30'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
---

Cloud computing is a broad term that describes a wide range of services. As with other significant developments in technology, many vendors have seized the term _cloud_ and are using it for products that are outside of the common definition. To understand how the cloud can be of value to an organization, you should understand what the cloud really is and its different components. Because the cloud is a broad collection of services, organizations can choose where, when, and how they use cloud computing.

This article explains the different types of cloud computing services commonly referred to as software as a service (SaaS), platform as a service (PaaS), and infrastructure as a service (IaaS). It also provides some guidance on situations where particular flavors of cloud computing are (or are not) the best option for an organization.

### The cloud computing stack

Cloud computing, often described as a stack, has a broad range of services built on top of one another under the name _cloud_. The generally accepted definition of _cloud computing_ comes from the National Institute of Standards and Technology (NIST). The [NIST definition](http://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-145.pdf) runs to several hundred words but begins as follows:

``` 
   `Cloud computing` is a model for enabling ubiquitous, convenient, on-demand network 
```

```
   access to a shared pool of configurable computing resources (e.g., networks, servers, 
```

```
   storage, applications, and services) that can be rapidly provisioned and released with 
```

```
   minimal management effort or service provider interaction.
```

This means that end users can use parts of bulk resources and that these resources can be acquired quickly and easily.

NIST also describes several characteristics as essential for a service to be considered _cloud_:

- On-demand self-service: End users can sign up and receive services without the long delays that have characterized traditional IT.
- Broad network access: Users can access the services by using standard platforms (such as desktop, laptop, and mobile).
- Resource pooling: Resources are pooled across multiple customers.
- Rapid elasticity: Capability can scale to cope with demand peaks.
- Measured service: Billing is metered and delivered as a utility service.

To maximize the benefits of cloud computing, a solution must demonstrate these particular characteristics. In recent years, some traditional software vendors have marketed solutions as cloud computing that do not fall within this definition, a practice known as _cloud-washing_.

This article describes all three cloud computing services in detail, but following is a simplified way of differentiating them:

- SaaS applications are designed for end-users, delivered over the web.
- PaaS is the set of tools and services designed to make coding and deploying those applications quick and efficient.
- IaaS is the hardware and software that powers it all – servers, storage, networks, and operating systems.

**Note**: Although this article clearly distinguishes SaaS, PaaS, and IaaS, the differences among these categories of cloud computing, especially between PaaS and IaaS, have blurred and will continue to do so.

### Software as a service

Software as a service (SaaS) is defined as software that is deployed over the Internet. A provider licenses a SaaS application to customers as an on-demand service, either through a subscription, through a pay-as-you-go model, or at no charge, when there is opportunity to generate revenue from streams other than the user, such as from advertisement.

SaaS has become commonplace within almost every organization, so it is important that buyers and users of technology understand what SaaS is and where it is suitable.

#### Characteristics of SaaS

Following are some defining characteristics of SaaS:

- Web access to commercial software
- Software managed from a central location
- Software delivered in a "one to many" model
- Users not required to handle software upgrades and patches
- Application Programming Interfaces (APIs) allow for integration between different pieces of software

#### When to use SaaS

Cloud computing generally, and SaaS in particular, is a rapidly growing method of delivering technology. That said, organizations considering a move to the cloud need to consider which applications they move to SaaS. Following are particular solutions that are prime candidates for an initial move to SaaS:

- Standard offerings in which the solution is largely undifferentiated—for example, email. Competitors often use the same email software because this fundamental technology is a requirement for doing business but does not itself confer an competitive advantage.
- Applications in which there is significant interplay between the organization and the outside world—for example, email newsletter campaign software.
- Applications that have a significant need for web or mobile access—for example, mobile sales management software.
- Software that is used only for a short term need—for  example, collaboration software for a specific project.
- Software for which demand spikes significantly—for example, tax or billing software used once a month.

SaaS was introduced to the business world by the Salesforce Customer Relationship Management (CRM) product. As one of the earliest entrants, CRM remains the most popular SaaS application area, but email, financial management, customer service, and expense management have also become popular SaaS applications.

#### When not to use SaaS

Although SaaS is a valuable tool, it is not the best option for software delivery in certain situations. Following are examples where SaaS might not be appropriate:

- Applications in which extremely fast processing of real-time data is required
- Applications for which legislation or other regulation does not permit data being hosted externally
- Applications for which an existing on-premises solution fulfills all of the organization's needs

### Platform as a service

Platform as a service (PaaS) brings the benefits to the software development world that SaaS brought for applications. PaaS can be defined as a computing platform that enables the quick and easy creation of web applications without the necessity of buying and maintaining the software and infrastructure underneath it.

PaaS is similar to SaaS except that, rather than being software delivered over the web, it is a platform for the creation of software, delivered over the web.

#### Characteristics of PaaS

Following are some basic characteristics of PaaS:

- Services to develop, test, deploy, host, and maintain applications in the same integrated development environment; that is, all the various services needed to fulfil the application development process
- Web-based user interface creation tools used to create, modify, test, and deploy different UI scenarios
- Multitenant architecture in which multiple concurrent users use the same development application
- Built-in scalability of deployed software, including load balancing and failover
- Integration with web services and databases via common standards
- Support for development team collaboration (some PaaS solutions include project planning and communication tools)
- Tools to handle billing and subscription management

PaaS, while similar in many ways to Infrastructure as a Service (IaaS), is differentiated from IaaS by the addition of value-added services and comes in two distinct flavors:

- A collaborative platform for software development, focused on workflow management regardless of the data source being used for the application. For example, Heroku is a PaaS that uses the Ruby on Rails development language.

- A platform that allows for the creation of software using proprietary data from an application. This sort of PaaS creates applications with a common data form or type. The Force.com PaaS from Salesforce.com, which is used almost exclusively to develop applications that work with the Salesforce.com CRM, exemplifies PaaS.

#### When to use PaaS

PaaS is especially useful when multiple developers are working on a development project or when other external parties need to interact with the development process. PaaS is proving invaluable for those who have an existing data source (for example, sales information from a customer relationship management tool) and want to create applications that leverage that data. PaaS is also useful when developers want to automate testing and deployment services.

The popularity of agile software development will also increase the adoption of PaaS because it eases the difficulties around rapid development and iteration of software.

#### When not to use PaaS

The ability to automate processes, use predefined components and building blocks, and deploy automatically to production provides sufficient value to make PaaS highly attractive. However, PaaS might not be ideal in the following situations:

- The application needs to be highly portable in terms of where it is hosted.
- Proprietary languages or approaches would impact the development process.
- A proprietary language would hinder later moves to another provider (concerns about vendor lock-in).
- Application performance requires customization of the underlying hardware and software.

A PaaS development environment enables applications to be created more quickly. In some examples, in the absence of PaaS, the cost of developing the application would have been prohibitive.

### Infrastructure as a service

Infrastructure as a service (IaaS) provides a way of delivering cloud computing infrastructure—servers, storage, network, and operating systems—as an on-demand service. Rather than purchasing servers, software, data-center space, or network equipment, clients instead buy those resources as a fully outsourced on-demand service.

Generally, IaaS can be obtained as public or private infrastructure, or a combination of the two.

- _Public cloud_ is considered infrastructure that consists of shared resources, deployed on a _self-service_ basis over the Internet.
- _Private cloud_ is infrastructure that emulates some of the cloud computing features, like virtualization, but does so on a private network.
- Some hosting providers offer a _hybrid cloud_ - a combination of traditional dedicated hosting alongside public cloud networks, private cloud networks, or both.

#### Characteristics of IaaS

The following core characteristics describe IaaS:

- Resources distributed as a service
- Allows for dynamic scaling
- Has a variable cost, utility pricing model
- Generally includes multiple users on a single piece of hardware

#### When to use IaaS

The following situations are particularly suitable for cloud infrastructure:

- When demand is volatile—that is, any time there are significant spikes and troughs of demand on the infrastructure
- For new organizations without the capital to invest in hardware
- When the organization is growing rapidly and scaling hardware would be problematic
- When there is pressure on the organization to limit capital expenditure and to move to operating expenditure
- For specific line of business, trial, or temporary infrastructure needs

#### When not to use IaaS

Although IaaS provides advantages in situations where scalability and quick provisioning are beneficial, following are situations in which its limitations might be problematic:

- Regulatory compliance makes the offshoring or outsourcing of data storage and processing difficult.
- The highest levels of performance are required, and on-premises or dedicated hosted infrastructure has the capacity to meet the organization's needs.

### Conclusion

_Cloud computing_ doesn't describe a single thing. Instead, it is a general term that describes a variety of services, from IaaS at the base, through PaaS as a development tool, to SaaS replacing on-premises applications.

Organizations considering a move to cloud computing need to understand the different aspects of it and to assess their situation and decide which types of solutions are appropriate for their unique needs.


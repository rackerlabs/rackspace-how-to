---
permalink: intro-to-kubernetes/
audit_date:
title: 'Intro to Kubernetes'
type: article
created_date: '2020-07-24'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

Kubernetes (K8s) is an open-sourced platform for managing containers and their services. Before I go into how Kubernetes will make your life much easier as a DevOps engineer or SRE, let’s take a step back for those that might be new to the containerization.

###In the beginning

In the early days of development engineers and developers would create and run their applications on physical servers. Before all of our lives existed on computers and clouds this was the simplest way to get an application up and running. 
The main problem with running your application on a physical server is that the application may run into resource issues, needing access to the CPU for extra processing, for example. 
This would hinder the performance of any other applications running, thus slowing down your site or application until the bottle-neck was resolved. So engineers decided to run each application on a separate physical server, which works (ok, I guess) for smaller companies, but this gets expensive very quickly.  

###Virtual Progression 

Enter virtual machines, our savior! Virtualization allowed applications to run on a virtual OS on a physical machine. This way you can have resource barriers between your applications so a resource-hungry application won’t eat up all the CPU, or mem on another application. 
This solution is still used to this day, but there is a weightiness to this solution for our application problem. With virtualization, each machine has the resources of an OS, which is fine if you need the full features of an OS. The use of OS has loads of files, such as bins and libraries, not to mention a GUI for consumers to interact with the machine. The resources needed to store and access these features can better be used to run your application.

###Kubernetes is lightweight and hydrated 

This is where K8s comes in as your healthy cousin, living her best life. Containerization is kinda like virtualization, you can specify the resource specs of the container, CPU, memory, and such, but the rules that keep each container separated are not as ridged as virtual machines. 
Since containers are decoupled from the physical machine they are portable, making them more accessible for you and your production team. Essentially making each container an OS without all the little things we humans need to interact with it. There is a lot that K8s can do to make your application work seamlessly such as, Self-Healing, Service Discovery and Load Balancing and Secret and Configuration Management. In the next article, we will cover how to set up K8s along with Docker. 

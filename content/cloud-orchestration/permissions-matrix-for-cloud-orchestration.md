---
node_id: 3888
title: Permissions matrix for Cloud Orchestration
type: article
created_date: '2014-02-05'
created_by: Renee Rendon
last_modified_date: '2016-01-27'
last_modified_by: Catherine Richardson
product: Cloud Orchestration
product_url: cloud-orchestration
---

The following permissions matrix displays specific permissions for the roles in Cloud Orchestration. The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

[Cloud Orchestration API v1.0 Developer Guide](https://developer.rackspace.com/docs/cloud-orchestration/v1/developer-guide/)

[Cloud Orchestration FAQ](/how-to/cloud-orchestration-faq)


#### As of May, 2015

Method name	| API action | Role | Description
--- | --- | --- | ---
**STACK OPERATIONS - Note:** Orchestration users will need access to any products used in their templates. | | |
Create Stack | ```POST /stacks``` | **Creator  & Admin** | Creates a stack.
List Stack Data | ```GET /stacks``` |	**Observer & Creator & Admin** | Lists active stacks.
Find Stack | ```GET /stacks/{stack_name}``` | **Observer & Creator & Admin** | Finds the canonical URL for a specified stack.
Get Stack Data | ```GET /stacks/{stack_name}/{stack_id}``` | **Observer & Creator & Admin** | Gets data about a specified stack.
Update Stack | ```PUT /stacks/{stack_name}/{stack_id}``` | **Creator & Admin** | Updates a specified stack.
Delete Stack | ```DELETE /stacks/{stack_name}/{stack_id}``` | **Admin only** | Deletes a specified stack.
Abandon Stack | ```DELETE /stacks/{stack_name}/{stack_id}/abandon``` | **Admin only** | Deletes a given stack (from orchestration system database) but leaves the stack resources intact.
Adopt Stack | ```POST /stacks``` | **Creator & Admin** | This operation is similar to the Create Stack operation. Along with stack create parameters, an additional body parameter 'adopt_stack_data' must be provided (adopt_stack_data type is String). Data returned by Abandon Stack could be provided as adopt_stack_data.
Preview Stack | ```POST /stacks/preview``` | **Creator & Admin** | Previews a stack.
**STACK RESOURCES** | | |
Find Stack Resources | ```GET /stacks/{stack_name}/resources``` | **Observer & Creator & Admin** | Finds the canonical URL for the resource list of a specified stack.
List Resources | ```GET /stacks/{stack_name}/{stack_id}/resources``` | **Observer & Creator & Admin** |	Lists resources in a stack.
Get Resource Data | ```GET /stacks/{stack_name}/{stack_id}/resources/{resource_name}``` | Gets data for a specified resource.
List Resource Types	| ```GET /resource_types``` | **Observer & Creator & Admin** | Lists the supported template resource types.
Get Resource Schema | ```GET /resource_types/{type_name}``` | **Observer & Creator & Admin** | Gets the interface schema for a specified resource type.
Get Resource Template | GET /resource_types/{type_name}/template | **Observer & Creator & Admin** | Gets a template representation for a specified resource type.
**STACK EVENTS** | | |
Find Stack Events | ```GET /stacks/{stack_name}/events``` | **Observer & Creator & Admin** | Finds the canonical URL for the event list of a specified stack.
List Stack Events | ```GET /stacks/{stack_name}/{stack_id}/events``` | **Observer & Creator & Admin** | Lists events for a specified stack.
List Resource Events | ```GET /stacks/{stack_name}/{stack_id}/resources/{resource_name}/events``` |**Observer & Creator & Admin** | Lists events for a specified stack resource.
Show Event | ```GET /stacks/{stack_name}/{stack_id}/resources/events/{event_id}``` | **Observer & Creator & Admin** | Gets data about a specified event.
**TEMPLATES** | | |
Get Stack Template | ```GET /stacks/{stack_name}/{stack_id}/template``` | **Observer & Creator & Admin** | Gets a template for a specified stack.
**BUILD INFORMATION** | | |
Get Build Info | ```GET /build_info``` | **Observer & Creator & Admin** | Gets information about the current heat build.



### Cloud Orchestration terminology

#### Template

A Cloud Orchestration template is a portable file, written in a user-readable language, that describes how a set of resources should be assembled and what software should be installed in order to produce a working deployment. The template specifies what resources should be used, what attributes can be set, and other parameters that are critical to the successful, repeatable automation of a specific application deployment.

#### Resource

A resource is a template artifact that represents some component of your desired architecture (a Nova server, a group of scaled servers, a Cinder volume, some configuration management system, and so forth).

#### Stack

A stack is a group of resources (servers, load balancers, databases, and so forth) combined to fulfill a useful purpose. Based on a template, Heat orchestration engine creates an instantiated set of resources (a stack) to run the application framework or component specified (in the template). A stack is a running instance of a template. The result of creating a stack is a deployment of the application framework or component.

---
node_id: 3675
title: Permissions Matrix for Auto Scale
type: article
created_date: '2013-09-04'
created_by: Renee Rendon
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Autoscale
product_url: rackspace-auto-scale
---

[API Documentation](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/)

[Related How-To Articles](/how-to/rackspace-auto-scale-overview)

As of November 11, 2013

| Method | API Action | Role | Description |
| ------ | ---------- | ---- | ----------- |
| Create Group | `POST /groups/` | **Admin only** | Creates an autoscaling group. |
| List Groups | `GET /groups/` | **Admin & Observer** | Lists the autoscaling groups available to the specified tenant. |
| List Group Details | `GET /groups/{groupId}` | **Admin & Observer** | Lists detailed autoscaling group configuration. |
| Delete Group | `DELETE /groups/{groupId}` | **Admin Only** | Deletes autoscaling group. |
| Get Group State | `GET /groups/{groupId}/state` | **Admin & Observer** | Reports autoscaling group state.  |
| Get Group Configuration | `GET /groups/{groupId}/config` | **Admin & Observer** | Lists autoscaling group configuration. |
| Replace Group Configuration | `PUT /groups/{groupId}/config` | **Admin Only**  | Updates autoscaling group configuration. |
| Get Launch Configuration  | `GET /groups/{groupId}/launch` | **Admin & Observer** | Lists launch configuration. |
| Replace Launch Configuration  | `PUT /groups/{groupId}/launch`  | **Admin Only**  | Update launch group configuration.  |
| Pause Group Policy Execution | `POST /groups/{groupId}/pause`  | **Admin Only** | Pauses policy execution. |
| Resume Group Policy Execution | `POST /groups/{groupId}/resume` | **Admin Only**  | Resumes policy execution.  |
| Get a List of Policies | `GET /groups/{groupId}/policies/`  | **Admin & Observer** | Lists scaling policies in the autoscaling group. |
| Get Details of a Policy  | `GET /groups/{groupId}/policies/{policyId}`  | **Admin & Observer** | Describes one policy.  |
| Create a New Policy  | `POST /groups/{groupId}/policies/` | **Admin Only** | Creates autoscaling policy. |
| Delete a Policy | `DELETE /groups/{groupId}/policies/{policyId}` | **Admin Only** | Deletes a policy.  |
| Replace a Policy | `PUT /groups/{groupId}/policies/{policyId}` | **Admin Only** | Updates policy. |
| Execute a Policy | `POST /groups/{groupId}/policies/{policyId}/execute` | **Admin Only** | Executes a policy. |
| Get a List of Webhooks | `GET /groups/{groupId}/policies/{policyId}/webhook` | **Admin Only** | Lists webhooks in the autoscaling group.  |
| Create a Webhook | `POST /groups/{groupId}/policies/{policyId}/webhook` | **Admin Only**  | Creates a webhook. |
| Replace a Webhook | `PUT /groups/{groupId}/policies/{policyId}/webhook/{webhookId}` | **Admin Only** | Updates a webhook.  |
| Delete a Webhook | `DELETE /groups/{groupId}/policies/{policyId}/webhook/{webhookId}` | **Admin Only** | Deletes a webhook. |
| View Webhook Info | `GET /groups/{groupId}/policies/{policyId}/webhook/{webhookId}` | **Admin Only** | Describes one webhook. |

**[Permission Matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)**

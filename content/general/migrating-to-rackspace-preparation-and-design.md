---
permalink: migrating-to-rackspace-preparation-and-design
audit_date:
title: Migrating to Rackspace - Preparation and Design
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: general
product_url: general
---

Welcome to Rackspace! We’re glad that you’re moving your applications to Rackspace. Now it’s time to actually move your apps and sites over to Rackspace. This migration process can be difficult, so we’ve asked our Cloud Launch Team (our team of cloud experts that help our brand new customers get started with Rackspace) what advice they have for migrations, and this is what they recommended. We’ll break this up into a few separate entries, so that it’s easier to read. First up, getting prepared for a successful migration.
Our Cloud Launch Team spelled out their steps for a successful migration, and the first thing they wanted to convey was that plannig is a key to success. Seeing migrations fail due to a lack of planning is painful for everyone. Take a few minutes to do some planning and discovery along the following lines:

### Security

Make sure you know your existing security policies. Are there any that will impede you from making a migration? Be sure to gather any needed SSH keys, and record any servers which might have IP address restrictions that could prevent a migration. Don’t lower your current level of security, just make sure that anything which might impede the migration is accounted for to ensure a smooth migration.

### Capacity

What does your traffic load look like today? Is it fairly steady; or prone to rapid changes. What server(s) do you currently use to run your applications? Knowing this information can help us get the best possible Rackspace solution in place for you.

### Lower TTLs Now

Sometime soon, you’ll need to change your DNS to point to your new environment at Rackspace. If you have a long TTL, (Time to live, the length of time that your DNS settings will remain cached) your migration might be slowed down. Some TTLs are set to as long as a week - that’s something that Rackspace can’t manage for you, so make sure to lower the TTLs at your DNS hosting provider to the lowest level available.

### Establish Maintenance Windows

Most users are forgiving of an announced, well planned maintenance window. Give your end users plenty of advanced notice that the migration will occur, and don’t forget to tell them why - are you moving to improve the performance of the site, or gain another benefit? Let your users know that this migration will benefit them, too.

### Start creating full backups

We are going to do everything in our power to make sure that your migration goes smoothly. You are going to do everything in your power to make sure that your migration goes smoothly. Sometimes problems still happen, and data gets lost in the migration. Your best bet is to have at least one good backup, just in case.-

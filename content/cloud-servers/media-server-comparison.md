---
permalink: media-server-comparison/
audit_date: '2020-07-29'
title: 'Media Server Comparison'
type: article
created_date: '2020-07-24'
created_by: Rackspace Support
last_modified_date: '2020-07-29'
last_modified_by: Chris Moyer
product: Cloud Product
product_url: cloud-product
---

Are you looking for a media server solution but are not sure which software to choose? Between Plex&reg;,
Jellyfin&reg;, and Emby&reg;, new users can find it hard to choose their media server. This article describes
the main differences between the three to make your choice easier, hopefully.

### Plex

Plex Media Server, created in 2008, is the oldest media server on this list. Because of its age, it’s had
plenty of time to mature and gain new features.

#### Pros

- **Automatic SSL**: With Plex Media Server, you don’t need to set up an SSL cert on your server because
  **plex.tv** handles logins. This service gives you peace of mind that no one can unencrypt your credentials,
  and you don't have to worry about setting up SSL.

- **Lots of apps**: Plex is very popular and has been around for a while. Because of this, you can run the Plex
  client on anything phones to desktops to gaming consoles.

#### Cons

- **Closed Source**: Plex Media Server is not open source. That means you can’t see or modify the code to your
  liking, and if the company goes under, the code could be left abandoned.

- **Paid Premium**: Some features that Plex offers, such as additional users, cost money. However, the basic
  functionality is free.

### Emby

Emby Media Server is another popular and mature media server.

#### Pros

- **Lots of apps**: Like Plex, you can choose from plenty of apps with Emby. You can run a client from your phone,
  desktop, smart tv, or gaming console.

#### Cons

- **Closed Source**: Plex Media Server is not open source. That means you can’t see or modify the code to your
  liking, and if the company goes under, the code could be left abandoned.

- **Paid Premium**: Some features that Emby offers cost money. However, the basic functionality is free.

- **Manual SSL**: If you want to secure your login credentials, you need to configure SSL manually.

### Jellyfin

Jellyfin was forked from Emby back in 2018 when Emby closed their source code. Because of this, it is very similar
to Emby.

#### Pros

- **Open Source**: Jellyfin is the only fully open-source option on this list. This fact allows you to view the source
  code for bugs and contribute to it. It also enables you to fork the project if the current maintainers abandon it or
  take it in another direction you’re unhappy with it.

- **No Paid Premium**: Jellyfin and all of its features are completely free to use.

#### Cons

- **Manual SSL**: Like Emby, if you want to secure your login credentials on a public server, you need to configure SSL
  manually.

- **Few apps**: Because Jellyfin is new, the developers are still working on applications for most platforms. However,
  there is a web application as well as Android&reg; and iPhone&reg; applications.

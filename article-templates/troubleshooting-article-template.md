---
permalink: article-title/
audit_date:
title: 'Article title'
type: article
created_date: 'yyyy-mm-dd'
created_by: First Last
last_modified_date: 'yyyy-mm-dd'
last_modified_by: First Last
product: Cloud Product
product_url: cloud-product
---

Provide a descriptive title for the article that begins with the imperative verb "Troubleshoot" in the metadata above. For example: Troubleshoot remote access to SQL Server.

Troubleshooting articles can be specific to an individual task, such as [Troubleshoot DNS issues](/how-to/troubleshooting-dns-issues), or can cover an entire product, such as [Troubleshoot Cloud Backup](/how-to/cloud-backup-troubleshooting).

Begin the article by describing the issue that the user needs to solve. The primary audience for How-To content is Rackspace customers and Support staff, who might have varying levels of technical expertise.

Write your article in Markdown. For more information about writing in Markdown, see the [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

For general writing guidelines, see the [contribution guidelines](https://github.com/rackerlabs/rackspace-how-to/blob/master/CONTRIBUTING.md).

### Section (repeat as necessary)

Provide a descriptive heading for this section that begins with an imperative verb. For example: Open TCP ports.

In these sections, provide whatever information is appropriate to the topic.

If your troubleshooting steps require a numbered procedure, be sure to list steps in numbered order and limit each step to a single action. You can add additional information related to a step in an indented paragraph. For example:

1. Open the **Run** window, type **cliconfig**, and ensure that the TCP/IP protocol is enabled.

2. Verify that the SQL Server service is started.

   - *(SQL Server 2005, 2008, and 2008 R2)* Select **Start > Administrative Tools > Services**, and verify that the **SQL Server (MSSQLSERVER)** service is started.
   - *(SQL Server 2012, 2014, and 2016)* Use the Windows key or hover the mouse pointer over the lower-left corner of the desktop, select **Administrative Tools > Services**, and verify that the **SQL Server (MSSQLSERVER)** service is started.

3. Create more steps as needed.

       To display code in a block, indent code samples by four spaces in regular text and increase the indent as necessary in lists (as shown here).

Conclude with a brief description of the end state. You can create as many sections as needed to solve the issue described in the introduction of the article. Be sure to use a descriptive title for each section.

For guidance on when to use diagrams and screenshots, see the [Screenshot and diagram guidelines](http://rackerlabs.github.io/docs-rackspace/style-guide/screenshot-diagram-guidelines.html).

#### Section subtopic (repeat as necessary)

Any subtopics related to a section should use the next level heading. Follow the preceding guidelines for subtopics.

### Next steps (optional)

Include any links to articles that your audience should read next.

### Related articles (optional)

Include any links to related content. Use a bulleted list if you have more than one link. For example:

- [Create an image from a server and restore a server from a saved image](/how-to/create-an-image-from-a-server-and-restore-a-server-from-a-saved-image)
- [About Cloud Server images](/how-to/about-cloud-server-images)

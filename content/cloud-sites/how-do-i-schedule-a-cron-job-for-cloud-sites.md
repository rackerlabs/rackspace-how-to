---
permalink: how-do-i-schedule-a-cron-job-for-cloud-sites/
audit_date:
title: Schedule a cron job for Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-04'
last_modified_by: Justin Taylor
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

Before scheduling a task, take a minute to review the five necessary
components in creating a scheduled task on Cloud Sites:

1. Task Name - You will need to name each cron job you schedule. The
name you choose is completely up to you and does not have any specific
requirements.

2. Email Address for Output - You will need a valid email address so you
can receive notice once the job has completed. You may have to tune your
spam filter settings to receive the desired status emails.

3. Command Language - What language is the script to be executed written
in? The Rackspace Cloud supports the scheduling of scripts which execute
in the following environments:

    * PHP
    * Python
    * Perl
    * HTTP

Items to note about the scripting language options:

-   The "Perl" option can also be used to execute shell scripts.
-   The "HTTP" option causes a visit to the URL you provide (technically
    running "curl <URL>" for the cron task).  The output is sent
    to the task log in your webroot's "logs" directory.

4. Command to Run - You'll need to indicate the path to the script that
you wish to be execute.

5. Frequency / Date / Time - How frequently do you want the task to run?
Everyday? Once a week? Once a week on a certain day of the week? Once a
month? Once a month on a certain day of the month? What time of day do
you want the specified task to run? All of these variations are possible
through the Classic Cloud Control Panel.

### Schedule a new task

Following is an example of setting up a new scheduled task in the Cloud Sites
Control Panel.

1. Log into the Cloud Sites Control Panel at <https://manage.rackspacecloud.com>.

2. Click on **Hosting** on the left navigation menu and then click on **Cloud Sites**.

3. Click on the site to which you want to add a cron backup.

4. Click on the **Features** tab on the top navigation bar.

5. Scroll down to the section called "Scheduled Tasks (Cron Jobs)"". This
is where you will see all tasks that you have scheduled and their status
for that particular domain.

6. Add a new task by clicking the **Add New Task** button.

  **Note:** All newly created cron jobs are enabled by default.

7. Enter a task name. For this example, let's call our task as "Wake Me
Up".

8. Enter the email address where you want the output from your task to
be sent. For this illustration, we'll enter **sleepyuser@myhome.com**.

9. The script that was chosen is written in Perl. So we'll choose Perl
as the command language.

10. Under the **Command to Run** option, it's important to note that the
top-level fully qualified path will be appended to the script path. Now
the fully qualified path to our script is:

        /mnt/Target01/123456/www.wakeupcall.com/scripts/wakemeup.pl

In this case, we would only have to enter "scripts/wakemeup.pl" in the
field. "/mnt/Target01/123456/www.wakeupcall.com/" will automatically be
appended. Please also note that the trailing slash is automatically
added.


11. The next section involves scheduling the time when the job needs to
be run. In our case, we want the script to run every day at 7:00AM. So
we would change the selection under "Repeat by the: \_\_" drop down menu
to "Day." In the "Time" field, we would enter "7:00."

12. Click the **Add Task** button at the bottom and the cron job will be
enabled.

**Note**: When you add a website through the Cloud Sites Control Panel,
a log directory is also created as a part of the website directory
structure. In order for the cron tool to run properly, this directory
structure must be preserved.

If you have any other questions on scheduling a task, please do not
hesitate to contact our support team.

---
permalink: managing-password-policies/
audit_date:
title: Managing password policies
type: article
created_date: '2014-08-18'
created_by: Marcin Stangel
last_modified_date: '2015-03-05'
last_modified_by: Jered Heeschen
product: Cloud Servers
product_url: cloud-servers
---

By default after system installation, most Linux distributions have
relaxed rules regarding how often you must change your password, or how
long you need to wait until you can change it again. This article
provides guidelines for changing these relaxed rules to strengthen
password security.

### Setting policies for future new user accounts

Password policies for user accounts that will be created are being
stored in the **/etc/login.defs** configuration file. This file contains
couple of very useful options:

-   `PASS_MAX_DAYS`: Maximum number of days a password may be used.
-   `PASS_MIN_DAYS`: Minimum number of days allowed between
    password changes.
-   `PASS_MIN_LEN`: Minimum acceptable password length.
-   `PASS_WARN_AGE`: Number of days that warning is given before a
    password expires.

By default these options are set to the following values:

    PASS_MAX_DAYS 99999  PASS_MIN_DAYS 0  PASS_MIN_LEN 5  PASS_WARN_AGE 7

As you can see, these settings allow you to keep your password almost
forever, allow you to change it as many times as you want, and set a
very low length limit on the password itself.

If you wanted to change these default values to values that are more
secure, you could, for example, revise them as follows:

    PASS_MAX_DAYS 60  PASS_MIN_DAYS 5  PASS_MIN_LEN 8  PASS_WARN_AGE 7

These new rules would apply to all newly created accounts. Passwords for
these accounts would have to be 8 characters long and last only 60 days,
and users would not be able to change them for 5 days, counted from the
day the password was set. Users would also receive a warning 7 days
before the password expired.

### Setting policies for existing user accounts

Changes in the **/etc/login.defs** file apply only to accounts that are
created after the changes are implemented; they don't apply to accounts
that already exist.

You can, however, change the same settings (or even more) on existing
accounts by using the `chage` command.

The `chage` command takes several arguments when you run it, but you can
also run it without any arguments (just specifying a selected user name
as an argument), and it will run in an interactive mode.

The syntax for this command is as follows:

-   `chage <username>` - Runs the command in an interactive mode.
-   `chage -l <username>` - Lists current expiration settings for
    the account.
-   `chage -d <username>` - Forces the user to change their password on
    next login.
-   `chage <options> <username>` - Sets the specified settings for
    the account.

The possible options are as follows:

-   `-M` - Maximum password age in days.
-   `-m` - Minimum password age in days. A value of 0 means that no
    minimum age is required.
-   `-W` - Password warning period in days, A value of 0 means that
    there is no warning period.
-   `-I` - Password inactive period in days, which is the number of days
    counted from the password expiration date, during which you could
    still log in and change your password. After that grace period ends,
    the account is inaccessible.
-   `-E` - Account expiration date. You can specify the date in many
    formats, including epoch. However, user-friendly formats like
    "December 31, 2014" work

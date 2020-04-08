---
permalink: managing-password-policies/
audit_date: '2020-04-08'
title: Managing password policies
type: article
created_date: '2014-08-18'
created_by: Marcin Stangel
last_modified_date: '2020-04-08'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

After system installation, most Linux&reg; distributions have
relaxed rules regarding how often you must change your password, or how
long you need to wait until you can change it again. This article
provides guidelines for changing password policy rules to strengthen
password security.

### Setting policies for future new user accounts

Cloud Servers stores password policies for new user accounts
in the **/etc/login.defs** configuration file. This file contains
a couple of useful options:

- `PASS_MAX_DAYS`: Maximum number of days you can use a password.
- `PASS_MIN_DAYS`: Minimum number of days allowed between password changes.
- `PASS_MIN_LEN`: Minimum acceptable password length.
- `PASS_WARN_AGE`: Number of days before a password expires for giving a warning.

By default, Cloud Servers sets these options to the following values:

    PASS_MAX_DAYS 99999  PASS_MIN_DAYS 0  PASS_MIN_LEN 5  PASS_WARN_AGE 7

These settings allow you to keep your password almost
forever, change it as many times as you want, and set a
low length limit on the password itself.

The following example shows password policy rules that are more secure than
the default settings:

    PASS_MAX_DAYS 60  PASS_MIN_DAYS 5  PASS_MIN_LEN 8  PASS_WARN_AGE 7

These new rules apply to all newly created accounts. Passwords for
these accounts have to be 8 characters long and last only 60 days,
and users cannot change them for 5 days, counted from the
day they set the password. Users also receive a warning 7 days
before the password expires.

### Setting policies for existing user accounts

Changes in the **/etc/login.defs** file apply only to accounts that users
create after the changes are implemented; they don't apply to accounts
that already exist.

You can, however, change the same settings on existing accounts by
using the `chage` command. For example:

    chage <options> <username>

You can also run `chage` with only a username, and it opens an interactive mode
for you to adjust the settings for the password policy.

The syntax for this command is as follows:

-   `chage <username>` - Runs the command in an interactive mode.
-   `chage -l <username>` - Lists current expiration settings for
    the account.
-   `chage -d <username>` - Forces the user to change their password on
    next login.
-   `chage <options> <username>` - Sets the specified settings for
    the account.

You can use the following options with the `chage` command:

- `-M` - Maximum password age in days.
- `-m` - Minimum password age in days. A value of 0 means that no
  minimum age is required.
- `-W` - Password warning period in days, A value of 0 means that
  there is no warning period.
- `-I` - Password inactive period in days, which is the number of days
  counted from the password expiration date, during which you could
  still log in and change your password. After that grace period ends,
  the account is inaccessible.
- `-E` - Account expiration date. You can specify the date in many
  formats, including epoch. However, user-friendly formats like
  "December 31, 2014" work

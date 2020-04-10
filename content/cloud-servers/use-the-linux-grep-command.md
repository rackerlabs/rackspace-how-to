---
permalink: use-the-linux-grep-command/
audit_date: '2020-04-02'
title: Use the Linux grep command 
type: article
created_date: '2020-03-25'
created_by: John Garcia
last_modified_date: '2020-04-06'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article explains how to start using the `grep` command in Linux&reg;.

### What is `grep`?

You use the `grep` command within a Linux or Unix-based system to perform text searches for a defined criteria of words or strings.  `grep` stands for **G**lobally search for a **R**egular **E**xpression and **P**rint it out.

### `grep` syntax

The following example shows the basic command structure:

    grep 'string' filename(s)

This command searches for and returns any lines of text that contain the given criteria *string* in *filename(s)*.

**Options:** 

You can add any of the following options individually or in combination to refine your search:

- **-i**: Prints lines with matching criteria while ignores casing (Upper/Lowecase).
- **-l**: Prints filenames only.
- **-n**: Prints lines with matching criteria and line numbers.
- **-c**: Prints count of lines with matching criteria.
- **-v**: Prints lines not matching criteria (inverse search).
- **-w**: Prints whole word matches.
- **-A n**: Prints *n* lines after matches.
- **-B n**: Prints *n* lines before matches.
- **-C n**: Prints *n* lines before and after matches.

### Sample `grep` commands with output

**Example:  file "example.txt" contains the following 5 lines:**

    hello world
    Hello World
    Hello Worlds
    Hello Moon
    321 Goodnight

**Basic command: Find and print an exact match for "world"**  

    [root@test ~]# grep world example.txt
    hello world


**Use "-i" to ignore case** 

    [root@test ~]# grep -i world example.txt
    hello world
    Hello World
    Hello Worlds


**Use "-n" to find and print matches and include line numbers.** 

    [root@test ~]# grep -n Hello example.txt
    2:Hello World
    3:Hello Worlds
    4:Hello Moon

**Use "-c" to find and print the number of line matches.**

    [root@test ~]# grep -c hello example.txt
    1

**Use a combination of  "-c" and "-i" to refine the search.**

    [root@test ~]# grep -ci hello example.txt
    4

**Use "-v" to find and print all inverse (non-matching) lines.**

    [root@test ~]# grep -v world example.txt
    Hello World
    Hello Worlds
    Hello Moon
    321 Goodnight

**Use a combination of  "-v" and "-i" to refine the search.**

    [root@test ~]# grep -vi world example.txt
    Hello Moon
    321 Goodnight

**Use "-w" to find and print whole word matches.**

    [root@test ~]# grep -w World example.txt
    Hello World

**Use "-A n" to find and print the matches along with "n" lines after the match.**

    [root@test ~]# grep -A 2 Worlds example.txt
    Hello Worlds
    Hello Moon
    321 Goodnight

**Use "-B n" to find and print the matches along with "n" lines before the match.**

    [root@test ~]# grep -B 2 Goodnight  example.txt
    Hello Worlds
    Hello Moon
    321 Goodnight

**Use "CA n" to find and print the match along with "n" lines before and after the match.**

    [root@test ~]# grep -C 2 Worlds  example.txt
    hello world
    Hello World
    Hello Worlds
    Hello Moon
    321 Goodnight

---
permalink: networking-fundamentals/
audit_date:
title: Networking Fundamentals
type: article
created_date: '2017-01-13'
created_by: Alan Hicks
last_modified_date: '2017-01-16'
last_modified_by: Alan Hicks
product: undefined
product_url: undefined
---

# Overview

Many technical people have only a rudimentary grasp of networking
fundamentals. How does subnetting work? How are routing decisions made?
What does the MAC address actually do? While most are familiar with
these things, they lack a real grasp of what they do and how they
interact. Hopefully this article should shore up your understanding of
the entire TCP/IP suite.

## Terms / Jargon

Before we dig into the details, it's important that we review and
define a few terms that you may not have previously learned.

**node (n.) -** Any single device on a network. A node can be a
computer, a network-enabled printer, a router, a managed switch, or
something else.

**bit bucket (n.) -** That place where discarded bits are thrown.

**copper (n.) -** For purposes of this document, we are only talking
about Cat-5 and similar networking cables that send a signal down pairs
of copper wires. Many other methods of transmitting data are possible,
including fiber-opics, radio waves, even pidgeons (for very low
bandwidth purposes only of course)!  Cat-5 and it's derivatives are the
most common physical media for transmitting data however, so
canonically, copper means Cat-5 and similar cables.

**TTL (n.) -** Time to Live.  In networking, this often isn't in
seconds, but rather in nodes to traverse before dying.

**canonnical (adj.) -** The usual way.

## Binary Arithmetic

In later portions of this document, we're going to discuss binary
numbers a good deal, so it's important to have a strong grasp on them
before proceeding. As you probably already know, computers deal
exclusively with 1s and 0s.  There is no number "2" in a computer, nor
a number "3".  Every number, every letter, every pixel, every process
is expressed as a string of seemingly random 1s and 0s.  How we
determine what a particular string of 1s and 0s means is what this
section is all about.

To demonstrate, look at your hand - five fingers. You may think it's
possible to count up to five on your hand, but if you think of your
fingers as individual bits that can be turned on and off (as a
computer would), you'll realize you can count all the way to 31. If a
finger is "down", that finger is a "0". If it is up it becomes a "1".

```
Decimal      Binary
0            00000
1            00001
2            00010
3            00011
4            00100
5            00101
6            00110
7            00111
8            01000
9            01001
10           01010
11           01011
12           01100
13           01101
14           01110
15           01111
16           10000
..           .....
31           11111
```

Those of you who are particularly smart are thinking "Hmmm.... binary
means two, right?  What are the powers of 2?"

```
Power        Decimal        Binary
0            1              00000001
1            2              00000010
2            4              00000100
3            8              00001000
4            16             00010000
5            32             00100000
6            64             01000000
7            128            10000000
```

We could go further out to the nth power, but this is as far as we need
to go for most practical purposes.  Here you can easily see what I call
the "Staircase of Two".  Each power of 2 shifts the "1" to the left
just a single bit.  Compare the above "base 2" table to the more
familiar "base 10" table.

```
Power        Decimal        Base Ten
0            1              00000001
1            10             00000010
2            100            00000100
..           ...            ........
7            10000000       10000000
```

Here you can easily see the "ones place", the "tens place", the
"hundreds place" and so on.  In binary, we have the same thing, except
that we have a "ones place", a "twos place", a "fours place", an
"eights place" and so on.

Looking back at the binary table, you can see that by adding these
together, we can quickly create any number we choose.  Let's assume we
want to find the binary value of 47.  To do this easily, we simply find
the largest power of two that's smaller than 47, and put a "1" in that
power's place.  Then we subtract that value, and continue on down the
line.  So what's the largest power of 2 that's not larger than 47?  32
is smaller, and 64 and above are too big, so we know that the first "1"
in our binary number will be in the sixth spot from the right (never
forget that the first place is the power of zero.  Computers start
counting at zero, and you should too).

  `47 - 32 = 15`

Our binary number looks something like this now.

  `001?????`

What's the largest power of 2 that's not larger than 15?  Well, the
next "place" in binary is 16, but that's too large, so we'll put a "0"
there.

  `0010????`

8 works!  So there will be a "1" in the fourth place from the right.

  `15 - 8 = 7`

  `00101???`

  `7 - 4 = 3`

  `001011??`

  `3 - 2 = 1`

  `0010111?`

  `1 - 1 = 0`

  `00101111`

Decimal 47 is Binary 00101111.  That wasn't so bad was it?  Working in
reverse is even easier.  What's the value of  11011001?  To figure this
out, we simply find the decimal value for each "1" and ignore the
values for each "0".

  `11011001 = 128 + 64 + 16 + 8 + 1 = 201`

An alternative way to look at this is to say that "11011001" has 1 128,
1 64, 1 16, and so on.

  `11011001 = (1 * 128) + (1 * 64) + (1 * 16) + (1 * 8) + (1 * 1)`

You can also look at the decimal (base 10) number the very same way.

  `201 = (2 * 100) + (0 * 10) + (1 * 1)`

Now that you know binary, not only can you count to 31 on one hand, but
you can also understand concepts like IP addressing and subnetting.










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

# Five Layers at a Glance

The TCP/IP suite makes use of five different layers to get its job
done. (This isn't strictly true. There are a couple of other layers
that come into play, but you will rarely run into them unless you are
doing exotic things like multi-casting.) You can think of the layers in
much the same way that you think of a stack of blocks.  At the bottom
is the physical layer, and at the top is the application layer.  Things
start at the top and slowly work their way down the layers to create a
network frame.  Each of these layers will be briefly explained now; we
will go into more depth in later sections.

## Physical Layer

The lowermost layer in our stack of blocks is the physical layer. This
layer consists of basically any physical part of your network.
"Physical" is a bit of a misnomer though, as it includes non-physical
transmission media such as light or radio signals.  Basically anything
that is capable of actually transmitting data is part of the physical
layer.  This includes network cards, copper wires, fiber-optic cable,
radio waves, and even infra-red light.  The physical layer turns the
digital packet into some form of anaolgue signal that can be
transmitted to another node on the network.

## Data-Link Layer

The Data-Link Layer is the first layer of the TCP/IP stack that
actually crafts part of the packet.  This layer is also responsible for
determining what machine will receive a packet on any given
network-layer subnet.

## Network Layer

The Network Layer is responsible for addressing hosts that may or may
not be on your particular LAN.  It is the only protocol that
understands routing and can address packets to machines not on your
LAN.

## Transport Layer

The Transport Layer is responsible for communicating between the
Network layer and the Application layer.  It is responsible for
determining what application a given packet will reach.  It is also the
only layer that can guarantee data transmission.

## Application Layer

The Application Layer is responsible for formatting the data that will
be transmitted to a remote host.  It includes most of the higher order
protocols you may be familiar with such as DHCP, DNS, and HTTP. 


# Physical Layer

As we discussed, the physical layer is responsible for transforming
digital signals.  How this happens depends on the transmission media of
course.  Fiber-optic cables send light signals of course.  Copper wires
transmit data in voltage fluctuations.  Radio communications send the
signal along a certain radio frequency.  We'll only discuss the most
common (copper) below.

## 802.3 Cabling

802.3 is the IEEE spec that defines ethernet. The most common
transmission media for Internet traffic is copper cable.  Ethernet has
reached speeds of 10, 100, 1000, and even 10000 megabits per second
(Mbps).  Cabling has changed over time from incredibly thick coax cable
to thin twisted pair copper which is prevalent today.  A typical cable
consists for four pairs of copper with each pair twisted about itself.
This twists generates a small electromagnetic shield around the cable
that helps prevent interference and increases the amount of data that
can be sent through the wire in a given period of time.

A typical Cat5e cable is terminated in an RJ-45 connecter that looks
like an oversized phone jack.  Inside the cable you will find 4
different colored pairs of wire.  In 10/100 Mbps ethernet, only pairs 1
and 2 transmit data.  Pairs 3 and 4 are left vacant, but can be used to
power a remote node using Power of Etherner (PoE).

```
  Pair 1: Orange / Orange-white
  Pair 2: Green / Green-white
  Pair 3: Blue / Blue-white
  Pair 4: Brown / Brown-white
```

Unfortunately, how these pairs are wired is a little counter-intuitive,
and depends on whether you are using an intermediate hub or switch, or
if you are connecting two Network Interface Cards (NICs) directly.  The
typical way of terminating these cables is known as 568B.  A 568B
termination looks a bit like this.

```
                   RJ-45 Terminator
             ===========================
             ||  Orange-white --------||
             ||  Orange       --------||
=============||  Green-white  --------||
 Cat5e Cable ||  Blue         --------||
=============||  Blue-white   --------||
             ||  Green        --------||
             ||  Brown-white  --------||
             ||  Brown        --------||
             ===========================
```

If both ends of the cable are terminated in this fasion, then the cable
is called a patch cable.  However, if only one end is terminated in the
following fashion, then the cable is known as a crossover cable and can
connect two computers without an intervening switch or hub.

```
                   RJ-45 Terminator
             ===========================
             ||  Green-white  --------||
             ||  Green        --------||
=============||  Orange-white --------||
 Cat5e Cable ||  Brown        --------||
=============||  Brown-white  --------||
             ||  Orange       --------||
             ||  Blue-white   --------||
             ||  Blue         --------||
             ===========================
```

Those of you who are ahead of the class are wondering why this isn't
necessary if the cable is to be plugged into a hub or switch.  The
reason is that certain pairs of wire are for sending data and others
are for receiving data.  A hub or switch has these reversed.  Here's a
standard cable for a 10/100Mb ethernet connection with the pairs marked
according to whether they are to transmit or receive data.

```
        NIC                  Hub or Switch
===================       =================
||  Output  -----|| 1   1 ||---- Input   ||
||  Output  -----|| 2   2 ||---- Input   ||
||  Input   -----|| 3   3 ||---- Output  ||
||  Unused  -----|| 4   4 ||---- Unused  ||
||  Unused  -----|| 5   5 ||---- Unused  ||
||  Input   -----|| 6   6 ||---- Output  ||
||  Unused  -----|| 7   7 ||---- Unused  ||
||  Unused  -----|| 8   8 ||---- Unused  ||
===================       =================
```

Here, you would want to use a patch cable, as the NIC's Output lines up
with the hub's input and vice-versa.  A crossover cable simply handles
this for you if the two interface ports have the same pin setup.
Consider this example:

```
       NIC 1                     NIC 2
===================       =================
||  Output  -----|| 1   1 ||---- Output  ||
||  Output  -----|| 2   2 ||---- Output  ||
||  Input   -----|| 3   3 ||---- Ipnut   ||
||  Unused  -----|| 4   4 ||---- Unused  ||
||  Unused  -----|| 5   5 ||---- Unused  ||
||  Input   -----|| 6   6 ||---- Input   ||
||  Unused  -----|| 7   7 ||---- Unused  ||
||  Unused  -----|| 8   8 ||---- Unused  ||
===================       =================
```

f we were to connect a patch cable between these two NICs, no data
could flow through as each NIC would attempt to transmit and receive on
the same pairs.  But by connecting a cross-over cable...

```
       NIC 1                     NIC 2
===================       =================
||  Output  -----|| 1   3 ||---- Output  ||
||  Output  -----|| 2   6 ||---- Output  ||
||  Input   -----|| 3   1 ||---- Ipnut   ||
||  Unused  -----|| 4   4 ||---- Unused  ||
||  Unused  -----|| 5   5 ||---- Unused  ||
||  Input   -----|| 6   2 ||---- Input   ||
||  Unused  -----|| 7   7 ||---- Unused  ||
||  Unused  -----|| 8   8 ||---- Unused  ||
===================       =================
```

... everything flows smoothly.

## Voltage Transmission

So now that we know what each cable is for, and how to wire up a cable,
how does a NIC actually transmit data?  To understand this, we have to
answer the age old question: "What is digital anyway?"  A google search
will return all kinds of definitions for "digital", but none of them
are very clear unless you already understand "digital".  Here is my
simpler definition.  "Digital" is just a way of interpreting an
analogue signal.

Your copper cable always carries a voltage, and as this voltage
changes, the remote NIC interprets this change as either a 1 or a 0.
Let's assuming your NIC is capable of producing voltages between 1 and
5 volts and that above 3 Volts is considered a "1" and below 3 Volts is
considered a "0".  Voltage always changes on a curve that resembled a
sine wave (yes, you should have paid attention in your high school Trig
class).  Another one of my insanely ugly ASCII-art graphs follows.

```
  5   |                . .               .
  4.5 |              .     .          .    .
V 4   |            .         .      .        .
o 3.5 |          .             .  .           .
l 3   | ===========================================================
t 2.5 |      .                                   .               .
s 2   |    .                                       .          .
  1.5 |  .                                           .      .
  1   | .                                              .  .
      -------------------------------------------------------------
        |  0  |  |     1       |   |     1     |  |      0       |
```

This should clearly show how changing voltage, even though the change
is analogue, can be interpreted as ones and zeros digitally.

## Repeaters

A repeater is really a simple device that takes a signal in and
amplifies it.  Repeaters are necessary to send data along particularly
long cables because the signal tends to degrade at distances longer
than 100 meters.  So if you wanted to ensure the integrity of a
transmission between two nodes that were 200 meters apart, you would
use two 100 meter long cables and connect them to a repeater in the
middle.  Simple, yes?

## Hubs

Hubs are devices with lots and lots of ethernet ports and basically
"split" a cable so that a single packet reaches multiple nodes.  A
hub's singular function is to accept signals on any of its interfaces,
and propogate those signals down all of its other ports.  Basically, a
hub is nothing more than a multi-port repeater.  Use of a hub allows
one node to contact multiple other nodes.  Today, however, hubs have
fallen out of favor due to the prevalence of switches (we will discuss
switches below) for a variety of reasons. The main problem with a hub,
is that only one node may send data at a time, and each node is
reponsible for collision detection.  Collisions occur when more than 1
node attempts to send data at a time.  Most hubs are capable of
disconnecting a node that is producing more than its fair share of
collisions, preventing a single mis-behaving machine from bringing down
the entire network, but this is still far from an ideal solution.

Hubs are considered "dumb" devices, because they replicate data
unneccessarily.  Only the single machine that a packet is destined for
needs to receive the packet, but a hub has no way of knowing what that
machine is, or even where it is located.  Thus, a hub just "spams" each
signal it receives to every machine it can reach.

I am reminded of a joke told by the famous country comedian and Grand
Ole Opry star Minnie Pearl that is perhaps the best analogy to the way
a hub works that I can think of.

"I was going down to the store here in Nashville the other day and this
city slicker laughed as I walked by.  He turned around to his friend
and says 'She don't look very country to me.'  His friend he laughed
and said 'Yeah, I bet she couldn't tell a goose from a gander.'  I
tried to ignore them, but I just couldn't help myself so I walked over
and promptly told them 'Well now in Grinder's Switch we don't worry
about that, we just put 'em all in a pen together and let 'em figure it
out for themselves."

This is precisely how a hub works.  A gander (male goose) wants to talk
to the female of the species, so he goes over to Minnie Pearl and honks
at her.  She doesn't know who he wants to speak with and really doesn't
care, so she tosses him in a pen with all the other geese.  Every
animal (whether a goose or a gander) gets to hear our gander's honk,
and each ignores that honk, except the one lucky goose our gander is
addressing. 

# Data-Link Layer

This is the layer where things actually get interesting. The Data-Link
Layer is responsible for sending packets "somewhere", even if
"somewhere" isn't their final destination. We will only discuss
Ethernet (802.3) here as it is predominant. Wireless Ethernet (802.11)
is similar enough that most everything we will discuss here applies to
it as well.

## MAC Addressing

Every NIC, every switch, every modem, every device that connects to a
network has a Media Access Control (MAC) Address that is set by the
device's manufacturer and is generally considered unchangeable.  This
address uniquely identifies a single device on a network segment,
allowing us to address data for that particular device.  In an ethernet
frame, we include two of these, a destination MAC address, and the
source MAC address.

When you send a packet, the packet is tagged with your MAC address as
the "source MAC", and you will set the "destination MAC" to the address
of the node you wish to reach, or to your router's MAC address if the
final node isn't on your subnet.  This will all make more sense when we
look at the Network Layer.

## Bridges

Bridges were designed as a way of limiting collisions on a network
using hubs to connect many different machines by "partitioning" the
network.  A bridge is basically a dedicated computer with more than one
NIC that sits between two or more hubs.  A bridge works like a hub, but
with one exception.  A bridge has "brains" and can "remember" what
machines are on either "side" of it.  When it receives a packet, it
consults its memory to see if the destination MAC is on the same
interface that the source MAC was on.  If so, it discards the packet.
However, if they are on different interfaces, it propogates the packet
only along the proper interface.  A couple of diagrams may help
explain.

```
=======================                    =======================
|      Hub A          |--------------------|        Hub B        |
=======================                    =======================
    |           |                              |           |
    |           |                              |           |
==========  ==========                     ==========  ==========
| Node 1 |  | Node 2 |                     | Node 3 |  | Node 4 |
==========  ==========                     ==========  ==========
```

In this example, if Node 1 sends a packet to Node 2, the packet
traverses both hubs, so nodes 2, 3, and 4 will all see the packet. Only
node 2 will act on it, and the others will ignore it.  Obviously, this
is less efficient since every single node has to do collision detection
for three other nodes.

```
=======================     ==========     =======================
|      Hub A          |-----| Bridge |-----|        Hub B        |
=======================     ==========     =======================
    |           |                              |           |
    |           |                              |           |
==========  ==========                     ==========  ==========
| Node 1 |  | Node 2 |                     | Node 3 |  | Node 4 |
==========  ==========                     ==========  ==========
```

In this example network, if Node 1 sends a packet to Node 2, both Node
2 and the bridge see the packet.  Node 2 accepts the packet, and the
bridge silently drops the packet to the bit bucket.  Now suppose Node 1
sends a packet to Node 3.  Node 2 and the bridge will see the packet.
Node 2 will drop the packet in its bit bucket, but the bridge will send
the packet over to Hub B where both Node 3 and Node 4 will see it. Node
3 will act on the packet and Node 4 will ignore it.  This is much more
efficient as each node only has to do collision detection for two other
devices (the other node on its hub, and the bridge).  You can see how
this improves things if you have dozens or hundreds of nodes on a hub
network.  Today however, bridges have lost their role as performance
enhancers due to the prevalence of switches, and you'll soon find out
exactly why.  Bridges are primarily used today as specialized devices
such as transparent firewalls or data filters, but that is a discussion
for a future class.

## Switches

At first glance, switches are indistinguishable from hubs.  They look
identical, but the magic is all on the inside.  Whereas hubs operate
entirely on the physical layer, a switch steps up to the data-link
layer and functions more like a bridge than a hub.  If you recall from
the earlier example, every node on a hub has to do collision detection
and prevention with every other node on the hub and any other hubs that
are directly attached to it.  If a node is attached to a switch on the
other hand, it only has to avoid collisions with the switch itself. How
is this possible?  Well, that's where the magic comes in.

Imagine if you will, that every single port on a hub was a bridge. This
bridge would only send any given packet directly to the single machine
the packet is destined to.  This is exactly how a switch operates.  By
"memorizing" the MAC addresses of all devices attached to it, a switch
is capable of looking at a packet's destination, and sending the packet
out only the single port that the destination node is attached to.
This means that on a switch, a machine will only see packets that are
intended for it.  Not only does this prevent collisions, but it also
increases overall throughput as multiple machines may send packets at
the same time.

```
=================================================================
|                            Switch A                           |
=================================================================
  | 1 |      | 2 |      | 3 |      | 4 |      | 5 |      | 6 |
  =====      =====      =====      =====      =====      =====
    |          |          |          |          |          |
    |          |          |          |          |          |
========== ========== ========== ========== ========== ==========
| Node A | | Node B | | Node C | | Node D | | Node E | | Node F |
========== ========== ========== ========== ========== ==========
```

This is a typical 6-port switch with 6 nodes attached to it.  Say that
Node A wants to send a packet to Node B.  The switch receives the
packet on port 1, looks at its ARP table, and determines that the
packet is destined for Node B, which it knows is on port 2.  The packet
is sent out port 2, and only out port 2.  Nodes C, D, E, and F never
see the packet and in fact, will never even know it existed.  Moreover,
Node C can send Node D a packet at the same time without fear of
collision, since the packets don't travel on the same physical link.

It's important to remember that switches are *not* security devices,
but rather performance devices.  It is possible to flood a switch's ARP
table and make it either crash, or convert to working as a hub
depending on the make and model.  You should never rely on a switch as
a way of preventing disclosure of information.

## ARP

ARP is a protocol used to resolve hardware addresses from network
addresses.  Canonically, this means that if you know a node's IP
Address, you'll use ARP to discover its MAC Address.  Simple, right?
ARP packets are non-routable, so they will only tell you the MAC
Addresses of nodes on your LAN.  A typical ARP dialogue looks like
this.

  `whippoorwill:  "Hey!  Who out there is 172.30.16.19?"`

  `nightingale: "Huh?  Oh that's me!  I'm 00:B0:D0:23:62:F2."`

And now whippoorwill knows that 192.168.1.197 maps to
00:B0:D0:23:62:F2. That's really all there is to it. ARP is strictly an
Ethernet protocol and once upon a time was used to resolve addresses in
non-IP networks like Chaosnet. These days, everyone uses Internet
Protocol. In IPv6, this functionality is handled by the similar
Neighbor Discovery Protocol (RFC 4861).






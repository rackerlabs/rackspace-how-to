---
permalink: text-editors-in-linux/
audit_date:
title: 'Text Editors in Linux'
type: article
created_date: '2020-03-19'
created_by: John Abercrombie
last_modified_date: '2020-03-19'
last_modified_by: John Abercrombie
product: Cloud Servers
product_url: cloud-servers
---

## Text Editors in Linux

The two command line text editors in Linux are called:

- Vim
- Nano

These are the two options available to you should you ever need to write a script, edit a configuration file, create a virtual host, or just jot down a quick note for yourself when your pen and paper decide that today is a great day for a mutiny. These are but a few examples of what you can do with these tools.

While these tools may seem daunting at first, it behooves any Linux user to become accustomed with at least one. Ask any Linux Administrator or regular user, and you’ll soon find that everyone has their favorite. In that vein, let’s find out what these two are all about, and how they differ from one another.

## Vim

Vim comes from Vi Improved since it is the successor of an older editor called vi. Since this editor (through its predecessor) has been around a long time, it is usually favored by Linux Admins or coders. It is typically the text editor used when someone is familiar with Linux. The reason for this is that it can have a bit of an uphill learning curve to it, but rest assured, anyone can learn it.

Vim can be used to edit, write, and save a document from the command line. It does this through the use of two different modes:

- Command
- Insert

The default mode that the vim editor opens in is command mode. In order to open the vim editor, you’ll use the following in the command line:

```sh
$ vim (name of file)
OR
$ vim (full path of file)
```

In order to start writing or editing, you’ll want to enter insert mode. You accomplish this by hitting the letter [i] on your keyboard. “I” for insert. You’ll see “---INSERT---” at the bottom of your terminal page if you’ve done it correctly. This tells you that vim is ready for you to get to work.

When you are finished typing, and you want to save your work, you’ll need to exit Insert mode. It’s really easy to do. Just hit the [ESC], or escape, key. This will place you back in Command mode. Here is where you can save your work.

After you’ve hit escape, the next two buttons you’ll need to press are [shift] + [;]. Basically, you’re wanting to type a colon. The bottom of your terminal screen will have changed to reflect that you’ve done it correctly. You’ll now see a ‘:’ where the ‘---INSERT---’ used to be.

Once you see the ‘:’ in the lower left-hand corner of your vim editor, you can hit the [w] button, followed by [Enter], to save your work. Then, you can either hit [i] again to go back into Insert mode if you wanted to continue writing, or you can quit the file. To quit, you would hit [shift] + [;] again, then once you see the [:] button in the lower left, you would hit the letter [q] followed the [Enter] key. This will save your file and close vim. You’ll see your usual terminal screen again.

Both the save and quit functions can be entered at the same time. You are correct. In other to save and quit vim in one swoop, you’ll enter [wq] after the ‘:’ and hit [Enter]. The file will save and close.

If you start working on a file, but you change your mind. You are a strong, independent Linux user who don’t need no text editor, and you just want to exit without saving. Fear not, that is possible too. To do this, you’ll want to enter Command mode ([Esc], [shift] + [;]). Once you see the ‘:’ at the lower left, you’ll enter [q!]. This will force quit vim without saving. As you may have guessed, the [!] key is the force function.

Those are the keys that you are going to be using 99% of the time, but just in case, for that 1%, here is a quick cheat sheet for vim.

# Vim Editor Commands Cheat Sheet

    > h = moves cursor to the left by one character; this also works by hitting the left arrow
    > j = moves the cursor one line down; this also works by hitting the down arrow
    > k = moves the cursor  one line up; this also works by hitting the up arrow
    > l = moves the cursor to the right by one character; this also works by hitting the right arrow
    > w = moves the cursor one full word to the right
    > b = moves the cursor one full word to the left
    > 0 = moves the cursor to the beginning of the current line
    > $ = moves the cursor to the end of the current line
    > ~ = changes the case of the current character
    > dd = deletes the current line
    > D = deletes everything on the line to the right of the cursor’s current position
    > x = deletes the current character
    > u = undo the last command
    > . = repeats the last command
    > :w = saves current file, but does not exit
    > :wq = saves current file, and quits

These following commands also will place you into Insert Mode:

    > i = inserts to the left of the current cursor position
    > a = appends to the right of the current cursor position
    > dw = deletes the current word
    > cw = changes the current word

As stated earlier, 99% of the time you will use the arrows, w, q, i, :, and ! keys. The beauty of the vim editor is you can be as basic or as fancy as you like with it. Make it yours. Be you. Vim doesn’t judge.

## Nano

Nano is the new editor in town. It’s claim to fame is that it’s simpler and easier to use.

Let’s dive right in. In order to open a nano file, type to following into the command line:

```sh
$ nano (name of file)
OR
$ nano (full path of file)
```

Once the nano editor opens, you can begin typing. When you’re ready to save your work, you’ll type [Ctrl] + [o]. This is called a “write out”. It saves your current work while allowing you to continue your work. If you’re done with your work, you can save and quit by typing [Ctrl] + [x]. When a file is saved in nano, it color codes your current work based on what you’re writing. Don’t be alarmed! This is normal.

Another major difference with nano is the editor will list out the commands you can use within the editor. It’s time for another text editor cheat sheet! One thing to note is that the commands will be presented as ‘^G’. What this refers to is pressing [Ctrl] + [g], for example.

## Nano Editor Commands Cheat Sheet

    > ^G = Get Help
    > ^X = Exit : Nano will ask if you want to save with a ‘Y’ or ‘N’ option following.
    > ^O = Write Out : Also known as save.
    > ^R = Read File : Enter the name of a file you want to paste into the current document at your cursor’s position
    > ^W = Where Is : Search function
    > ^\ = Replace
    > ^K = Cut Text
    > ^U = Uncut Text
    > ^J = Justify
    > ^T = To Spell
    > ^C = Cur Pos : Fancy way of saying cancel save
    > ^_ = Go to Line

As always, you can use the man pages to find out more in-depth answers. The commands are ‘man vim’ or ‘man nano’, respectively.

Try both out, and see which one works best for you. There is no right or wrong choice, regardless of what any Linux user tells you. Whether your Team Vim or Team Nano, there’s a text editor for you.

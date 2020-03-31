---
permalink: command-line-text-editors-in-linux/
audit_date: '2020-03-31'
title: 'Command-line text editors in Linux'
type: article
created_date: '2020-03-19'
created_by: John Abercrombie
last_modified_date: '2020-03-31'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

There are two command-line text editors in Linux&reg;: vim and nano.

You can use one of these two available options should you ever need to write a script, edit a configuration file, create a virtual host, or jot down a quick note for yourself. These are but a few examples of what you can do with these tools.

While these tools might seem daunting at first, any Linux user should become accustomed to using at least one. Ask any Linux Administrator or regular user, and you soon find that everyone has their favorite. 

This article covers the basics of each editing tool and how they differ.

### Vim

Vim comes from Vi Improved because it is the successor of an older editor called vi. Because this editor (through its predecessor) has been around a long time, Linux Administrators or coders usually favor it. Vim is typically used by people who are familiar with Linux because it can have a bit of an uphill learning curve.

You can use vim to edit, write, and save a document from the command line. It does this through the use of two different modes:

- Command
- Insert

By default, the vim editor opens in command mode. To open the vim editor, use the following syntax at the command line:

    $ vim (name of the file)

or

    $ vim (full path of the file)

To start writing or editing, you must enter **insert** mode by pressing the letter **i** on your keyboard (“I” for insert). You should see `---INSERT---` at the bottom of your terminal page if you did it correctly.

When you are finished typing, and you want to save your work, you need to exit **insert** mode. Press the escape (**esc**) key, which places you back in **command** mode. Then you can save your work.

After you press escape, press **shift + ;**. The bottom of your terminal screen changes to reflect that you did it correctly. You now see a `:` where the `---INSERT---` was.

After you see the `:` in the lower left-hand corner of your vim editor, type `w` and then press **enter** to save your work. Then, you can either type `i` again to go back into **insert** mode if you want to continue writing, or you can quit the file. To quit, press **shift + ;** again, type `q` and then press **enter**. This saves your file and closes vim. You should see your usual terminal screen again.

You can also enter both the save and quit functions at the same time. To save and quit vim in one command, type `wq` after the `:` and then press **enter**. The file saves and closes.

If you start working on a file, but you change your mind, you can exit without saving. To do this, enter **command** mode by pressing **esc** followed by **shift + ;**. After you see the `:` at the lower left, enter `q!`. This force-quits vim without saving. `!` is the force function.

Those commands are the ones that you are going use most of the time, but you can use the following cheat sheet if you want to do more complex actions with vim.

#### Vim editor cheat sheet

Use the following commands in **command** mode:

- `h` - Moves the cursor to the left by one character; you can also press the left arrow.
- `j` - Moves the cursor one line down; you can also press the down arrow.
- `k` - Moves the cursor  one line up; you can also press the up arrow.
- `l` - Moves the cursor to the right by one character; you can also press the right arrow.
- `w` - Moves the cursor one full word to the right.
- `b` - Moves the cursor one full word to the left.
- `0` - Moves the cursor to the beginning of the current line.
- `$` - Moves the cursor to the end of the current line.
- `~` - Changes the case of the current character.
- `dd` - Deletes the current line.
- `D` - Deletes everything on the line to the right of the cursor’s current position.
- `x` - Deletes the current character.
- `u` - Undo the last command.
- `.` - Repeats the last command.
- `:w` - Saves current file, but does not exit.
- `:wq` - Saves current file, and quits.

The following commands place you into **insert** mode:

- `i` - Inserts to the left of the current cursor position.
- `a` - Appends to the right of the current cursor position.
- `dw` - Deletes the current word.
- `cw` - Changes the current word.

### Nano

Nano is a newer text editor in Linux systems. It’s simpler and easier to use than vim.

To open a file with nano, use the following syntax at the command line:

    $ nano (name of the file)
    
or

    $ nano (full path of the file)

After the nano editor opens, you can begin typing. When you’re ready to save your work, press **ctrl + o**, which is called a *write out*. It saves your current work while allowing you to continue your work. If you’re done, you can save and quit by pressing **ctrl + x**. When you save a file in nano, your current work is color-coded based on what you’re writing.

Another major difference with nano is that you can access a list of commands within the editor, but you can use the following cheat sheet as well. 

#### Nano editor cheat sheet

**Note:** The commands in the following list use `^` to indicate that you should press the **ctrl** key along with the other key. For example `^G` means that you should press **ctrl + G**.

- `^G` - Get Help.
- `^X` - Exit. Nano then asks if you want to save with a `Y` or `N` option.
- `^O` - Write Out; also known as save.
- `^R` - Read File. Enter the name of a file you want to paste into the current document at your cursor’s position.
- `^W` - Where Is; Search function.
- `^\` - Replace.
- `^K` - Cut text.
- `^U` - Uncut text.
- `^J` - Justify.
- `^T` - To spell.
- `^C` - Current Position; Cancel save.
- `^_` - Go to line.

You can use the man pages to find out more in-depth information about each text editor. The commands are ‘man vim’ or ‘man nano’, respectively.

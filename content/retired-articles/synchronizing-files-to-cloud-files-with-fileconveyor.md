<!---
---
permalink: synchronizing-files-to-cloud-files-with-fileconveyor/
audit_date:
title: Synchronize files to Cloud Files with File Conveyor
type: article
created_date: '2013-01-22'
created_by: Jered Heeschen
last_modified_date: '2016-04-19'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---
--->

Many file synchronization applications exist, but few are as versatile as the open-source [File Conveyor](http://fileconveyor.org/). The File Conveyor source code is fully documented, and the tool is easy to install. In a matter of minutes, you can have the project synchronizing the local files on your server to a destination such as Rackspace Cloud Files.

Using File Conveyor to synchronize files to the content delivery network (CDN) enables you to use Ecommerce solutions like Magento or CMS applications like Drupal or WordPress with Cloud Files without relying on a plug-in to handle the file transfers.

### Prerequisites

This article documents File Conveyor version 0.3. You can run File Conveyor version 0.3 on Linux or Mac OS X operating systems. Microsoft Windows is not supported for this version.

- Your system must have Python 2.5 or later installed.
- Installation of File Conveyor requires Git and the Python package manager pip. If these are not already installed, use the following instructions:

  - You can download Git from the [project's website](http://git-scm.com/). Most Linux distributions also have Git in their main package repository, under the package name `git`.
  - If you don't have [pip](http://pypi.python.org/pypi/rackspace-novaclient/) installed, the easiest way to get it is to install the Python `setuptools` package. You can download the installer from [its website](http://pypi.python.org/pypi/setuptools).

  As an alternative you can use a Linux package manager to install `setuptools`. On most distributions the package name is `python-setuptools`.

  After you have installed `setuptools`, you can install pip by running the following command:

			  sudo easy_install pip

### Install File Conveyor

Change to the directory that you want to hold the File Conveyor files, and then run the following command:

    sudo pip install -e git+https://github.com/wimleers/fileconveyor@master#egg=fileconveyor

The File Conveyor source files are downloaded to the `src/fileconveyor` directory, relative to where you run the `pip` command. For example, if you run `pip` in the `/usr/local` directory, the File Conveyor script directory is in `/usr/local/src/fileconveyor`.

Running the installation with `sudo` (or as root) lets `pip` handle the installation of dependencies like Django and python-cloudfiles.

### Configure File Conveyor

Before running File Conveyor, you need to configure it by creating a file named `config.xml` in the same directory as the `arbitrator.py` file.

1. If you are starting in the directory that you were in when you started the installation, you can run the following command:

        sudo nano src/fileconveyor/fileconveyor/config.xml

2. For a simple configuration that will synchronize the contents of a directory with a Cloud Files container, paste the following text into the `config.xml` file:

	    <?xml version="1.0" encoding="UTF-8"?>
	    <config>
	      <!-- Sources -->
	      <sources ignoredDirs="">
	        <source name="test" scanPath="/var/www/html/test" />
	      </sources>

	      <!-- Servers -->
	        <servers>
	          <server name="Rackspace Cloud Files" transporter="cloudfiles">
	            <username>USERNAME</username>
	            <api_key>APIKEY</api_key>
	            <container>CONTAINER</container>
	          </server>
	        </servers>
	       <!-- Rules -->
	        <rules>
	          <rule for="test" label="Test">
	            <destinations>
	              <destination server="Rackspace Cloud Files" path="test" />
	            </destinations>
	          </rule>
	        </rules>
	      </config>

**Note**: "USERNAME" in the example above is your Rackspace Cloud account username.

3. Modify the configuration to fit your environment and account details:

    - In the `<sources>` section, change the `scanPath` property to the directory that you want to synchronize.

    - In the `<servers>` section, set `username` and `api_key` to match your credentials, and set `container` to the name of the container that will hold the synchronized files.

    - In the `<rules>` section set the `path` property to the subdirectory to synchronize to in the container. Leave the value blank to synchronize to the root of the container (path="").

You can perform more complex synchronizations by using multiple rules, synchronizing from  multiple sources, or having File Conveyor change the file name or some of a file's properties before copying it to Cloud Files (using "processors"). You can find details in the File Conveyor documentation and [on the project's website](http://fileconveyor.org/).

### Run File Conveyor

With the configuration set, run File Conveyor for its initial synchronization. The `arbitrator.py` script launches  File Conveyor's various components:

    sudo python src/fileconveyor/fileconveyor/arbitrator.py

The File Conveyor program runs as a console script, without an included init script or means of forking the process to run as a daemon. For testing purposes, you can run the script directly from a command line. For persistent use, you should either set up an init script or run the program from a screen session, as in the following example:

    screen python src/fileconveyor/fileconveyor/arbitrator.py

After the initial synchronization is complete, you should be able to see the results in the target container within the Cloud Control Panel.

### More options

The sample configuration provided in this article is simple, and you can do much more with File Conveyor to customize its operation for your needs. See the documentation in the source directory and the [project web page](http://fileconveyor.org/) for full details, but following are a few more options:

- Run `verify.py` to check the source directory against the Cloud Files container to confirm that the files synchronized correctly.

- This article instructs you to install and run via sudo, but File Conveyor doesn't require root privileges to run. You can also change the owner (`chown`) of the `fileconveyor` directory and its contents to an unprivileged user.

- The application runs off a Django back end source to connect to the various servers. You can safely disregard any DeprecationWarning entries in the log.

- The fewer files per minute you chose to update with File Conveyor, the more efficiently it runs. Try to stay below updating 100 files per minute for the best results.

- You can edit values in the `settings.py` file to make the locations of the SQLite databases, the `pid` file, and other system files more permanent. Following is an example:

		RESTART_AFTER_UNHANDLED_EXCEPTION = True
		RESTART_INTERVAL = 10
		LOG_FILE = '/var/log/fileconveyor.log'
		PID_FILE = '/var/run/fileconveyor/fileconveyor.pid'
		PERSISTENT_DATA_DB = '/etc/fileconveyor/persistent_data.db'
		SYNCED_FILES_DB = '/etc/fileconveyor/synced_files.db'
		WORKING_DIR = '/tmp/fileconveyor'
		MAX_FILES_IN_PIPELINE = 50
		MAX_SIMULTANEOUS_PROCESSORCHAINS = 1
		MAX_SIMULTANEOUS_TRANSPORTERS = 10
		MAX_TRANSPORTER_QUEUE_SIZE = 1
		QUEUE_PROCESS_BATCH_SIZE = 20
		CALLBACKS_CONSOLE_OUTPUT = False
		CONSOLE_LOGGER_LEVEL = logging.INFO
		FILE_LOGGER_LEVEL = logging.DEBUG
		RETRY_INTERVAL = 30

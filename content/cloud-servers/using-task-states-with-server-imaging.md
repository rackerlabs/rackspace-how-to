---
permalink: using-task-states-with-server-imaging/
audit_date:
title: Use task states with server imaging
type: article
created_date: '2013-08-28'
created_by: Brian Rosmaita
last_modified_date: '2015-06-03'
last_modified_by: Kelly Holcomb
product: Cloud Servers
product_url: cloud-servers
---

Some new task states have been exposed in the OpenStack Server Extended
Status Extension that provide more fine-grained visibility into server
state during the image-create (or "snapshot") process.  In this article,
I'll tell you what they are and make some suggestions for how you can
make use of them.

Before the OpenStack Grizzly release, when you requested a create image
action on a server, the server would go into a special "task state" of
image\_snapshot, and it would stay in this task state until the image
was completed.  This single task state hid the fact that there are three
distinct phases to a snapshot operation:

1.  The hypervisor creates an image of the server's virtual hard disk.
2.  The hypervisor packages the image and prepares it for upload to the
    image store.
3.  The hypervisor uploads the packaged image to the image store.

By far, the phase that takes the longest is the third phase, in which
the upload occurs.  Further, in both phases 2 and 3, while the
hypervisor is working on your server's behalf, it isn't doing anything
with your virtual hard disk.  So only during phase 1 is it important
that you avoid any operations that would modify data on the server's
virtual hard disk.  (Otherwise, the recorded snapshot might include
inconsistencies from which certain application programs on your
server--I'm thinking primarily of databases here--might not be able to
recover when you boot from the image.)

With the OpenStack Grizzly release, the semantics of the image\_snapshot
task state were modified slightly and two new task states were added.
 So now the task states that your server will go through while
processing an image create action are:

1.  image\_snapshot: the hypervisor is creating an image of the server's
    virtual hard disk
2.  image\_pending\_upload: the hypervisor is packaging the image and
    preparing it for upload
3.  image\_uploading: the hypervisor is uploading the image to the image
    store

While your server is any of these task states, you can't issue another
create image action on that server.  As you can see from the task state
descriptions, the hypervisor is involved in all three phases of the
image create action, so all the extra bookkeeping resources the
hypervisor has allocated to your server are in use.  You have to wait
until the entire snapshot process has completed and these resources are
released before you can create another snapshot.

Notice, however, that once the first phase is completed, you no longer
have to worry about operations occuring on your server that might
interfere with the effectiveness of your snapshot.  Unfortunately,
server task states are not currently exposed in the control panel.  You
can, however, easily check them by using the API or the
python-novaclient.

### Using the API to Check Server Task State

The task states are included in the server detail response:

GET /v2/servers/{serverId}

Here's an abbreviated JSON server detail response:

    {
        "server": {
            "OS-EXT-STS:power_state": 1,
            "OS-EXT-STS:task_state": "image_pending_upload",
            "OS-EXT-STS:vm_state": "active",
            /* ... */
            "id": "c2d5da0a-80d7-4ca7-872c-505410ab55d0",
            /* ... */
            "name": "check-my-task-state",
            "progress": 100,
            "status": "ACTIVE",
       }
    }

You're looking for the element named "OS-EXT-STS:task\_state".  (Since a
JSON object is unordered, it might not be right near the top of the
response, as it is in this example.)  From the value displayed in this
example, you can see that the hypervisor has completed creating the
image of the server's virtual hard disk and is now packaging and
preparing the image for upload.

### Using the Python-Novaclient to Check Server Task State

The python-novaclient is a handy program you can run from the command
line.  If you haven't used it before, here are some How-To
articles to check out:

-   [Installing python-novaclient on Linux and Mac
    OS](/how-to/installing-python-novaclient-on-linux-and-mac-os)
-   [Installing python-novaclient on
    Windows](/how-to/installing-python-novaclient-on-windows)

These articles will provide you with an overview of python-novaclient
and complete instructions for installing it on your operating system of
choice.

To see the task state for a server using the python-novaclient, simply
do a "show" on the server:

\$ nova show {serverId}

Here's an abbreviated response:

    +------------------------+---------------------------------------+
    | Property               | Value                                 |
    +------------------------+---------------------------------------+
    | status                 | ACTIVE                                |
    | OS-EXT-STS:task_state  | None                                  |
    | OS-EXT-STS:vm_state    | active                                |
    | id                     | 933e803f-13b0-4698-a5c7-f74ec424fd38  |
    | name                   | check-my-task-state                   |
    | OS-DCF:diskConfig      | MANUAL                                |
    | progress               | 100                                   |
    | OS-EXT-STS:power_state | 1                                     |
    | metadata               | {}                                    |
    +------------------------+---------------------------------------+

In this example, you can see that there's no task state for the server,
so it could accept an image-create request.

### Polling to Check Server Task State

The use case for server task states we're discussing here is the
ability to:

1.  Stop activities on the server that would affect the
    quality of the disk image (e.g., stop a database
    management system).
2.  Issue an image-create command (via API, novaclient, or
    control panel) for the server.
3.  Monitor the server to see when it exits the
    'image\_snapshot' task state.
4.  Restart the activities stopped before you took the
    snapshot (e.g., bring your database management system
    back up).

You can write a simple bash script to monitor your server.
 How elaborate you want the script to be is up to you, here's a sample
of the most relevant part.  (Please read through and make sure you know
what it's doing before using it.)  It uses four programs (curl, egrep,
sed, and date) that are installed by default on most linux systems.
This fragment is pretty primitive, you have to control-C to stop the
script.

    # set these vars
    #
    # the API endpoint, e.g., "https://iad.servers.api.rackspacecloud.com/v2/123456"
    API_ENDPOINT=
    # your API username, e.g., "fredco"
    API_USER=
    # your API auth token, obtained from the Rackspace cloud identity service
    API_AUTH_TOKEN=
    # the UUID of the server you want to monitor
    API_SERVER=
    # how long to pause in between requests, in seconds
    SLEEP_TIME=30
    # a temporary file, e.g., "/tmp/polling.json"
    DETAIL_FIL=

    # verify that the server exists
    API_RESP_CODE=$(curl -X GET <br>
     -k -s <br>
     -H "X-Auth-User: $API_USER" <br>
     -H "X-Auth-Token: $API_AUTH_TOKEN" <br>
     -H "Accept: application/json" <br>
     -w "%{http_code}" <br>
     -o $DETAIL_FIL <br>
     "$API_ENDPOINT/servers/$API_SERVER")
    if [ "$API_RESP_CODE" != "200" ] ; then
      echo "[error] can't find server $API_SERVER"
      exit 1
    fi

    while [ 0 ] ; do
       API_RESP_CODE=$(curl -s -k -X GET <br>
        -H "X-Auth-User: $API_USER" <br>
        -H "X-Auth-Token: $API_AUTH_TOKEN" <br>
        -H "Accept: application/json" <br>
        -w "%{http_code}" <br>
        -o $DETAIL_FIL <br>
      "$API_ENDPOINT/servers/$API_SERVER")
      if [ "$API_RESP_CODE" == "404" ] ; then
        echo "[info] server $API_SERVER has disappeared!"
        break
      fi
      RAW_STAT=$(egrep -o '"status": (".*?"|null)' $DETAIL_FIL | sed 's/"//g')
      VM_STAT=$(egrep -o '"OS-EXT-STS:vm_state": (".*?"|null)' $DETAIL_FIL | sed 's/OS-EXT-STS://;s/"//g')
      TASK_STAT=$(egrep -o '"OS-EXT-STS:task_state": (".*?"|null)' $DETAIL_FIL | sed 's/OS-EXT-STS://;s/"//g')
      POW_STAT=$(egrep -o '"OS-EXT-STS:power_state": (\d|null)' $DETAIL_FIL | sed 's/OS-EXT-STS://;s/"//g')
      TIME=$(date +"%H:%M:%S")
      echo "$TIME   $RAW_STAT   $VM_STAT   $TASK_STAT   $POW_STAT"
      sleep ${SLEEP_TIME:-45}
    done

If you start a script that contains the above fragment and then take a
server snapshot, you'll see something like this:

    17:14:41   status: ACTIVE   vm_state: active   task_state: null   power_state: 1
    17:14:44   status: ACTIVE   vm_state: active   task_state: null   power_state: 1
    17:14:48   status: ACTIVE   vm_state: active   task_state: image_snapshot   power_state: 1
    17:14:51   status: ACTIVE   vm_state: active   task_state: image_pending_upload   power_state: 1
    17:14:55   status: ACTIVE   vm_state: active   task_state: image_pending_upload   power_state: 1
    17:14:58   status: ACTIVE   vm_state: active   task_state: image_pending_upload   power_state: 1
    17:15:02   status: ACTIVE   vm_state: active   task_state: image_pending_upload   power_state: 1
    17:15:05   status: ACTIVE   vm_state: active   task_state: image_uploading   power_state: 1
    17:15:09   status: ACTIVE   vm_state: active   task_state: image_uploading   power_state: 1
        ...
    17:16:19   status: ACTIVE   vm_state: active   task_state: image_uploading   power_state: 1
    17:16:23   status: ACTIVE   vm_state: active   task_state: image_uploading   power_state: 1
    17:16:26   status: ACTIVE   vm_state: active   task_state: null   power_state: 1
    17:16:30   status: ACTIVE   vm_state: active   task_state: null   power_state: 1

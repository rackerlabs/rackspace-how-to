- [Retiring content from the Rackspace How-To content repository](#retiring-content-from-the-rackspace-how-to-content-repository)
- [Redirect the article to retired](#redirect-the-article-to-retired)
- [Make a copy of the retired article for the archive folder](#make-a-copy-of-the-retired-article-for-the-archive-folder)

## Retiring content from the Rackspace How-To content repository

Follow these steps to retire an article from a product folder of the
**rackerlabs/rackspace-how-to** repo.

1. Go to the [Rackspace How-To content folder](https://github.com/rackerlabs/rackspace-how-to/tree/master/content)
and click the product for which you want to create an article.

2. Locate the article you want to retire from the list and click on it.

3. Click on the trash can icon in the top right corner of the file window.

4. Scroll to the bottom to commit the change.  Add a description and explanation.
Select the **Create a new branch** radio button, and then click the
**Commit changes** button.

5. Complete the process to create a pull request.  After the pull request is
created, post a link in the Rackdx "how-to" slack channel for review and merge,
by using the @ht-review tag.


## Redirect the article to retired

1. Go to the [Rackspace nexus control config rewrites folder](https://github.com/rackerlabs/nexus-control)
and click the support.rackspace.com.json file.

2. Click on the pencil icon icon in the top right corner of the file window.

3. Add a block of text, similar to the following example, substituting your article details.

        {
           "description": "Redirect /how-to/first-generation-cloud-servers-sample-code/ URL to how-to/article-retired/ ",
           "from": "^\\/how-to\\/first-generation-cloud-servers-sample-code(.*)$",
           "to": "/how-to/article-retired/",
           "rewrite": false,
           "status": 301
        },

4. Scroll to the bottom to commit the change.  Add a description and explanation.
Select the **Create a new branch** radio button, and then click the
**Commit changes** button.

5. Complete the process to create a pull request.  After the pull request is
created, post a link in the Rackdx "how-to" slack channel for review and merge,
by using the @ht-review tag.

## Make a copy of the retired article for the archive folder

1. On your PC, copy the original article and paste it into the
content/retired-articles folder.

2. Commit the change and create a pull request. After the pull request is
created, post a link in the Rackdx "how-to" slack channel for review and merge,
by using the @ht-review tag.














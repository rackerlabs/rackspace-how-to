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

1. On your PC, copy the original article.

2. Go to the [Rackspace How-To retired articles folder](https://github.com/rackerlabs/rackspace-how-to/tree/master/content/retired-articles).

3. Click **Create new file**.

4. Paste the original article into the GitHub text editor. Don't forget to enter the file name in *Name your file* box at the top of the page. The file name should match the `permalink` metadata field from the original article, followed by the file extension `.md`.

5. Remove both the `product:` and `product_url:` metadata fields from the retired article.

6. Commit the change and create a pull request. After the pull request is
created, post a link in the Rackdx "how-to" slack channel for review and merge
by using the @ht-review tag.

## Remove the article from the index.md page

This step is optional and should only be completed if the article is on the index page (the intro page or the landing page) for the topic.

**Important:** Complete this step in the same PR as the one you retired the article.

1. Locate and open `index.md` found in the retired article's folder.

    You can edit the article in GitHub or in your chosen text editor after opening a new branch.

2. Remove the article's link and alt text.

3. Commit the changes and push them up to the branch where you retired the article to update the PR to the master branch.

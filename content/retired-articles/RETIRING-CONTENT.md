### GitHub Interface Instructions

- [Retire content from the Rackspace How-To content repository in GitHub](#retire-content-from-the-rackspace-how-to-content-repository-in-github)
- [Make a copy of the retired article for the archive folder in GitHub](#make-a-copy-of-the-retired-article-for-the-archive-folder-in-github)
- [Retire content using Atom](#retire-content-using-atom)
- [Redirect the article to retired](#redirect-the-article-to-retired)

### Retiring content from the Rackspace How-To content repository in GitHub

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

### Make a copy of the retired article for the archive folder in GitHub

1. On your PC, copy the original article.

2. Go to the [Rackspace How-To retired articles folder](https://github.com/rackerlabs/rackspace-how-to/tree/master/content/retired-articles).

3. Click **Create new file**.

4. Paste the original article into the GitHub text editor. Don't forget to enter the file name in *Name your file* box at the top of the page. The file name should match the `permalink` metadata field from the original article, followed by the file extension `.md`.

5. Remove both the `product:` and `product_url:` metadata fields from the retired article.

6. Commit the change and create a pull request.

After the pull request is created, post a link in the #how-to slack channel for review and merge.

### Remove the article from the index.md page

This step is optional and should only be completed if the article is on the index page (the intro page or the landing page) for the topic.

**Important:** Complete this step in the same PR as the one you retired the article.

1. Locate and open `index.md` found in the retired article's folder.

    You can edit the article in GitHub or in your chosen text editor after opening a new branch.

2. Remove the article's link and alt text.

3. Commit the changes and push them up to the branch where you retired the article to update the PR to the master branch.

### Retire content using Atom

Here is an alternative path to retire an article.

1. Create a branch for your changes, and check out that branch.

2. In Atom, move the article in question from its current location into the `retired-articles` folder.

3. Remove both the `product:` and `product_url:` metadata fields from the retired article.

4. *(Optional)* Open the `index.md` article from the original folder and remove the retired article's link from the file.

5. Commit your changes and open a PR to merge your branch from your fork into the master branch in the how-to repo.

### Redirect the article to retired

You need to install a JSON validation tool before entering the redirect.

#### Install linter on Atom

1. In Atom, open **Preferences**. On Mac, go to **Atom > Preferences**.

2. Open the **Install** tab.

3. Install `linter` and `linter-jsonlint`.

4. Open the settings for `linter` by clicking the **Settings** button on the package.

5. Ensure at least "Lint As You Type", "Highlight Error Lines in Gutter", "Show Error Panel", "Display Linter Info in the Status Bar" and "Display Linter Status Info in Status Bar" are checked. Check all of the options for ease of use.

#### Modify the rewrite file

1. In your local clone of the nexus-control repo, create a branch for your changes and check out that branch.

2. In Atom, open `nexus-control/config/rewrites.d/support.rackspace.com.json`.

3. Add the rewrite at the end of the file, substituting your article details.

    ```{
      "description": "Retire {article name}",
      "from": "^\\/how-to\\/{permalink-from-article}(.*)$",
      "to": "/how-to/article-retired/",
      "rewrite": false,
      "status": 301
    }```

4. Check your linter status.

5. Commit your changes and open a PR to merge your branch from your fork into the master branch in the nexus-control repo.

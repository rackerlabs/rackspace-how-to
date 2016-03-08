## Contributing to the Rackspace How-To content repository

This file describes the general process for maintaining source code for content published at [https://support.rackspace.com/how-to/](https://support.rackspace.com/how-to/).

Content is grouped into one directory per product. Each directory contains one file per article.

### Creating and changing articles

Use the following instructions to create a new article, make edits to an existing one, or suggest edits via an issue.

#### Create a fork of the repository

Before you create a new article or make edits to an existing one, create a *fork* of the How-to repo. 

1. In the top-right corner of the page, click the **Fork** button. 

2. In the pop-up box, select your personal GitHub account. 

A personal copy of the How-To repository is created in your GitHub account. 

Because your forked copy of the repository is not live, you need to periodically bring it back up to date. There is a status message above the latest commit activity that informs you whether your forked repo is current with the master How-To repository. If the status says `This branch is 10 commits behind rackerlabs:master`, update your repo by clicking the **Pull request** button to the right of the message.

To avoid any merge conflicts or difficulties when making a pull request, always check that your copy of the fork is up to date with the master repository.

#### Create an article

Follow these steps to create a new article within a product folder of the **rackerlabs/rackspace-how-to** repo.

1.	Go to the [Rackspace How-to content folder](https://github.com/rackerlabs/rackspace-how-to/tree/master/content) and click the product for which you want to create an article.

2.	Click **New file**.

3.	Enter a name for your article in the text box at the end of the **rackspace-how-to/content/*productName*/** string. The name should be in the format **your-article-name.md** and should reflect the title of the article.

4.	Enter header information using the format shown in the following example:

           ---
           title: Checking cloud status

           type: article

           created_date: '2016-01-29'

           created_by: Rosie Contreras

           last_modified_date: '2016-01-29'

           last_modified_by: Rosie Contreras

           product: Cloud Servers

           product_url: cloud-servers
           ---
5.	Write your article in Markdown.

6.	When you have finished writing your article, review it in the *Preview* tab.

7.	In the **Commit new file** box at the bottom of the page, create a new branch for this commit.

8.	Create a pull request (PR).

Your PR will be reviewed. Depending on the review feedback, you might be asked to make additional changes.

**Note:** If your article includes images, send an email to <how-to@rackspace.com> with the image files. Note where the images belong in the article by using comments: `<!--this is a comment-->`. 

#### Edit an article
Follow these steps to edit an existing article within a product folder of the **rackerlabs/rackspace-how-to** repo.

1. Go to the [Rackspace How-to content folder](https://github.com/rackerlabs/rackspace-how-to/tree/master/content) and click the product for which you want to edit the article.

2. Make any edits directly through the GitHub website, through a GitHub desktop client, or on the command line.

    **Note:** If you are using a desktop client or the command line, and you are forking or cloning the repo, be sure to make your changes in a new branch. Doing so ensures that you are producing a pull request (PR) rather than committing changes directly to the master.

3. When you have finished editing the article, commit the edits so that GitHub can produce a PR. If you are working in the GitHub website, be sure to select **Create a new branch for this commit and start a pull request**.

  Use the following guidelines to create a commit message:

    - Provide a brief description of the change, starting with an imperative verb. For example, "Add a paragraph about... ."
    - If you make a complex edit, explain why you are making the edit. For example, if you are changing the formatting of an article because a list should be ordered instead of unordered, say, "Switch list in middle of article to ordered to show clear progression of steps".

4. Create a PR for your branch.

Your PR will be reviewed. Depending on the review feedback, you might be asked to make additional changes.

#### Request an article change

To request a change, create an issue by clicking **Issue** near the top of this page. Describe the changes that you are requesting.

### Writing guidelines

Use the following general writing guidelines, which are described in detail in [style-guidelines.md](style-guidelines.md):

- Use sentence-style capitalization for titles and headings
- Use active voice
- Use present tense
- Write to the user by using second person and imperative mood
- Write clear and consistent step text
- Use consistent text formatting
- Clarify pronouns such as *it*, *this*, *there*, and *that*
- Clarify gerunds and participles
- Write clear and consistent code examples
- Use consistent terminology

Following are some specific guidelines for How-To content:

- For the first-level headings in an article, use the H3 level (designated by ###). Avoid using more than three levels of heading in an article (H3, H4, and H5). If you need more than three levels, you should consider breaking your article into two or more articles.

- When an article mainly provides step-by-step instructions for users to follow, begin the title of the article with an imperative verb. For example: Install the Cloud Backup agent on Windows.

- If a title contains a special character, such as a colon, enclose the title with single quotation marks.

- When code includes placeholders, show them in camelCase and enclose them in angle brackets. For example, `<hostName>`.

- To link to another article, use the following format: `[<articleName>](/how-to/<articleName>)`. For example,  `[Rackspace Email and Hosted Exchange settings](/how-to/rackspace-email-and-hosted-exchange-settings)`. Note the use of the leading slash.

- When creating complex lists, such as procedures with sublists, graphics, and code examples, use the spacing guidelines at https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#lists.

### Support and feedback

If you find a problem, open a GitHub issue.

If you need additional assistance, contact us at [devdoc@rackspace.com](mailto:devdoc@rackspace.com).

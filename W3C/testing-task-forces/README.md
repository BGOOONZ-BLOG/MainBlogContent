The documents in this repository are deliverables of the W3C Testing Task Forces. More information is available from the [Wiki](http://www.w3.org/wiki/Testing).

Editing these documents
-----------------------

These document are developed using [ReSpec][respec] which now handles [Markdown syntax][md]. The only thing you need to get start is a browser and a text editor. Make your changes to any html file and drag it into a browser, ReSpec will compile it into a properly formatted doc on the fly.

### Using GitHub

Please do not commit directly to the main repository _even if you have commit rights_.

Instead, please fork the repository to your own GitHub account, then clone it to your local repository.

    $ git clone git@github.com:{{YOUR_USER_NAME}}/testing-task-forces.git
    $ git remote add origin git@github.com:{{YOUR_USER_NAME}}/testing-task-forces.git

Also add W3C's repository as a remote repository. This will allow you to easily keep up to date with the canonical repo.

    $ git remote add w3c git@github.com:w3c/testing-task-forces.git

When you want to work on a new feature, please first update your local repository with whatever changes have been made to W3C's repository.

    $ git fetch w3c
    $ git rebase w3c/gh-pages gh-pages
    
You may then create a feature branch:

    $ git checkout -b {{YOUR_FEATURE_NAME}}

Once you're satisfied with your changes, commit and push them to your own GitHub repository:

    $ git commit -m "{{YOUR_COMMIT_MESSAGE}}"
    $ git push origin gh-pages

Navigate to your GitHub account and send [pull requests][pr] to the main repository from there.

Please note that the main branch is `gh-pages`, as this allows automatically publishing the document on GitHub pages as described in [Using GitHub for Spec Work][specs-on-github].

### References

* [ReSpec documentation][respec]
* [Markdown Syntax][md]
* [Using GitHub for Spec Work][specs-on-github]

[respec]: http://dev.w3.org/2009/dap/ReSpec.js/documentation.html
[md]: http://daringfireball.net/projects/markdown/
[specs-on-github]: http://tobie.github.com/specs-on-github/
[pr]: https://help.github.com/articles/using-pull-requests
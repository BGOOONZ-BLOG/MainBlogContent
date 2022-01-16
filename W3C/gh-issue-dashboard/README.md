## W3C GitHub Issue Dashboard

A Web app to keep tabs on github issues used in W3C Repos. Improvements welcome!

See it in action at https://www.w3.org/Tools/gh-dashboard/

## Configurable views
You can easily create new views of github issues by creating [HTML files with Mustache templates](app/templates/), and then adding a reference to said file in the `templateUrls` in [app/scripts/main.js](app/scripts/main.js).

Templates are populated with an `issues` object that contains the list of issues and pull requests obtained from the repo via the [Github API](https://developer.github.com/v3/issues/). You can use the `filter` and `group_by` helpers to select which issues should be displayed where (see the [Issues sorted by a label-based state](app/templates/label-state.html) as an example).

Templates are expected to self-document themselves with an element of id `doc` whose content will be inserted at the bottom of the generated views.

Ideally, templates should be re-usable across repos / groups, so try and make them generic if possible, and improve existing templates rather than forking them. But this is early days with this tool, so do not feel to constrained either :)

## Adding a repo to the dashboard
Repos listed in the repository selector are the ones registered in ash-nazg. The app will also happily read from any repo in the @w3c organization account.

(MIT License) - Copyright (c) 2014 Ilya Grigorik


# gh-backup

Automatic backing up of GitHub repositories for the W3C organisation.

## Installation

Just clone the repo wherever you want it. Then call:

    npm install -d

At its root. If you want the `gh-backup` command to be available in your path, just:

    npm link .

and you'll be good to go.

## Usage

### gh-backup help

Prints a help message.

### gh-backup version

Prints the version.

### gh-backup init /path/to/configuration

Initialises the backup. You need to call this the first time you get a backup running. The
configuration is described below. Note that this only backs up public repositories because it only
gets those from the GitHub API.

### gh-backup update /path/to/configuration

Updates the backup. You should probably call this as a cronjob.

## Configuration

The `init` and `update` commands take a configuration file. It's a simple JSON file, with the
following keys:

* `dataDir`: Path to a directory in which to store information, notably all the backed up
  repositories. Required, created for you if it doesn't exist (its parent needs to be there).
* `pheme`: The URL to the root of the Pheme API that this should get its information from about
  updated repositories (including trailing slash). E.g. `https://labs.w3.org/hatchery/pheme/`.
  This is required. The reason for this is that using git to check for updates in 250+ repositories
  can be very slow; this API call immediately lists the repositories that have been touched since
  the last update (or init).
* `console`: If true, will log to the console.
* `logFile`: If set to a path, logging goes there.
* `debug`: If set to true, extra information is dumped and only the first five init repos (or
  udpates) are processed. Only use this to check that a code change you've made is correct, without
  cloning gigabytes of information from GitHub.

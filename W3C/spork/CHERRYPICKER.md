
# `cherry-picker.js`

The cherry picker (so called because it is intended to replace the humans who did this job) is a
script that wraps `spork` and is meant to run as a cron job in order to carry out the publication.
It accepts the following arguments:

* `--config path`, `-c path`. The required path to a JSON configuration file (described below).
* `--force`, `-f`. By default if there are no changes to the HTML source the tool does nothing; this
  forces a regeneration.
* `--quiet`, `-q`. By default the script logs a lot of information to the console. This switches
  that off (it will keep logging to any specified log file and sending errors to a given email
  address if specified).
* `--publish`, `-p`. By default the script produces an Editor's Draft; this switches it to produce
  a Working Draft. This also make it call the automatic publishing system to request publication of
  the draft.

## Configuration

The cherry picker needs the additional properties in the configuration file:

* `production`. When set to true (on the production installation and **never** on the development
  copy) this causes the picker to check *itself* for updates, and to `git pull` if needed. When this
  happens, on the next invocation of the cron job the HTML will also get regenerated.
* `pubDir`. Required in `publish` mode, replaces `outDir`.
* `pubLogFile`. Same as `logFile` but for `publish` mode.
* `token`. The Echidna token. If absent, automatic publication will fail.
* `echidnaURL`. The URL to give to Echidna for publication. For HTML this is a manifest file.
* `decisionURL`. The link to a decision by the group to publish.
* `email`. If you wish to be notified of problems over email (highly recommended) you will need to
  detail this object. You will receive all failures that cause the spec not to be built, notably
  changes to the source that make it impossible for the system to apply a given transformation.
    * `to`. Who to send it to.
    * `from`. Who it's from.
    * `host`. The SMTP service.
    * `port`. The SMTP port.
    * `username`. The username for the SMTP service.
    * `password`. And password.
    * `ssl`. Whether to access SMTP over SSL.
    * `tls`. Same for TLS.
    * `level`. The level to send over email. It is recommended to use `error`. Switching to `info` will
      get you an email for every run of the tool.
    * `handleExceptions`. Set to true to get exceptions (that kill the process) sent to you in email.
      Recommended.

# tweetie

Reports on IRC when the user is mentioned on Twitter, allows to reply or tweet

## Dependencies

* POE, POE::Component::IRC, POE::Component::IRC::Plugin::BotCommand (Debian packages `libpoe-perl` and `libpoe-component-irc-perl`)
* Net::Twitter::Lite::WithAPIv1_1 and Net::OAuth (Debian packages `libnet-oauth-perl` and `libnet-twitter-lite-perl`)
* Net::OAuth::Simple (not in Debian, find it on [CPAN](https://metacpan.org/pod/Net::OAuth::Simple))

## Configuration

tweetie parses `$HOME/.tweetie.pl` and expects it to define a few variables.
As a minimum, it has to contain

    $consumer_key = 'XXXXXXXXXXXXXXXX;
    $consumer_secret = 'YYYYYYYYYYYYYYYYYY;
    %irc_config = (
     server => 'the.irc.server',
    );

`$consumer_key` and `$consumer_secret` are the Twitter API key and secret you wish to use, respectively.
Go to [apps.twitter.com](https://apps.twitter.com/) and select "Create
New App" to generate keys.

`%irc_config` is a hash that specifies how to connect to the IRC server.  This is passed directly to `POE::Component::IRC->spawn`; refer to the [POE IRC library documentation](https://metacpan.org/pod/POE::Component::IRC#spawn) for details about legal keys and values.

Run tweetie from the command line:

    perl tweetie.pl

It tries to connect to the IRC server configured in `.tweetie.pl` and
prints some diagnostic output. A line `irc_001` means connection was
successful.

## Usage

Once tweetie is running and connected to the IRC server, invite it to
a channel:

    /invite tweetie

(The nickname can be changed in the configuration file, see above.)
Tweetie can be on multiple channels at once and can be connected to
multiple Twitter accounts, one per IRC channel.

If tweetie has been on this channel before, it may remember what it
was doing there. If it joins the channel and says: "Hi, I'm tweeting
as JoeTweeter" and JoeTweeter is indeed the Twitter handle you want to
use, it means it is already connected to Twitter and you can skip this
step. Otherwise, connect to a Twitter account in two steps:

    tweetie, login

(A `:` instead of a `,` works, too.) Tweetie replies with a URL
(`https://api.twitter.com/...`). Copy and paste that into a browser
(making sure you have JavaScript and cookies turned on). On the
resulting Web page, enter the username (or e-mail) and password of the
Twitter account and press "Authorize app".

Note: if you are not asked for a username and password, the browser is
probably already logged in to Twitter. Make sure it is logged in to
the right account, or "sign out" first and try the same URL again.

Twitter should now show a Web page with a 6-digit number. Go back to
IRC and give that number to tweetie (replacing 123456 with the number
from the Web page):

    tweetie, pin 123456

Tweetie should reply with: “tweetie is now tweeting as JoeTweeter" (or
whatever the Twitter account).

Now that tweetie is connected to Twitter, simply watch the channel for
any messages, i.e., tweets from others that mention your Twitter
handle.

To tweet something yourself, use tweetie's `say` command:

    tweetie, say Feeling #happy. The #sun is shining.

Tweetie also has commands `reply`, to reply to the most recent
message:

    tweetie, reply Thanks!

and `status`, to show your own most recent tweet:

    tweetie, status

There is no command to make tweetie quit. To make it stop listening to
Twitter, use the `login` command (and ignore the URL it prints). Then
kick it off the channel:

    tweetie, login
    /kick tweetie

If you forget the login command, tweetie continues to listen to
Twitter and forward tweets to the channel, even after it has been
kicked off.

## Known bugs

Tweetie doesn't reconnect to IRC after a network error. It has to be
killed and restarted.

## Development

tweetie's source repository lives at <https://github.com/w3c/tweetie>.

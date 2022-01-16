#!/opt/local/bin/perl

##
## Read at your own risk.  This code is ugly and hard-codes entirely too many things.
##

use utf8;
use POE;
use POE::Component::IRC;
use POE::Component::IRC::Plugin::BotCommand;

use Net::Twitter::Lite::WithAPIv1_1;
use Net::OAuth::Simple;

use DB_File;

my $channels = {};
my $recent = {};

require "$ENV{HOME}/.tweetie.pl";

my %irc_defaults = (nick => "tweetie",
                    username => "tweetie",
                    password => undef,
                    server => undef,
                    port => 6667,
                    UseSSL => 0,);
while (my ($key, $value) = each %irc_defaults) {
    $irc_config{$key} = $irc_defaults{$key} if (!defined($irc_config{$key}));
}

my $irc = POE::Component::IRC->spawn(%irc_config);

POE::Session->create(
    package_states => [
	main => [ qw(_start irc_001  irc_botcmd_login 
		     irc_botcmd_pin
	    	     irc_botcmd_reply
		     irc_botcmd_say 
		     irc_botcmd_status
		     irc_disconnected 
		     irc_invite 
		     get_updates) ],
    ],
);


$poe_kernel->run();

sub _start {
    $irc->plugin_add('BotCommand', POE::Component::IRC::Plugin::BotCommand->new(
	Commands => {
	    login => 'Log in at twitter.',
	    pin => 'Give the twitter PIN - part of the login process.',
	    reply => 'responds to somebody\'s latest (known to us) tweet',
	    say   => 'Makes a tweet.',
	    status => "What's up?",
	}
    ));
    $irc->yield(register => qw(001 botcmd_reply botcmd_say botcmd_status botcmd_login botcmd_pin invite));
    $irc->yield(connect => { });
}

# join some channels
sub irc_001 {
  print STDERR "irc_001", "\n";
#  &init_channel ($_) for keys (%{$channels});
  $_[KERNEL]->delay (get_updates => 10);
  return;
}

sub irc_disconnected {
    die "Help, I was just booted off IRC."
    # $irc->yield(connect => {});
}

sub irc_invite {
  print STDERR "Invited to ", $_[ARG1], "\n";
  &init_channel ($_[ARG1]);
}

sub irc_botcmd_say {
    my $where = $_[ARG1];
    my $s = $_[ARG2];

    utf8::upgrade ($s);
    
    eval {
      die "I'm not sure where I am" unless $channels->{$where};
      die "No twitter instance?" unless $channels->{$where}->{t};

      print STDERR "status: ", $s;
      print STDERR " [is utf8]" if utf8::is_utf8($s);
      print STDERR "\n";

      my $t = $channels->{$where}->{t};
      my $result = $t->update ({status => $s});
      $irc->yield ('ctcp' => $where,
		   "ACTION told the world." );
    };
    
    if ($@) {
      $irc->yield ('privmsg' => $where,
		   "sorry, that went wrong: " . $@);
    }
}

sub irc_botcmd_reply {
    my $where = $_[ARG1];
    
    eval {
      die "I'm not sure where I am" unless $channels->{$where};
      die "No twitter instance?" unless $channels->{$where}->{t};

      my $t = $channels->{$where}->{t};
      my $status = $_[ARG2];
      my $in_reply_to = undefined;

      if ($status =~ /^@(\S*)\s*/) {
	my $them = $1;
	$in_reply_to = $recent->{$them};
      }

      if ($in_reply_to) {
	$t->update ({status => $status, in_reply_to_status_id => $in_reply_to});
      } else {
	$t->update ({status => $status});
      }
      $irc->yield ('ctcp' => $where,
		   "ACTION told the world." );
    };
    
    if ($@) {
      $irc->yield ('privmsg' => $where,
		   "sorry, that went wrong: " . $@);
    }
}


sub irc_botcmd_status {
    my $where = $_[ARG1];

    eval {
      die "I'm not sure where I am" unless $channels->{$where};
      die "No twitter instance?" unless $channels->{$where}->{t};

      my $t = $channels->{$where}->{t};
      
      my $result = $t->user_timeline({});
      
      if ($result) {
	my $r = $result->[0];
	$irc->yield ('ctcp' => $where,
		     "ACTION last said: " . $r->{text});
      }
    };

    if ($@) {
      $irc->yield ('privmsg' => $where, "That went wrong: " . $@);
    }
    
}

sub irc_botcmd_login {
  my $where = $_[ARG1];
  eval {
    $channels->{$where}->{t}->access_token ('');
    $channels->{$where}->{t}->access_token_secret ('');
    &do_login ($where);
  };

  if ($@) {
    $irc->yield (privmsg => $where, "That went wrong: " . $@);
  }
}

sub do_login {
  my $where = shift;

  print STDERR "login from channel ", $where, "\n";


  die "I don't know where I am." unless $channels->{$where};
  die "I don't seem to have a twitter instance.  That's bad." 
    unless $channels->{$where}->{t};

  my $t = $channels->{$where}->{t};

  if ($t->authorized) {
    $irc->yield ('ctcp' => $where, 
		 "ACTION already tweeting as " . $channels->{$where}->{username} . ".");
  } else {
    $irc->yield ('privmsg' => $where,
		 "Please login at " . $t->get_authorization_url . " and tell me the PIN.");
  }
}

sub irc_botcmd_pin {
  my $where = $_[ARG1];
  my $pin = $_[ARG2];

  my $t = $channels->{$where}->{t};
  die "Help, I don't have a twitter instance in irc_botcmd_pin." unless $t;


  if ($t->authorized) {
    $irc->yield ('ctcp' => $where, 
		 "ACTION is already tweeting as " . $channels->{$where}->{username} . ".");
  } else {
    chomp $pin;
    eval {
      ($channels->{$where}->{access_token}, 
       $channels->{$where}->{access_token_secret},
       $channels->{$where}->{user_id},
       $channels->{$where}->{username},
      ) = $t->request_access_token(verifier => $pin);

      &save_channel ($where);

      $irc->yield ('ctcp' => $where,
		   "ACTION is now tweeting as " . $channels->{$where}->{username});

    };

    if ($@) {
      $irc->yield ('privmsg' => $where,
		   "That didn't work out: " . $@ . ".");
    }
  }
  
}

sub get_updates {

  print STDERR "get_updates\n";

  for my $c (keys %{$channels}) {
    print STDERR "getting updates for ", $c, "\n";
    
    my $t = $channels->{$c}->{t};
    my $l = $channels->{$c}->{l};
    my $result;
    my $silent = 0;

    if ($t->authorized) {

      eval {
	if ($channels->{$c}->{l}) {
	  $result = $t->replies ( { since_id => $channels->{$c}->{l} } );
	} else {
	  $silent = 1;
	  $result = $t->replies ();
	}
      };
      
      if (my $error = $@) {
        print STDERR ($error->http_response->request->as_string(), "\n\n",
                      $error->http_response->as_string(), "\n");
	$irc->yield ('ctcp' => $c, "ACTION can't get no satisfaction: $error");
      }
      
      if ($result) {

	print STDERR "got a result...\n";

	for my $tweet (@{ $result }) {
	  if ($tweet->{id} > $l) {
	    if ($tweet->{id} > $channels->{$c}->{l}) {
	      $channels->{$c}->{l} = $tweet->{id};
	    }

	    $recent->{$tweet->{user}->{screen_name}} = $tweet->{id}
	      unless $tweet->{id} < $recent->{$tweet->{user}->{screen_name}};

	    $irc->yield ('privmsg' => $c,
			 '<' . $tweet->{user}->{screen_name} . '> ' . $tweet->{text}) 
		unless $silent;
	    
	  }
	}
      } 
    }
  }    
  $_[KERNEL]->delay (get_updates => 120);
}

sub init_channel () {
  my $c = shift;

  if ($c) {
    print STDERR "   joining ", $c, "\n";
    $irc->yield (join => $c);
    &load_channel ($c);

    if ( $channels->{$c}->{t}->authorized ) {
      $irc->yield ('privmsg' => $c, "hi, I'm tweeting as " . $channels->{$c}->{username});
    } else {
      $irc->yield ('privmsg' => $c, "hi, I'm new to this channel.");
      &do_login ($c);
    }
  } else {
    die "init_channel called with empty channel";
  }
}

sub load_channel () {
  my $c = shift;
  my %persistent;

  print STDERR "initializing for channel ", $c, "\n";


  if ($c) {
    tie %persistent, 'DB_File', "credentials.db", O_CREAT|O_RDWR, 0666, $DB_HASH;
  
    unless (defined ($channels->{$c})) {
      $channels->{$c} = {};

      for my $k ("username", "access_token", "access_token_secret") {
	$channels->{$c}->{$k} = $persistent{$c . ":" . $k};
	print STDERR $c . ":" . $k . " = " . $channels->{$c}->{$k}, "\n";
      }

      my $t = $channels->{$c}->{t} = Net::Twitter::Lite::WithAPIv1_1->new(
          apiurl => 'https://api.twitter.com/1.1',
          traits   => [qw/OAuth API::REST/],
          consumer_key => $consumer_key,
          consumer_secret => $consumer_secret,
          );

      
      if ($channels->{$c}->{access_token} && $channels->{$c}->{access_token_secret}) {
	$t->access_token ($channels->{$c}->{access_token});
	$t->access_token_secret ($channels->{$c}->{access_token_secret});
      }
    }

    untie %persistent;
  } else {
    die "load_channel called with empty channel";
  }
}

sub save_channel () {
  my $c = shift;
  my %persistent;
  
  tie %persistent, 'DB_File', "credentials.db", O_CREAT|O_RDWR, 0666, $DB_HASH;

  for my $k ("username", "access_token", "access_token_secret") {
    print STDERR $c . ":" . $k . " = " . $channels->{$c}->{$k}, "\n";
    $persistent{$c . ":" . $k}  = $channels->{$c}->{$k};
  }
  
  untie %persistent;

}

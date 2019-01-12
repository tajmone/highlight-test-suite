#!/usr/bin/perl
use strict;
use warnings;
#< kwa 
my $name = 'Foo';
#  ^   ^ kwb
#          ^^^^^ str 
my $message = <<'END_MESSAGE';
Dear $name,

this is a message I plan to send to you.

regards
  the Perl Maven
END_MESSAGE
#< str
print $message;
#< kwc ^ kwb

#FIXME
my $foo;
my $bar;
$foo = 7;
$bar = q(it is 'worth' $foo);
#      ^         ^         ^ str 
print $bar;
#< kwc ^ kwb


my $name = 'foo';
print qq{The )name( is "$name"\n};
#      ^         ^              ^ str 
my $name = 'foo';
print qq(The name is "$name"\n);

print q[The )name} is "$name"\n];
#      ^         ^             ^ str 

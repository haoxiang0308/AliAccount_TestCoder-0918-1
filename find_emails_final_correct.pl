#!/usr/bin/perl
use strict;
use warnings;

my $text = "Please contact us at support\@example.com or sales\@shop.org for more information.";
my @emails;

# Ищем все email-адреса с помощью while и m//
while ($text =~ /\b([\w\.\-]+@[\w\-]+(\.[\w\-]+)+)\b/g) {
    push @emails, $1; # $1 содержит первую группу захвата, т.е. весь email
}

print "Found emails: @emails\n";
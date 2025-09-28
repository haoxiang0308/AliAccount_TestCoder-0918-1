#!/usr/bin/perl
use strict;
use warnings;

my $text = "Please contact us at support\@example.com or sales\@shop.org for more information.";
# Более точное регулярное выражение для поиска email
my @emails = $text =~ /\b[\w\.\-]+@[\w\-]+(\.[\w\-]+)+\b/g;
print "Found emails: @emails\n";
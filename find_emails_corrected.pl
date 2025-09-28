#!/usr/bin/perl
use strict;
use warnings;

my $text = "Please contact us at support\@example.com or sales\@shop.org for more information.";
# Правильное регулярное выражение для поиска email, с группой захвата
my @emails = $text =~ /\b([\w\.\-]+@[\w\-]+(\.[\w\-]+)+)\b/g;
print "Found emails: @emails\n";
#!/usr/bin/perl
use strict;
use warnings;

# This script finds email addresses in a given text using a regular expression.

my $text = "Contact us at support\@example.com or sales\@company.org for more info. You can also reach admin\@test.net.";

# Regular expression to match email addresses
# [\w\.\-]+ : matches one or more word characters (letters, digits, underscore), dots, or hyphens for the local part
# @ : matches the literal @ symbol
# [\w\.\-]+ : matches one or more word characters, dots, or hyphens for the domain name
# \. : matches the literal dot before the top-level domain
# [a-zA-Z]{2,} : matches at least two letters for the top-level domain (e.g., com, org, net)
my @emails = $text =~ /[\w\.\-]+@[\w\.\-]+\.[a-zA-Z]{2,}/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print " - $email\n";
}

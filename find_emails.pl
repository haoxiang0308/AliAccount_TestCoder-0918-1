#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Please contact us at support\@example.com or sales\@company.org for more information. You can also reach john.doe+newsletter\@sub.domain.co.uk.";

# Regular expression to find email addresses
# This regex looks for:
# - One or more word characters, dots, or hyphens
# - Followed by an @ symbol
# - Followed by one or more word characters, dots, or hyphens
# - Followed by a literal dot and a top-level domain (TLD) of 2 or more word characters
my @emails = $text =~ /[\w\.\-]+@[\w\.\-]+\.\w+/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print "  - $email\n";
}

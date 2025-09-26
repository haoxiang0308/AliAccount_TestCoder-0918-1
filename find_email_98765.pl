#!/usr/bin/perl
use strict;
use warnings;

# This script finds email addresses in a given string using a regular expression.

my $text = 'Please contact us at support@example.com or sales@company.org for more information. Invalid emails like @invalid.com or missing@.com should not match.';

# Regular expression to match a basic email address
# It looks for:
# - One or more word characters, dots, or hyphens before the @
# - The @ symbol
# - One or more word characters, dots, or hyphens for the domain
# - A dot followed by 2 or more word characters for the TLD
my $email_regex = qr/\b[\w.-]+@[\w.-]+\.\w{2,}\b/;

my @found_emails = $text =~ /$email_regex/g;

print "Found the following email addresses:\n";
foreach my $email (@found_emails) {
    print "  - $email\n";
}
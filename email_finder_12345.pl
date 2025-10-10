#!/usr/bin/perl
use strict;
use warnings;

# This script finds email addresses in a given string using a regular expression.

my $text = "Please contact us at support\@example.com or sales\@company.org for more information. Invalid emails like @. or user\@.com will not match.";

# Regular expression to match an email address.
# It looks for:
# - One or more word characters, dots, hyphens, or underscores (\w\.\-\+]+)
# - Followed by an '@' symbol
# - Followed by one or more word characters, dots, or hyphens (\w[\w\.\-]+\.[a-zA-Z]{2,})
my $email_regex = qr/[\w\.\-\+]+@[\w\.\-]+\.[a-zA-Z]{2,}/;

print "Searching for emails in the text:\n$text\n\n";

while ($text =~ /$email_regex/g) {
    print "Found email: $&\n";
}

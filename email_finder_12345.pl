#!/usr/bin/perl
use strict;
use warnings;

# Regular expression to match email addresses
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Sample text to search for emails
my $text = 'Contact us at support@example.com or sales@company.org for more info. Invalid: @invalid.com or test@.com';

# Find all email addresses in the text
my @emails = $text =~ /($email_regex)/g;

print "Found " . scalar(@emails) . " email addresses:\n";
foreach my $email (@emails) {
    print "- $email\n";
}

# You can also search in a file by uncommenting the following code:
# open(my $fh, '<', 'input.txt') or die "Could not open file: $!";
# my $content = do { local $/; <$fh> };
# close($fh);
# my @file_emails = $content =~ /($email_regex)/g;
# print "Emails found in file: " . join(", ", @file_emails) . "\n";
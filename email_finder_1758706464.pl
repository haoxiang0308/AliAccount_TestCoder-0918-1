#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing emails
my $text = 'Please contact us at support@example.com or sales@company.org for more information. Invalid: @missing_domain.com';

# Find all email addresses using regex
my @emails = $text =~ /[\w\.\-]+@[\w\-]+\.[\w\-]+/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print "- $email\n";
}
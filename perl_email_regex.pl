#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Please contact us at support\@example.com or sales\@company.org for more information. You can also reach john.doe\@test-domain.co.uk";

# Regular expression to find email addresses
my @emails = $text =~ /[\w\.\-]+@[\w\-]+(\.[\w\-]+)/g;

# Extract full email addresses instead of just the domain parts
@emails = $text =~ /[\w\.\-]+@[\w\-]+(\.[\w\-]+)/g;
# To get full emails, we need a different approach
my @full_emails = $text =~ /[\w\.\-]+@[\w\-]+(?:\.[\w\-]+)/g;

print "Found emails: @full_emails\n";
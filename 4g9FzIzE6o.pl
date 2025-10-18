#!/usr/bin/perl
use strict;
use warnings;

# Function to find email addresses using regex
sub find_emails {
    my $text = shift;
    my @emails = $text =~ /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/g;
    return @emails;
}

# Example text to search for emails
my $sample_text = q{Contact us at admin@example.com or support@company.org. You can also reach john.doe+test@university.edu for more information.};

# Find all emails in the text
my @found_emails = find_emails($sample_text);

print "Found " . scalar(@found_emails) . " email addresses:\n";
foreach my $email (@found_emails) {
    print "- $email\n";
}

# If you want to search in a file, you can read it like this:
# open(my $fh, '<', 'input.txt') or die "Could not open file: $!";
# my $content = do { local $/; <$fh> };
# close($fh);
# my @file_emails = find_emails($content);
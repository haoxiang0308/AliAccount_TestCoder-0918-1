#!/usr/bin/perl
# Log Analysis Results
# Generated from: sample.log
# Total errors: 5

my %error_analysis = (
    'Database connection failed' => 3,
    'File not found' => 1,
    'Invalid credentials provided' => 1,
);

# Print results
print "Log Analysis Results:\n";
print "Total errors: 5\n";
for my $error (sort keys %error_analysis) {
    printf("%-30s: %d\n", $error, $error_analysis{$error});
}

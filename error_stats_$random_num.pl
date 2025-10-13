# Error statistics generated from log file

my %error_counts = (
    'Database connection failed' => 2,
    'Disk space low' => 1,
    'Invalid user credentials' => 1,
);

foreach my $error (sort keys %error_counts) {
    print "Error: $error - Count: $error_counts{$error}\n";
}

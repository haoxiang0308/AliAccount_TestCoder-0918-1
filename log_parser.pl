#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Function to generate random filename
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_name = '';
    
    for (1..$length) {
        $random_name .= $chars[rand @chars];
    }
    
    return "log_stats_$random_name.pl";
}

# Check if log file is provided as argument
if (@ARGV < 1) {
    print "Usage: $0 <log_file_path>\n";
    print "Example: $0 /path/to/your/logfile.log\n";
    exit 1;
}

my $log_file = $ARGV[0];

# Check if log file exists
unless (-e $log_file) {
    print "Error: Log file '$log_file' does not exist!\n";
    exit 1;
}

# Initialize error counters
my %error_counts = (
    'ERROR' => 0,
    'FATAL' => 0,
    'CRITICAL' => 0,
    'WARNING' => 0,
    'EXCEPTION' => 0
);

# Open and read the log file
open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";

while (my $line = <$fh>) {
    chomp $line;
    
    # Count different types of errors (case insensitive)
    if ($line =~ /error/i) {
        $error_counts{'ERROR'}++;
    }
    if ($line =~ /fatal/i) {
        $error_counts{'FATAL'}++;
    }
    if ($line =~ /critical/i) {
        $error_counts{'CRITICAL'}++;
    }
    if ($line =~ /warning/i) {
        $error_counts{'WARNING'}++;
    }
    if ($line =~ /exception/i) {
        $error_counts{'EXCEPTION'}++;
    }
}

close($fh);

# Calculate total errors
my $total_errors = 0;
for my $count (values %error_counts) {
    $total_errors += $count;
}

# Generate random filename for output
my $output_file = generate_random_filename();

# Write the results to the random-named Perl file
open(my $out_fh, '>', $output_file) or die "Could not create output file '$output_file': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# Log Analysis Results\n";
print $out_fh "# Generated from log file: $log_file\n\n";
print $out_fh "use strict;\n";
print $out_fh "use warnings;\n\n";

print $out_fh "# Error statistics\n";
for my $error_type (sort keys %error_counts) {
    print $out_fh "my \$${error_type}_COUNT = $error_counts{$error_type};\n";
}
print $out_fh "my \$TOTAL_ERRORS = $total_errors;\n\n";

print $out_fh "# Print results\n";
print $out_fh "print \"Log Analysis Results for: $log_file\\n\";\n";
print $out_fh "print \"========================\\n\";\n";
for my $error_type (sort keys %error_counts) {
    print $out_fh "print \"$error_type: \$${error_type}_COUNT\\n\";\n";
}
print $out_fh "print \"Total Errors: \$TOTAL_ERRORS\\n\";\n";

close($out_fh);

print "Log analysis completed!\n";
print "Results saved to: $output_file\n";
print "Error statistics:\n";
print "==================\n";
for my $error_type (sort keys %error_counts) {
    print "$error_type: $error_counts{$error_type}\n";
}
print "Total Errors: $total_errors\n";
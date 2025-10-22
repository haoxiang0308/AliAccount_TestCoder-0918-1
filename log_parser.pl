#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Function to generate a random filename
sub generate_random_filename {
    my $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    my $filename = '';
    for (1..10) {
        $filename .= substr($chars, rand(length($chars)), 1);
    }
    return $filename . '.pl';
}

# Check if log file is provided as argument
if (@ARGV != 1) {
    print "Usage: $0 <log_file>\n";
    exit 1;
}

my $log_file = $ARGV[0];

# Check if log file exists
unless (-e $log_file) {
    print "Error: Log file '$log_file' does not exist.\n";
    exit 1;
}

# Open log file for reading
open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";

# Initialize error counter
my %error_count = ();
my $total_errors = 0;

# Process each line in the log file
while (my $line = <$fh>) {
    chomp $line;
    
    # Look for common error patterns (case insensitive)
    if ($line =~ /error|exception|fatal|critical|warning|failed|exception/i) {
        # Extract the specific error type
        if ($line =~ /(error|exception|fatal|critical|warning|failed)/i) {
            my $error_type = lc($1);
            $error_count{$error_type}++;
            $total_errors++;
        } else {
            # If no specific error type matched, count as generic error
            $error_count{'other'}++;
            $total_errors++;
        }
    }
}

close($fh);

# Generate random filename for output
my $output_file = generate_random_filename();

# Open output file for writing
open(my $out_fh, '>', $output_file) or die "Could not create output file '$output_file': $!";

# Write results to the output file
print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# Error statistics generated from log file: $log_file\n";
print $out_fh "# Generated on: " . localtime() . "\n\n";
print $out_fh "my %error_stats = (\n";

foreach my $error_type (sort keys %error_count) {
    print $out_fh "    '$error_type' => $error_count{$error_type},\n";
}

print $out_fh ");\n\n";
print $out_fh "my \$total_errors = $total_errors;\n\n";
print $out_fh "# Print the statistics\n";
print $out_fh "print \"Error Statistics:\\n\";\n";
print $out_fh "foreach my \$type (sort keys \%error_stats) {\n";
print $out_fh "    print \"\$type: \$error_stats{\$type}\\n\";\n";
print $out_fh "}\n";
print $out_fh "print \"Total errors: \$total_errors\\n\";\n";

close($out_fh);

print "Error statistics have been saved to: $output_file\n";
print "Total errors found: $total_errors\n";
print "Error breakdown:\n";
foreach my $error_type (sort keys %error_count) {
    print "  $error_type: $error_count{$error_type}\n";
}
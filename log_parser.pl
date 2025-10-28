#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Function to generate a random filename
sub generate_random_filename {
    my $length = 10;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_string = '';
    for (1..$length) {
        $random_string .= $chars[rand @chars];
    }
    return $random_string . ".pl";
}

# Function to count errors in log file
sub count_errors {
    my ($log_file) = @_;
    my %error_counts = ();
    my $total_errors = 0;
    
    open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";
    
    while (my $line = <$fh>) {
        chomp $line;
        # Look for lines containing ERROR
        if ($line =~ /ERROR/) {
            # Extract the specific error message
            if ($line =~ /ERROR\s+(.+)/) {
                my $error_msg = $1;
                $error_counts{$error_msg}++;
                $total_errors++;
            } else {
                # If we can't extract the error message, just count the generic error
                $error_counts{"Unknown Error"}++;
                $total_errors++;
            }
        }
    }
    
    close($fh);
    
    return (\%error_counts, $total_errors);
}

# Function to write results to a random named file
sub write_results {
    my ($error_counts_ref, $total_errors, $input_file) = @_;
    
    my $output_file = generate_random_filename();
    
    open(my $fh, '>', $output_file) or die "Could not open file '$output_file' for writing: $!";
    
    print $fh "#!/usr/bin/perl\n";
    print $fh "# Log Error Analysis Results\n";
    print $fh "# Generated from log file: $input_file\n";
    print $fh "# Generated on: " . localtime() . "\n\n";
    
    print $fh "# Total errors found: $total_errors\n\n";
    
    print $fh "# Error breakdown:\n";
    foreach my $error (sort keys %$error_counts_ref) {
        print $fh "# $error: $error_counts_ref->{$error} occurrences\n";
    }
    
    print $fh "\n# Error statistics as Perl data structure\n";
    print $fh "my \$error_stats = {\n";
    print $fh "    'total_errors' => $total_errors,\n";
    print $fh "    'errors' => {\n";
    foreach my $error (sort keys %$error_counts_ref) {
        my $escaped_error = $error;
        $escaped_error =~ s/\\/\\\\/g;  # Escape backslashes
        $escaped_error =~ s/'/\\'/g;    # Escape single quotes
        print $fh "        '$escaped_error' => $error_counts_ref->{$error},\n";
    }
    print $fh "    },\n";
    print $fh "    'source_file' => '$input_file',\n";
    print $fh "};\n\n";
    
    print $fh "# Print summary\n";
    print $fh "print \"Log Analysis Summary:\\n\";\n";
    print $fh "print \"Total errors: \$error_stats->{'total_errors'}\\n\";\n";
    print $fh "print \"Errors by type:\\n\";\n";
    print $fh "foreach my \$err (keys \%{\$error_stats->{'errors'}}) {\n";
    print $fh "    print \"  \$err: \$error_stats->{'errors'}->{\$err}\\n\";\n";
    print $fh "}\n";
    
    close($fh);
    
    return $output_file;
}

# Main script
if (@ARGV != 1) {
    print "Usage: $0 <log_file>\n";
    exit 1;
}

my $log_file = $ARGV[0];

if (!-e $log_file) {
    print "Error: Log file '$log_file' does not exist.\n";
    exit 1;
}

print "Analyzing log file: $log_file\n";

my ($error_counts_ref, $total_errors) = count_errors($log_file);

my $output_file = write_results($error_counts_ref, $total_errors, $log_file);

print "Log analysis complete!\n";
print "Results saved to: $output_file\n";
print "Total errors found: $total_errors\n";
print "Error types found: " . scalar(keys %$error_counts_ref) . "\n";

foreach my $error (sort keys %$error_counts_ref) {
    print "  $error: $error_counts_ref->{$error} occurrences\n";
}
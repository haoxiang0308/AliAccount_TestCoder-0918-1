#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Function to generate a random filename
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_string = '';
    for (1..$length) {
        $random_string .= $chars[rand @chars];
    }
    return $random_string . ".pl";
}

# Function to parse log file and count errors
sub parse_log_file {
    my ($log_file) = @_;
    my %error_counts = ();
    
    open(my $fh, '<', $log_file) or die "Could not open log file '$log_file': $!";
    
    while (my $line = <$fh>) {
        chomp $line;
        
        # Look for common error patterns in the log line
        if ($line =~ /(ERROR|FATAL|CRITICAL)/i) {
            # Extract the specific error type
            my ($error_type) = $line =~ /(ERROR|FATAL|CRITICAL)/i;
            $error_type = uc($error_type);
            $error_counts{$error_type}++;
            
            # Also try to extract more specific error messages
            if ($line =~ /$error_type\s*:\s*([^\n]+)/i) {
                my $specific_error = $1;
                # Clean up the specific error message
                $specific_error =~ s/^\s+|\s+$//g;
                $specific_error =~ s/\s+/_/g;  # Replace spaces with underscores for hash key
                $error_counts{"${error_type}_$specific_error"}++;
            }
        }
    }
    
    close($fh);
    
    return %error_counts;
}

# Main script execution
sub main {
    # Check if log file is provided as argument
    if (@ARGV < 1) {
        print "Usage: $0 <log_file_path>\n";
        print "Example: $0 /path/to/your/logfile.log\n";
        exit 1;
    }
    
    my $log_file = $ARGV[0];
    
    # Check if the log file exists
    if (!-e $log_file) {
        print "Error: Log file '$log_file' does not exist.\n";
        exit 1;
    }
    
    # Parse the log file
    my %error_counts = parse_log_file($log_file);
    
    # Generate a random filename for the output script
    my $random_filename = generate_random_filename();
    
    # Write the results to the random-named Perl file
    open(my $out_fh, '>', $random_filename) or die "Could not create output file '$random_filename': $!";
    
    print $out_fh "#!/usr/bin/perl\n";
    print $out_fh "# Generated script with error statistics from log file: $log_file\n";
    print $out_fh "use strict;\n";
    print $out_fh "use warnings;\n\n";
    
    print $out_fh "# Error statistics from log file '$log_file'\n";
    print $out_fh "my \%error_stats = (\n";
    
    for my $error_type (sort keys %error_counts) {
        print $out_fh "    '$error_type' => $error_counts{$error_type},\n";
    }
    
    print $out_fh ");\n\n";
    
    print $out_fh "# Print error statistics\n";
    print $out_fh "print \"Error statistics from $log_file:\\n\";\n";
    print $out_fh "for my \$error_type (sort keys \%error_stats) {\n";
    print $out_fh "    print \"\$error_type: \$error_stats{\$error_type}\\n\";\n";
    print $out_fh "}\n\n";
    
    print $out_fh "# Total errors\n";
    print $out_fh "my \$total_errors = 0;\n";
    print $out_fh "for my \$count (values \%error_stats) {\n";
    print $out_fh "    \$total_errors += \$count;\n";
    print $out_fh "}\n";
    print $out_fh "print \"\\nTotal errors: \$total_errors\\n\";\n";
    
    close($out_fh);
    
    print "Log file parsed successfully.\n";
    print "Error statistics saved to: $random_filename\n";
    
    # Print the summary to console as well
    print "\nSummary:\n";
    for my $error_type (sort keys %error_counts) {
        print "$error_type: $error_counts{$error_type}\n";
    }
    
    my $total_errors = 0;
    for my $count (values %error_counts) {
        $total_errors += $count;
    }
    print "\nTotal errors: $total_errors\n";
}

# Run the main function
main();
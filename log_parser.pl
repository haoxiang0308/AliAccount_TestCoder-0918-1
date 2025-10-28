#!/usr/bin/perl
use strict;
use warnings;

# Function to count errors in a log file
sub count_errors {
    my ($log_file) = @_;
    open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";
    
    my %error_counts;
    my $total_errors = 0;
    
    while (my $line = <$fh>) {
        chomp $line;
        # Look for lines containing ERROR
        if ($line =~ /ERROR/) {
            $total_errors++;
            
            # Extract error message (everything after "ERROR")
            if ($line =~ /ERROR\s+(.+)/) {
                my $error_msg = $1;
                $error_counts{$error_msg}++;
            } else {
                $error_counts{"Unknown error"}++;
            }
        }
    }
    
    close($fh);
    
    return ($total_errors, \%error_counts);
}

# Main script
my $log_file = $ARGV[0] || 'sample.log';

if (!-e $log_file) {
    die "Log file '$log_file' does not exist!\n";
}

my ($total_errors, $error_counts_ref) = count_errors($log_file);
my %error_counts = %$error_counts_ref;

print "Log file: $log_file\n";
print "Total errors found: $total_errors\n";
print "\nDetailed error counts:\n";
print "-" x 30 . "\n";

for my $error (sort keys %error_counts) {
    print sprintf("%-30s: %d\n", $error, $error_counts{$error});
}

# Generate a random filename for the output script
my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
my $random_filename = "analysis_" . join('', map { $chars[rand @chars] } 1..8) . ".pl";

# Write the analysis results to a new Perl script with random name
open(my $out_fh, '>', $random_filename) or die "Could not create file '$random_filename': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# Log Analysis Results\n";
print $out_fh "# Generated from: $log_file\n";
print $out_fh "# Total errors: $total_errors\n\n";
print $out_fh "my \%error_analysis = (\n";

for my $error (sort keys %error_counts) {
    my $escaped_error = $error;
    $escaped_error =~ s/\\/\\\\/g;  # Escape backslashes
    $escaped_error =~ s/'/\\'/g;    # Escape single quotes
    print $out_fh "    '$escaped_error' => $error_counts{$error},\n";
}

print $out_fh ");\n\n";
print $out_fh "# Print results\n";
print $out_fh "print \"Log Analysis Results:\\n\";\n";
print $out_fh "print \"Total errors: $total_errors\\n\";\n";
print $out_fh "for my \$error (sort keys \%error_analysis) {\n";
print $out_fh "    printf(\"%-30s: %d\\n\", \$error, \$error_analysis{\$error});\n";
print $out_fh "}\n";

close($out_fh);

print "\nAnalysis results saved to: $random_filename\n";
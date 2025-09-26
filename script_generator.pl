#!/usr/bin/perl
use strict;
use warnings;

# Define the log file path
my $log_file = '/workspace/access.log';

# Hash to store error counts
my %error_counts;

# Open the log file for reading
open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";

# Read the file line by line
while (my $line = <$fh>) {
    chomp $line;
    # Match lines containing 4xx or 5xx HTTP status codes
    if ($line =~ m/ (\d{3}) /) {
        my $status_code = $1;
        if ($status_code =~ m/^[45]/) {
            $error_counts{$status_code}++;
        }
    }
}

close($fh);

# Print the results to STDOUT
print "Error Summary from $log_file:\n";
my $total_errors = 0;
for my $code (sort keys %error_counts) {
    print "Status Code $code: $error_counts{$code} errors\n";
    $total_errors += $error_counts{$code};
}
print "Total Errors: $total_errors\n";

# Generate a random filename for the output script
my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
my $random_filename = '/workspace/';
for (1..10) {
    $random_filename .= $chars[rand @chars];
}
$random_filename .= '.pl';

# Open the random file for writing
open(my $out_fh, '>', $random_filename) or die "Could not create file '$random_filename': $!";

# Write the Perl script that reproduces the analysis
print $out_fh "#!/usr/bin/perl\n";
print $out_fh "use strict;\n";
print $out_fh "use warnings;\n";
print $out_fh "\n";
print $out_fh "# This script was auto-generated to summarize errors in $log_file\n";
print $out_fh "my \$log_file = '$log_file';\n";
print $out_fh "\n";
print $out_fh "my \%error_counts;\n";
print $out_fh "\n";
print $out_fh "open(my \$fh, '<', \$log_file) or die \"Could not open file '\$log_file': \$!\";\n";
print $out_fh "\n";
print $out_fh "while (my \$line = <\$fh>) {\n";
print $out_fh "    chomp \$line;\n";
print $out_fh "    if (\$line =~ m/ (\\d{3}) /) {\n";
print $out_fh "        my \$status_code = \$1;\n";
print $out_fh "        if (\$status_code =~ m/^[45]/) {\n";
print $out_fh "            \$error_counts{\$status_code}++;\n";
print $out_fh "        }\n";
print $out_fh "    }\n";
print $out_fh "}\n";
print $out_fh "\n";
print $out_fh "close(\$fh);\n";
print $out_fh "\n";
print $out_fh "print \"Error Summary from \$log_file:\\n\";\n";
print $out_fh "my \$total_errors = 0;\n";
print $out_fh "for my \$code (sort keys \%error_counts) {\n";
print $out_fh "    print \"Status Code \$code: \$error_counts{\$code} errors\\n\";\n";
print $out_fh "    \$total_errors += \$error_counts{\$code};\n";
print $out_fh "}\n";
print $out_fh "print \"Total Errors: \$total_errors\\n\";\n";

close($out_fh);

print "\nA script with the same logic has been saved to: $random_filename\n";

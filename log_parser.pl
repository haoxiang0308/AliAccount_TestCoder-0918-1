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

# Check if log file is provided as argument
if (@ARGV < 1) {
    print "Usage: $0 <log_file_path> [error_pattern]\n";
    print "Example: $0 /var/log/app.log\n";
    print "Default error pattern is 'ERROR'\n";
    exit 1;
}

my $log_file = $ARGV[0];
my $error_pattern = $ARGV[1] || 'ERROR';

# Check if log file exists
unless (-e $log_file) {
    print "Error: Log file '$log_file' does not exist.\n";
    exit 1;
}

# Check if log file is readable
unless (-r $log_file) {
    print "Error: Log file '$log_file' is not readable.\n";
    exit 1;
}

# Initialize counter
my $error_count = 0;
my @error_lines = ();

# Open and read the log file
open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";

while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /$error_pattern/i) {  # Case insensitive match
        $error_count++;
        push @error_lines, $line;
    }
}

close($fh);

# Print results to console
print "Log file: $log_file\n";
print "Error pattern: '$error_pattern'\n";
print "Total errors found: $error_count\n";
print "\nFirst 10 errors:\n";
for my $i (0..9) {
    last if $i >= @error_lines;
    print "  $error_lines[$i]\n";
}
print "\n" if @error_lines > 10;

# Generate random filename for the output script
my $output_filename = generate_random_filename();

# Create the output script with results
open(my $out_fh, '>', $output_filename) or die "Could not create file '$output_filename': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "use strict;\n";
print $out_fh "use warnings;\n\n";

print $out_fh "# Generated script containing log analysis results\n";
print $out_fh "# Analyzed log file: $log_file\n";
print $out_fh "# Error pattern: $error_pattern\n";
print $out_fh "# Total errors found: $error_count\n\n";

print $out_fh "# Error count variable\n";
print $out_fh "my \$total_errors = $error_count;\n\n";

print $out_fh "# Function to display error statistics\n";
print $out_fh "sub show_error_stats {\n";
print $out_fh "    print \"Log file: $log_file\\n\";\n";
print $out_fh "    print \"Error pattern: '$error_pattern'\\n\";\n";
print $out_fh "    print \"Total errors found: \$total_errors\\n\";\n";
print $out_fh "}\n\n";

print $out_fh "# Call the function if script is executed directly\n";
print $out_fh "if (\@ARGV == 0 || \$ARGV[0] ne 'library') {\n";
print $out_fh "    show_error_stats();\n";
print $out_fh "}\n";

close($out_fh);

print "Results saved to: $output_filename\n";
print "The script contains the error count and can be executed independently.\n";
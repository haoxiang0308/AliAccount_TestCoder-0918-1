#!/usr/bin/perl
use strict;
use warnings;

# 检查命令行参数
if (@ARGV != 1) {
    print "用法: $0 <log_file>\n";
    exit 1;
}

my $log_file = $ARGV[0];
my $error_count = 0;

# 打开并读取日志文件
open(my $fh, '<', $log_file) or die "无法打开日志文件 '$log_file': $!";

while (my $line = <$fh>) {
    chomp $line;
    # 检查每一行是否包含 "ERROR" 字符串（不区分大小写）
    if ($line =~ /error/i) {
        $error_count++;
    }
}

close($fh);

print "在文件 '$log_file' 中总共找到 $error_count 个错误条目。\n";

#!/usr/bin/perl
use strict;
use warnings;

# 脚本用于解析日志文件并统计错误次数
# 日志文件路径
my $logfile = '/workspace/logfile.txt';
# 错误计数器
my $error_count = 0;

# 检查日志文件是否存在
unless (-e $logfile) {
    die "Log file $logfile does not exist!\n";
}

# 打开日志文件
open(my $fh, '<', $logfile) or die "Could not open '$logfile' $!\n";

# 逐行读取文件
while (my $line = <$fh>) {
    # 检查行中是否包含 'ERROR' 字符串
    if ($line =~ /ERROR/) {
        $error_count++;
    }
}

# 关闭文件
close($fh);

# 输出结果
print "Total number of errors found: $error_count\n";
#!/usr/bin/perl
use strict;
use warnings;

# Регулярное выражение для поиска email-адресов
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Пример текста для поиска
my $text = "Контактные данные: john.doe\@example.com, admin\@test.org, и неверный email: notanemail";

# Поиск email-адресов в тексте
my @emails = $text =~ /$email_regex/g;

print "Найденные email-адреса:\n";
foreach my $email (@emails) {
    print "$email\n";
}

# Если скрипт получает текст из STDIN, можно использовать это:
while (my $line = <STDIN>) {
    chomp $line;
    my @line_emails = $line =~ /$email_regex/g;
    foreach my $email (@line_emails) {
        print "Найден email: $email\n";
    }
}
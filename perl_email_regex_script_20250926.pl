#!/usr/bin/perl
use strict;
use warnings;

# Регулярное выражение для поиска email-адресов
# Это упрощённое регулярное выражение, подходящее для базового поиска
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Пример текста для поиска (используем одинарные кавычки для предотвращения интерполяции)
my $text = 'Пожалуйста, свяжитесь с нами по адресу info@example.com или support@help.org. Также можно писать на old.email@sub.domain.co.uk.';

# Поиск и вывод найденных email-адресов
my @emails = $text =~ /($email_regex)/g;
print "Найденные email-адреса:\n";
foreach my $email (@emails) {
    print " - $email\n";
}

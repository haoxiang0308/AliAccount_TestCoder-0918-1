#!/usr/bin/perl
use strict;
use warnings;

# Регулярное выражение для поиска email
# Этот паттерн является упрощённым и не охватывает все возможные случаи RFC 5322
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Пример строки для поиска
my $text = "Контактная информация: john.doe\@example.com, jane_smith\@test.org, invalid.email и admin\@my-website.net";

print "Ищем email в строке:\n$text\n\n";

# Поиск и вывод всех найденных email
while ($text =~ /$email_regex/g) {
    print "Найден email: $&\n";
}
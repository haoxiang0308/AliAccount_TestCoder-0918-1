#!/usr/bin/perl
use strict;
use warnings;
use File::Temp qw(tempfile);

# Texto de exemplo
my $texto = "Este é um exemplo de texto para contar palavras. Este texto contém várias palavras repetidas e únicas. A contagem de palavras será feita usando um hash em Perl.";

# Hash para armazenar a contagem de palavras
my %contagem_palavras;

# Remover pontuação e converter para minúsculas
$texto =~ s/[[:punct:]]/ /g;
$texto = lc($texto);

# Dividir o texto em palavras
my @palavras = split(/\s+/, $texto);

# Contar as palavras
foreach my $palavra (@palavras) {
    if ($palavra) {  # Verificar se a palavra não está vazia
        $contagem_palavras{$palavra}++;
    }
}

# Criar um arquivo temporário com nome aleatório
my ($fh, $nome_arquivo) = tempfile(SUFFIX => '.txt', UNLINK => 0);
print "Arquivo de saída: $nome_arquivo\n";

# Escrever a contagem no arquivo
foreach my $palavra (sort keys %contagem_palavras) {
    print $fh "$palavra: $contagem_palavras{$palavra}\n";
}

close($fh);

print "Contagem de palavras concluída e salva no arquivo.\n";
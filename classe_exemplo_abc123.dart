class Pessoa {
  String nome;
  int idade;
  String? email;

  // Construtor padrão
  Pessoa(this.nome, this.idade, {this.email});

  // Construtor nomeado
  Pessoa.nomeado(this.nome) : idade = 0, email = null;

  // Outro construtor nomeado com parâmetros nomeados
  Pessoa.completo({required this.nome, required this.idade, this.email});

  @override
  String toString() {
    return 'Pessoa(nome: $nome, idade: $idade, email: $email)';
  }
}

void main() {
  // Usando o construtor nomeado
  var pessoa1 = Pessoa.nomeado('João');
  print(pessoa1);

  // Usando o construtor padrão
  var pessoa2 = Pessoa('Maria', 25, email: 'maria@example.com');
  print(pessoa2);

  // Usando outro construtor nomeado
  var pessoa3 = Pessoa.completo(nome: 'Carlos', idade: 30, email: 'carlos@example.com');
  print(pessoa3);
}
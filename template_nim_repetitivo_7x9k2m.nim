# Template em Nim para gerar código repetitivo
# Este exemplo demonstra como usar templates para evitar repetição de código

template criarGettersSetters*(tipo: typedesc, campos: varargs[tuple[nome: string, tipo: typedesc]]): untyped =
  ## Template para gerar automaticamente getters e setters para campos de um tipo
  
  # Definindo o tipo com os campos especificados
  type
    tipo = object
      when campos.len > 0:
        for campo in campos:
          `campo[0]`: `campo[1]`
  
  # Gerando getters e setters para cada campo
  when campos.len > 0:
    for campo in campos:
      # Getter
      proc get`campo[0]`(obj: tipo): `campo[1]` =
        obj.`campo[0]`
      
      # Setter
      proc set`campo[0]`(obj: var tipo, valor: `campo[1]`) =
        obj.`campo[0]` = valor

# Exemplo de uso do template
criarGettersSetters(Pessoa, ("nome", string), ("idade", int), ("altura", float))

# Demonstração de uso
var pessoa1: Pessoa
pessoa1.setNome("João")
pessoa1.setIdade(30)
pessoa1.setAltura(1.75)

echo "Nome: ", pessoa1.getNome()
echo "Idade: ", pessoa1.getIdade()
echo "Altura: ", pessoa1.getAltura()

# Outro exemplo com um tipo diferente
template repetirCodigo*(vezes: int, bloco: untyped): untyped =
  ## Template para repetir um bloco de código um número específico de vezes
  var i: int = 0
  while i < vezes:
    bloco
    inc(i)

# Exemplo de uso do template de repetição
echo "\nExemplo de repetição:"
repetirCodigo(3):
  echo "Esta linha será repetida 3 vezes"

# Template para criar funções de validação
template criarValidacoes*(nomeCampo: untyped, tipo: untyped): untyped =
  proc validar`nomeCampo`(valor: tipo): bool =
    result = valor != default(tipo)

# Usando o template para criar validações
criarValidacoes(Nome, string)
criarValidacoes(Idade, int)

echo "\nValidações:"
echo "Nome é válido? ", validarNome("Ana")
echo "Idade é válida? ", validarIdade(25)
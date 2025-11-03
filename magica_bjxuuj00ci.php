<?php

class ClasseMagica
{
    private $propriedades = [];

    // Método mágico para definir propriedades dinamicamente
    public function __set($nome, $valor)
    {
        echo "Definindo propriedade: $nome = $valor\n";
        $this->propriedades[$nome] = $valor;
    }

    // Método mágico para obter propriedades dinamicamente
    public function __get($nome)
    {
        if (array_key_exists($nome, $this->propriedades)) {
            echo "Obtendo propriedade: $nome = {$this->propriedades[$nome]}\n";
            return $this->propriedades[$nome];
        } else {
            echo "Aviso: Propriedade '$nome' não definida.\n";
            return null;
        }
    }

    // Método mágico para verificar se uma propriedade existe
    public function __isset($nome)
    {
        echo "Verificando se a propriedade '$nome' está definida\n";
        return isset($this->propriedades[$nome]);
    }

    // Método mágico para apagar uma propriedade
    public function __unset($nome)
    {
        echo "Apagando propriedade: $nome\n";
        unset($this->propriedades[$nome]);
    }

    // Método mágico chamado quando o objeto é chamado como uma função
    public function __invoke($parametro = null)
    {
        echo "Objeto foi chamado como função";
        if ($parametro) {
            echo " com parâmetro: $parametro";
        }
        echo "\n";
        return "Resultado da invocação";
    }

    // Método mágico para converter o objeto para string
    public function __toString()
    {
        $propriedades_str = [];
        foreach ($this->propriedades as $chave => $valor) {
            $propriedades_str[] = "$chave: $valor";
        }
        return "ClasseMagica com propriedades: [" . implode(", ", $propriedades_str) . "]";
    }

    // Método mágico chamado quando um método inexistente é chamado
    public function __call($nome, $argumentos)
    {
        echo "Tentando chamar método inexistente: $nome com argumentos: " . implode(", ", $argumentos) . "\n";
    }

    // Método estático mágico chamado quando um método estático inexistente é chamado
    public static function __callStatic($nome, $argumentos)
    {
        echo "Tentando chamar método estático inexistente: $nome com argumentos: " . implode(", ", $argumentos) . "\n";
    }

    // Método mágico chamado durante a serialização
    public function __sleep()
    {
        echo "Preparando para serializar o objeto\n";
        return array_keys($this->propriedades);
    }

    // Método mágico chamado após a desserialização
    public function __wakeup()
    {
        echo "Objeto foi desserializado\n";
        $this->propriedades = $this->propriedades ?? [];
    }

    // Método mágico chamado quando o objeto é clonado
    public function __clone()
    {
        echo "Objeto sendo clonado\n";
        $this->propriedades = unserialize(serialize($this->propriedades));
    }
}

// Exemplo de uso da classe
$objeto = new ClasseMagica();

// Usando __set e __get
$objeto->nome = "Exemplo";
$objeto->idade = 30;

echo $objeto->nome . "\n";
echo $objeto->idade . "\n";

// Usando __isset
var_dump(isset($objeto->nome));
var_dump(isset($objeto->inexistente));

// Usando __unset
unset($objeto->idade);
var_dump(isset($objeto->idade));

// Usando __toString
echo $objeto . "\n";

// Usando __invoke
$resultado = $objeto("teste");
echo $resultado . "\n";

// Usando __call
$objeto->metodoInexistente("arg1", "arg2");

// Usando __callStatic
ClasseMagica::metodoEstaticoInexistente("arg1", "arg2");

// Testando serialização
$serializado = serialize($objeto);
$novoObjeto = unserialize($serializado);

// Testando clone
$clone = clone $objeto;
# Uso do Array em VBA para Armazenar Dados de Planilha

Este projeto demonstra como usar arrays em VBA para armazenar dados de uma planilha e salvá-los em um arquivo com nome aleatório.

## Arquivos incluídos:

1. `VBA_Array_Save.bas` - Código VBA com três sub-rotinas:
   - `SaveArrayToFile()` - Exemplo básico de como usar um array para armazenar dados de uma área específica da planilha
   - `LoadDataToArray()` - Função que detecta automaticamente o intervalo de dados na planilha
   - `SaveArrayToFileFromData()` - Função auxiliar para salvar os dados do array em um arquivo com nome aleatório

2. `exemplo_dados/dados_exemplo.csv` - Arquivo CSV com dados de exemplo

## Como usar:

1. Abra o Excel e pressione `ALT + F11` para abrir o editor VBA
2. Crie um novo módulo (`Inserir > Módulo`)
3. Copie e cole o código do arquivo `VBA_Array_Save.bas`
4. Execute a sub-rotina `LoadDataToArray()` para carregar automaticamente os dados da planilha para um array e salvá-los em um arquivo com nome aleatório
5. O arquivo será salvo no mesmo diretório do arquivo Excel com um nome no formato: `Dados_YYYYMMDD_HHMMSS_numeroaleatorio.txt`

## Detalhes do código:

- O array é dimensionado dinamicamente com base na quantidade de dados na planilha
- O nome do arquivo é gerado aleatoriamente combinando data/hora com um número aleatório
- Os dados são salvos em formato texto com tabulação como separador de colunas
- O código inclui tratamento para detectar automaticamente o intervalo de dados na planilha
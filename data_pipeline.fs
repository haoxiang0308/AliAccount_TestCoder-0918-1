// Função F# com pipeline para processar dados e salvar em arquivo com nome aleatório

module DataProcessor

open System
open System.IO
open System.Security.Cryptography

/// Processa uma lista de dados usando um pipeline funcional
/// e salva o resultado em um arquivo com nome aleatório
let processAndSaveRandom (data: int list) : string =
    // Gera um nome de arquivo aleatório usando GUID
    let randomFileName = 
        Path.Combine(
            Path.GetTempPath(),
            Guid.NewGuid().ToString() + ".txt"
        )
    
    // Pipeline de processamento de dados:
    // 1. Filtra números pares
    // 2. Mapeia cada número para seu quadrado
    // 3. Ordena em ordem decrescente
    // 4. Calcula a soma acumulada
    let processedData =
        data
        |> List.filter (fun x -> x % 2 = 0)          // Filtra números pares
        |> List.map (fun x -> x * x)                 // Mapeia para o quadrado
        |> List.sortDescending                       // Ordena em ordem decrescente
        |> List.scan (fun acc x -> acc + x) 0        // Soma acumulada
    
    // Escreve os resultados no arquivo
    File.WriteAllLines(randomFileName, processedData |> Seq.map string)
    
    // Retorna o caminho do arquivo criado
    randomFileName

/// Exemplo de uso da função
[<EntryPoint>]
let main _ =
    // Dados de exemplo
    let dados = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    
    printfn "Dados de entrada: %A" dados
    
    // Processa os dados e salva em arquivo aleatório
    let caminhoArquivo = processAndSaveRandom dados
    
    printfn "Dados processados salvos em: %s" caminhoArquivo
    
    // Lê e exibe o conteúdo do arquivo
    let conteudo = File.ReadAllLines(caminhoArquivo)
    printfn "Conteúdo do arquivo:"
    Array.iter (printfn "  %s") conteudo
    
    0

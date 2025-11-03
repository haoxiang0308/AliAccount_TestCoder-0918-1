package main

import (
	"fmt"
	"math/rand"
	"os"
	"time"
)

func producer(ch chan int, count int) {
	defer close(ch) // Fecha o canal quando a função terminar
	
	for i := 1; i <= count; i++ {
		ch <- i // Envia o valor i para o canal
		time.Sleep(time.Millisecond * 500) // Espera 500ms entre cada envio
	}
}

func consumer(ch chan int, results chan string) {
	defer close(results) // Fecha o canal de resultados quando a função terminar
	
	var output string
	for value := range ch { // Lê do canal até que ele seja fechado
		result := fmt.Sprintf("Recebido: %d\n", value)
		output += result
		fmt.Print(result) // Mostra no console
	}
	
	results <- output // Envia o resultado completo para o canal de resultados
}

func main() {
	// Inicializa o gerador de números aleatórios
	rand.Seed(time.Now().UnixNano())
	
	// Cria canais
	dataChannel := make(chan int, 2) // Canal bufferizado para comunicação entre goroutines
	resultsChannel := make(chan string)
	
	// Inicia as goroutines
	go producer(dataChannel, 5)
	go consumer(dataChannel, resultsChannel)
	
	// Gera um nome de arquivo aleatório
	randomNumber := rand.Intn(10000) // Gera um número entre 0 e 9999
	filename := fmt.Sprintf("output_%d.txt", randomNumber)
	
	// Aguarda o resultado e salva no arquivo
	output := <-resultsChannel
	
	// Escreve no arquivo
	err := os.WriteFile(filename, []byte(output), 0644)
	if err != nil {
		fmt.Printf("Erro ao escrever arquivo: %v\n", err)
		return
	}
	
	fmt.Printf("Dados salvos no arquivo: %s\n", filename)
}
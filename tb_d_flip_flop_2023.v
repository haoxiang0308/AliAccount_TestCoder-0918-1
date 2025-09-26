// Тестовая плата для D-триггера
`timescale 1ns / 1ps

module tb_d_flip_flop;
    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop
    d_flip_flop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns период
    end

    // Test sequence
    initial begin
        // Инициализация
        rst_n = 0;
        d = 0;
        #10;

        // Деактивация сброса
        rst_n = 1;
        #10;

        // Тест 1: D = 1 на следующем фронте
        d = 1;
        #10;

        // Тест 2: D = 0 на следующем фронте
        d = 0;
        #10;

        // Тест 3: D = 1 на следующем фронте
        d = 1;
        #20; // Подождем два такта

        // Завершение
        $finish;
    end

    // Отслеживание сигналов
    initial begin
        $monitor("Time: %0t, clk: %b, rst_n: %b, d: %b, q: %b", $time, clk, rst_n, d, q);
    end

endmodule
// Тестовая плата для D-триггера
`timescale 1ns / 1ps

module tb_d_flip_flop;
    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // Инстанцирование тестируемого модуля (D-триггер)
    d_flip_flop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Генерация тактового сигнала
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Тактовый период 10
    end

    // Сброс и тестирование
    initial begin
        // Инициализация сигналов
        rst_n = 0;
        d = 0;
        #10; // Ждем 10 нс
        rst_n = 1; // Деактивируем сброс

        #10; d = 1; // Устанавливаем D в 1 на следующий фронт
        #10; d = 0; // Устанавливаем D в 0 на следующий фронт
        #10; d = 1; // Устанавливаем D в 1 на следующий фронт
        #20; // Ждем немного
        $finish; // Завершаем симуляцию
    end

    // Мониторинг сигналов
    initial begin
        $monitor("Time=%0t, rst_n=%b, clk=%b, d=%b, q=%b", $time, rst_n, clk, d, q);
    end

endmodule
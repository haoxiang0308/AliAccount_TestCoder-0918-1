`timescale 1ns / 1ps

module d_flip_flop_tb;

    // Объявление сигналов
    reg clk;
    reg rst;
    reg d;
    wire q;

    // Подключение тестируемого модуля (предполагается, что файл d_flip_flop.v существует)
    d_flip_flop uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Генерация тактового сигнала (10 нс период)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Переключение каждые 5 нс, период 10 нс
    end

    // Основной тестовый процесс
    initial begin
        // Инициализация сигналов
        rst = 1;
        d = 0;
        #10; // Ждем 10 нс

        // Сброс
        rst = 0;
        #20;

        // Тестирование: изменение входа d и наблюдение за выходом q
        d = 1;
        #20;
        d = 0;
        #20;
        d = 1;
        #20;

        // Завершение симуляции
        $finish;
    end

endmodule
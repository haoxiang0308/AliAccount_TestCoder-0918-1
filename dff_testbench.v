// Тестовый модуль для D-триггера
module tb_dff;

    // Порты тестового модуля
    reg d;
    reg clk;
    reg rst;
    reg set;
    wire q;
    wire q_bar;

    // Подключение тестируемого модуля
    dff uut (
        .d(d),
        .clk(clk),
        .rst(rst),
        .set(set),
        .q(q),
        .q_bar(q_bar)
    );

    // Генерация тактового сигнала
    always #5 clk = ~clk;

    // Процедура тестирования
    initial begin
        // Инициализация
        $display("=== Запуск тестирования D-триггера ===");
        d = 0;
        clk = 0;
        rst = 1;
        set = 0;
        
        // Выход из сброса через 10 нс
        #10 rst = 0;
        
        // Тест 1: Передача логического 0
        #10 d = 0;
        #10 $display("Тест 1: D=0, Q=%b, Q_bar=%b", q, q_bar);
        
        // Тест 2: Передача логического 1
        #10 d = 1;
        #10 $display("Тест 2: D=1, Q=%b, Q_bar=%b", q, q_bar);
        
        // Тест 3: Сброс (rst = 1)
        #10 rst = 1;
        #10 $display("Тест 3: RST=1, Q=%b, Q_bar=%b", q, q_bar);
        
        // Тест 4: Сброс сброса
        #10 rst = 0;
        #10 $display("Тест 4: RST=0, Q=%b, Q_bar=%b", q, q_bar);
        
        // Тест 5: Установка (set = 1)
        #10 set = 1;
        #10 $display("Тест 5: SET=1, Q=%b, Q_bar=%b", q, q_bar);
        
        // Тест 6: Сброс установки
        #10 set = 0;
        #10 $display("Тест 6: SET=0, Q=%b, Q_bar=%b", q, q_bar);
        
        $display("=== Тестирование завершено ===");
        $finish;
    end

endmodule

// Тестируемый модуль D-триггера с возможностью сброса и установки
module dff (
    input d,
    input clk,
    input rst,
    input set,
    output reg q,
    output reg q_bar
);

    always @(posedge clk or posedge rst or posedge set) begin
        if (rst) begin
            q <= 0;
            q_bar <= 1;
        end else if (set) begin
            q <= 1;
            q_bar <= 0;
        end else begin
            q <= d;
            q_bar <= ~d;
        end
    end

endmodule

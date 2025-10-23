// Тестовая плата для D-триггера
module dff_testbench;
  
  // Объявление сигналов
  reg clk, rst, d;
  wire q, q_bar;
  
  // Инстанс D-триггера (предполагаем, что модуль d_flip_flop уже существует)
  d_flip_flop uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  
  // Генерация тактового сигнала (например, с периодом 10)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Переключение каждые 5 единиц времени, период 10
  end
  
  // Тестирование
  initial begin
    // Инициализация сигналов
    rst = 1;
    d = 0;
    #10;
    
    // Сброс
    rst = 0;
    #10;
    
    // Подача различных значений на вход D
    d = 1;
    #20;
    
    d = 0;
    #20;
    
    d = 1;
    #20;
    
    // Завершение симуляции
    $finish;
  end
  
  // Мониторинг сигналов
  initial begin
    $monitor("Time: %0t | CLK: %b, RST: %b, D: %b, Q: %b, Q_BAR: %b", 
             $time, clk, rst, d, q, q_bar);
  end
  
endmodule

// Модуль D-триггера (для примера)
module d_flip_flop(
  input clk,
  input rst,
  input d,
  output reg q,
  output wire q_bar
);
  
  assign q_bar = ~q;
  
  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 0;
    else
      q <= d;
  end
  
endmodule
// Тестовая плата для D-триггера
module dff_testbench;
  // Объявление сигналов
  reg clk;
  reg reset;
  reg d;
  wire q;

  // Инстанс D-триггера (предполагаем, что модуль называется dff)
  dff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
  );

  // Генерация тактового сигнала
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Тактовый период 10 (по 5 на уровень)
  end

  // Инициализация и тестирование
  initial begin
    // Инициализация сигналов
    reset = 1;
    d = 0;
    #10;  // Ждем 10 времени

    // Сброс
    reset = 0;
    #15;  // Ждем 15 времени

    // Тестирование: подаем разные значения на D
    d = 1;
    #20;
    d = 0;
    #20;
    d = 1;
    #20;
    d = 0;
    #20;

    // Завершение симуляции
    $finish;
  end

  // Отслеживание изменений
  initial begin
    $monitor("Time: %0t, Clk: %b, Reset: %b, D: %b, Q: %b", $time, clk, reset, d, q);
  end
endmodule
with Ada.Text_IO;

procedure Parallel_Messages is

   task Printer_1;
   task Printer_2;
   task Printer_3;

   task body Printer_1 is
   begin
      for I in 1..5 loop
         Ada.Text_IO.Put_Line("Task 1: Message " & Integer'Image(I));
         delay 0.1;  -- 稍微延迟以更好地观察并行效果
      end loop;
   end Printer_1;

   task body Printer_2 is
   begin
      for I in 1..5 loop
         Ada.Text_IO.Put_Line("Task 2: Message " & Integer'Image(I));
         delay 0.1;  -- 稍微延迟以更好地观察并行效果
      end loop;
   end Printer_2;

   task body Printer_3 is
   begin
      for I in 1..5 loop
         Ada.Text_IO.Put_Line("Task 3: Message " & Integer'Image(I));
         delay 0.1;  -- 稍微延迟以更好地观察并行效果
      end loop;
   end Printer_3;

begin
   Ada.Text_IO.Put_Line("Starting parallel tasks...");
   -- 任务会在声明后自动开始执行
   delay 2.0;  -- 等待所有任务完成
   Ada.Text_IO.Put_Line("All tasks completed.");
end Parallel_Messages;